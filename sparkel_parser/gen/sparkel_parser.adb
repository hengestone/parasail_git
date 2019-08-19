

with Sparkel_tokens, Sparkel_lex_io, Sparkel_goto, Sparkel_shift_reduce;
with Sparkel_lex, text_io;

use  Sparkel_tokens, Sparkel_lex_io, Sparkel_goto, Sparkel_shift_reduce;
use  Sparkel_lex, text_io;

with PSC.Trees; use PSC.Trees;

with PSC.Messages;
with PSC.Symbols;
with PSC.Syntax;
with PSC.Strings;
pragma Elaborate (PSC.Strings);
with PSC.Source_Positions;
with PSC.Trees.Module;
with PSC.Trees.Implements_Element;
with PSC.Trees.Binary;
with PSC.Trees.Unary;
with PSC.Trees.Identifier;
with PSC.Trees.Qualified_Name;
with PSC.Trees.Lists;
with PSC.Trees.Obj_Decl;
with PSC.Trees.Param_Decl;
with PSC.Trees.Operation;
with PSC.Trees.Reference;
with PSC.Trees.Assign_Stmt;
with PSC.Trees.Conditional;
with PSC.Trees.Invocation;
with PSC.Trees.Control_Stmt;
with PSC.Trees.Type_Decl;
with PSC.Trees.Selection;
with PSC.Trees.Case_Construct;
with PSC.Trees.Iterator;
with PSC.Trees.While_Stmt;
with PSC.Trees.Block_Stmt;
with PSC.Trees.For_Loop_Construct;
with PSC.Trees.Qualifier;
with PSC.Trees.Annotation;
with PSC.Trees.Property;
with PSC.Trees.Compound_Stmt;
with PSC.Trees.Semantics;

package body Sparkel_Parser is

    use type Param_Decl.Param_Kind;
    use type PSC.Strings.U_String;

    Concurrent_Str : constant PSC.Strings.U_String :=
      PSC.Strings.String_Lookup ("concurrent");

    Forward_Str : constant PSC.Strings.U_String :=
      PSC.Strings.String_Lookup ("forward");

    Reverse_Str : constant PSC.Strings.U_String :=
      PSC.Strings.String_Lookup ("reverse");

    Func_Str : constant PSC.Strings.U_String :=
      PSC.Strings.String_Lookup ("func");

    Function_Str : constant PSC.Strings.U_String :=
      PSC.Strings.String_Lookup ("function");

    Proc_Str : constant PSC.Strings.U_String :=
      PSC.Strings.String_Lookup ("proc");

    Procedure_Str : constant PSC.Strings.U_String :=
      PSC.Strings.String_Lookup ("procedure");

    Last_Import_File : PSC.Strings.U_String := PSC.Strings.Null_U_String;
    Last_Import_List : PSC.Trees.Lists.List;

    function List_Or_Empty (S : YYSType) return Lists.List is
    --  Return S.List if S.Kind = One_List, else return Empty_List
    begin
        if S.Kind = One_List then
            return S.List;
        else
            return Lists.Empty_List;
        end if;
    end List_Or_Empty;

    function Token_Src_Pos (Token : YYSType)
      return PSC.Source_Positions.Source_Position is
    --  Try to extract source-pos from Token, else
    --  return PSC.Syntax.Cur_Source_Pos.
        use PSC.Source_Positions;
        Result : Source_Position := Null_Source_Position;
    begin
        case Token.Kind is
           when One_Token | Construct_Qualifier |
              One_Unary_Op | One_Binary_Op | One_Assign_Op |
              Optional_End_Token =>
              Result := Token.Source_Pos;
           when One_Tree =>
              Result := PSC.Trees.Find_Source_Pos (Token.Tree);
           when others =>
              null;
        end case;
        if Result /= Null_Source_Position then
           return Result;
        else
           return PSC.Syntax.Cur_Source_Pos;
        end if;
    end Token_Src_Pos;

   procedure Yyerror (S : String := "syntax error";
     At_Token : Sparkel_Tokens.YYSType := (Sparkel_Tokens.Optional,
       Is_Present => False)) is
    begin
        PSC.Messages.Parser_Error (S, Src_Pos => Token_Src_Pos (At_Token));
    end yyerror;

   procedure Parser_Warning (S : String;
     At_Token : Sparkel_Tokens.YYSType := (Sparkel_Tokens.Optional,
       Is_Present => False)) is
    begin
        PSC.Messages.Parser_Warning (S, Src_Pos => Token_Src_Pos (At_Token));
    end Parser_Warning;

    function Name_For_Module (Defining_Name : Optional_Tree)
      return Optional_Tree is
        --  Return Optional_Name for package, extracting it
        --  from the "name[#label]" construct if necessary.
        Def_Name : Tree'Class renames Tree_Ptr_Of (Defining_Name).all;
    begin
        if Def_Name not in Invocation.Tree'Class then
            --  No Add-on label
            return Defining_Name;
        else
            --  Has an add-on label
            return Invocation.Tree (Def_Name).Prefix;
        end if;
    end Name_For_Module;

    procedure Check_Id_Match (Starting_Id : Optional_Tree;
      Ending_Id : Optional_Tree) is
      --  Check that starting and ending id's match
        Start_Strs : constant PSC.Symbols.Str_Array :=
          PSC.Symbols.Name_Strings (Starting_Id);
        End_Strs : constant PSC.Symbols.Str_Array :=
          PSC.Symbols.Name_Strings (Ending_Id);
        use type PSC.Strings.U_String;
        use type PSC.Symbols.Str_Array;
    begin
        if Start_Strs /= End_Strs then
            --  Mismatch between start and end designators
            declare
                End_Token : constant YYSType (One_Tree) :=
                  (One_Tree, Ending_Id);
            begin
                yyerror ("Start and end designators must match",
                  At_Token => End_Token);
            end;
        end if;
    end Check_Id_Match;

    procedure Check_Func_Proc_Match (Op_Decl : Operation.Tree;
      End_Construct_Token : YYSType) is
    --  Check that "proc" ends with "end proc" and "func" ends with "end func"
       use Operation;
    begin
       if End_Construct_Token.Kind = Optional_End_Token
         and then End_Construct_Token.End_Construct_Str /=
           PSC.Strings.Null_U_String
       then
          case Operation.Func_Proc_Specifier'(Op_Decl.Operation_Kind) is
             when Func_Operation =>
                if End_Construct_Token.End_Construct_Str /= Func_Str then
                   yyerror ("Should be ""end func""",
                     At_Token => End_Construct_Token);
                end if;
             when Function_Operation =>
                if End_Construct_Token.End_Construct_Str /= Function_Str then
                   yyerror ("Should be ""end function""",
                     At_Token => End_Construct_Token);
                end if;
             when Proc_Operation =>
                if End_Construct_Token.End_Construct_Str /= Proc_Str then
                   yyerror ("Should be ""end proc""",
                     At_Token => End_Construct_Token);
                end if;
             when Procedure_Operation =>
                if End_Construct_Token.End_Construct_Str /= Procedure_Str then
                   yyerror ("Should be ""end procedure""",
                     At_Token => End_Construct_Token);
                end if;
          end case;
       end if;
    end Check_Func_Proc_Match;

    function Add_On_For_Module (Defining_Name : Optional_Tree)
      return Lists.List is
        --  Return add-on label(s), if any, as a list
        Def_Name : Tree'Class renames Tree_Ptr_Of (Defining_Name).all;
    begin
        if Def_Name not in Invocation.Tree'Class then
            --  No Add-on label
            return Lists.Empty_List;
        else
            --  Has an add-on label
            return Invocation.Tree (Def_Name).Operands;
        end if;
    end Add_On_For_Module;

    function Conditionally_Complement (Cond : Optional_Tree;
      Complement : Boolean) return Optional_Tree is
        --  Return Tree, optionally surrounded by a "not" operator
    begin
        if Complement then
            return Unary.Make (
              Operator => Unary.Not_Op,
              Operand => Cond);
        else
            return Cond;
        end if;
    end Conditionally_Complement;

    procedure Check_Stmt_Label (Compound_Stmt : YYSType;
      Start_Label_Token : YYSType) is
        --  Make sure that starting label matches
        --  ending label.
        pragma Assert (Compound_Stmt.Kind = One_Tree);
        Compound_Stmt_OT : constant Optional_Tree := Compound_Stmt.Tree;
    begin
        if Is_Null (Compound_Stmt_OT) then
            --  Must have already been some error in the compound statement
            return;
        else
          declare
            pragma Assert (Tree_Ptr_Of (Compound_Stmt_OT).all in
              PSC.Trees.Compound_Stmt.Tree'Class);
            Compound_Tree : PSC.Trees.Compound_Stmt.Tree'Class renames
              PSC.Trees.Compound_Stmt.Tree'Class
                (Tree_Ptr_Of (Compound_Stmt_OT).all);
            End_Label : constant Optional_Tree := Compound_Tree.Label;
            Start_Label : Optional_Tree := Null_Optional_Tree;
          begin
            if Start_Label_Token.Kind = One_Tree then
                Start_Label := Start_Label_Token.Tree;
            end if;
            if not Compound_Tree.Check_Label then
                --  No end label; copy from start label
                pragma Assert (Is_Null (End_Label));
                Compound_Tree.Label := Start_Label;
            elsif Is_Null (Start_Label) then
                if Is_Null (End_Label) then
                    --  Both null, that's fine
                    return;
                else
                    yyerror ("Missing start label",
                      At_Token => Compound_Stmt);
                end if;
            elsif Is_Null (End_Label) then
                yyerror ("Missing end label",
                  At_Token => Compound_Stmt);
            else
              declare
                pragma Assert (
                  Tree_Ptr_Of (Start_Label).all in PSC.Trees.Identifier.Tree);
                pragma Assert (
                  Tree_Ptr_Of (End_Label).all in PSC.Trees.Identifier.Tree);
                use PSC.Strings;
                Start_Label_Id : constant U_String :=
                  PSC.Trees.Identifier.Tree (Tree_Ptr_Of (Start_Label).all).Str;
                End_Label_Id : constant U_String :=
                  PSC.Trees.Identifier.Tree (Tree_Ptr_Of (End_Label).all).Str;
              begin
                if Start_Label_Id /= End_Label_Id then
                    yyerror ("Start label " &
                      To_String (Start_Label_Id) &
                      " does not match end label " &
                      To_String (End_Label_Id),
                      At_Token => Start_Label_Token);
                end if;
              end;
            end if; -- whether start and end label not null
          end;
        end if;  -- whether Compound stmt not null
    end Check_Stmt_Label;

    use Qualifier; -- For Qualifier_Enum literals

pragma Style_Checks (Off);
procedure YYParse is

   --  Rename User Defined Packages to Internal Names.
    package yy_goto_tables         renames
      Sparkel_Goto;
    package yy_shift_reduce_tables renames
      Sparkel_Shift_Reduce;
    package yy_tokens              renames
      Sparkel_Tokens;

   use yy_tokens, yy_goto_tables, yy_shift_reduce_tables;

   procedure yyerrok;
   procedure yyclearin;


   package yy is

       --  the size of the value and state stacks
       stack_size : constant Natural := 3000;

       --  subtype rule         is natural;
       subtype parse_state  is natural;
       --  subtype nonterminal  is integer;

       --  encryption constants
       default           : constant := -1;
       first_shift_entry : constant :=  0;
       accept_code       : constant := -3001;
       error_code        : constant := -3000;

       --  stack data used by the parser
       tos                : natural := 0;
       value_stack        : array (0..stack_size) of yy_tokens.yystype;
       state_stack        : array (0..stack_size) of parse_state;

       --  current input symbol and action the parser is on
       action             : integer;
       rule_id            : rule;
       input_symbol       : yy_tokens.token;


       --  error recovery flag
       error_flag : natural := 0;
          --  indicates  3 - (number of valid shifts after an error occurs)

       look_ahead : boolean := true;
       index      : integer;

       --  Is Debugging option on or off
        DEBUG : constant boolean := FALSE;

    end yy;


    function goto_state
      (state : yy.parse_state;
       sym   : nonterminal) return yy.parse_state;

    function parse_action
      (state : yy.parse_state;
       t     : yy_tokens.token) return integer;

    pragma inline (goto_state, parse_action);


    function goto_state (state : yy.parse_state;
                        sym   : nonterminal) return yy.parse_state is
        index : integer;
    begin
        index := goto_offset (state);
        while  integer (goto_matrix (index).nonterm) /= sym loop
            index := index + 1;
        end loop;
        return integer (goto_matrix (index).newstate);
    end goto_state;


    function parse_action (state : yy.parse_state;
                          t     : yy_tokens.token) return integer is
        index      : integer;
        tok_pos    : integer;
        default    : constant integer := -1;
    begin
        tok_pos := yy_tokens.token'pos (t);
        index   := shift_reduce_offset (state);
        while integer (shift_reduce_matrix (index).t) /= tok_pos and then
              integer (shift_reduce_matrix (index).t) /= default
        loop
            index := index + 1;
        end loop;
        return integer (shift_reduce_matrix (index).act);
    end parse_action;

--  error recovery stuff

    procedure handle_error is
      temp_action : integer;
    begin

      if yy.error_flag = 3 then -- no shift yet, clobber input.
      if yy.debug then
          text_io.put_line ("Ayacc.YYParse: Error Recovery Clobbers " &
                   yy_tokens.token'image (yy.input_symbol));
      end if;
        if yy.input_symbol = yy_tokens.end_of_input then  -- don't discard,
        if yy.debug then
            text_io.put_line ("Ayacc.YYParse: Can't discard END_OF_INPUT, quiting...");
        end if;
        raise yy_tokens.syntax_error;
        end if;

            yy.look_ahead := true;   -- get next token
        return;                  -- and try again...
    end if;

    if yy.error_flag = 0 then -- brand new error
        yyerror ("Syntax Error");
    end if;

    yy.error_flag := 3;

    -- find state on stack where error is a valid shift --

    if yy.debug then
        text_io.put_line ("Ayacc.YYParse: Looking for state with error as valid shift");
    end if;

    loop
        if yy.debug then
          text_io.put_line ("Ayacc.YYParse: Examining State " &
               yy.parse_state'image (yy.state_stack (yy.tos)));
        end if;
        temp_action := parse_action (yy.state_stack (yy.tos), error);

            if temp_action >= yy.first_shift_entry then
                if yy.tos = yy.stack_size then
                    text_io.put_line (" Stack size exceeded on state_stack");
                    raise yy_Tokens.syntax_error;
                end if;
                yy.tos := yy.tos + 1;
                yy.state_stack (yy.tos) := temp_action;
                exit;
            end if;

        Decrement_Stack_Pointer :
        begin
          yy.tos := yy.tos - 1;
        exception
          when Constraint_Error =>
            yy.tos := 0;
        end Decrement_Stack_Pointer;

        if yy.tos = 0 then
          if yy.debug then
            text_io.put_line ("Ayacc.YYParse: Error recovery popped entire stack, aborting...");
          end if;
          raise yy_tokens.syntax_error;
        end if;
    end loop;

    if yy.debug then
        text_io.put_line ("Ayacc.YYParse: Shifted error token in state " &
              yy.parse_state'image (yy.state_stack (yy.tos)));
    end if;

    end handle_error;

   --  print debugging information for a shift operation
   procedure shift_debug (state_id: yy.parse_state; lexeme: yy_tokens.token) is
   begin
       text_io.put_line ("Ayacc.YYParse: Shift "& yy.parse_state'image (state_id)&" on input symbol "&
               yy_tokens.token'image (lexeme) );
   end;

   --  print debugging information for a reduce operation
   procedure reduce_debug (rule_id: rule; state_id: yy.parse_state) is
   begin
       text_io.put_line ("Ayacc.YYParse: Reduce by rule "&rule'image (rule_id)&" goto state "&
               yy.parse_state'image (state_id));
   end;

   --  make the parser believe that 3 valid shifts have occured.
   --  used for error recovery.
   procedure yyerrok is
   begin
       yy.error_flag := 0;
   end yyerrok;

   --  called to clear input symbol that caused an error.
   procedure yyclearin is
   begin
       --  yy.input_symbol := yylex;
       yy.look_ahead := true;
   end yyclearin;


begin
    --  initialize by pushing state 0 and getting the first input symbol
    yy.state_stack (yy.tos) := 0;


    loop

        yy.index := shift_reduce_offset (yy.state_stack (yy.tos));
        if integer (shift_reduce_matrix (yy.index).t) = yy.default then
            yy.action := integer (shift_reduce_matrix (yy.index).act);
        else
            if yy.look_ahead then
                yy.look_ahead   := false;

                yy.input_symbol := yylex;
            end if;
            yy.action :=
             parse_action (yy.state_stack (yy.tos), yy.input_symbol);
        end if;


        if yy.action >= yy.first_shift_entry then  -- SHIFT

            if yy.debug then
                shift_debug (yy.action, yy.input_symbol);
            end if;

            --  Enter new state
            if yy.tos = yy.stack_size then
                text_io.put_line (" Stack size exceeded on state_stack");
                raise yy_Tokens.syntax_error;
            end if;
            yy.tos := yy.tos + 1;
            yy.state_stack (yy.tos) := yy.action;
              yy.value_stack (yy.tos) := yylval;

        if yy.error_flag > 0 then  -- indicate a valid shift
            yy.error_flag := yy.error_flag - 1;
        end if;

            --  Advance lookahead
            yy.look_ahead := true;

        elsif yy.action = yy.error_code then       -- ERROR

            handle_error;

        elsif yy.action = yy.accept_code then
            if yy.debug then
                text_io.put_line ("Ayacc.YYParse: Accepting Grammar...");
            end if;
            exit;

        else -- Reduce Action

            --  Convert action into a rule
            yy.rule_id  := -1 * yy.action;

            --  Execute User Action
            --  user_action(yy.rule_id);


                case yy.rule_id is

when  3 =>
--#line  276

        Semantics.Add_Top_Level_Tree (
yy.value_stack (yy.tos).Tree, Imports =>
yy.value_stack (yy.tos-1).List);
        if PSC.Syntax.Echo_Input then
           New_Line;
           Dump_Subtree (
yy.value_stack (yy.tos).Tree);
        end if;


when  4 =>
--#line  283

        Semantics.Add_Top_Level_Tree (
yy.value_stack (yy.tos).Tree, Imports =>
yy.value_stack (yy.tos-1).List);
        if PSC.Syntax.Echo_Input then
           New_Line;
           Dump_Subtree (
yy.value_stack (yy.tos).Tree);
        end if;


when  5 =>
--#line  290

        Semantics.Add_Top_Level_Tree (
yy.value_stack (yy.tos).Tree, Imports =>
yy.value_stack (yy.tos-1).List);
        if PSC.Syntax.Echo_Input then
           New_Line;
           Dump_Subtree (
yy.value_stack (yy.tos).Tree);
        end if;


when  6 =>
--#line  297

        Semantics.Add_Top_Level_Tree (
yy.value_stack (yy.tos).Tree, Imports =>
yy.value_stack (yy.tos-1).List);
        if PSC.Syntax.Echo_Input then
           New_Line;
           Dump_Subtree (
yy.value_stack (yy.tos).Tree);
        end if;


when  7 =>
--#line  304

        null;


when  11 =>
--#line  312


yyval := (One_List, Lists.Make ((1 =>
yy.value_stack (yy.tos).Tree)));


when  12 =>
--#line  315


yyval :=
yy.value_stack (yy.tos-2);
        Lists.Append (
yyval.List,
yy.value_stack (yy.tos).Tree);


when  13 =>
--#line  322


yyval := (One_Tree, PSC.Trees.Identifier.Make (
yy.value_stack (yy.tos).Str,
yy.value_stack (yy.tos).Source_Pos));


when  14 =>
--#line  325


yyval :=
yy.value_stack (yy.tos);


when  15 =>
--#line  328


yyval := (One_Tree, Qualified_Name.Make (
          Prefix =>
yy.value_stack (yy.tos-2).Tree,
          Id => PSC.Trees.Identifier.Make (
yy.value_stack (yy.tos).Str,
yy.value_stack (yy.tos).Source_Pos)));


when  16 =>
--#line  335

        if not Lists.Is_Empty (
yy.value_stack (yy.tos).List)
          or else PSC.Syntax.Cur_File /= Last_Import_File then
            --  We have a new non-empty list of imports, or a new file;
            --  this list overrides any earlier list
            Last_Import_List :=
yy.value_stack (yy.tos).List;
            Last_Import_File := PSC.Syntax.Cur_File;
        end if;

yyval := (One_List, Last_Import_List);


when  17 =>
--#line  347


yyval := (One_List, Lists.Empty_List);


when  18 =>
--#line  350


yyval :=
yy.value_stack (yy.tos-1);
        Lists.Append (
yyval.List,
yy.value_stack (yy.tos).List);


when  19 =>
--#line  360


yyval :=
yy.value_stack (yy.tos-1);


when  20 =>
--#line  373


yyval :=
yy.value_stack (yy.tos);
        declare
            Mod_Tree : Module.Tree renames
              Module.Tree (Tree_Ptr_Of (
yyval.Tree).all);
        begin
            Mod_Tree.Has_Formals := True;
            Mod_Tree.Module_Formals :=
yy.value_stack (yy.tos-1).List;
        end;


when  21 =>
--#line  385


yyval :=
yy.value_stack (yy.tos-1); --  TBD


when  22 =>
--#line  391


yyval := (One_List, Lists.Empty_List);


when  23 =>
--#line  394


yyval :=
yy.value_stack (yy.tos);


when  24 =>
--#line  399


yyval :=
yy.value_stack (yy.tos-1);


when  25 =>
--#line  402


yyval :=
yy.value_stack (yy.tos-2);
        Lists.Append (
yyval.List,
yy.value_stack (yy.tos-1).List);


when  26 =>
--#line  409


yyval := (One_List, Lists.Make ((1 =>
yy.value_stack (yy.tos).Tree)));


when  27 =>
--#line  412


yyval :=
yy.value_stack (yy.tos);


when  28 =>
--#line  418


yyval := (One_Tree, Type_Decl.Make (
          Name =>
yy.value_stack (yy.tos-3).Tree,
          Is_New_Type => False,  --  Note, not really a "new" type
          Type_Definition =>
yy.value_stack (yy.tos).Tree));


when  29 =>
--#line  424

        yyerror ("""new"" required", At_Token =>
yy.value_stack (yy.tos));

yyval := (One_Tree, Type_Decl.Make (
          Name =>
yy.value_stack (yy.tos-3).Tree,
          Is_New_Type => False,  --  Note, not really a "new" type
          Type_Definition =>
yy.value_stack (yy.tos).Tree));


when  30 =>
--#line  434


yyval :=
yy.value_stack (yy.tos);


when  31 =>
--#line  440

yyval :=
yy.value_stack (yy.tos);

when  32 =>
--#line  447

      declare
        Elem_List : Lists.List :=
yy.value_stack (yy.tos-5).List;
      begin
        --  if $1.Is_Private and then $4.Has_Module_Formals then
        --     yyerror("Private pkg_spec may not add package parameters");
        --  end if;
        if not Lists.Is_Empty (
yy.value_stack (yy.tos-4).List) then
            --  Include the opt_annotation
            Lists.Append (Elem_List, Annotation.Make (Annotations =>
yy.value_stack (yy.tos-4).List));
        end if;

yyval := (One_Tree, Tree => PSC.Trees.Module.Make (
          Name => Name_For_Module (
yy.value_stack (yy.tos-7).Tree),
          Add_On_Label => Add_On_For_Module (
yy.value_stack (yy.tos-7).Tree),
          Is_Interface => True,
          Is_Abstract => False,
          Is_Private =>
yy.value_stack (yy.tos-9).Is_Present,
          Is_Concurrent => False,
          Is_Limited => True,  --  Packages are never assignable
          Has_Formals => False,
          Module_Formals => Lists.Empty_List,
          Extends_Interface => Null_Optional_Tree,
          Implements_Interfaces => Lists.Empty_List,
          Class_Locals => Lists.Empty_List,
          Module_Exports => Elem_List,
          Module_New_Exports =>
yy.value_stack (yy.tos-3).List,
          Module_Implements =>
yy.value_stack (yy.tos-2).List));

        if
yy.value_stack (yy.tos).Check_Label then
            Check_Id_Match (Starting_Id => Name_For_Module (
yy.value_stack (yy.tos-7).Tree),
              Ending_Id =>
yy.value_stack (yy.tos).Label);
        end if;

      end;


when  33 =>
--#line  484

        --  if $1.Is_Private and then $4.Has_Module_Formals then
        --     yyerror("Private pkg_spec may not add package parameters");
        --  end if;

yyval := (One_Tree, Tree => PSC.Trees.Module.Make (
          Name => Name_For_Module (
yy.value_stack (yy.tos-5).Tree),
          Add_On_Label => Add_On_For_Module (
yy.value_stack (yy.tos-5).Tree),
          Is_Interface => True,
          Is_Abstract => False,
          Is_Private =>
yy.value_stack (yy.tos-7).Is_Present,
          Is_Concurrent => False,
          Is_Limited => True,  --  Packages are never assignable
          Has_Formals => False,
          Module_Formals => Lists.Empty_List,
          Extends_Interface => Null_Optional_Tree,
          Implements_Interfaces => Lists.Empty_List,
          Class_Locals => Lists.Empty_List,
          Module_Exports => Lists.Empty_List,
          Module_New_Exports => Lists.Empty_List,
          Module_Implements => Lists.Empty_List));

        Check_Id_Match (Starting_Id => Name_For_Module (
yy.value_stack (yy.tos-5).Tree),
          Ending_Id =>
yy.value_stack (yy.tos-1).Tree);


when  34 =>
--#line  512

yyval :=
yy.value_stack (yy.tos-1);

when  35 =>
--#line  516

        --  Instantiate a package, not intended to be used as a type.

yyval := (One_Tree, Tree => PSC.Trees.Module.Make (
          Name =>
yy.value_stack (yy.tos-2).Tree,
          Add_On_Label => Lists.Empty_List,
          Is_Interface => True,
          Is_Abstract => False,
          Is_Private =>
yy.value_stack (yy.tos-4).Is_Present,
          Is_Concurrent => False,
          Is_Limited => True,
          Has_Formals => True,
          Treat_As_Type => False,
          Module_Formals => Lists.Empty_List,
          Extends_Interface =>
yy.value_stack (yy.tos).Tree,
          Implements_Interfaces => Lists.Empty_List,
          Class_Locals => Lists.Empty_List,
          Module_Exports => Lists.Empty_List,
          Module_New_Exports => Lists.Empty_List,
          Module_Implements => Lists.Empty_List));


when  37 =>
--#line  539

        yyerror ("Syntax error before ""is""", At_Token =>
yy.value_stack (yy.tos-1));


when  41 =>
--#line  552


yyval := (Optional_End_Token,
                Source_Pos => PSC.Source_Positions.Null_Source_Position,
                End_Construct_Str => PSC.Strings.Null_U_String,
                Check_Label => False,
                others => Null_Optional_Tree);


when  42 =>
--#line  559


yyval := (Optional_End_Token,
                Source_Pos =>
yy.value_stack (yy.tos-3).Source_Pos,
                End_Construct_Str =>
yy.value_stack (yy.tos-2).Str, Check_Label => True,
                Label =>
yy.value_stack (yy.tos-1).Tree, others => Null_Optional_Tree);


when  44 =>
--#line  569

yyval :=
yy.value_stack (yy.tos);

when  45 =>
--#line  570


yyval := (One_Token,
          PSC.Source_Positions.Null_Source_Position,
          PSC.Strings.Null_U_String);


when  46 =>
--#line  578

yyval :=
yy.value_stack (yy.tos);

when  47 =>
--#line  579


yyval := (Construct_Qualifier,
               Source_Pos => PSC.Source_Positions.Null_Source_Position,
               others => False);


when  48 =>
--#line  587

yyval :=
yy.value_stack (yy.tos);

when  49 =>
--#line  588


yyval := (Construct_Qualifier,
          Source_Pos =>
yy.value_stack (yy.tos-1).Source_Pos,
          Is_Abstract => True,
          Is_Concurrent =>
yy.value_stack (yy.tos).Is_Concurrent,
          others => False);


when  50 =>
--#line  595


yyval := (Construct_Qualifier,
          Source_Pos =>
yy.value_stack (yy.tos-1).Source_Pos,
          Is_Private => True,
          Is_Concurrent =>
yy.value_stack (yy.tos).Is_Concurrent,
          others => False);


when  51 =>
--#line  605

yyval :=
yy.value_stack (yy.tos);

when  52 =>
--#line  606


yyval := (Construct_Qualifier,
               Source_Pos => PSC.Source_Positions.Null_Source_Position,
               others => False);


when  53 =>
--#line  613


yyval := (Construct_Qualifier,
               Source_Pos =>
yy.value_stack (yy.tos).Source_Pos,
               Is_Concurrent => True, others => False);


when  54 =>
--#line  620


yyval :=
yy.value_stack (yy.tos);


when  55 =>
--#line  623

yyval :=
yy.value_stack (yy.tos-1);

when  56 =>
--#line  624

yyval :=
yy.value_stack (yy.tos-1);

when  57 =>
--#line  628

yyval :=
yy.value_stack (yy.tos-1);

when  58 =>
--#line  629

yyval := (One_List, Lists.Empty_List);

when  60 =>
--#line  632

        if Sparkel_Lex.Debug_Indent
          and then Sparkel_Lex.Expecting_Indent
        then
            Text_IO.Put (" [colon with indent off] "); Text_IO.Flush;
        end if;
        Sparkel_Lex.Expecting_Indent := False;


when  61 =>
--#line  642

yyval :=
yy.value_stack (yy.tos);

when  62 =>
--#line  643


yyval := (Optional, Is_Present => False);


when  63 =>
--#line  648

yyval :=
yy.value_stack (yy.tos);

when  64 =>
--#line  651

yyval :=
yy.value_stack (yy.tos);

when  65 =>
--#line  652


yyval := (One_Tree, Invocation.Make (
          Kind => Invocation.Container_Indexing,
          Prefix =>
yy.value_stack (yy.tos-1).Tree,
          Operands =>
yy.value_stack (yy.tos).List));


when  66 =>
--#line  661


yyval :=
yy.value_stack (yy.tos-1);


when  67 =>
--#line  666

yyval :=
yy.value_stack (yy.tos);

when  68 =>
--#line  667


yyval := (One_List, Lists.Empty_List);


when  69 =>
--#line  672

yyval :=
yy.value_stack (yy.tos);

when  70 =>
--#line  673


yyval :=
yy.value_stack (yy.tos-2);
        Lists.Append (
yyval.List,
yy.value_stack (yy.tos).List);


when  71 =>
--#line  680

        Annotation.Add_Annotation (
yy.value_stack (yy.tos-1).Tree,
yy.value_stack (yy.tos-2).List, Precedes => True);
        Annotation.Add_Annotation (
yy.value_stack (yy.tos-1).Tree,
yy.value_stack (yy.tos).List);

yyval := (One_List, Lists.Make ((1 =>
yy.value_stack (yy.tos-1).Tree)));


when  72 =>
--#line  689


yyval :=
yy.value_stack (yy.tos-1);
        if not Lists.Is_Empty (
yy.value_stack (yy.tos-2).List) then
            --  Add annotation to first element
            Annotation.Add_Annotation (
              Lists.Nth_Element (
yyval.List, 1),
yy.value_stack (yy.tos-2).List, Precedes => True);
        end if;

        if not Lists.Is_Empty (
yy.value_stack (yy.tos).List) then
            --  Add annotation to last element
            Annotation.Add_Annotation (
              Lists.Nth_Element (
yyval.List, Lists.Length (
yyval.List)),
yy.value_stack (yy.tos).List);
        end if;


when  73 =>
--#line  706

yyval :=
yy.value_stack (yy.tos);

when  74 =>
--#line  707


yyval := (One_List, Lists.Empty_List);


when  75 =>
--#line  713

yyval :=
yy.value_stack (yy.tos);

when  76 =>
--#line  714


yyval := (One_List, Lists.Empty_List);


when  77 =>
--#line  720


yyval := (One_Tree, Type_Decl.Make (
          Name =>
yy.value_stack (yy.tos-2).Tree,
          Is_New_Type => False,
          Type_Definition =>
yy.value_stack (yy.tos).Tree));


when  78 =>
--#line  726


yyval := (One_Tree, Type_Decl.Make (
          Name => Null_Optional_Tree,
          Is_New_Type => False,
          Type_Definition =>
yy.value_stack (yy.tos).Tree));


when  79 =>
--#line  734

        if Sparkel_Lex.Debug_Indent
          and then Sparkel_Lex.Expecting_Indent
        then
            Text_IO.Put (" [is with indent off] "); Text_IO.Flush;
        end if;
        Sparkel_Lex.Expecting_Indent := False;


when  80 =>
--#line  775

yyval :=
yy.value_stack (yy.tos);

when  81 =>
--#line  776

yyval := (One_Tree, Null_Optional_Tree);

when  82 =>
--#line  782

        --  "simple_expression" to avoid use of '>'

yyval := (One_List, Lists.Empty_List);
        for I in 1..Lists.Length (
yy.value_stack (yy.tos-4).List) loop
            Lists.Append (
yyval.List, Param_Decl.Make (
              Name => Lists.Nth_Element (
yy.value_stack (yy.tos-4).List, I),
              Kind => Param_Decl.Default_Param,
              Locking => Param_Decl.Not_Locked,
              Is_Optional =>
yy.value_stack (yy.tos-2).Is_Optional,
              Param_Type =>
yy.value_stack (yy.tos-1).Tree,
              Param_Default =>
yy.value_stack (yy.tos).Tree));
        end loop;


when  83 =>
--#line  797

        --  "simple_expression" to avoid use of '>'

yyval := (One_List, Lists.Empty_List);
        for I in 1..Lists.Length (
yy.value_stack (yy.tos-4).List) loop
            Lists.Append (
yyval.List, Param_Decl.Make (
              Name => Lists.Nth_Element (
yy.value_stack (yy.tos-4).List, I),
              Kind =>
yy.value_stack (yy.tos-5).Param_Kind,
              Locking => Param_Decl.Not_Locked,
              Is_Optional =>
yy.value_stack (yy.tos-2).Is_Optional,
              Param_Type =>
yy.value_stack (yy.tos-1).Tree,
              Param_Default =>
yy.value_stack (yy.tos).Tree));
        end loop;


when  84 =>
--#line  811


yyval := (One_List, Lists.Make ((1 => Param_Decl.Make (
          Name => Null_Optional_Tree,
          Kind =>
yy.value_stack (yy.tos-1).Param_Kind,
          Locking => Param_Decl.Not_Locked,
          Is_Optional => False,
          Param_Type =>
yy.value_stack (yy.tos).Tree,
          Param_Default => Null_Optional_Tree))));


when  85 =>
--#line  822

yyval :=
yy.value_stack (yy.tos);

when  86 =>
--#line  825

yyval :=
yy.value_stack (yy.tos);

when  87 =>
--#line  826

yyval := (One_Tree, Null_Optional_Tree);

when  88 =>
--#line  830


yyval := (One_Tree, PSC.Trees.Identifier.Make (
yy.value_stack (yy.tos).Str,
yy.value_stack (yy.tos).Source_Pos));


when  89 =>
--#line  839


yyval := (One_List, Lists.Make ((1 =>
yy.value_stack (yy.tos).Tree)));


when  90 =>
--#line  842


yyval :=
yy.value_stack (yy.tos-2);
        Lists.Append (
yyval.List,
yy.value_stack (yy.tos).Tree);


when  91 =>
--#line  849

yyval :=
yy.value_stack (yy.tos);

when  92 =>
--#line  850

yyval :=
yy.value_stack (yy.tos);

when  93 =>
--#line  853


yyval := (One_Tree, Qualifier.Qualify (
            Qualifiers => (Qualifier.Is_Polymorphic => True, others => False),
            Operand =>
yy.value_stack (yy.tos-1).Tree));


when  94 =>
--#line  860


yyval :=
yy.value_stack (yy.tos);


when  95 =>
--#line  863


yyval := (One_Tree, Selection.Make (
          Prefix =>
yy.value_stack (yy.tos-2).Tree,
          Selector =>
yy.value_stack (yy.tos).Tree));


when  96 =>
--#line  868


yyval := (One_Tree, Qualified_Name.Make (
          Prefix =>
yy.value_stack (yy.tos-2).Tree,
          Id =>
yy.value_stack (yy.tos).Tree));


when  97 =>
--#line  876

yyval :=
yy.value_stack (yy.tos);

when  98 =>
--#line  877

yyval :=
yy.value_stack (yy.tos);

when  99 =>
--#line  880

        --  String_Literal can be used as a "name" when it is an operator

yyval := (One_Tree, PSC.Trees.Identifier.Make (
yy.value_stack (yy.tos).Str,
yy.value_stack (yy.tos).Source_Pos));


when  100 =>
--#line  887


yyval := (One_Tree, Invocation.Make (
          Kind => Invocation.Module_Instantiation,
          Prefix =>
yy.value_stack (yy.tos-3).Tree,
          Operands =>
yy.value_stack (yy.tos-1).List));


when  101 =>
--#line  893

        --  Include extension label in package name

yyval := (One_Tree, Invocation.Make (
          Kind => Invocation.Module_Instantiation,
          Prefix =>
            Invocation.Make (
              Kind => Invocation.Container_Indexing,
              Prefix =>
yy.value_stack (yy.tos-6).Tree,
              Operands =>
yy.value_stack (yy.tos-4).List),
          Operands =>
yy.value_stack (yy.tos-1).List));


when  102 =>
--#line  907

yyval :=
yy.value_stack (yy.tos);

when  103 =>
--#line  908


yyval := (One_List, Lists.Empty_List);


when  104 =>
--#line  914

yyval :=
yy.value_stack (yy.tos);

when  105 =>
--#line  915


yyval := (One_List, Lists.Empty_List);


when  106 =>
--#line  921


yyval := (One_List, Lists.Make ((1 =>
yy.value_stack (yy.tos).Tree)));


when  107 =>
--#line  924


yyval :=
yy.value_stack (yy.tos-2);
        Lists.Append (
yyval.List,
yy.value_stack (yy.tos).Tree);


when  108 =>
--#line  931

yyval :=
yy.value_stack (yy.tos);

when  109 =>
--#line  932


yyval := (One_Tree, Reference.Make (
          Key =>
yy.value_stack (yy.tos-2).Tree,
          Referent =>
yy.value_stack (yy.tos).Tree));


when  110 =>
--#line  941

        --  polymorphic type name not allowed here

yyval :=
yy.value_stack (yy.tos-1);
        Annotation.Add_Annotation (
yyval.Tree,
yy.value_stack (yy.tos).List);


when  111 =>
--#line  946


yyval :=
yy.value_stack (yy.tos-1);
        Annotation.Add_Annotation (
yyval.Tree,
yy.value_stack (yy.tos).List);


when  112 =>
--#line  950

        --  This is a polymorphic type name, presumably.
        --  We use adding_expression instead of expanded_name
        --  to avoid reduce/reduce conflicts in the grammar.

yyval := (One_Tree, Qualifier.Qualify (
            Qualifiers => (Qualifier.Is_Polymorphic => True, others => False),
            Operand =>
yy.value_stack (yy.tos-1).Tree));


when  113 =>
--#line  958

yyval :=
yy.value_stack (yy.tos);

when  114 =>
--#line  960

yyval :=
yy.value_stack (yy.tos);

when  115 =>
--#line  961

yyval :=
yy.value_stack (yy.tos);

when  116 =>
--#line  965

yyval :=
yy.value_stack (yy.tos);

when  117 =>
--#line  966


yyval :=
yy.value_stack (yy.tos-1);
        Annotation.Add_Annotation (
yyval.Tree,
yy.value_stack (yy.tos).List);


when  118 =>
--#line  973

yyval :=
yy.value_stack (yy.tos);

when  119 =>
--#line  974


yyval :=
yy.value_stack (yy.tos-1);
        Annotation.Add_Annotation (
yyval.Tree,
yy.value_stack (yy.tos).List);


when  120 =>
--#line  978


yyval :=
yy.value_stack (yy.tos);


when  121 =>
--#line  984

yyval :=
yy.value_stack (yy.tos);

when  122 =>
--#line  985

yyval :=
yy.value_stack (yy.tos);

when  123 =>
--#line  989


yyval :=
yy.value_stack (yy.tos);


when  124 =>
--#line  992


yyval :=
yy.value_stack (yy.tos);


when  125 =>
--#line  995


yyval := (One_Tree, Invocation.Add_Extends (
          Instantiation =>
yy.value_stack (yy.tos-2).Tree,
          Extends =>
yy.value_stack (yy.tos).Tree));


when  126 =>
--#line  1003


yyval := (One_Tree, Qualifier.Qualify (
          Qualifiers => (Is_Optional =>
yy.value_stack (yy.tos-1).Is_Optional,
            Is_Concurrent =>
yy.value_stack (yy.tos-1).Is_Concurrent,
            others => False),
          Operand =>
yy.value_stack (yy.tos).Tree));


when  127 =>
--#line  1010


yyval := (One_Tree, Qualifier.Qualify (
          Qualifiers => (Is_Optional =>
yy.value_stack (yy.tos-1).Is_Optional,
            Is_Concurrent =>
yy.value_stack (yy.tos-1).Is_Concurrent,
            others => False),
          Operand =>
yy.value_stack (yy.tos).Tree));


when  128 =>
--#line  1018


yyval := (One_Tree, Qualifier.Qualify (
          Qualifiers => (Is_Optional =>
yy.value_stack (yy.tos-3).Is_Optional,
            Is_Concurrent =>
yy.value_stack (yy.tos-3).Is_Concurrent,
            others => False),
          Operand => Invocation.Add_Extends (
            Instantiation =>
yy.value_stack (yy.tos-2).Tree,
            Extends =>
yy.value_stack (yy.tos).Tree)));


when  129 =>
--#line  1030


yyval := (Construct_Qualifier,
          Source_Pos =>
yy.value_stack (yy.tos-1).Source_Pos,
          Is_Optional => True,
          Is_Concurrent =>
yy.value_stack (yy.tos).Is_Present,
          others => False);


when  130 =>
--#line  1037


yyval := (Construct_Qualifier,
               Source_Pos =>
yy.value_stack (yy.tos).Source_Pos,
               Is_Concurrent => True, others => False);


when  131 =>
--#line  1045


yyval := (Optional, True);


when  132 =>
--#line  1048


yyval := (Optional, False);


when  133 =>
--#line  1054


yyval := (One_Tree, Operation.Make (
          Name => Null_Optional_Tree,
          Operation_Kind => Operation.Proc_Type_Specifier,
          Operation_Inputs =>
yy.value_stack (yy.tos).List,
          Operation_Outputs => Lists.Empty_List,
          Preconditions => Null_Optional_Tree,
          Postconditions => Null_Optional_Tree,
          Is_Abstract => False,
          Is_Optional => False,
          Is_Queued => False,
          Is_Def => False,
          Statements => Null_Optional_Tree));


when  134 =>
--#line  1068


yyval := (One_Tree, Operation.Make (
          Name => Null_Optional_Tree,
          Operation_Kind => Operation.Func_Type_Specifier,
          Operation_Inputs =>
yy.value_stack (yy.tos-2).List,
          Operation_Outputs =>
yy.value_stack (yy.tos).List,
          Preconditions => Null_Optional_Tree,
          Postconditions => Null_Optional_Tree,
          Is_Abstract => False,
          Is_Optional => False,
          Is_Queued => False,
          Is_Def => False,
          Statements => Null_Optional_Tree));


when  135 =>
--#line  1084

yyval := (One_List, Lists.Empty_List);

when  136 =>
--#line  1085

        if Lists.Is_Empty (
yy.value_stack (yy.tos-1).List) then
            --  We want to make sure that we return a non-empty list

yyval := (One_List,
              Lists.Make ((1 => Annotation.Make (Annotations =>
yy.value_stack (yy.tos).List))));
        else

yyval :=
yy.value_stack (yy.tos-1);
            if not Lists.Is_Empty (
yy.value_stack (yy.tos).List) then
                --  Add annotation to item at end of list
                Annotation.Add_Annotation (
                  Lists.Nth_Element (
yyval.List, Lists.Length (
yyval.List)),

yy.value_stack (yy.tos).List);
            end if;
        end if;


when  139 =>
--#line  1104


yyval := (One_List, Lists.Empty_List);


when  140 =>
--#line  1107


yyval :=
yy.value_stack (yy.tos-2);
        if not Lists.Is_Empty (
yy.value_stack (yy.tos-1).List) then
            --  Add annotation to pkg_spec_element
            Annotation.Add_Annotation (

yy.value_stack (yy.tos).Tree,
yy.value_stack (yy.tos-1).List, Precedes => True);
        end if;
        Lists.Append (
yyval.List,
yy.value_stack (yy.tos).Tree);


when  141 =>
--#line  1117


yyval :=
yy.value_stack (yy.tos-3);
        if not Lists.Is_Empty (
yy.value_stack (yy.tos-2).List) then
            --  Add annotation to pkg_spec_element
            Annotation.Add_Annotation (

yy.value_stack (yy.tos-1).Tree,
yy.value_stack (yy.tos-2).List, Precedes => True);
        end if;
        Lists.Append (
yyval.List,
yy.value_stack (yy.tos-1).Tree);


when  142 =>
--#line  1127


yyval :=
yy.value_stack (yy.tos-3);
        if not Lists.Is_Empty (
yy.value_stack (yy.tos-2).List) then
            --  Add annotation to pkg_spec_element
            Annotation.Add_Annotation (

yy.value_stack (yy.tos-1).Tree,
yy.value_stack (yy.tos-2).List, Precedes => True);
        end if;
        Lists.Append (
yyval.List,
yy.value_stack (yy.tos-1).Tree);


when  143 =>
--#line  1140


yyval :=
yy.value_stack (yy.tos-2);


when  144 =>
--#line  1146

yyval :=
yy.value_stack (yy.tos-1);

when  145 =>
--#line  1147

yyval :=
yy.value_stack (yy.tos);

when  146 =>
--#line  1151

yyval :=
yy.value_stack (yy.tos);

when  147 =>
--#line  1152

yyval :=
yy.value_stack (yy.tos);

when  148 =>
--#line  1153

yyval :=
yy.value_stack (yy.tos);

when  149 =>
--#line  1154

yyval :=
yy.value_stack (yy.tos);

when  150 =>
--#line  1158

yyval :=
yy.value_stack (yy.tos);

when  151 =>
--#line  1159

yyval :=
yy.value_stack (yy.tos);

when  152 =>
--#line  1160

yyval :=
yy.value_stack (yy.tos);

when  153 =>
--#line  1161

yyval :=
yy.value_stack (yy.tos);

when  154 =>
--#line  1165

yyval :=
yy.value_stack (yy.tos);

when  155 =>
--#line  1166


yyval := (One_List, Lists.Empty_List);


when  156 =>
--#line  1172

      declare
        Elem_List : Lists.List :=
yy.value_stack (yy.tos-1).List;
      begin
        if not Lists.Is_Empty (
yy.value_stack (yy.tos).List) then
            --  Include the opt_annotation
            Lists.Append (Elem_List, Annotation.Make (Annotations =>
yy.value_stack (yy.tos).List));
        end if;

yyval := (One_List, Lists.Make ((1 => Implements_Element.Make (
          For_Interfaces => Lists.Empty_List,
          Elements => Elem_List))));
      end;


when  159 =>
--#line  1190

yyval :=
yy.value_stack (yy.tos);

when  160 =>
--#line  1191


yyval := (One_List, Lists.Empty_List);


when  161 =>
--#line  1197

      declare
        Elem_List : Lists.List :=
yy.value_stack (yy.tos).List;
      begin

yyval := (One_List, Lists.Make ((1 => Implements_Element.Make (
          For_Interfaces => Lists.Empty_List,
          Elements => Elem_List))));
      end;


when  162 =>
--#line  1209


yyval := (One_Tree, Operation.Add_Import_Info (
        Op_Decl =>
yy.value_stack (yy.tos-2).Tree, Import_Info =>
yy.value_stack (yy.tos).List));


when  164 =>
--#line  1217

        --  Pop the indent stack
        if Sparkel_Lex.Debug_Indent then
            Text_IO.Put (" [IS: popping top indent] "); Text_IO.Flush;
        end if;
        Sparkel_Lex.Top := Sparkel_Lex.Top - 1;


when  165 =>
--#line  1226


yyval := (One_Tree, Operation.Add_Op_Equiv (
          Op_Decl =>
yy.value_stack (yy.tos-2).Tree, Op_Equiv =>
yy.value_stack (yy.tos).Tree));


when  166 =>
--#line  1230

        --  Indicate that operation should be found in given type

yyval := (One_Tree, Operation.Add_Op_Location (
          Op_Decl =>
yy.value_stack (yy.tos-3).Tree, Op_Location =>
yy.value_stack (yy.tos).Tree));


when  167 =>
--#line  1235


yyval := (One_Tree, Operation.Add_Op_Equiv (
          Op_Decl =>
yy.value_stack (yy.tos-4).Tree, Op_Equiv =>
yy.value_stack (yy.tos-2).Tree));

yyval := (One_Tree, Operation.Add_Op_Location (
          Op_Decl =>
yy.value_stack (yy.tos-4).Tree, Op_Location =>
yy.value_stack (yy.tos).Tree));


when  168 =>
--#line  1241

        declare
            Op_Decl : Operation.Tree :=
              Operation.Tree (Tree_Of (
yy.value_stack (yy.tos-4).Tree));
        begin
            Op_Decl.Is_Def := True;
            Op_Decl.Is_Expression_Function := True;
            Op_Decl.Statements := Invocation.Make
              (Kind => Invocation.Class_Aggregate,
               Prefix => Null_Optional_Tree,
               Operands =>
yy.value_stack (yy.tos-1).List,
               Source_Pos =>
yy.value_stack (yy.tos-2).Source_Pos);

yyval := (One_Tree, Optional (Op_Decl));
        end;


when  169 =>
--#line  1256


yyval := (One_Tree, Operation.Add_Op_Equiv (
          Op_Decl =>
yy.value_stack (yy.tos-2).Tree, Op_Equiv =>
yy.value_stack (yy.tos).Tree));
        if Sparkel_Lex.Debug_Indent then
            Text_IO.Put (" [IS: popping top indent] "); Text_IO.Flush;
        end if;
        Sparkel_Lex.Top := Sparkel_Lex.Top - 1;  --  Pop the indent stack


when  170 =>
--#line  1264


yyval := (One_Tree, Operation.Add_Op_Equiv (
          Op_Decl =>
yy.value_stack (yy.tos-4).Tree, Op_Equiv =>
yy.value_stack (yy.tos-2).Tree));

yyval := (One_Tree, Operation.Add_Op_Location (
          Op_Decl =>
yy.value_stack (yy.tos-4).Tree, Op_Location =>
yy.value_stack (yy.tos).Tree));
        if Sparkel_Lex.Debug_Indent then
            Text_IO.Put (" [IS: popping top indent] "); Text_IO.Flush;
        end if;
        Sparkel_Lex.Top := Sparkel_Lex.Top - 1;  --  Pop the indent stack


when  171 =>
--#line  1274

        declare
            Op_Decl : Operation.Tree :=
              Operation.Tree (Tree_Of (
yy.value_stack (yy.tos-4).Tree));
        begin
            Op_Decl.Is_Def := True;
            Op_Decl.Is_Expression_Function := True;
            Op_Decl.Statements := Invocation.Make
              (Kind => Invocation.Class_Aggregate,
               Prefix => Null_Optional_Tree,
               Operands =>
yy.value_stack (yy.tos-1).List,
               Source_Pos =>
yy.value_stack (yy.tos-2).Source_Pos);

yyval := (One_Tree, Optional (Op_Decl));
            if Sparkel_Lex.Debug_Indent then
                Text_IO.Put (" [IS: popping top indent] "); Text_IO.Flush;
            end if;
            Sparkel_Lex.Top := Sparkel_Lex.Top - 1;  --  Pop the indent stack
        end;


when  172 =>
--#line  1295

yyval := (One_List, Lists.Empty_List);

when  173 =>
--#line  1296

        if Lists.Is_Empty (
yy.value_stack (yy.tos).List) then
            --  We want to make sure that we return a non-empty list

yyval := (One_List, Lists.Make ((1 => Null_Optional_Tree)));
        else

yyval :=
yy.value_stack (yy.tos);
        end if;


when  174 =>
--#line  1308


yyval := (Two_Lists, Lists.Empty_List,
yy.value_stack (yy.tos).List);


when  175 =>
--#line  1319

        --  Include annotation at end of locals
      declare
        Locals : Lists.List :=
yy.value_stack (yy.tos-3).List;
      begin
        if not Lists.Is_Empty (
yy.value_stack (yy.tos-2).List) then
            Lists.Append (Locals, Annotation.Make (Annotations =>
yy.value_stack (yy.tos-2).List));
        end if;


yyval := (Two_Lists, Locals,
yy.value_stack (yy.tos).List);
      end;


when  176 =>
--#line  1331

        yyerror ("Missing ""exports"" keyword");

yyval := (Two_Lists, Lists.Empty_List,
yy.value_stack (yy.tos).List);


when  180 =>
--#line  1339


yyval := (One_List, Lists.Empty_List);


when  181 =>
--#line  1342


yyval :=
yy.value_stack (yy.tos-1);
        Lists.Append (
yyval.List,
yy.value_stack (yy.tos).Tree);


when  182 =>
--#line  1349

yyval :=
yy.value_stack (yy.tos);

when  183 =>
--#line  1350

yyval :=
yy.value_stack (yy.tos-1);

when  184 =>
--#line  1351

yyval :=
yy.value_stack (yy.tos-1);

when  185 =>
--#line  1352

yyval :=
yy.value_stack (yy.tos);

when  186 =>
--#line  1355


yyval := (One_List, Lists.Empty_List);


when  187 =>
--#line  1358


yyval :=
yy.value_stack (yy.tos-1);
        Lists.Append (
yyval.List,
yy.value_stack (yy.tos).Tree);


when  188 =>
--#line  1362


yyval :=
yy.value_stack (yy.tos-2);
        Lists.Append (
yyval.List,
yy.value_stack (yy.tos-1).Tree);


when  189 =>
--#line  1366


yyval :=
yy.value_stack (yy.tos-2);
        Lists.Append (
yyval.List,
yy.value_stack (yy.tos-1).Tree);


when  190 =>
--#line  1370

        yyerror ("This kind of declaration not permitted after ""exports""",
          At_Token =>
yy.value_stack (yy.tos));

yyval :=
yy.value_stack (yy.tos-1);
        Lists.Append (
yyval.List,
yy.value_stack (yy.tos).Tree);


when  191 =>
--#line  1376


yyval :=
yy.value_stack (yy.tos-2);


when  192 =>
--#line  1382

yyval :=
yy.value_stack (yy.tos);

when  193 =>
--#line  1383


yyval := (One_Tree, Annotation.Make (Annotations =>
yy.value_stack (yy.tos).List));


when  194 =>
--#line  1386


yyval :=
yy.value_stack (yy.tos);
        Annotation.Add_Annotation (
yyval.Tree,
yy.value_stack (yy.tos-1).List, Precedes => True);


when  195 =>
--#line  1393

yyval :=
yy.value_stack (yy.tos);

when  196 =>
--#line  1394

yyval :=
yy.value_stack (yy.tos);

when  197 =>
--#line  1395

yyval :=
yy.value_stack (yy.tos);

when  198 =>
--#line  1404

        --  TBD: allow an annotation after pkg_body_element_list

yyval := (One_Tree, PSC.Trees.Module.Make (
          Name => Name_For_Module (
yy.value_stack (yy.tos-6).Tree),
          Add_On_Label => Add_On_For_Module (
yy.value_stack (yy.tos-6).Tree),
          Is_Interface => False,
          Is_Abstract => False,
          Is_Private =>
yy.value_stack (yy.tos-9).Is_Present,
          Is_Concurrent => False,
          Is_Limited => True,  --  Packages are never assignable
          Has_Formals => False,
          Module_Formals => Lists.Empty_List,
          Extends_Interface => Null_Optional_Tree,
          Implements_Interfaces => Lists.Empty_List,
          Class_Locals =>
yy.value_stack (yy.tos-4).First_List,
          Module_Exports =>
yy.value_stack (yy.tos-4).Second_List,
          Module_New_Exports =>
yy.value_stack (yy.tos-3).List,
          Module_Implements =>
yy.value_stack (yy.tos-2).List));
            --  NOTE: Module_Implements is where bodies would go
            --       if there is some ambiguity between operations that
            --       are in the "normal" pkg_spec part vs. in the
            --       "implements" part of the pkg_spec.

        if
yy.value_stack (yy.tos).Check_Label then
            Check_Id_Match (Starting_Id => Name_For_Module (
yy.value_stack (yy.tos-6).Tree),
              Ending_Id =>
yy.value_stack (yy.tos).Label);
        end if;


when  199 =>
--#line  1434


yyval := (Optional, Is_Present => False);


when  200 =>
--#line  1437


yyval := (Optional, Is_Present => True);


when  201 =>
--#line  1442

yyval :=
yy.value_stack (yy.tos);

when  202 =>
--#line  1443

yyval :=
yy.value_stack (yy.tos);

when  203 =>
--#line  1444


yyval :=
yy.value_stack (yy.tos-1);
        Lists.Append (
yyval.List,
yy.value_stack (yy.tos).List);


when  204 =>
--#line  1451

yyval :=
yy.value_stack (yy.tos-1);

when  205 =>
--#line  1452


yyval :=
yy.value_stack (yy.tos-2);
        Lists.Append (
yyval.List,
yy.value_stack (yy.tos-1).List);


when  206 =>
--#line  1458

yyval :=
yy.value_stack (yy.tos-1);

when  207 =>
--#line  1459


yyval :=
yy.value_stack (yy.tos-3);
        Lists.Append (
yyval.List,
yy.value_stack (yy.tos-1).List);


when  208 =>
--#line  1466


yyval :=
yy.value_stack (yy.tos);


when  209 =>
--#line  1469

        --  A labeled annotation list becomes a separate nested annotation

yyval := (One_List, Lists.Make
                 ((1 => Annotation.Make
                   (Annotations =>
yy.value_stack (yy.tos).List, Label =>
yy.value_stack (yy.tos-1).Tree))));


when  210 =>
--#line  1479


yyval := (One_List, Lists.Make ((1 =>
yy.value_stack (yy.tos).Tree)));


when  211 =>
--#line  1482


yyval :=
yy.value_stack (yy.tos-2);
        Lists.Append (
yyval.List,
yy.value_stack (yy.tos).Tree);


when  212 =>
--#line  1486


yyval :=
yy.value_stack (yy.tos-2);


when  213 =>
--#line  1492

yyval :=
yy.value_stack (yy.tos);

when  214 =>
--#line  1493

yyval :=
yy.value_stack (yy.tos);

when  215 =>
--#line  1494

yyval :=
yy.value_stack (yy.tos);

when  216 =>
--#line  1495

yyval :=
yy.value_stack (yy.tos);

when  217 =>
--#line  1496

yyval :=
yy.value_stack (yy.tos);

when  218 =>
--#line  1497

        --  Nested annotations are intended to represent
        --  "correctness" rather than "safety" concerns,
        --  and as such are *not* required to be provable
        --  at compile-time, though a warning is expected,
        --  and a debugger breakpoint if running in debug mode.

yyval := (One_Tree, Annotation.Make (Annotations =>
yy.value_stack (yy.tos).List));


when  219 =>
--#line  1507

yyval :=
yy.value_stack (yy.tos);

when  220 =>
--#line  1510


yyval := (Construct_Qualifier,
               Source_Pos =>
yy.value_stack (yy.tos).Source_Pos,
               Is_Abstract => True, others => False);


when  221 =>
--#line  1515


yyval := (Construct_Qualifier,
               Source_Pos =>
yy.value_stack (yy.tos).Source_Pos,
               Is_Optional => True, others => False);


when  222 =>
--#line  1520

yyval := (Construct_Qualifier,
             Source_Pos => PSC.Source_Positions.Null_Source_Position,
             others => False);

when  223 =>
--#line  1526


yyval := (Construct_Qualifier,
          Source_Pos =>
yy.value_stack (yy.tos-1).Source_Pos,
          Is_Abstract => True, Is_Queued =>
yy.value_stack (yy.tos).Is_Present, others => False);


when  224 =>
--#line  1531


yyval := (Construct_Qualifier,
          Source_Pos =>
yy.value_stack (yy.tos-1).Source_Pos,
          Is_Optional => True, Is_Queued =>
yy.value_stack (yy.tos).Is_Present, others => False);


when  225 =>
--#line  1536


yyval := (Construct_Qualifier,
          Source_Pos => PSC.Source_Positions.Null_Source_Position,
          Is_Queued =>
yy.value_stack (yy.tos).Is_Present, others => False);


when  226 =>
--#line  1544


yyval := (Optional, Is_Present => True);


when  227 =>
--#line  1547


yyval := (Optional, Is_Present => False);


when  228 =>
--#line  1553


yyval :=
yy.value_stack (yy.tos);


when  229 =>
--#line  1556

        yyerror ("Operator designator must be in quotes");

yyval :=
yy.value_stack (yy.tos);


when  230 =>
--#line  1563


yyval :=
yy.value_stack (yy.tos);
        declare
            Func_Tree : Operation.Tree renames
              Operation.Tree (Tree_Ptr_Of (
yyval.Tree).all);
        begin
            Func_Tree.Is_Abstract :=
yy.value_stack (yy.tos-1).Is_Abstract;
            Func_Tree.Is_Optional :=
yy.value_stack (yy.tos-1).Is_Optional;
            Func_Tree.Is_Queued :=
yy.value_stack (yy.tos-1).Is_Queued;
        end;


when  231 =>
--#line  1577


yyval := (One_Tree, Operation.Make (
          Name =>
yy.value_stack (yy.tos-2).Tree,
          Operation_Kind => Operation.Proc_Operation,
          Operation_Inputs =>
yy.value_stack (yy.tos-1).List,
          Operation_Outputs => Lists.Empty_List,
          Preconditions => Null_Optional_Tree,
          Postconditions => Annotation.Make (
yy.value_stack (yy.tos).List),
          Is_Abstract => False,
          Is_Optional => False,
          Is_Queued => False,
          Is_Def => False,
          Statements => Null_Optional_Tree));


when  232 =>
--#line  1592


yyval := (One_Tree, Operation.Make (
          Name =>
yy.value_stack (yy.tos-5).Tree,
          Operation_Kind => Operation.Func_Operation,
          Operation_Inputs =>
yy.value_stack (yy.tos-4).List,
          Operation_Outputs =>
yy.value_stack (yy.tos-1).List,
          Preconditions => Annotation.Make (
yy.value_stack (yy.tos-3).List),
          Postconditions => Annotation.Make (
yy.value_stack (yy.tos).List),
          Is_Abstract => False,
          Is_Optional => False,
          Is_Queued => False,
          Is_Def => False,
          Statements => Null_Optional_Tree));


when  233 =>
--#line  1609


yyval :=
yy.value_stack (yy.tos);


when  234 =>
--#line  1615


yyval := (One_List, Lists.Make ((1 =>
yy.value_stack (yy.tos).Tree)));


when  235 =>
--#line  1618


yyval :=
yy.value_stack (yy.tos-1);


when  236 =>
--#line  1621

      declare
        Id_List : Lists.List :=
yy.value_stack (yy.tos-3).List;
      begin
        yyerror ("Parameter types must be separated by "";""",
          At_Token =>
yy.value_stack (yy.tos-2));

yyval := (One_List, Lists.Empty_List);
        Lists.Append (Id_List,
yy.value_stack (yy.tos-1).Tree);
        for I in 1..Lists.Length (Id_List) loop
            Lists.Append (
yyval.List, Param_Decl.Make (
              Name => Null_Optional_Tree,
              Kind => Param_Decl.Default_Param,
              Locking => Param_Decl.Not_Locked,
              Is_Optional => False,
              Param_Type => Lists.Nth_Element (Id_List, I),
              Param_Default => Null_Optional_Tree));
        end loop;
      end;


when  237 =>
--#line  1640

        yyerror ("Sparkel requires at least ""()"" in operation definition");

yyval := (One_List, Lists.Empty_List);


when  238 =>
--#line  1647

yyval :=
yy.value_stack (yy.tos);

when  239 =>
--#line  1648

        yyerror ("Expecting one ')'", At_Token =>
yy.value_stack (yy.tos));

yyval := (One_Token,
          PSC.Source_Positions.Null_Source_Position,
          PSC.Strings.String_Lookup (")"));


when  240 =>
--#line  1658


yyval := (One_Tree, Param_Decl.Make (
          Name =>
yy.value_stack (yy.tos-3).Tree,
          Kind =>
yy.value_stack (yy.tos-4).Param_Kind,
          Locking =>
yy.value_stack (yy.tos-4).Param_Locking,
          Is_Optional =>
yy.value_stack (yy.tos-1).Is_Optional,
          Param_Type =>
yy.value_stack (yy.tos).Tree,
          Param_Default => Null_Optional_Tree));


when  241 =>
--#line  1667


yyval := (One_Tree, Param_Decl.Make (
          Name => Null_Optional_Tree,
          Kind =>
yy.value_stack (yy.tos-2).Param_Kind,
          Locking =>
yy.value_stack (yy.tos-2).Param_Locking,
          Is_Optional =>
yy.value_stack (yy.tos-1).Is_Optional,
          Param_Type =>
yy.value_stack (yy.tos).Tree,
          Param_Default => Null_Optional_Tree));


when  242 =>
--#line  1676


yyval := (One_Tree, Param_Decl.Make (
          Name => Null_Optional_Tree,
          Kind =>
yy.value_stack (yy.tos-1).Param_Kind,
          Locking => Param_Decl.Not_Locked,
          Is_Optional => False,
          Param_Type =>
yy.value_stack (yy.tos).Tree,
          Param_Default => Null_Optional_Tree));


when  243 =>
--#line  1688

yyval :=
yy.value_stack (yy.tos);

when  244 =>
--#line  1689


yyval := (Param_Mode,
          Param_Kind => Param_Decl.Default_Param,
          Param_Locking => Param_Decl.Not_Locked);


when  245 =>
--#line  1697

yyval :=
yy.value_stack (yy.tos);

when  246 =>
--#line  1698

yyval :=
yy.value_stack (yy.tos);

when  247 =>
--#line  1699


yyval := (Param_Mode,
          Param_Kind => Param_Decl.Default_Param,
          Param_Locking => Param_Decl.Queued_Param);


when  248 =>
--#line  1704


yyval := (Param_Mode,
          Param_Kind => Param_Decl.Var_Param,
          Param_Locking => Param_Decl.Queued_Param);


when  249 =>
--#line  1709


yyval := (Param_Mode,
          Param_Kind =>
yy.value_stack (yy.tos).Param_Kind,
          Param_Locking => Param_Decl.Queued_Param);


when  250 =>
--#line  1714


yyval := (Param_Mode,
          Param_Kind => Param_Decl.Default_Param,
          Param_Locking => Param_Decl.Locked_Param);


when  251 =>
--#line  1719


yyval := (Param_Mode,
          Param_Kind => Param_Decl.Var_Param,
          Param_Locking => Param_Decl.Locked_Param);


when  252 =>
--#line  1724


yyval := (Param_Mode,
          Param_Kind =>
yy.value_stack (yy.tos).Param_Kind,
          Param_Locking => Param_Decl.Locked_Param);


when  253 =>
--#line  1729


yyval := (Param_Mode,
          Param_Kind => Param_Decl.Var_Param,
          Param_Locking => Param_Decl.Not_Locked);


when  254 =>
--#line  1737

yyval :=
yy.value_stack (yy.tos);

when  255 =>
--#line  1738


yyval := (Param_Mode,
          Param_Kind => Param_Decl.Default_Param,
          Param_Locking => Param_Decl.Not_Locked);


when  256 =>
--#line  1746


yyval := (Param_Mode,
          Param_Kind => Param_Decl.Ref_Param,
          Param_Locking => Param_Decl.Not_Locked);


when  257 =>
--#line  1751


yyval := (Param_Mode,
          Param_Kind => Param_Decl.Ref_Const_Param,
          Param_Locking => Param_Decl.Not_Locked);


when  258 =>
--#line  1756


yyval := (Param_Mode,
          Param_Kind => Param_Decl.Ref_Var_Param,
          Param_Locking => Param_Decl.Not_Locked);


when  259 =>
--#line  1764


yyval := (Param_Mode,
          Param_Kind => Param_Decl.Global_Param,
          Param_Locking => Param_Decl.Not_Locked);


when  260 =>
--#line  1769


yyval := (Param_Mode,
          Param_Kind => Param_Decl.Global_Var_Param,
          Param_Locking => Param_Decl.Not_Locked);


when  261 =>
--#line  1777

yyval :=
yy.value_stack (yy.tos);

when  262 =>
--#line  1778


yyval := (One_List, Lists.Empty_List);


when  263 =>
--#line  1784

yyval :=
yy.value_stack (yy.tos);

when  264 =>
--#line  1785


yyval :=
yy.value_stack (yy.tos-2);
        Lists.Append (
yyval.List,
yy.value_stack (yy.tos).List);


when  265 =>
--#line  1792

        if not Lists.Is_Empty (
yy.value_stack (yy.tos).List) then
            --  Add annotations to last element of list

yyval :=
yy.value_stack (yy.tos-1);
            Annotation.Add_Annotation (
              Lists.Nth_Element (
yyval.List, Lists.Length (
yyval.List)),
yy.value_stack (yy.tos).List);
        else

yyval :=
yy.value_stack (yy.tos-1);
        end if;


when  266 =>
--#line  1802

        --  Add annotations to first/last element of list

yyval :=
yy.value_stack (yy.tos-1);
        Annotation.Add_Annotation (
          Lists.Nth_Element (
yyval.List, 1),
yy.value_stack (yy.tos-2).List, Precedes => True);
        if not Lists.Is_Empty (
yy.value_stack (yy.tos).List) then
            Annotation.Add_Annotation (
              Lists.Nth_Element (
yyval.List, Lists.Length (
yyval.List)),
yy.value_stack (yy.tos).List);
        end if;


when  267 =>
--#line  1824


yyval := (One_List, Lists.Empty_List);
        for I in 1..Lists.Length (
yy.value_stack (yy.tos-5).List) loop
            Lists.Append (
yyval.List, Param_Decl.Make (
              Name => Lists.Nth_Element (
yy.value_stack (yy.tos-5).List, I),
              Kind => Param_Decl.Default_Param,
              Locking => Param_Decl.Not_Locked,
              Is_Optional =>
yy.value_stack (yy.tos-3).Is_Optional,
              In_Region =>
yy.value_stack (yy.tos-1).Tree,
              Param_Type =>
yy.value_stack (yy.tos-2).Tree,
              Param_Default =>
yy.value_stack (yy.tos).Tree));
        end loop;


when  268 =>
--#line  1839


yyval := (One_List, Lists.Empty_List);
        for I in 1..Lists.Length (
yy.value_stack (yy.tos-5).List) loop
            Lists.Append (
yyval.List, Param_Decl.Make (
              Name => Lists.Nth_Element (
yy.value_stack (yy.tos-5).List, I),
              Kind =>
yy.value_stack (yy.tos-6).Param_Kind,
              Locking =>
yy.value_stack (yy.tos-6).Param_Locking,
              Is_Optional =>
yy.value_stack (yy.tos-3).Is_Optional,
              In_Region =>
yy.value_stack (yy.tos-1).Tree,
              Param_Type =>
yy.value_stack (yy.tos-2).Tree,
              Param_Default =>
yy.value_stack (yy.tos).Tree));
        end loop;


when  269 =>
--#line  1852


yyval := (One_List, Lists.Make ((1 => Param_Decl.Make (
          Name => Null_Optional_Tree,
          Kind => Param_Decl.Default_Param,
          Locking => Param_Decl.Not_Locked,
          Is_Optional => False,
          Param_Type =>
yy.value_stack (yy.tos-1).Tree,
          Param_Default =>
yy.value_stack (yy.tos).Tree))));


when  270 =>
--#line  1862


yyval := (One_List, Lists.Make ((1 => Param_Decl.Make (
          Name => Null_Optional_Tree,
          Kind =>
yy.value_stack (yy.tos-3).Param_Kind,
          Locking =>
yy.value_stack (yy.tos-3).Param_Locking,
          Is_Optional =>
yy.value_stack (yy.tos-2).Is_Optional,
          Param_Type =>
yy.value_stack (yy.tos-1).Tree,
          Param_Default =>
yy.value_stack (yy.tos).Tree))));


when  271 =>
--#line  1871


yyval := (One_List, Lists.Make ((1 => Param_Decl.Make (
          Name => Null_Optional_Tree,
          Kind =>
yy.value_stack (yy.tos-2).Param_Kind,
          Locking =>
yy.value_stack (yy.tos-2).Param_Locking,
          Is_Optional => False,
          Param_Type =>
yy.value_stack (yy.tos-1).Tree,
          Param_Default =>
yy.value_stack (yy.tos).Tree))));


when  272 =>
--#line  1881


yyval := (One_List, Lists.Make ((1 => Param_Decl.Make (
          Name => Null_Optional_Tree,
          Kind => Param_Decl.Default_Param,
          Locking => Param_Decl.Not_Locked,
          Is_Optional =>
yy.value_stack (yy.tos-2).Is_Optional,
          Param_Type =>
yy.value_stack (yy.tos-1).Tree,
          Param_Default =>
yy.value_stack (yy.tos).Tree))));


when  273 =>
--#line  1890


yyval :=
yy.value_stack (yy.tos-1);
        --  Set Is_Implicit_Module_Param on each parameter
        for I in 1..Lists.Length (
yyval.List) loop
          declare
            Param_Decl_Tree : Param_Decl.Tree renames
              Param_Decl.Tree (Tree_Ptr_Of (Lists.Nth_Element (
yyval.List, I)).all);
          begin
            Param_Decl_Tree.Is_Implicit_Module_Param := True;
          end;
        end loop;


when  274 =>
--#line  1905

yyval :=
yy.value_stack (yy.tos);

when  275 =>
--#line  1906


yyval := (Construct_Qualifier,
               Source_Pos => PSC.Source_Positions.Null_Source_Position,
               others => False);


when  276 =>
--#line  1914

yyval :=
yy.value_stack (yy.tos);

when  277 =>
--#line  1915

yyval :=
yy.value_stack (yy.tos);

when  278 =>
--#line  1919

yyval :=
yy.value_stack (yy.tos);

when  279 =>
--#line  1920

         --  NOTE: Operation can have "type" parameters
         --  such as "Left_Type is Integer<>"

yyval := (One_Tree, Type_Decl.Make (
          Name =>
yy.value_stack (yy.tos-2).Tree,
          Is_New_Type => False,
          Type_Definition =>
yy.value_stack (yy.tos).Tree));


when  280 =>
--#line  1928


yyval :=
yy.value_stack (yy.tos);


when  281 =>
--#line  1934


yyval := (Construct_Qualifier,
          Source_Pos =>
yy.value_stack (yy.tos).Source_Pos,
          Is_Optional => True,
          others => False);


when  282 =>
--#line  1943

yyval :=
yy.value_stack (yy.tos);

when  283 =>
--#line  1944


yyval := (Construct_Qualifier,
               Source_Pos => PSC.Source_Positions.Null_Source_Position,
               others => False);


when  284 =>
--#line  1952


yyval := (Construct_Qualifier,
          Source_Pos =>
yy.value_stack (yy.tos).Source_Pos,
          Is_Optional => True,
          others => False);


when  285 =>
--#line  1962

yyval := (Optional, Is_Present => True);

when  286 =>
--#line  1963

yyval := (Optional, Is_Present => False);

when  287 =>
--#line  1967


yyval := (One_List, Lists.Make ((1 =>
yy.value_stack (yy.tos).Tree)));


when  288 =>
--#line  1970

        Annotation.Add_Annotation (
yy.value_stack (yy.tos).Tree,
yy.value_stack (yy.tos-1).List, Precedes => True);

yyval := (One_List, Lists.Make ((1 =>
yy.value_stack (yy.tos).Tree)));


when  289 =>
--#line  1974


yyval :=
yy.value_stack (yy.tos-1);


when  290 =>
--#line  1977

      declare
        Id_List : Lists.List :=
yy.value_stack (yy.tos-3).List;
      begin
        yyerror ("Parameter types must be separated by "";""",
          At_Token =>
yy.value_stack (yy.tos-3));

yyval := (One_List, Lists.Empty_List);
        Lists.Append (Id_List,
yy.value_stack (yy.tos-1).Tree);
        for I in 1..Lists.Length (Id_List) loop
            Lists.Append (
yyval.List, Param_Decl.Make (
              Name => Null_Optional_Tree,
              Kind => Param_Decl.Default_Param,
              Locking => Param_Decl.Not_Locked,
              Is_Optional => False,
              Param_Type => Lists.Nth_Element (Id_List, I),
              Param_Default => Null_Optional_Tree));
        end loop;
      end;


when  291 =>
--#line  1996

      declare
        Id_List : Lists.List :=
yy.value_stack (yy.tos-3).List;
      begin
        yyerror ("Parameter types must be separated by "";""",
          At_Token =>
yy.value_stack (yy.tos-2));

yyval := (One_List, Lists.Empty_List);
        Lists.Append (Id_List,
yy.value_stack (yy.tos-1).Tree);
        for I in 1..Lists.Length (Id_List) loop
            Lists.Append (
yyval.List, Param_Decl.Make (
              Name => Null_Optional_Tree,
              Kind => Param_Decl.Default_Param,
              Locking => Param_Decl.Not_Locked,
              Is_Optional => False,
              Param_Type => Lists.Nth_Element (Id_List, I),
              Param_Default => Null_Optional_Tree));
        end loop;
      end;


when  292 =>
--#line  2019


yyval := (One_Tree, Param_Decl.Make (
          Name =>
yy.value_stack (yy.tos-3).Tree,
          Kind =>
yy.value_stack (yy.tos-4).Param_Kind,
          Locking =>
yy.value_stack (yy.tos-4).Param_Locking,
          Is_Optional =>
yy.value_stack (yy.tos-1).Is_Optional,
          Param_Type =>
yy.value_stack (yy.tos).Tree,
          Param_Default => Null_Optional_Tree));


when  293 =>
--#line  2028


yyval := (One_Tree, Param_Decl.Make (
          Name => Null_Optional_Tree,
          Kind =>
yy.value_stack (yy.tos-2).Param_Kind,
          Locking =>
yy.value_stack (yy.tos-2).Param_Locking,
          Is_Optional =>
yy.value_stack (yy.tos-1).Is_Optional,
          Param_Type =>
yy.value_stack (yy.tos).Tree,
          Param_Default => Null_Optional_Tree));


when  294 =>
--#line  2037


yyval := (One_Tree, Param_Decl.Make (
          Name => Null_Optional_Tree,
          Kind =>
yy.value_stack (yy.tos-1).Param_Kind,
          Locking =>
yy.value_stack (yy.tos-1).Param_Locking,
          Is_Optional => False,
          Param_Type =>
yy.value_stack (yy.tos).Tree,
          Param_Default => Null_Optional_Tree));


when  295 =>
--#line  2047


yyval := (One_Tree, Param_Decl.Make (
          Name =>
yy.value_stack (yy.tos-3).Tree,
          Kind => Param_Decl.Default_Param,
          Locking => Param_Decl.Not_Locked,
          Is_Optional =>
yy.value_stack (yy.tos-1).Is_Optional,
          Param_Type =>
yy.value_stack (yy.tos).Tree,
          Param_Default => Null_Optional_Tree));


when  296 =>
--#line  2056


yyval := (One_Tree, Param_Decl.Make (
          Name => Null_Optional_Tree,
          Kind => Param_Decl.Default_Param,
          Locking => Param_Decl.Not_Locked,
          Is_Optional =>
yy.value_stack (yy.tos-1).Is_Optional,
          Param_Type =>
yy.value_stack (yy.tos).Tree,
          Param_Default => Null_Optional_Tree));


when  297 =>
--#line  2065


yyval := (One_Tree, Param_Decl.Make (
          Name => Null_Optional_Tree,
          Kind => Param_Decl.Default_Param,
          Locking => Param_Decl.Not_Locked,
          Is_Optional => False,
          Param_Type =>
yy.value_stack (yy.tos).Tree,
          Param_Default => Null_Optional_Tree));


when  298 =>
--#line  2077


yyval :=
yy.value_stack (yy.tos);


when  299 =>
--#line  2080


yyval :=
yy.value_stack (yy.tos-2);
        Lists.Append (
yyval.List,
yy.value_stack (yy.tos).List);


when  300 =>
--#line  2087

        if not Lists.Is_Empty (
yy.value_stack (yy.tos).List) then
            --  Add annotations to last element of list

yyval :=
yy.value_stack (yy.tos-1);
            Annotation.Add_Annotation (
              Lists.Nth_Element (
yyval.List, Lists.Length (
yyval.List)),
yy.value_stack (yy.tos).List);
        else

yyval :=
yy.value_stack (yy.tos-1);
        end if;


when  301 =>
--#line  2097

        --  Add annotations to first/last element of list

yyval :=
yy.value_stack (yy.tos-1);
        if not Lists.Is_Empty (
yy.value_stack (yy.tos-2).List) then
            Annotation.Add_Annotation (
              Lists.Nth_Element (
yyval.List, 1),
yy.value_stack (yy.tos-2).List, Precedes => True);
        end if;
        if not Lists.Is_Empty (
yy.value_stack (yy.tos).List) then
            Annotation.Add_Annotation (
              Lists.Nth_Element (
yyval.List, Lists.Length (
yyval.List)),
yy.value_stack (yy.tos).List);
        end if;


when  302 =>
--#line  2113


yyval := (One_List, Lists.Empty_List);
        for I in 1..Lists.Length (
yy.value_stack (yy.tos-3).List) loop
            Lists.Append (
yyval.List, Param_Decl.Make (
              Name => Lists.Nth_Element (
yy.value_stack (yy.tos-3).List, I),
              Kind => Param_Decl.Default_Param,
              Locking => Param_Decl.Not_Locked,
              Is_Optional =>
yy.value_stack (yy.tos-1).Is_Optional,
              Param_Type =>
yy.value_stack (yy.tos).Tree,
              Param_Default => Null_Optional_Tree));
        end loop;


when  303 =>
--#line  2127


yyval := (One_List, Lists.Empty_List);
        for I in 1..Lists.Length (
yy.value_stack (yy.tos-3).List) loop
            Lists.Append (
yyval.List, Param_Decl.Make (
              Name => Lists.Nth_Element (
yy.value_stack (yy.tos-3).List, I),
              Kind =>
yy.value_stack (yy.tos-4).Param_Kind,
              Locking =>
yy.value_stack (yy.tos-4).Param_Locking,
              Is_Optional =>
yy.value_stack (yy.tos-1).Is_Optional,
              Param_Type =>
yy.value_stack (yy.tos).Tree,
              Param_Default => Null_Optional_Tree));
        end loop;


when  304 =>
--#line  2139


yyval := (One_List, Lists.Make ((1 => Param_Decl.Make (
          Name => Null_Optional_Tree,
          Kind => Param_Decl.Default_Param,
          Locking => Param_Decl.Not_Locked,
          Is_Optional => False,
          Param_Type =>
yy.value_stack (yy.tos).Tree,
          Param_Default => Null_Optional_Tree))));


when  305 =>
--#line  2148


yyval := (One_List, Lists.Make ((1 => Param_Decl.Make (
          Name => Null_Optional_Tree,
          Kind =>
yy.value_stack (yy.tos-2).Param_Kind,
          Locking =>
yy.value_stack (yy.tos-2).Param_Locking,
          Is_Optional =>
yy.value_stack (yy.tos-1).Is_Optional,
          Param_Type =>
yy.value_stack (yy.tos).Tree,
          Param_Default => Null_Optional_Tree))));


when  306 =>
--#line  2157


yyval := (One_List, Lists.Make ((1 => Param_Decl.Make (
          Name => Null_Optional_Tree,
          Kind =>
yy.value_stack (yy.tos-1).Param_Kind,
          Locking =>
yy.value_stack (yy.tos-1).Param_Locking,
          Is_Optional => False,
          Param_Type =>
yy.value_stack (yy.tos).Tree,
          Param_Default => Null_Optional_Tree))));


when  307 =>
--#line  2166


yyval := (One_List, Lists.Make ((1 => Param_Decl.Make (
          Name => Null_Optional_Tree,
          Kind => Param_Decl.Default_Param,
          Locking => Param_Decl.Not_Locked,
          Is_Optional =>
yy.value_stack (yy.tos-1).Is_Optional,
          Param_Type =>
yy.value_stack (yy.tos).Tree,
          Param_Default => Null_Optional_Tree))));


when  308 =>
--#line  2178

yyval :=
yy.value_stack (yy.tos);

when  309 =>
--#line  2179

yyval :=
yy.value_stack (yy.tos);

when  310 =>
--#line  2184


yyval := (One_Tree, Obj_Decl.Make (
          Name => PSC.Trees.Identifier.Tree (Tree_Of (
yy.value_stack (yy.tos-4).Tree)),
          Is_Var => True,
          Is_Const => False,
          Is_Ref => False,
          Is_Optional => False, -- TBD
          In_Region =>
yy.value_stack (yy.tos-1).Tree,
          Obj_Type =>
yy.value_stack (yy.tos-2).Tree,
          Obj_Value =>
yy.value_stack (yy.tos).Tree));


when  311 =>
--#line  2195


yyval :=
yy.value_stack (yy.tos);


when  312 =>
--#line  2203

        yyerror ("Must specify ""var,"" ""const,"" or ""ref""",
          At_Token =>
yy.value_stack (yy.tos-2));

yyval := (One_Tree, Obj_Decl.Make (
          Name => PSC.Trees.Identifier.Tree (Tree_Of (
yy.value_stack (yy.tos-2).Tree)),
          Is_Var => True,
          Is_Const => False,
          Is_Ref => False,
          Is_Optional => False, -- TBD
          Obj_Type =>
yy.value_stack (yy.tos-1).Tree,
          Obj_Value =>
yy.value_stack (yy.tos).Tree));


when  313 =>
--#line  2219


yyval := (One_Tree, Obj_Decl.Make (
          Name => PSC.Trees.Identifier.Tree (Tree_Of (
yy.value_stack (yy.tos-4).Tree)),
          Is_Var => False,
          Is_Const => True,
          Is_Ref => False,
          Is_Optional => False, -- TBD
          In_Region =>
yy.value_stack (yy.tos-1).Tree,
          Obj_Type =>
yy.value_stack (yy.tos-2).Tree,
          Obj_Value =>
yy.value_stack (yy.tos).Tree));


when  314 =>
--#line  2230


yyval := (One_Tree, Obj_Decl.Make (
          Name => PSC.Trees.Identifier.Tree (Tree_Of (
yy.value_stack (yy.tos-3).Tree)),
          Is_Var => False,
          Is_Const => True,
          Is_Ref => False,
          Is_Optional => False, -- TBD
          In_Region =>
yy.value_stack (yy.tos-2).Tree,
          Obj_Type => Null_Optional_Tree,
          Obj_Value =>
yy.value_stack (yy.tos).Tree));


when  315 =>
--#line  2243


yyval := (One_Tree, Obj_Decl.Make (
          Name => PSC.Trees.Identifier.Tree (Tree_Of (
yy.value_stack (yy.tos-3).Tree)),
          Is_Var => True,
          Is_Const => False,
          Is_Ref => True,
          Is_Optional => False, -- TBD
          Obj_Type =>
yy.value_stack (yy.tos-1).Tree,
          Obj_Value =>
yy.value_stack (yy.tos).Tree));


when  316 =>
--#line  2255


yyval := (One_Tree, Obj_Decl.Make (
          Name => PSC.Trees.Identifier.Tree (Tree_Of (
yy.value_stack (yy.tos-3).Tree)),
          Is_Var => False,
          Is_Const => True,
          Is_Ref => True,
          Is_Optional => False, -- TBD
          Obj_Type =>
yy.value_stack (yy.tos-1).Tree,
          Obj_Value =>
yy.value_stack (yy.tos).Tree));


when  317 =>
--#line  2267


yyval := (One_Tree, Obj_Decl.Make (
          Name => PSC.Trees.Identifier.Tree (Tree_Of (
yy.value_stack (yy.tos-3).Tree)),
          Is_Var => False,
          Is_Const => False,
          Is_Ref => True,
          Is_Optional => False, -- TBD
          Obj_Type =>
yy.value_stack (yy.tos-1).Tree,
          Obj_Value =>
yy.value_stack (yy.tos).Tree));


when  318 =>
--#line  2280

yyval :=
yy.value_stack (yy.tos);

when  319 =>
--#line  2281


yyval := (One_Tree, Null_Optional_Tree);


when  320 =>
--#line  2287

yyval :=
yy.value_stack (yy.tos);

when  321 =>
--#line  2288


yyval := (One_Tree, Null_Optional_Tree);


when  322 =>
--#line  2294

yyval :=
yy.value_stack (yy.tos);

when  323 =>
--#line  2295


yyval := (One_Tree, Null_Optional_Tree);


when  324 =>
--#line  2300

yyval :=
yy.value_stack (yy.tos-1);

when  325 =>
--#line  2303


yyval := (One_Tree, Obj_Decl.Make (
          Name => PSC.Trees.Identifier.Tree (Tree_Of (
yy.value_stack (yy.tos-3).Tree)),
          Is_Var => True,
          Is_Const => False,
          Is_Ref => False,
          Is_Optional => False, -- TBD
          In_Region =>
yy.value_stack (yy.tos-2).Tree,
          Obj_Type => Null_Optional_Tree,
          Obj_Value =>
yy.value_stack (yy.tos).Tree));


when  326 =>
--#line  2314


yyval := (One_Tree, Obj_Decl.Make (
          Name => PSC.Trees.Identifier.Tree (Tree_Of (
yy.value_stack (yy.tos-2).Tree)),
          Is_Var => False,
          Is_Const => True,
          Is_Ref => True,
          Is_Optional => False, -- TBD
          Obj_Type => Null_Optional_Tree,
          Obj_Value =>
yy.value_stack (yy.tos).Tree));


when  327 =>
--#line  2324


yyval := (One_Tree, Obj_Decl.Make (
          Name => PSC.Trees.Identifier.Tree (Tree_Of (
yy.value_stack (yy.tos-2).Tree)),
          Is_Var => True,
          Is_Const => False,
          Is_Ref => True,
          Is_Optional => False, -- TBD
          Obj_Type => Null_Optional_Tree,
          Obj_Value =>
yy.value_stack (yy.tos).Tree));


when  328 =>
--#line  2334


yyval := (One_Tree, Obj_Decl.Make (
          Name => PSC.Trees.Identifier.Tree (Tree_Of (
yy.value_stack (yy.tos-2).Tree)),
          Is_Var => False,
          Is_Const => False,
          Is_Ref => True,
          Is_Optional => False, -- TBD
          Obj_Type => Null_Optional_Tree,
          Obj_Value =>
yy.value_stack (yy.tos).Tree));


when  329 =>
--#line  2344


yyval := (One_Tree, Obj_Decl.Make (
          Name => PSC.Trees.Identifier.Tree (Tree_Of (
yy.value_stack (yy.tos-2).Tree)),
          Is_Var => False,
          Is_Const => True,
          Is_Ref => False,
          Is_Optional => False, -- TBD
          Is_Move => True,
          Obj_Type => Null_Optional_Tree,
          Obj_Value =>
yy.value_stack (yy.tos).Tree));


when  330 =>
--#line  2355


yyval := (One_Tree, Obj_Decl.Make (
          Name => PSC.Trees.Identifier.Tree (Tree_Of (
yy.value_stack (yy.tos-2).Tree)),
          Is_Var => True,
          Is_Const => False,
          Is_Ref => False,
          Is_Optional => False, -- TBD
          Is_Move => True,
          Obj_Type => Null_Optional_Tree,
          Obj_Value =>
yy.value_stack (yy.tos).Tree));


when  331 =>
--#line  2368

yyval :=
yy.value_stack (yy.tos);

when  332 =>
--#line  2369

yyval :=
yy.value_stack (yy.tos);

when  333 =>
--#line  2372

yyval :=
yy.value_stack (yy.tos);

when  334 =>
--#line  2375


yyval :=
yy.value_stack (yy.tos);


when  335 =>
--#line  2379
  --  TBD: discrims, abstract
        declare
           Rec_Mod : Module.Tree
             renames Module.Tree (Tree_Ptr_Of (
yy.value_stack (yy.tos).Tree).all);
        begin
           --  Fill in name and is-abstract
           Rec_Mod.Name :=
yy.value_stack (yy.tos-3).Tree;
           Rec_Mod.Is_Abstract :=
yy.value_stack (yy.tos-1).Is_Abstract;

           --  Now build a type-decl

yyval := (One_Tree, Type_Decl.Make (
             Name =>
yy.value_stack (yy.tos-3).Tree,
             Is_New_Type => True,
             Type_Definition => Invocation.Make (
               Kind => Invocation.Module_Instantiation,
               --  NOTE: Private/Record type decl has module as Prefix of inst
               Prefix =>
yy.value_stack (yy.tos).Tree,
               Operands => Lists.Empty_List)));
        end;


when  336 =>
--#line  2399
  --  TBD: discrims

yyval := (One_Tree, Type_Decl.Make (
          Name =>
yy.value_stack (yy.tos-2).Tree,
          Is_New_Type => True,
          Type_Definition =>
yy.value_stack (yy.tos).Tree));


when  337 =>
--#line  2406
  --  TBD: discrims

yyval := (One_Tree, Type_Decl.Make (
          Name =>
yy.value_stack (yy.tos-4).Tree,
          Is_New_Type => True,
          Type_Definition => Invocation.Make (
            Kind => Invocation.Module_Instantiation,
            --  NOTE: Private/Record type decl has module as Prefix of inst
            Prefix => Module.Make (
              Name =>
yy.value_stack (yy.tos-4).Tree,
              Add_On_Label => Lists.Empty_List,
              Is_Interface => True,
              Is_Abstract =>
yy.value_stack (yy.tos-2).Is_Abstract,
              Is_Private => True,
              Is_Concurrent =>
yy.value_stack (yy.tos-1).Is_Concurrent,
              Is_Limited =>
yy.value_stack (yy.tos-1).Is_Limited,
              Has_Formals => False,
              Treat_As_Type => True,
              Module_Formals => Lists.Empty_List,
              Extends_Interface => Null_Optional_Tree,
              Implements_Interfaces => Lists.Empty_List,
              Class_Locals => Lists.Empty_List,
              Module_Exports => Lists.Empty_List,
              Module_New_Exports => Lists.Empty_List,
              Module_Implements => Lists.Empty_List),
            Operands => Lists.Empty_List)));


when  338 =>
--#line  2434


yyval := (Construct_Qualifier,
          Source_Pos => PSC.Source_Positions.Null_Source_Position,
          others => False);


when  339 =>
--#line  2439


yyval := (Construct_Qualifier,
          Source_Pos =>
yy.value_stack (yy.tos).Source_Pos,
          Is_Abstract => True,
          others => False);


when  340 =>
--#line  2448


yyval := (Construct_Qualifier,
          Source_Pos =>
yy.value_stack (yy.tos).Source_Pos,
          Is_Limited => True,
          others => False);


when  341 =>
--#line  2454


yyval := (Construct_Qualifier,
          Source_Pos =>
yy.value_stack (yy.tos).Source_Pos,
          Is_Concurrent => True,
          others => False);


when  342 =>
--#line  2460


yyval := (Construct_Qualifier,
          Source_Pos => PSC.Source_Positions.Null_Source_Position,
          others => False);


when  343 =>
--#line  2469

        --  TBD: discrims, abstract

yyval := (One_Tree, Type_Decl.Make
          (Name =>
yy.value_stack (yy.tos-4).Tree,
           Is_New_Type => True,
           Type_Definition => Invocation.Make
            (Kind => Invocation.Module_Instantiation,
             --  NOTE: type decl has module as Prefix of inst
             Prefix => PSC.Trees.Module.Make (
               Name =>
yy.value_stack (yy.tos-4).Tree,
               Add_On_Label => Lists.Empty_List,
               Is_Interface => True,
               Is_Abstract =>
yy.value_stack (yy.tos-2).Is_Abstract,
               Is_Private => False,
               Is_Concurrent =>
yy.value_stack (yy.tos-1).Is_Concurrent,
               Is_Limited =>
yy.value_stack (yy.tos-1).Is_Limited,
               Has_Formals => False,
               Treat_As_Type => True,
               Module_Formals => Lists.Empty_List,
               Extends_Interface =>
yy.value_stack (yy.tos).Tree,
               Implements_Interfaces => Lists.Empty_List,
               Class_Locals => Lists.Empty_List,
               Module_Exports => Lists.Empty_List,
               Module_New_Exports => Lists.Empty_List,
               Module_Implements => Lists.Empty_List),
             Operands => Lists.Empty_List)));


when  344 =>
--#line  2497

        --  TBD: discrims, abstract

yyval := (One_Tree, Type_Decl.Make
          (Name =>
yy.value_stack (yy.tos-6).Tree,
           Is_New_Type => True,
           Type_Definition => Invocation.Make
            (Kind => Invocation.Module_Instantiation,
             --  NOTE: type decl has module as Prefix of inst
             Prefix => PSC.Trees.Module.Make (
               Name =>
yy.value_stack (yy.tos-6).Tree,
               Add_On_Label => Lists.Empty_List,
               Is_Interface => True,
               Is_Abstract =>
yy.value_stack (yy.tos-4).Is_Abstract,
               Is_Private => True,
               Is_Concurrent =>
yy.value_stack (yy.tos-3).Is_Concurrent,
               Is_Limited =>
yy.value_stack (yy.tos-3).Is_Limited,
               Has_Formals => False,
               Treat_As_Type => True,
               Module_Formals => Lists.Empty_List,
               Extends_Interface =>
yy.value_stack (yy.tos-2).Tree,
               Implements_Interfaces => Lists.Empty_List,
               Class_Locals => Lists.Empty_List,
               Module_Exports => Lists.Empty_List,
               Module_New_Exports => Lists.Empty_List,
               Module_Implements => Lists.Empty_List),
             Operands => Lists.Empty_List)));


when  345 =>
--#line  2526
  --  TBD: discrims
        declare
           Rec_Mod : Module.Tree
             renames Module.Tree (Tree_Ptr_Of (
yy.value_stack (yy.tos).Tree).all);
        begin
           --  Fill in name and other info
           Rec_Mod.Name :=
yy.value_stack (yy.tos-6).Tree;
           Rec_Mod.Is_Abstract :=
yy.value_stack (yy.tos-4).Is_Abstract;
           Rec_Mod.Is_Limited :=
yy.value_stack (yy.tos-3).is_Limited;
           Rec_Mod.Is_Concurrent :=
yy.value_stack (yy.tos-3).is_Concurrent;
           Rec_Mod.Extends_Interface :=
yy.value_stack (yy.tos-2).Tree;

           --  Now build a type-decl

yyval := (One_Tree, Type_Decl.Make (
             Name =>
yy.value_stack (yy.tos-6).Tree,
             Is_New_Type => True,
             Type_Definition => Invocation.Make (
               Kind => Invocation.Module_Instantiation,
               --  NOTE: type decl has module as Prefix of inst
               Prefix =>
yy.value_stack (yy.tos).Tree,
               Operands => Lists.Empty_List)));
        end;


when  346 =>
--#line  2552

        --  We use a param-decl for the parent type for uniformity

yyval := (One_Tree, Tree => Param_Decl.Make
           (Name => Null_Optional_Tree,
            Kind => Param_Decl.Default_Param,
            Locking => Param_Decl.Not_Locked,
            Is_Optional => False,
            Param_Type =>
yy.value_stack (yy.tos).Tree,
            Param_Default => Null_Optional_Tree));


when  347 =>
--#line  2562

        --  We use a param-decl for the parent type for uniformity
        yyerror ("""new"" required unless defining a subtype",
           At_Token =>
yy.value_stack (yy.tos));

yyval := (One_Tree, Tree => Param_Decl.Make
           (Name => Null_Optional_Tree,
            Kind => Param_Decl.Default_Param,
            Locking => Param_Decl.Not_Locked,
            Is_Optional => False,
            Param_Type =>
yy.value_stack (yy.tos).Tree,
            Param_Default => Null_Optional_Tree));



when  348 =>
--#line  2578


yyval := (One_Tree, Tree => PSC.Trees.Module.Make (
          Name => Null_Optional_Tree,
          Add_On_Label => Lists.Empty_List,
          Is_Interface => True,
          Is_Abstract => False,
          Is_Private => False,
          Is_Concurrent =>
yy.value_stack (yy.tos-2).Is_Concurrent,
          Is_Limited =>
yy.value_stack (yy.tos-2).Is_Limited,
          Has_Formals => False,
          Treat_As_Type => True,
          Module_Formals => Lists.Empty_List,
          Extends_Interface => Null_Optional_Tree,
          Implements_Interfaces => Lists.Empty_List,
          Class_Locals => Lists.Empty_List,
          Module_Exports => Lists.Empty_List,
          Module_New_Exports => Lists.Empty_List,
          Module_Implements => Lists.Empty_List));


when  349 =>
--#line  2600


yyval := (One_Tree, Tree => PSC.Trees.Module.Make (
          Name => Null_Optional_Tree,
          Add_On_Label => Lists.Empty_List,
          Is_Interface => True,
          Is_Abstract => False,
          Is_Private => False,
          Is_Concurrent =>
yy.value_stack (yy.tos-5).Is_Concurrent,
          Is_Limited =>
yy.value_stack (yy.tos-5).Is_Limited,
          Has_Formals => False,
          Treat_As_Type => True,
          Module_Formals => Lists.Empty_List,
          Extends_Interface => Null_Optional_Tree,
          Implements_Interfaces => Lists.Empty_List,
          Class_Locals => Lists.Empty_List,
          Module_Exports =>
yy.value_stack (yy.tos-2).List,
          Module_New_Exports => Lists.Empty_List,
          Module_Implements => Lists.Empty_List));


when  350 =>
--#line  2622


yyval := (One_List, Lists.Make ((1 =>
yy.value_stack (yy.tos-1).Tree)));


when  351 =>
--#line  2625


yyval :=
yy.value_stack (yy.tos-2);
        Lists.Append (
yyval.List,
yy.value_stack (yy.tos-1).Tree);


when  352 =>
--#line  2632


yyval :=
yy.value_stack (yy.tos);


when  353 =>
--#line  2636


yyval := (One_Tree, Obj_Decl.Make (
          Name => PSC.Trees.Identifier.Tree (Tree_Of (
yy.value_stack (yy.tos-4).Tree)),
          Is_Var => True,
          Is_Const => False,
          Is_Ref => False,
          Is_Optional => False, -- TBD
          In_Region =>
yy.value_stack (yy.tos-1).Tree,
          Obj_Type =>
yy.value_stack (yy.tos-2).Tree,
          Obj_Value =>
yy.value_stack (yy.tos).Tree));


when  354 =>
--#line  2651


yyval := (Optional_End_Token,
                Source_Pos => PSC.Source_Positions.Null_Source_Position,
                End_Construct_Str => PSC.Strings.Null_U_String,
                Check_Label => False,
                others => Null_Optional_Tree);


when  355 =>
--#line  2658


yyval := (Optional_End_Token,
                Source_Pos =>
yy.value_stack (yy.tos-2).Source_Pos,
                End_Construct_Str =>
yy.value_stack (yy.tos-1).Str,
                Check_Label => Not_Null (
yy.value_stack (yy.tos).Tree),
                Label =>
yy.value_stack (yy.tos).Tree, others => Null_Optional_Tree);


when  356 =>
--#line  2667

yyval :=
yy.value_stack (yy.tos);

when  357 =>
--#line  2668

        yyerror ("Should be ""end record [id]"" rather than ""end [id]""");

yyval := (One_Token,
          PSC.Source_Positions.Null_Source_Position,
          PSC.Strings.Null_U_String);


when  358 =>
--#line  2677


yyval := (One_Tree, Type_Decl.Make (
          Name =>
yy.value_stack (yy.tos-2).Tree,
          Is_New_Type => False,
          Type_Definition =>
yy.value_stack (yy.tos).Tree));


when  359 =>
--#line  2688

        declare
            Op_Decl : Operation.Tree :=
              Operation.Tree (Tree_Of (
yy.value_stack (yy.tos-4).Tree));
        begin
            Op_Decl.Is_Def := True;
            Op_Decl.Statements :=
yy.value_stack (yy.tos-2).Tree;

yyval := (One_Tree, Optional (Op_Decl));

            if
yy.value_stack (yy.tos).Check_Label then
                Check_Id_Match (Starting_Id => Op_Decl.Name,
                  Ending_Id =>
yy.value_stack (yy.tos).Label);
                Check_Func_Proc_Match (Op_Decl,
yy.value_stack (yy.tos));
            end if;
        end;


when  360 =>
--#line  2706

        declare
            Op_Decl : Operation.Tree :=
              Operation.Tree (Tree_Of (
yy.value_stack (yy.tos-5).Tree));
        begin
            Op_Decl.Is_Def := True;
            Op_Decl.Dequeue_Condition :=
yy.value_stack (yy.tos-3).Tree;
            Op_Decl.Statements :=
yy.value_stack (yy.tos-2).Tree;

yyval := (One_Tree, Optional (Op_Decl));

            if
yy.value_stack (yy.tos).Check_Label then
                Check_Id_Match (Starting_Id => Op_Decl.Name,
                  Ending_Id =>
yy.value_stack (yy.tos).Label);
                Check_Func_Proc_Match (Op_Decl,
yy.value_stack (yy.tos));
            end if;
        end;


when  361 =>
--#line  2725

        declare
            Op_Decl : Operation.Tree :=
              Operation.Tree (Tree_Of (
yy.value_stack (yy.tos-6).Tree));
        begin
            Parser_Warning ("Statements should be indented",
              At_Token =>
yy.value_stack (yy.tos-4));
            Op_Decl.Is_Def := True;
            Op_Decl.Statements :=
yy.value_stack (yy.tos-4).Tree;

yyval := (One_Tree, Optional (Op_Decl));

            Check_Id_Match (Starting_Id => Op_Decl.Name,
              Ending_Id =>
yy.value_stack (yy.tos-1).Tree);
        end;


when  362 =>
--#line  2742

        declare
            Op_Decl : Operation.Tree :=
              Operation.Tree (Tree_Of (
yy.value_stack (yy.tos-7).Tree));
        begin
            Parser_Warning ("Statements should be indented",
              At_Token =>
yy.value_stack (yy.tos-4));
            Op_Decl.Is_Def := True;
            Op_Decl.Dequeue_Condition :=
yy.value_stack (yy.tos-5).Tree;
            Op_Decl.Statements :=
yy.value_stack (yy.tos-4).Tree;

yyval := (One_Tree, Optional (Op_Decl));

            Check_Id_Match (Starting_Id => Op_Decl.Name,
              Ending_Id =>
yy.value_stack (yy.tos-1).Tree);
        end;


when  363 =>
--#line  2761


yyval :=
yy.value_stack (yy.tos);


when  364 =>
--#line  2764


yyval :=
yy.value_stack (yy.tos);


when  365 =>
--#line  2767


yyval := (One_Token,
          PSC.Source_Positions.Null_Source_Position,
          PSC.Strings.Null_U_String);


when  366 =>
--#line  2775

yyval :=
yy.value_stack (yy.tos);

when  367 =>
--#line  2776

yyval := (One_Tree, Null_Optional_Tree);

when  368 =>
--#line  2780

yyval :=
yy.value_stack (yy.tos);

when  369 =>
--#line  2783

yyval :=
yy.value_stack (yy.tos-1);

when  370 =>
--#line  2787


yyval := (One_Tree, Conditionally_Complement (

yy.value_stack (yy.tos).Tree,
          Complement =>
yy.value_stack (yy.tos-2).Is_While));
            --  Complement cond if "while" present
        Set_Source_Pos (
yyval.Tree, Source_Pos =>
yy.value_stack (yy.tos-3).Source_Pos);


when  371 =>
--#line  2795

        --  Pop the indent stack
        if Sparkel_Lex.Debug_Indent then
            Text_IO.Put (" [QUEUED: popping top indent] "); Text_IO.Flush;
        end if;
        Sparkel_Lex.Top := Sparkel_Lex.Top - 1;


when  375 =>
--#line  2808


yyval := (Optional_End_Token,
                Source_Pos => PSC.Source_Positions.Null_Source_Position,
                End_Construct_Str => PSC.Strings.Null_U_String,
                Check_Label => False,
                others => Null_Optional_Tree);


when  376 =>
--#line  2815


yyval := (Optional_End_Token,
                Source_Pos =>
yy.value_stack (yy.tos-3).Source_Pos,
                End_Construct_Str =>
yy.value_stack (yy.tos-2).Str,
                Check_Label => True,
                Label =>
yy.value_stack (yy.tos-1).Tree, others => Null_Optional_Tree);


when  377 =>
--#line  2825


yyval :=
yy.value_stack (yy.tos-1);


when  378 =>
--#line  2830

yyval :=
yy.value_stack (yy.tos);

when  379 =>
--#line  2831

yyval :=
yy.value_stack (yy.tos);

when  380 =>
--#line  2835

yyval :=
yy.value_stack (yy.tos);

when  381 =>
--#line  2836


yyval := (One_Tree, Binary.Make (
          Operator => Binary.Next_Stmt_Op,
          Left_Operand =>
yy.value_stack (yy.tos-1).Tree,
          Right_Operand =>
yy.value_stack (yy.tos).Tree));


when  382 =>
--#line  2845

yyval :=
yy.value_stack (yy.tos);

when  383 =>
--#line  2846


yyval := (One_Tree, Binary.Make (
          Operator => Binary.Next_Stmt_Op,
          Left_Operand =>
yy.value_stack (yy.tos-1).Tree,
          Right_Operand =>
yy.value_stack (yy.tos).Tree));


when  384 =>
--#line  2855

yyval :=
yy.value_stack (yy.tos);

when  385 =>
--#line  2856

yyval :=
yy.value_stack (yy.tos);

when  386 =>
--#line  2860

yyval :=
yy.value_stack (yy.tos);

when  387 =>
--#line  2861

        --  "then" forces sequential processing; it has lower precedence
        --  than "||" so declarations preceding "then" are visible to both
        --  sides of the "||".

yyval := (One_Tree, Binary.Make (
          Operator => Binary.Then_Stmt_Op,
          Left_Operand =>
yy.value_stack (yy.tos-2).Tree,
          Right_Operand =>
yy.value_stack (yy.tos).Tree,
          Source_Pos =>
yy.value_stack (yy.tos-1).Source_Pos));


when  388 =>
--#line  2871

        --  "then" forces sequential processing; it has lower precedence
        --  than "||" so declarations preceding "then" are visible to both
        --  sides of the "||".

yyval := (One_Tree, Binary.Make (
          Operator => Binary.Then_Stmt_Op,
          Left_Operand =>
yy.value_stack (yy.tos-2).Tree,
          Right_Operand =>
yy.value_stack (yy.tos).Tree,
          Source_Pos =>
yy.value_stack (yy.tos-1).Source_Pos));


when  389 =>
--#line  2882

        --  "begin" is not used in Sparkel; treat like "then" for now

yyval := (One_Tree, Binary.Make (
          Operator => Binary.Then_Stmt_Op,
          Left_Operand =>
yy.value_stack (yy.tos-2).Tree,
          Right_Operand =>
yy.value_stack (yy.tos).Tree));


when  390 =>
--#line  2889

        --  "begin" is not used in Sparkel

yyval :=
yy.value_stack (yy.tos);


when  391 =>
--#line  2895

        if Sparkel_Lex.Debug_Indent
          and then Sparkel_Lex.Expecting_Indent
        then
            Text_IO.Put (" [then with indent off] "); Text_IO.Flush;
        end if;
        Sparkel_Lex.Expecting_Indent := False;

yyval :=
yy.value_stack (yy.tos);


when  392 =>
--#line  2905

        if Sparkel_Lex.Debug_Indent
          and then Sparkel_Lex.Expecting_Indent
        then
            Text_IO.Put (" [record with indent off] "); Text_IO.Flush;
        end if;
        Sparkel_Lex.Expecting_Indent := False;


when  393 =>
--#line  2915


yyval :=
yy.value_stack (yy.tos);


when  394 =>
--#line  2918


yyval :=
yy.value_stack (yy.tos-1);


when  397 =>
--#line  2924

        if Sparkel_Lex.Debug_Indent
          and then Sparkel_Lex.Expecting_Indent
        then
            Text_IO.Put (" [else with indent off] "); Text_IO.Flush;
        end if;
        Sparkel_Lex.Expecting_Indent := False;


when  398 =>
--#line  2933

        yyerror ("No need for ""begin"" in Sparkel operation definition");


when  399 =>
--#line  2939

yyval :=
yy.value_stack (yy.tos);

when  400 =>
--#line  2940

        --  "then" forces sequential processing; it has lower precedence
        --  than "||" so declarations preceding "then" are visible to both
        --  sides of the "||".

yyval := (One_Tree, Binary.Make (
          Operator => Binary.Then_Stmt_Op,
          Left_Operand =>
yy.value_stack (yy.tos-2).Tree,
          Right_Operand =>
yy.value_stack (yy.tos).Tree,
          Source_Pos =>
yy.value_stack (yy.tos-1).Source_Pos));


when  401 =>
--#line  2950

        --  "then" forces sequential processing; it has lower precedence
        --  than "||" so declarations preceding "then" are visible to both
        --  sides of the "||".

yyval := (One_Tree, Binary.Make (
          Operator => Binary.Then_Stmt_Op,
          Left_Operand =>
yy.value_stack (yy.tos-2).Tree,
          Right_Operand =>
yy.value_stack (yy.tos).Tree));


when  402 =>
--#line  2962


yyval :=
yy.value_stack (yy.tos);


when  403 =>
--#line  2965


yyval := (One_Tree, Binary.Make (
          Operator => Binary.Parallel_Stmt_Op,
          Left_Operand =>
yy.value_stack (yy.tos-2).Tree,
          Right_Operand =>
yy.value_stack (yy.tos).Tree,
          Source_Pos =>
yy.value_stack (yy.tos-1).Source_Pos));


when  404 =>
--#line  2972


yyval := (One_Tree, Binary.Make (
          Operator => Binary.Parallel_Stmt_Op,
          Left_Operand =>
yy.value_stack (yy.tos-2).Tree,
          Right_Operand =>
yy.value_stack (yy.tos).Tree,
          Source_Pos =>
yy.value_stack (yy.tos-1).Source_Pos));


when  405 =>
--#line  2981


yyval :=
yy.value_stack (yy.tos);


when  406 =>
--#line  2984


yyval :=
yy.value_stack (yy.tos-1);


when  407 =>
--#line  2989


yyval :=
yy.value_stack (yy.tos);


when  408 =>
--#line  2992


yyval := (One_Tree, Binary.Make (
          Operator => Binary.Parallel_Stmt_Op,
          Left_Operand =>
yy.value_stack (yy.tos-2).Tree,
          Right_Operand =>
yy.value_stack (yy.tos).Tree,
          Source_Pos =>
yy.value_stack (yy.tos-1).Source_Pos));


when  409 =>
--#line  2999


yyval := (One_Tree, Binary.Make (
          Operator => Binary.Parallel_Stmt_Op,
          Left_Operand =>
yy.value_stack (yy.tos-2).Tree,
          Right_Operand =>
yy.value_stack (yy.tos).Tree,
          Source_Pos =>
yy.value_stack (yy.tos-1).Source_Pos));


when  410 =>
--#line  3009

yyval :=
yy.value_stack (yy.tos);

when  411 =>
--#line  3010


yyval := (One_Tree, Binary.Make (
          Operator => Binary.Next_Stmt_Op,
          Left_Operand =>
yy.value_stack (yy.tos-1).Tree,
          Right_Operand =>
yy.value_stack (yy.tos).Tree));


when  412 =>
--#line  3019

yyval :=
yy.value_stack (yy.tos);

when  413 =>
--#line  3020


yyval := (One_Tree, Binary.Make (
          Operator => Binary.Next_Stmt_Op,
          Left_Operand =>
yy.value_stack (yy.tos-1).Tree,
          Right_Operand =>
yy.value_stack (yy.tos).Tree));


when  414 =>
--#line  3029


yyval :=
yy.value_stack (yy.tos);


when  415 =>
--#line  3032


yyval :=
yy.value_stack (yy.tos);


when  416 =>
--#line  3038


yyval :=
yy.value_stack (yy.tos-1);


when  417 =>
--#line  3044


yyval :=
yy.value_stack (yy.tos-1);
        Annotation.Add_Annotation (
yyval.Tree,
yy.value_stack (yy.tos-2).List, Precedes => True);
        Annotation.Add_Annotation (
yyval.Tree,
yy.value_stack (yy.tos).List);


when  418 =>
--#line  3049


yyval :=
yy.value_stack (yy.tos-1);
        Annotation.Add_Annotation (
yyval.Tree,
yy.value_stack (yy.tos).List);


when  419 =>
--#line  3053

        --  An annotation can appear by itself

yyval := (One_Tree, Annotation.Make (Annotations =>
yy.value_stack (yy.tos).List));


when  420 =>
--#line  3060

            --  NOTE: these already allow trailing annotations

yyval :=
yy.value_stack (yy.tos);
        Annotation.Add_Annotation (
yyval.Tree,
yy.value_stack (yy.tos-1).List, Precedes => True);


when  421 =>
--#line  3065


yyval :=
yy.value_stack (yy.tos);
        Annotation.Add_Annotation (
yyval.Tree,
yy.value_stack (yy.tos-1).List, Precedes => True);


when  422 =>
--#line  3069

yyval :=
yy.value_stack (yy.tos);

when  423 =>
--#line  3071


yyval :=
yy.value_stack (yy.tos);


when  424 =>
--#line  3077

yyval :=
yy.value_stack (yy.tos-1);

when  425 =>
--#line  3080

yyval :=
yy.value_stack (yy.tos);

when  426 =>
--#line  3081

        if Not_Null (
yy.value_stack (yy.tos).Tree) then
            --  Stmt might be null if there was an error.
            Check_Stmt_Label (
              Compound_Stmt =>
yy.value_stack (yy.tos), Start_Label_Token =>
yy.value_stack (yy.tos-1));
        end if;


yyval :=
yy.value_stack (yy.tos);


when  427 =>
--#line  3090

        if Not_Null (
yy.value_stack (yy.tos).Tree) then
            --  Stmt might be null if there was an error.
            Check_Stmt_Label (
              Compound_Stmt =>
yy.value_stack (yy.tos),
                Start_Label_Token => (Optional, Is_Present => False));
        end if;


yyval :=
yy.value_stack (yy.tos);


when  428 =>
--#line  3103


yyval :=
yy.value_stack (yy.tos);


when  429 =>
--#line  3106


yyval := (One_Tree, Assign_Stmt.Make (
          Assign_Operator => Assign_Stmt.Assign_Op,
          LHS =>
yy.value_stack (yy.tos-2).Tree,
          RHS =>
yy.value_stack (yy.tos).Tree));


when  430 =>
--#line  3112

        --  A "null" statement (i.e. a no-op)

yyval := (One_Tree, Control_Stmt.Make (
          Kind => Control_Stmt.Null_Stmt,
          Applies_To => Control_Stmt.Operation_Body,
          Id => Null_Optional_Tree,
          Values => Null_Optional_Tree,
          Source_Pos =>
yy.value_stack (yy.tos).Source_Pos));


when  431 =>
--#line  3121


yyval := (One_Tree, Invocation.Make (
          Kind => Invocation.Operation_Call,
          Prefix =>
yy.value_stack (yy.tos-3).Tree,
          Operands =>
yy.value_stack (yy.tos-1).List));


when  432 =>
--#line  3127

yyval :=
yy.value_stack (yy.tos);

when  433 =>
--#line  3128


yyval := (One_Tree, Control_Stmt.Make (
          Kind => Control_Stmt.Continue_Stmt,
          Applies_To => Control_Stmt.Loop_Stmt,
          Id =>
yy.value_stack (yy.tos-1).Tree,
          Values =>
yy.value_stack (yy.tos).Tree,
          Source_Pos =>
yy.value_stack (yy.tos-3).Source_Pos));


when  434 =>
--#line  3136


yyval := (One_Tree, Control_Stmt.Make (
          Kind => Control_Stmt.Exit_Stmt,
          Applies_To =>
yy.value_stack (yy.tos-2).Exitable_Construct,
          Id =>
yy.value_stack (yy.tos-1).Tree,
          Values =>
yy.value_stack (yy.tos).Tree,
          Source_Pos =>
yy.value_stack (yy.tos-3).Source_Pos));


when  435 =>
--#line  3145


yyval := (One_Tree, Conditional.Make (Kind => Conditional.If_Stmt,
          Source_Pos =>
yy.value_stack (yy.tos-5).Source_Pos,
          Cond =>
yy.value_stack (yy.tos).Tree,
          Then_Part => Control_Stmt.Make (
             Kind => Control_Stmt.Exit_Stmt,
             Applies_To =>
yy.value_stack (yy.tos-4).Exitable_Construct,
             Id =>
yy.value_stack (yy.tos-3).Tree,
             Values =>
yy.value_stack (yy.tos-2).Tree,
             Source_Pos =>
yy.value_stack (yy.tos-5).Source_Pos),
          Else_Part => Null_Optional_Tree,
          End_With_Values => Null_Optional_Tree,
          Check_Label => False,
          Label => Null_Optional_Tree));


when  436 =>
--#line  3160

        yyerror ("Extra ')'", At_Token =>
yy.value_stack (yy.tos));

yyval :=
yy.value_stack (yy.tos-1);


when  437 =>
--#line  3167

        if Sparkel_Lex.Debug_Indent
          and then Sparkel_Lex.Expecting_Indent
        then
            Text_IO.Put (" [loop with indent off] "); Text_IO.Flush;
        end if;
        Sparkel_Lex.Expecting_Indent := False;

yyval :=
yy.value_stack (yy.tos);


when  438 =>
--#line  3178


yyval := (One_Tree, Control_Stmt.Make (
          Kind => Control_Stmt.Return_Stmt,
          Applies_To => Control_Stmt.Operation_Body,
          Id => Null_Optional_Tree,
          Values =>
yy.value_stack (yy.tos).Tree,
          Source_Pos =>
yy.value_stack (yy.tos-1).Source_Pos));


when  439 =>
--#line  3186


yyval := (One_Tree, Control_Stmt.Make (
          Kind => Control_Stmt.Return_Stmt,
          Applies_To => Control_Stmt.Operation_Body,
          Id => Null_Optional_Tree,
          Values =>
yy.value_stack (yy.tos).Tree,
          Source_Pos =>
yy.value_stack (yy.tos-1).Source_Pos));


when  440 =>
--#line  3197

yyval :=
yy.value_stack (yy.tos);

when  441 =>
--#line  3198

        yyerror ("""loop"" required after ""continue""");

yyval := (One_Token,
          PSC.Source_Positions.Null_Source_Position,
          PSC.Strings.Null_U_String);


when  442 =>
--#line  3207


yyval := (One_Tree, Assign_Stmt.Make (
          Assign_Operator =>
yy.value_stack (yy.tos-1).Assign_Op,
          LHS =>
yy.value_stack (yy.tos-2).Tree,
          RHS =>
yy.value_stack (yy.tos).Tree));


when  443 =>
--#line  3213


yyval := (One_Tree, Assign_Stmt.Make (
          Assign_Operator => Assign_Stmt.Divide_Assign_Op,
          LHS =>
yy.value_stack (yy.tos-2).Tree,
          RHS =>
yy.value_stack (yy.tos).Tree));


when  444 =>
--#line  3219


yyval := (One_Tree, Assign_Stmt.Make (
          Assign_Operator => Assign_Stmt.Combine_Move_Op,
          LHS =>
yy.value_stack (yy.tos-2).Tree,
          RHS =>
yy.value_stack (yy.tos).Tree));


when  445 =>
--#line  3225


yyval := (One_Tree, Assign_Stmt.Make (
          Assign_Operator => Assign_Stmt.Move_Op,
          LHS =>
yy.value_stack (yy.tos-2).Tree,
          RHS =>
yy.value_stack (yy.tos).Tree));


when  446 =>
--#line  3231


yyval := (One_Tree, Assign_Stmt.Make (
          Assign_Operator => Assign_Stmt.Swap_Op,
          LHS =>
yy.value_stack (yy.tos-2).Tree,
          RHS =>
yy.value_stack (yy.tos).Tree));


when  447 =>
--#line  3237

        --  multiple assignment
        --  NOTE: Using "opt_operation_actual_list" rather
        --       than "operation_actual_list" to avoid ambiguity

yyval := (One_Tree, Assign_Stmt.Make (
          Assign_Operator => Assign_Stmt.Assign_Op,
          LHS => Invocation.Make (
            Kind => Invocation.Class_Aggregate,
            Prefix => Null_Optional_Tree,
            Operands =>
yy.value_stack (yy.tos-3).List,
            Source_Pos =>
yy.value_stack (yy.tos-4).Source_Pos),
          RHS =>
yy.value_stack (yy.tos).Tree));


when  448 =>
--#line  3250


yyval := (One_Tree, Annotation.Make
                 (Annotations => Lists.Make ((1 =>
yy.value_stack (yy.tos).Tree))));


when  449 =>
--#line  3254


yyval := (One_Tree, Annotation.Make
                 (Annotations => Lists.Make ((1 =>
yy.value_stack (yy.tos-2).Tree)),
                  Label =>
yy.value_stack (yy.tos).Tree));


when  450 =>
--#line  3262

yyval :=
yy.value_stack (yy.tos);

when  451 =>
--#line  3263


yyval := (One_List, Lists.Empty_List);


when  452 =>
--#line  3269

yyval :=
yy.value_stack (yy.tos);

when  453 =>
--#line  3270


yyval := (One_Tree, Null_Optional_Tree);


when  454 =>
--#line  3275

        --  NOTE: This used to be '(' operation_actual_list ')'
        --       but that prevented continuing with a single expression.

yyval :=
yy.value_stack (yy.tos);


when  455 =>
--#line  3282

yyval :=
yy.value_stack (yy.tos);

when  456 =>
--#line  3283


yyval := (One_Tree, Null_Optional_Tree);


when  457 =>
--#line  3289

yyval :=
yy.value_stack (yy.tos);

when  458 =>
--#line  3290

        yyerror (
          """loop,"" ""if,"" ""case,"" or ""block"" must follow ""exit""");

yyval := (Construct_Kind, Control_Stmt.Loop_Stmt);


when  459 =>
--#line  3298


yyval := (Construct_Kind, Control_Stmt.Loop_Stmt);


when  460 =>
--#line  3301


yyval := (Construct_Kind, Control_Stmt.If_Stmt);


when  461 =>
--#line  3304


yyval := (Construct_Kind, Control_Stmt.Case_Stmt);


when  462 =>
--#line  3307


yyval := (Construct_Kind, Control_Stmt.Block_Stmt);


when  463 =>
--#line  3310


yyval := (Construct_Kind, Control_Stmt.Block_Stmt); --  TBD: Parallel_Stmt


when  464 =>
--#line  3315

        if Sparkel_Lex.Debug_Indent
          and then Sparkel_Lex.Expecting_Indent
        then
            Text_IO.Put (" [block with indent off] "); Text_IO.Flush;
        end if;
        Sparkel_Lex.Expecting_Indent := False;

yyval :=
yy.value_stack (yy.tos);


when  465 =>
--#line  3325

        if Sparkel_Lex.Debug_Indent
          and then Sparkel_Lex.Expecting_Indent
        then
            Text_IO.Put (" [parallel with indent off] "); Text_IO.Flush;
        end if;
        Sparkel_Lex.Expecting_Indent := False;

yyval :=
yy.value_stack (yy.tos);


when  466 =>
--#line  3336

yyval :=
yy.value_stack (yy.tos);

when  467 =>
--#line  3337

yyval :=
yy.value_stack (yy.tos);

when  468 =>
--#line  3338

yyval :=
yy.value_stack (yy.tos);

when  469 =>
--#line  3339

yyval :=
yy.value_stack (yy.tos);

when  470 =>
--#line  3343

yyval :=
yy.value_stack (yy.tos);

when  471 =>
--#line  3344

yyval :=
yy.value_stack (yy.tos);

when  472 =>
--#line  3345

yyval :=
yy.value_stack (yy.tos-1);

when  473 =>
--#line  3346

yyval :=
yy.value_stack (yy.tos);

when  474 =>
--#line  3347

yyval :=
yy.value_stack (yy.tos);

when  475 =>
--#line  3350

yyval :=
yy.value_stack (yy.tos);

when  476 =>
--#line  3351

yyval :=
yy.value_stack (yy.tos-1);

when  477 =>
--#line  3352

yyval :=
yy.value_stack (yy.tos-1);

when  478 =>
--#line  3355

yyval :=
yy.value_stack (yy.tos-1);

when  479 =>
--#line  3358

yyval :=
yy.value_stack (yy.tos);

when  480 =>
--#line  3359

yyval :=
yy.value_stack (yy.tos);

when  481 =>
--#line  3360

yyval :=
yy.value_stack (yy.tos);

when  482 =>
--#line  3361

yyval :=
yy.value_stack (yy.tos);

when  483 =>
--#line  3362

yyval :=
yy.value_stack (yy.tos);

when  484 =>
--#line  3363

yyval :=
yy.value_stack (yy.tos);

when  485 =>
--#line  3364

yyval :=
yy.value_stack (yy.tos);

when  486 =>
--#line  3365

yyval := (One_Tree, Null_Optional_Tree);

when  487 =>
--#line  3371


yyval := (One_Tree, Conditional.Make (Kind => Conditional.If_Stmt,
          Source_Pos =>
yy.value_stack (yy.tos-5).Source_Pos,
          Cond =>
yy.value_stack (yy.tos-4).Tree,
          Then_Part =>
yy.value_stack (yy.tos-2).Tree,
          Else_Part =>
yy.value_stack (yy.tos-1).Tree,
          End_With_Values =>
yy.value_stack (yy.tos).End_With_Values,
          Check_Label =>
yy.value_stack (yy.tos).Check_Label,
          Label =>
yy.value_stack (yy.tos).Label));


when  488 =>
--#line  3386


yyval := (One_Tree, Conditional.Make (Kind => Conditional.Elsif_Stmt,
          Source_Pos =>
yy.value_stack (yy.tos-4).Source_Pos,
          Cond =>
yy.value_stack (yy.tos-3).Tree,
          Then_Part =>
yy.value_stack (yy.tos-1).Tree,
          Else_Part =>
yy.value_stack (yy.tos).Tree));


when  489 =>
--#line  3394


yyval :=
yy.value_stack (yy.tos-1);


when  490 =>
--#line  3397


yyval := (One_Tree, Null_Optional_Tree);


when  491 =>
--#line  3402

yyval :=
yy.value_stack (yy.tos);

when  493 =>
--#line  3408


yyval := (Optional_End_Token,
                Source_Pos => PSC.Source_Positions.Null_Source_Position,
                End_Construct_Str => PSC.Strings.Null_U_String,
                Check_Label => False,
                others => Null_Optional_Tree);


when  494 =>
--#line  3415


yyval := (Optional_End_Token,
                Source_Pos =>
yy.value_stack (yy.tos-4).Source_Pos,
                End_Construct_Str =>
yy.value_stack (yy.tos-3).Str,
                Check_Label => True,
                Label =>
yy.value_stack (yy.tos-2).Tree, End_With_Values =>
yy.value_stack (yy.tos-1).Tree);


when  495 =>
--#line  3428

        declare
            Case_Alt_List : Lists.List :=
yy.value_stack (yy.tos-3).List;
        begin
            if Not_Null (
yy.value_stack (yy.tos-2).Tree) then
                Lists.Append (Case_Alt_List,
yy.value_stack (yy.tos-2).Tree);
            end if;

yyval := (One_Tree, Case_Construct.Make (
              Source_Pos =>
yy.value_stack (yy.tos-6).Source_Pos,
              Case_Selector =>
yy.value_stack (yy.tos-5).Tree,
              Case_Alt_List => Case_Alt_List,
              End_With_Values =>
yy.value_stack (yy.tos).End_With_Values,
              Check_Label =>
yy.value_stack (yy.tos).Check_Label,
              Label =>
yy.value_stack (yy.tos).Label));
        end;


when  496 =>
--#line  3447


yyval := (Optional_End_Token,
                Source_Pos => PSC.Source_Positions.Null_Source_Position,
                End_Construct_Str => PSC.Strings.Null_U_String,
                Check_Label => False,
                others => Null_Optional_Tree);


when  497 =>
--#line  3454


yyval := (Optional_End_Token,
                Source_Pos =>
yy.value_stack (yy.tos-4).Source_Pos,
                End_Construct_Str =>
yy.value_stack (yy.tos-3).Str,
                Check_Label => True,
                Label =>
yy.value_stack (yy.tos-2).Tree, End_With_Values =>
yy.value_stack (yy.tos-1).Tree);


when  498 =>
--#line  3464


yyval := (One_List, Lists.Make ((1 =>
yy.value_stack (yy.tos).Tree)));


when  499 =>
--#line  3467


yyval :=
yy.value_stack (yy.tos-1);
        Lists.Append (
yyval.List,
yy.value_stack (yy.tos).Tree);


when  500 =>
--#line  3475


yyval := (One_Tree, Reference.Make (
          Key => Invocation.Make (Invocation.Container_Aggregate,
            Prefix => Null_Optional_Tree,
            Operands => Lists.Make ((1 =>
yy.value_stack (yy.tos-2).Tree))),
          Referent =>
yy.value_stack (yy.tos).Tree));


when  501 =>
--#line  3484

        if Sparkel_Lex.Debug_Indent then
           Text_IO.Put (" [indent on] "); Text_IO.Flush;
        end if;
        Sparkel_Lex.Bracketing_Token := REFERS_TO;
        Sparkel_Lex.Expecting_Indent := True;

yyval :=
yy.value_stack (yy.tos);


when  502 =>
--#line  3494

yyval :=
yy.value_stack (yy.tos);

when  503 =>
--#line  3496


yyval := (One_Tree, Param_Decl.Make (
          Name =>
yy.value_stack (yy.tos-2).Tree,
          Kind => Param_Decl.Default_Param,
          Locking => Param_Decl.Not_Locked,
          Is_Optional => False,
          Param_Type =>
yy.value_stack (yy.tos).Tree,
          Param_Default => Null_Optional_Tree));


when  504 =>
--#line  3509


yyval := (One_Tree, Reference.Make (
          Key => Invocation.Make (Invocation.Container_Aggregate,
            Prefix => Null_Optional_Tree,
            Operands => Lists.Make ((1 =>
yy.value_stack (yy.tos-2).Tree))),
          Referent =>
yy.value_stack (yy.tos).Tree));


when  505 =>
--#line  3516


yyval := (One_Tree, Null_Optional_Tree);


when  506 =>
--#line  3522


yyval := (One_Tree, Binary.Make (Binary.Closed_Interval_Op,
          Left_Operand => Null_Optional_Tree,
          Right_Operand => Null_Optional_Tree));


when  507 =>
--#line  3530

yyval :=
yy.value_stack (yy.tos-1);

when  508 =>
--#line  3531

yyval :=
yy.value_stack (yy.tos-2);

when  509 =>
--#line  3532

yyval :=
yy.value_stack (yy.tos);

when  510 =>
--#line  3536

yyval :=
yy.value_stack (yy.tos);

when  511 =>
--#line  3537


yyval := (One_Tree, Param_Decl.Make (
          Name =>
yy.value_stack (yy.tos-2).Tree,
          Kind => Param_Decl.Default_Param,
          Locking => Param_Decl.Not_Locked,
          Is_Optional => False,
          Param_Type =>
yy.value_stack (yy.tos).Tree,
          Param_Default => Null_Optional_Tree));


when  512 =>
--#line  3548


yyval := (One_Tree, Binary.Make (Binary.Closed_Interval_Op,
          Left_Operand => Null_Optional_Tree,
          Right_Operand => Null_Optional_Tree));


when  513 =>
--#line  3558


yyval := (One_Tree, While_Stmt.Make (
          Source_Pos =>
yy.value_stack (yy.tos-4).Source_Pos,
          While_Cond => Null_Optional_Tree,
          Loop_Body =>
yy.value_stack (yy.tos-2).Tree,
          End_With_Values =>
yy.value_stack (yy.tos).End_With_Values,
          Check_Label =>
yy.value_stack (yy.tos).Check_Label,
          Label =>
yy.value_stack (yy.tos).Label));


when  514 =>
--#line  3572


yyval := (One_Tree, While_Stmt.Make (
          Source_Pos =>
yy.value_stack (yy.tos-5).Source_Pos,
          While_Cond => Conditionally_Complement (
yy.value_stack (yy.tos-4).Tree,
            Complement =>
yy.value_stack (yy.tos-5).Is_Until),
          Loop_Body =>
yy.value_stack (yy.tos-2).Tree,
          End_With_Values =>
yy.value_stack (yy.tos).End_With_Values,
          Check_Label =>
yy.value_stack (yy.tos).Check_Label,
          Label =>
yy.value_stack (yy.tos).Label));


when  515 =>
--#line  3585

yyval := (Construct_Qualifier,
                      Source_Pos =>
yy.value_stack (yy.tos).Source_Pos,
                      Is_While => True, others => False);

when  516 =>
--#line  3588

yyval := (Construct_Qualifier,
                      Source_Pos =>
yy.value_stack (yy.tos).Source_Pos,
                      Is_Until => True, others => False);

when  519 =>
--#line  3596


yyval := (Optional_End_Token,
                Source_Pos => PSC.Source_Positions.Null_Source_Position,
                End_Construct_Str => PSC.Strings.Null_U_String,
                Check_Label => False,
                others => Null_Optional_Tree);


when  520 =>
--#line  3603


yyval := (Optional_End_Token,
                Source_Pos =>
yy.value_stack (yy.tos-4).Source_Pos,
                End_Construct_Str =>
yy.value_stack (yy.tos-3).Str,
                Check_Label => True,
                Label =>
yy.value_stack (yy.tos-2).Tree, End_With_Values =>
yy.value_stack (yy.tos-1).Tree);


when  521 =>
--#line  3617


yyval := (One_Tree, For_Loop_Construct.Make (
          Source_Pos =>
yy.value_stack (yy.tos-7).Source_Pos,
          Kind => For_Loop_Construct.For_Loop_Statement,
          Iterators =>
yy.value_stack (yy.tos-6).List,
          Filter =>
yy.value_stack (yy.tos-5).List,
          Loop_Body =>
yy.value_stack (yy.tos-2).Tree,
          Direction =>
yy.value_stack (yy.tos-4).Str,
          End_With_Values =>
yy.value_stack (yy.tos).End_With_Values,
          Check_Label =>
yy.value_stack (yy.tos).Check_Label,
          Label =>
yy.value_stack (yy.tos).Label));


when  522 =>
--#line  3632


yyval := (One_List, Lists.Make ((1 =>
yy.value_stack (yy.tos).Tree)));


when  523 =>
--#line  3635

yyval :=
yy.value_stack (yy.tos-1);

when  524 =>
--#line  3639

        declare
            use type PSC.Strings.U_String;
            Iterator_Tree : constant Optional_Tree :=
yy.value_stack (yy.tos-1).Tree;
        begin
            if
yy.value_stack (yy.tos).Str /= PSC.Strings.Null_U_String then
                Iterator.Add_Direction (Iterator_Tree,
yy.value_stack (yy.tos).Str);
            end if;

yyval := (One_List, Lists.Make ((1 => Iterator_Tree)));
        end;


when  525 =>
--#line  3650

        declare
            use type PSC.Strings.U_String;
            Iterator_Tree : Optional_Tree :=
yy.value_stack (yy.tos-1).Tree;
        begin
            if
yy.value_stack (yy.tos).Str /= PSC.Strings.Null_U_String then
                Iterator.Add_Direction (Iterator_Tree,
yy.value_stack (yy.tos).Str);
            end if;

yyval :=
yy.value_stack (yy.tos-3);
            Lists.Append (
yyval.List, Iterator_Tree);
        end;


when  526 =>
--#line  3662

        declare
            use type PSC.Strings.U_String;
            Iterator_Tree : constant Optional_Tree :=
yy.value_stack (yy.tos-1).Tree;
        begin
            yyerror ("Iterators must be separated by "";""",
              At_Token =>
yy.value_stack (yy.tos-2));
            if
yy.value_stack (yy.tos).Str /= PSC.Strings.Null_U_String then
                Iterator.Add_Direction (Iterator_Tree,
yy.value_stack (yy.tos).Str);
            end if;

yyval :=
yy.value_stack (yy.tos-3);
            Lists.Append (
yyval.List, Iterator_Tree);
        end;


when  527 =>
--#line  3679

yyval :=
yy.value_stack (yy.tos);

when  528 =>
--#line  3680


yyval := (One_Token,
          PSC.Source_Positions.Null_Source_Position,
          PSC.Strings.Null_U_String);


when  529 =>
--#line  3688

yyval :=
yy.value_stack (yy.tos);

when  530 =>
--#line  3689

        yyerror ("Use ""for ..."" or ""for each ..."" rather " &
          "than ""for all ..."" in iterator of for-loop",
          At_Token =>
yy.value_stack (yy.tos-1));

yyval :=
yy.value_stack (yy.tos);


when  531 =>
--#line  3695

yyval :=
yy.value_stack (yy.tos);

when  532 =>
--#line  3696

        yyerror ("""for-each"" iterator uses ""of"" rather than ""in""",
          At_Token =>
yy.value_stack (yy.tos-1));

yyval :=
yy.value_stack (yy.tos);


when  533 =>
--#line  3701

        yyerror ("Use ""for each ..."" rather than ""for all ..."" in " &
          "container element iterator",
          At_Token =>
yy.value_stack (yy.tos-1));

yyval :=
yy.value_stack (yy.tos);


when  534 =>
--#line  3707

        yyerror ("Missing ""each"" in container element ""for-each"" iterator",
          At_Token =>
yy.value_stack (yy.tos));

yyval :=
yy.value_stack (yy.tos);


when  535 =>
--#line  3712

yyval :=
yy.value_stack (yy.tos);

when  536 =>
--#line  3713

yyval :=
yy.value_stack (yy.tos);

when  537 =>
--#line  3717


yyval := (One_Tree, Iterator.Make (
          Kind => Iterator.Set_Iterator,
          Name => PSC.Trees.Identifier.Tree (Tree_Of (
yy.value_stack (yy.tos-4).Tree)),
          Is_Ref => False,
          Obj_Type =>
yy.value_stack (yy.tos-3).Tree,
          Obj_Value =>
yy.value_stack (yy.tos).Tree));


when  539 =>
--#line  3727

        yyerror ("The ""reverse"" keyword goes immediately before ""loop""");


when  540 =>
--#line  3732


yyval := (One_Tree, Iterator.Make (
          Kind => Iterator.Each_Value,
          Name => PSC.Trees.Identifier.Tree (Tree_Of (
yy.value_stack (yy.tos-3).Tree)),
          Is_Ref => True,
          Obj_Type =>
yy.value_stack (yy.tos-2).Tree,
          Obj_Value =>
yy.value_stack (yy.tos).Tree));


when  541 =>
--#line  3740


yyval := (One_Tree, Iterator.Make (
          Kind => Iterator.Each_Key_Value,
          Name => PSC.Trees.Identifier.Tree (Tree_Of (
yy.value_stack (yy.tos-3).Tree)),
          Is_Ref => True,
          Obj_Type => Null_Optional_Tree,
          Obj_Value =>
yy.value_stack (yy.tos).Tree,
          Key_Name =>
yy.value_stack (yy.tos-5).Tree));


when  542 =>
--#line  3751

        if Sparkel_Lex.Debug_Indent
          and then Sparkel_Lex.Expecting_Indent
        then
            Text_IO.Put (" [of with indent off] "); Text_IO.Flush;
        end if;
        Sparkel_Lex.Expecting_Indent := False;


when  543 =>
--#line  3762


yyval := (One_Tree, Iterator.Make (
          Kind => Iterator.Initial_Next_Value,
          Name => PSC.Trees.Identifier.Tree (Tree_Of (
yy.value_stack (yy.tos-6).Tree)),
          Is_Ref => False,
          Obj_Type =>
yy.value_stack (yy.tos-5).Tree,
          Obj_Value =>
yy.value_stack (yy.tos-3).Tree,
          Next_Values =>
yy.value_stack (yy.tos-1).List,
          While_Cond =>
yy.value_stack (yy.tos).Tree));


when  544 =>
--#line  3773


yyval := (One_Tree, Iterator.Make (
          Kind => Iterator.Initial_Next_Value,
          Name => PSC.Trees.Identifier.Tree (Tree_Of (
yy.value_stack (yy.tos-6).Tree)),
          Is_Ref => True,
          Obj_Type =>
yy.value_stack (yy.tos-5).Tree,
          Obj_Value =>
yy.value_stack (yy.tos-3).Tree,
          Next_Values =>
yy.value_stack (yy.tos-1).List,
          While_Cond =>
yy.value_stack (yy.tos).Tree));


when  545 =>
--#line  3786


yyval := (One_Tree, Iterator.Make (
          Kind => Iterator.Initial_Value,
          Name => PSC.Trees.Identifier.Tree (Tree_Of (
yy.value_stack (yy.tos-4).Tree)),
          Is_Ref => False,
          Obj_Type =>
yy.value_stack (yy.tos-3).Tree,
          Obj_Value =>
yy.value_stack (yy.tos-1).Tree,
          While_Cond =>
yy.value_stack (yy.tos).Tree));


when  546 =>
--#line  3795


yyval := (One_Tree, Iterator.Make (
          Kind => Iterator.Initial_Value,
          Name => PSC.Trees.Identifier.Tree (Tree_Of (
yy.value_stack (yy.tos-4).Tree)),
          Is_Ref => True,
          Obj_Type =>
yy.value_stack (yy.tos-3).Tree,
          Obj_Value =>
yy.value_stack (yy.tos-1).Tree,
          While_Cond =>
yy.value_stack (yy.tos).Tree));


when  547 =>
--#line  3807


yyval :=
yy.value_stack (yy.tos);


when  548 =>
--#line  3810


yyval := (One_Tree, Null_Optional_Tree);


when  549 =>
--#line  3816


yyval := (One_List, Lists.Make ((1 =>
yy.value_stack (yy.tos).Tree)));


when  550 =>
--#line  3819


yyval :=
yy.value_stack (yy.tos-2);
        Lists.Append (
yyval.List,
yy.value_stack (yy.tos).Tree);


when  551 =>
--#line  3826


yyval := (One_List, Lists.Make ((1 =>
yy.value_stack (yy.tos).Tree)));


when  552 =>
--#line  3829


yyval :=
yy.value_stack (yy.tos-2);
        Lists.Append (
yyval.List,
yy.value_stack (yy.tos).Tree);


when  553 =>
--#line  3836


yyval := (One_Tree, Conditionally_Complement (

yy.value_stack (yy.tos).Tree, Complement =>
yy.value_stack (yy.tos-1).Is_Until));
            --  Complement condition if used "until"


when  554 =>
--#line  3841


yyval := (One_Tree, Null_Optional_Tree);


when  555 =>
--#line  3846

yyval :=
yy.value_stack (yy.tos);

when  556 =>
--#line  3847


yyval := (One_Token,
          PSC.Source_Positions.Null_Source_Position,
          PSC.Strings.Null_U_String);


when  557 =>
--#line  3855


yyval := (One_Token, PSC.Syntax.Cur_Source_Pos, Concurrent_Str);


when  558 =>
--#line  3858

yyval :=
yy.value_stack (yy.tos);

when  559 =>
--#line  3862


yyval := (One_Token, PSC.Syntax.Cur_Source_Pos, Forward_Str);


when  560 =>
--#line  3865


yyval := (One_Token, PSC.Syntax.Cur_Source_Pos, Reverse_Str);


when  561 =>
--#line  3873


yyval := (One_Tree, Block_Stmt.Make (
          Source_Pos =>
yy.value_stack (yy.tos-4).Source_Pos,
          Block_Body =>
yy.value_stack (yy.tos-2).Tree,
          End_With_Values =>
yy.value_stack (yy.tos).End_With_Values,
          Check_Label =>
yy.value_stack (yy.tos).Check_Label,
          Label =>
yy.value_stack (yy.tos).Label));


when  562 =>
--#line  3883

yyval :=
yy.value_stack (yy.tos);

when  563 =>
--#line  3884

        yyerror ("Should be ""end block <id>"" rather than ""end <id>""");

yyval := (One_Token,
          PSC.Source_Positions.Null_Source_Position,
          PSC.Strings.Null_U_String);


when  564 =>
--#line  3893


yyval := (Optional_End_Token,
                Source_Pos => PSC.Source_Positions.Null_Source_Position,
                End_Construct_Str => PSC.Strings.Null_U_String,
                Check_Label => False,
                others => Null_Optional_Tree);


when  565 =>
--#line  3900


yyval := (Optional_End_Token,
                Source_Pos =>
yy.value_stack (yy.tos-4).Source_Pos,
                End_Construct_Str =>
yy.value_stack (yy.tos-3).Str,
                Check_Label => True,
                Label =>
yy.value_stack (yy.tos-2).Tree, End_With_Values =>
yy.value_stack (yy.tos-1).Tree);


when  566 =>
--#line  3912


yyval := (One_Tree, Block_Stmt.Make (
          Source_Pos =>
yy.value_stack (yy.tos-4).Source_Pos,
          Block_Body =>
yy.value_stack (yy.tos-2).Tree,
          End_With_Values =>
yy.value_stack (yy.tos).End_With_Values,
          Check_Label =>
yy.value_stack (yy.tos).Check_Label,
          Label =>
yy.value_stack (yy.tos).Label));


when  567 =>
--#line  3922

yyval :=
yy.value_stack (yy.tos);

when  568 =>
--#line  3923

        yyerror ("Should be ""end parallel <id>"" rather than ""end <id>""");

yyval := (One_Token,
          PSC.Source_Positions.Null_Source_Position,
          PSC.Strings.Null_U_String);


when  569 =>
--#line  3932


yyval := (Optional_End_Token,
                Source_Pos => PSC.Source_Positions.Null_Source_Position,
                End_Construct_Str => PSC.Strings.Null_U_String,
                Check_Label => False,
                others => Null_Optional_Tree);


when  570 =>
--#line  3939


yyval := (Optional_End_Token,
                Source_Pos =>
yy.value_stack (yy.tos-4).Source_Pos,
                End_Construct_Str =>
yy.value_stack (yy.tos-3).Str,
                Check_Label => True,
                Label =>
yy.value_stack (yy.tos-2).Tree, End_With_Values =>
yy.value_stack (yy.tos-1).Tree);


when  571 =>
--#line  3949


yyval :=
yy.value_stack (yy.tos);


when  572 =>
--#line  3962

        --  Treat "/=" equiv to "!=" in an expression

yyval := (One_Binary_Op,
yy.value_stack (yy.tos).Source_Pos, Binary.NEQ_Op);


when  573 =>
--#line  3969

yyval :=
yy.value_stack (yy.tos);

when  574 =>
--#line  3972


yyval := (One_Tree, Conditional.Make (Kind => Conditional.Quest_Colon,
          Source_Pos =>
yy.value_stack (yy.tos-3).Source_Pos,
          Cond =>
yy.value_stack (yy.tos-4).Tree,
          Then_Part =>
yy.value_stack (yy.tos-2).Tree,
          Else_Part =>
yy.value_stack (yy.tos).Tree));
        Set_Source_Pos (
yyval.Tree, Source_Pos =>
yy.value_stack (yy.tos-3).Source_Pos);


when  575 =>
--#line  3980

yyval :=
yy.value_stack (yy.tos);

when  576 =>
--#line  3985


yyval := (One_Tree, Operation.Make (
          Name => Null_Optional_Tree,
          Operation_Kind => Operation.Lambda_Operation,
          Operation_Inputs =>
yy.value_stack (yy.tos-2).List,
          Operation_Outputs => Lists.Empty_List,
          Preconditions => Null_Optional_Tree,
          Postconditions => Null_Optional_Tree,
          Is_Abstract => False,
          Is_Optional => False,
          Is_Def => True,
          Statements =>
yy.value_stack (yy.tos).Tree));


when  577 =>
--#line  4000


yyval := (One_List, Lists.Empty_List);


when  578 =>
--#line  4003


yyval := (One_List, Lists.Make ((1 =>
yy.value_stack (yy.tos).Tree)));


when  579 =>
--#line  4006


yyval :=
yy.value_stack (yy.tos-1);


when  580 =>
--#line  4011


yyval := (One_List, Lists.Make ((1 =>
yy.value_stack (yy.tos).Tree)));


when  581 =>
--#line  4014


yyval :=
yy.value_stack (yy.tos-2);
        Lists.Append (
yyval.List,
yy.value_stack (yy.tos).Tree);


when  582 =>
--#line  4020


yyval := (One_Tree, Param_Decl.Make (
          Name =>
yy.value_stack (yy.tos).Tree,
          Kind => Param_Decl.Default_Param,
          Locking => Param_Decl.Not_Locked,
          Is_Optional => False,
          Param_Type => Null_Optional_Tree,
          Param_Default => Null_Optional_Tree));


when  583 =>
--#line  4032

yyval :=
yy.value_stack (yy.tos);

when  584 =>
--#line  4033


yyval := (One_Tree, Invocation.Make (
          Kind => Invocation.Class_Aggregate,
          Prefix => Null_Optional_Tree,
          Operands => Lists.Make ((1 =>
yy.value_stack (yy.tos-1).Tree))));


when  585 =>
--#line  4041


yyval := (One_Tree, Binary.Make (
          Operator => Binary.Next_Stmt_Op,
          Left_Operand =>
yy.value_stack (yy.tos-2).Tree,
          Right_Operand =>
yy.value_stack (yy.tos).Tree));


when  586 =>
--#line  4047


yyval := (One_Tree, Binary.Make (
          Operator => Binary.Next_Stmt_Op,
          Left_Operand =>
yy.value_stack (yy.tos-2).Tree,
          Right_Operand =>
yy.value_stack (yy.tos).Tree));


when  587 =>
--#line  4056

yyval :=
yy.value_stack (yy.tos);

when  588 =>
--#line  4057

yyval :=
yy.value_stack (yy.tos);

when  589 =>
--#line  4061

yyval :=
yy.value_stack (yy.tos);

when  590 =>
--#line  4062

      declare
        Left_Tree : PSC.Trees.Tree'Class renames Tree_Ptr_Of (
yy.value_stack (yy.tos-2).Tree).all;
        use type Binary.Binary_Operator_Enum;
      begin
        if Left_Tree in Binary.Tree'Class and then
          Binary.Tree (Left_Tree).Operator in Binary.Logical_Ops then
            if Binary.Tree (Left_Tree).Operator /=
yy.value_stack (yy.tos-1).Binary_Op then
                --  logical operators are associative only with same op
                yyerror (
                  "must use parentheses in sequence of " &
                    "distinct logical operators",
                  At_Token =>
yy.value_stack (yy.tos-1));
            elsif
yy.value_stack (yy.tos-1).Binary_Op = Binary.Implies_Op then
                --  Implication should associate right-to-left but that
                --  is too confusing.
                yyerror (
                  "must use parentheses in sequence of implication operators",
                  At_Token =>
yy.value_stack (yy.tos-1));
            end if;
        end if;


yyval := (One_Tree, Binary.Make (
          Operator =>
yy.value_stack (yy.tos-1).Binary_Op,
          Left_Operand =>
yy.value_stack (yy.tos-2).Tree,
          Right_Operand =>
yy.value_stack (yy.tos).Tree));
      end;


when  591 =>
--#line  4093

yyval :=
yy.value_stack (yy.tos);

when  592 =>
--#line  4094


yyval := (One_Tree, Binary.Make (
          Operator =>
yy.value_stack (yy.tos-1).Binary_Op,
          Left_Operand =>
yy.value_stack (yy.tos-2).Tree,
          Right_Operand =>
yy.value_stack (yy.tos).Tree));


when  593 =>
--#line  4103

yyval :=
yy.value_stack (yy.tos);

when  594 =>
--#line  4104


yyval := (One_Tree, Binary.Make (
          Operator => Binary.In_Op,
          Left_Operand =>
yy.value_stack (yy.tos-2).Tree,
          Right_Operand =>
yy.value_stack (yy.tos).Tree));


when  595 =>
--#line  4110


yyval := (One_Tree, Binary.Make (
          Operator => Binary.Not_In_Op,
          Left_Operand =>
yy.value_stack (yy.tos-3).Tree,
          Right_Operand =>
yy.value_stack (yy.tos).Tree));


when  596 =>
--#line  4116


yyval := (One_Tree, Unary.Make (
          Operator => Unary.Is_Null_Op,
          Operand =>
yy.value_stack (yy.tos-2).Tree));


when  597 =>
--#line  4121

        --  We use adding_expression before "NOT" instead of simple_expression
        --  to avoid ambiguity associated with polymorphic type names
        --  (which are included in simple_expression but not adding_expression):
        --    Integer+ not null
        --  could be interpreted as:
        --    Integer + not(null)

yyval := (One_Tree, Unary.Make (
          Operator => Unary.Not_Null_Op,
          Operand =>
yy.value_stack (yy.tos-2).Tree));


when  598 =>
--#line  4132


yyval := (One_Tree, Invocation.Make (
          Kind => Invocation.Is_Function_Of,
          Prefix =>
yy.value_stack (yy.tos-5).Tree,
          Operands =>
yy.value_stack (yy.tos-1).List));


when  599 =>
--#line  4141

yyval :=
yy.value_stack (yy.tos);

when  600 =>
--#line  4142


yyval := (One_Tree, Binary.Make (
          Operator => Binary.Combine_Op,
          Left_Operand =>
yy.value_stack (yy.tos-2).Tree,
          Right_Operand =>
yy.value_stack (yy.tos).Tree));


when  601 =>
--#line  4151

yyval :=
yy.value_stack (yy.tos);

when  602 =>
--#line  4152


yyval := (One_Tree, Binary.Make (
          Operator =>
yy.value_stack (yy.tos-1).Binary_Op,
          Left_Operand =>
yy.value_stack (yy.tos-2).Tree,
          Right_Operand =>
yy.value_stack (yy.tos).Tree));


when  603 =>
--#line  4175

yyval :=
yy.value_stack (yy.tos);

when  604 =>
--#line  4176

        --  NOTE: We treat '+' here separately to avoid
        --        reduce/reduce conflicts

yyval := (One_Tree, Binary.Make (
          Operator => Binary.Plus_Op,
          Left_Operand =>
yy.value_stack (yy.tos-2).Tree,
          Right_Operand =>
yy.value_stack (yy.tos).Tree));


when  605 =>
--#line  4184


yyval := (One_Tree, Binary.Make (
          Operator =>
yy.value_stack (yy.tos-1).Binary_Op,
          Left_Operand =>
yy.value_stack (yy.tos-2).Tree,
          Right_Operand =>
yy.value_stack (yy.tos).Tree));


when  606 =>
--#line  4193

yyval :=
yy.value_stack (yy.tos);

when  607 =>
--#line  4194


yyval := (One_Tree, Binary.Make (
          Operator =>
yy.value_stack (yy.tos-1).Binary_Op,
          Left_Operand =>
yy.value_stack (yy.tos-2).Tree,
          Right_Operand =>
yy.value_stack (yy.tos).Tree));


when  608 =>
--#line  4203

yyval :=
yy.value_stack (yy.tos);

when  609 =>
--#line  4204

         --  right associative

yyval := (One_Tree, Binary.Make (
          Operator =>
yy.value_stack (yy.tos-1).Binary_Op,
          Left_Operand =>
yy.value_stack (yy.tos-2).Tree,
          Right_Operand =>
yy.value_stack (yy.tos).Tree));


when  610 =>
--#line  4211

        --  unary ops have higher precedence
        --  than every operator except the power_operator.

yyval := (One_Tree, Unary.Make (
          Operator =>
yy.value_stack (yy.tos-1).Unary_Op,
          Operand =>
yy.value_stack (yy.tos).Tree));


when  611 =>
--#line  4221

yyval :=
yy.value_stack (yy.tos);

when  612 =>
--#line  4222

yyval :=
yy.value_stack (yy.tos);

when  613 =>
--#line  4223

yyval :=
yy.value_stack (yy.tos-1);

when  614 =>
--#line  4224

yyval :=
yy.value_stack (yy.tos-1);

when  615 =>
--#line  4225

yyval :=
yy.value_stack (yy.tos-1);

when  616 =>
--#line  4226


yyval := (One_Tree, Unary.Make (Unary.Magnitude_Op,
          Operand =>
yy.value_stack (yy.tos-1).Tree));


when  617 =>
--#line  4230

yyval :=
yy.value_stack (yy.tos);

when  618 =>
--#line  4231

        --  This is used in a map_reduce expression to specify the initial val

yyval := (One_Tree, Unary.Make (Unary.Initial_Value_Op,
          Operand =>
yy.value_stack (yy.tos-1).Tree));


when  619 =>
--#line  4239


yyval := (One_Tree, PSC.Trees.Identifier.Make (
yy.value_stack (yy.tos).Str,
yy.value_stack (yy.tos).Source_Pos));


when  620 =>
--#line  4242


yyval := (One_Tree, PSC.Trees.Identifier.Make (
yy.value_stack (yy.tos).Str,
yy.value_stack (yy.tos).Source_Pos));


when  621 =>
--#line  4245


yyval := (One_Tree, PSC.Trees.Identifier.Make (
yy.value_stack (yy.tos).Str,
yy.value_stack (yy.tos).Source_Pos));


when  622 =>
--#line  4248


yyval := (One_Tree, PSC.Trees.Identifier.Make (
yy.value_stack (yy.tos).Str,
yy.value_stack (yy.tos).Source_Pos));


when  623 =>
--#line  4251


yyval := (One_Tree, PSC.Trees.Identifier.Make ("null",
yy.value_stack (yy.tos).Source_Pos));


when  624 =>
--#line  4257


yyval :=
yy.value_stack (yy.tos);


when  625 =>
--#line  4260


yyval :=
yy.value_stack (yy.tos);


when  626 =>
--#line  4266


yyval := (One_Tree, Invocation.Make (
          Kind => Invocation.Operation_Call,
          Prefix =>
yy.value_stack (yy.tos-3).Tree,
          Operands =>
yy.value_stack (yy.tos-1).List));


when  627 =>
--#line  4272


yyval := (One_Tree, Invocation.Make (
          Kind => Invocation.Container_Indexing,
          Prefix =>
yy.value_stack (yy.tos-3).Tree,
          Operands =>
yy.value_stack (yy.tos-1).List));


when  628 =>
--#line  4278


yyval := (One_Tree, Invocation.Make (
          Kind => Invocation.Container_Indexing,
          Prefix =>
yy.value_stack (yy.tos-3).Tree,
          Operands => Lists.Make ((1 =>
yy.value_stack (yy.tos-1).Tree))));


when  629 =>
--#line  4284


yyval := (One_Tree, Selection.Make (
          Prefix =>
yy.value_stack (yy.tos-2).Tree,
          Selector =>
yy.value_stack (yy.tos).Tree));


when  630 =>
--#line  4292


yyval := (One_List, Lists.Make ((1 =>
yy.value_stack (yy.tos).Tree)));


when  631 =>
--#line  4295


yyval :=
yy.value_stack (yy.tos-2);
        Lists.Append (
yyval.List,
yy.value_stack (yy.tos).Tree);


when  632 =>
--#line  4302

yyval :=
yy.value_stack (yy.tos);

when  633 =>
--#line  4303


yyval := (One_Tree, Reference.Make (
          Key =>
yy.value_stack (yy.tos-2).Tree,
          Referent =>
yy.value_stack (yy.tos).Tree));


when  634 =>
--#line  4310

yyval :=
yy.value_stack (yy.tos);

when  635 =>
--#line  4313

yyval := (One_Unary_Op,
yy.value_stack (yy.tos).Source_Pos, Unary.Plus_Op);

when  636 =>
--#line  4314

yyval := (One_Unary_Op,
yy.value_stack (yy.tos).Source_Pos, Unary.Minus_Op);

when  637 =>
--#line  4315

yyval := (One_Unary_Op,
yy.value_stack (yy.tos).Source_Pos, Unary.Abs_Op);

when  638 =>
--#line  4316

yyval := (One_Unary_Op,
yy.value_stack (yy.tos).Source_Pos, Unary.Not_Op);

when  639 =>
--#line  4317

yyval := (One_Unary_Op,
yy.value_stack (yy.tos).Source_Pos, Unary.Plus_Op);

when  640 =>
--#line  4318

yyval := (One_Unary_Op,
yy.value_stack (yy.tos).Source_Pos, Unary.Minus_Op);

when  641 =>
--#line  4322

yyval := (One_Binary_Op,
yy.value_stack (yy.tos).Source_Pos, Binary.Minus_Op);

when  642 =>
--#line  4323

yyval := (One_Binary_Op,
yy.value_stack (yy.tos).Source_Pos, Binary.Plus_Op);

when  643 =>
--#line  4324

yyval := (One_Binary_Op,
yy.value_stack (yy.tos).Source_Pos, Binary.Minus_Op);

when  644 =>
--#line  4325

yyval := (One_Binary_Op,
yy.value_stack (yy.tos).Source_Pos, Binary.Ampersand_Op);

when  645 =>
--#line  4329

yyval := (One_Binary_Op,
yy.value_stack (yy.tos).Source_Pos, Binary.Times_Op);

when  646 =>
--#line  4330

yyval := (One_Binary_Op,
yy.value_stack (yy.tos).Source_Pos, Binary.Divide_Op);

when  647 =>
--#line  4331

yyval := (One_Binary_Op,
yy.value_stack (yy.tos).Source_Pos, Binary.Mod_Op);

when  648 =>
--#line  4332

yyval := (One_Binary_Op,
yy.value_stack (yy.tos).Source_Pos, Binary.Rem_Op);

when  649 =>
--#line  4335


yyval := (One_Binary_Op,
yy.value_stack (yy.tos).Source_Pos, Binary.Power_Op);


when  650 =>
--#line  4339

yyval :=
yy.value_stack (yy.tos);

when  651 =>
--#line  4340


yyval := (One_Assign_Op,
yy.value_stack (yy.tos).Source_Pos, Assign_Stmt.Divide_Assign_Op);


when  652 =>
--#line  4346


yyval := (One_Assign_Op,
yy.value_stack (yy.tos).Source_Pos, Assign_Stmt.Assign_Op);


when  653 =>
--#line  4349


yyval := (One_Assign_Op,
yy.value_stack (yy.tos).Source_Pos, Assign_Stmt.Plus_Assign_Op);


when  654 =>
--#line  4352


yyval := (One_Assign_Op,
yy.value_stack (yy.tos).Source_Pos, Assign_Stmt.Minus_Assign_Op);


when  655 =>
--#line  4355


yyval := (One_Assign_Op,
yy.value_stack (yy.tos).Source_Pos, Assign_Stmt.Times_Assign_Op);


when  656 =>
--#line  4358


yyval := (One_Assign_Op,
yy.value_stack (yy.tos).Source_Pos, Assign_Stmt.Power_Assign_Op);


when  657 =>
--#line  4361


yyval := (One_Assign_Op,
yy.value_stack (yy.tos).Source_Pos, Assign_Stmt.Combine_Assign_Op);


when  658 =>
--#line  4364


yyval := (One_Assign_Op,
yy.value_stack (yy.tos).Source_Pos, Assign_Stmt.Ampersand_Assign_Op);


when  659 =>
--#line  4367


yyval := (One_Assign_Op,
yy.value_stack (yy.tos).Source_Pos, Assign_Stmt.And_Assign_Op);


when  660 =>
--#line  4370


yyval := (One_Assign_Op,
yy.value_stack (yy.tos).Source_Pos, Assign_Stmt.Or_Assign_Op);


when  661 =>
--#line  4373


yyval := (One_Assign_Op,
yy.value_stack (yy.tos).Source_Pos, Assign_Stmt.Xor_Assign_Op);


when  662 =>
--#line  4376


yyval := (One_Assign_Op,
yy.value_stack (yy.tos).Source_Pos, Assign_Stmt.Left_Shift_Assign_Op);


when  663 =>
--#line  4379


yyval := (One_Assign_Op,
yy.value_stack (yy.tos).Source_Pos, Assign_Stmt.Right_Shift_Assign_Op);


when  664 =>
--#line  4384


yyval := (One_Assign_Op,
yy.value_stack (yy.tos).Source_Pos, Assign_Stmt.Assign_Op);


when  665 =>
--#line  4387

yyval :=
yy.value_stack (yy.tos);

when  666 =>
--#line  4390

        yyerror ("Use "":="" rather than ""="" in Sparkel");

yyval := (One_Assign_Op,
yy.value_stack (yy.tos).Source_Pos, Assign_Stmt.Assign_Op);


when  667 =>
--#line  4397

yyval := (One_Binary_Op,
yy.value_stack (yy.tos).Source_Pos, Binary.Compare_Op);

when  668 =>
--#line  4398

yyval := (One_Binary_Op,
yy.value_stack (yy.tos).Source_Pos, Binary.Equal_Op);

when  669 =>
--#line  4399

yyval := (One_Binary_Op,
yy.value_stack (yy.tos).Source_Pos, Binary.NEQ_Op);

when  670 =>
--#line  4400

yyval := (One_Binary_Op,
yy.value_stack (yy.tos).Source_Pos, Binary.NEQ_Op);

when  671 =>
--#line  4401

yyval := (One_Binary_Op,
yy.value_stack (yy.tos).Source_Pos, Binary.Less_Op);

when  672 =>
--#line  4402

yyval := (One_Binary_Op,
yy.value_stack (yy.tos).Source_Pos, Binary.LEQ_Op);

when  673 =>
--#line  4403

yyval := (One_Binary_Op,
yy.value_stack (yy.tos).Source_Pos, Binary.Greater_Op);

when  674 =>
--#line  4404

yyval := (One_Binary_Op,
yy.value_stack (yy.tos).Source_Pos, Binary.GEQ_Op);

when  675 =>
--#line  4405

yyval := (One_Binary_Op,
yy.value_stack (yy.tos).Source_Pos, Binary.Left_Shift_Op );

when  676 =>
--#line  4406

yyval := (One_Binary_Op,
yy.value_stack (yy.tos-1).Source_Pos, Binary.Right_Shift_Op);

when  677 =>
--#line  4407

        yyerror ("Use ""="" rather than ""=="" in Sparkel");

yyval := (One_Binary_Op,
yy.value_stack (yy.tos).Source_Pos, Binary.Equal_Op);


when  678 =>
--#line  4414

yyval := (One_Binary_Op,
yy.value_stack (yy.tos).Source_Pos, Binary.And_Op);

when  679 =>
--#line  4415

yyval := (One_Binary_Op,
yy.value_stack (yy.tos).Source_Pos, Binary.Or_Op);

when  680 =>
--#line  4416

yyval := (One_Binary_Op,
yy.value_stack (yy.tos).Source_Pos, Binary.Xor_Op);

when  681 =>
--#line  4418

yyval := (One_Binary_Op,
yy.value_stack (yy.tos-1).Source_Pos, Binary.And_Then_Op);

when  682 =>
--#line  4420

yyval := (One_Binary_Op,
yy.value_stack (yy.tos-1).Source_Pos, Binary.Or_Else_Op);

when  683 =>
--#line  4421

yyval := (One_Binary_Op,
yy.value_stack (yy.tos).Source_Pos, Binary.Implies_Op);

when  684 =>
--#line  4425


yyval := (One_Binary_Op,
yy.value_stack (yy.tos).Source_Pos, Binary.Closed_Interval_Op);


when  685 =>
--#line  4428


yyval := (One_Binary_Op,
yy.value_stack (yy.tos).Source_Pos, Binary.Open_Interval_Op);


when  686 =>
--#line  4431


yyval := (One_Binary_Op,
yy.value_stack (yy.tos).Source_Pos, Binary.Closed_Open_Interval_Op);


when  687 =>
--#line  4434


yyval := (One_Binary_Op,
yy.value_stack (yy.tos).Source_Pos, Binary.Open_Closed_Interval_Op);


when  688 =>
--#line  4440

yyval :=
yy.value_stack (yy.tos);

when  689 =>
--#line  4441

yyval :=
yy.value_stack (yy.tos);

when  690 =>
--#line  4445


yyval := (One_Tree, Invocation.Make (
          Kind => Invocation.Class_Aggregate,
          Prefix => Null_Optional_Tree,
          Operands =>
yy.value_stack (yy.tos-1).List,
          Source_Pos =>
yy.value_stack (yy.tos-2).Source_Pos));


when  691 =>
--#line  4462

        --  Type of aggregate specified

yyval := (One_Tree, Invocation.Make (
          Kind => Invocation.Class_Aggregate,
          Prefix =>
yy.value_stack (yy.tos-4).Tree,
          Operands =>
yy.value_stack (yy.tos-1).List,
          Source_Pos =>
yy.value_stack (yy.tos-2).Source_Pos));


when  692 =>
--#line  4473


yyval :=
yy.value_stack (yy.tos);


when  693 =>
--#line  4476


yyval := (One_List, Lists.Empty_List);


when  694 =>
--#line  4482


yyval := (One_List, Lists.Make ((1 =>
yy.value_stack (yy.tos).Tree)));


when  695 =>
--#line  4485


yyval :=
yy.value_stack (yy.tos-2);
        Lists.Append (
yyval.List,
yy.value_stack (yy.tos).Tree);


when  696 =>
--#line  4492

yyval :=
yy.value_stack (yy.tos);

when  697 =>
--#line  4493


yyval := (One_Tree, Reference.Make (
          Key =>
yy.value_stack (yy.tos-2).Tree,
          Referent =>
yy.value_stack (yy.tos).Tree));


when  698 =>
--#line  4498


yyval := (One_Tree, Assign_Stmt.Make (
          Assign_Operator => Assign_Stmt.Move_Op,
          LHS =>
yy.value_stack (yy.tos-2).Tree,
          RHS =>
yy.value_stack (yy.tos).Tree));


when  699 =>
--#line  4508

      declare
        use type Invocation.Invocation_Kind_Enum;
        Is_Double_Bracket_Special_Case : Boolean := False;
      begin
--  TBD: The following fails at execution time due to a master
--      being init'ed in a short-circuit, and then finalized
--      outside the short-circuit:
--      if Lists.Length($2.List) = 1 and then
--        Tree_Of(Lists.Nth_Element($2.List, 1)) in Invocation.Tree and then
--        Invocation.Tree(Tree_Of(Lists.Nth_Element($2.List, 1))).Kind =
--          Invocation.Container_Aggregate and then
--        Is_Null(Invocation.Tree(
--          Tree_Of(Lists.Nth_Element($2.List, 1))).Prefix) then

        if Lists.Length (
yy.value_stack (yy.tos-1).List) = 1 then
          declare
            Solo_Operand : PSC.Trees.Tree'Class renames
              Tree_Ptr_Of (Lists.Nth_Element (
yy.value_stack (yy.tos-1).List, 1)).all;
          begin
            if Solo_Operand in Invocation.Tree
              and then Invocation.Tree (Solo_Operand).Kind =
                Invocation.Container_Aggregate
              and then
                Lists.Length (Invocation.Tree (Solo_Operand).Operands) = 1
              and then Is_Null (Invocation.Tree (Solo_Operand).Prefix)
            then
                --  We have the special case of "[[...]]"
                Is_Double_Bracket_Special_Case := True;
            end if;
          end;
        end if;

        if Is_Double_Bracket_Special_Case then

            --  [[...]] is a special case, and invokes the "meaning" op.
            --  TBD: Should we recognize this later as part of name resolution?


yyval := (One_Tree, Unary.Make (Unary.Meaning_Op,
              Operand =>
                Lists.Nth_Element (Invocation.Tree (
                  Tree_Ptr_Of
                    (Lists.Nth_Element (
yy.value_stack (yy.tos-1).List, 1)).all).Operands, 1)));
        else
            --  Normal case of [...], create an invocation node.

yyval := (One_Tree, Invocation.Make (
              Kind => Invocation.Container_Aggregate,
              Prefix => Null_Optional_Tree,
              Operands =>
yy.value_stack (yy.tos-1).List,
              Source_Pos =>
yy.value_stack (yy.tos-2).Source_Pos));
        end if;
      end;


when  700 =>
--#line  4561

        --  Type of result specified
      declare
        use type Invocation.Invocation_Kind_Enum;
        Is_Double_Bracket_Special_Case : Boolean := False;
      begin
        if Lists.Length (
yy.value_stack (yy.tos-1).List) = 1 then
          declare
            Solo_Operand : PSC.Trees.Tree'Class renames
              Tree_Ptr_Of (Lists.Nth_Element (
yy.value_stack (yy.tos-1).List, 1)).all;
          begin
            if Solo_Operand in Invocation.Tree
              and then
                Invocation.Tree (Solo_Operand).Kind =
                  Invocation.Container_Aggregate
              and then
                Lists.Length (Invocation.Tree (Solo_Operand).Operands) = 1
              and then
                Is_Null (Invocation.Tree (Solo_Operand).Prefix)
            then
                --  We have the special case of "[[...]]"
                Is_Double_Bracket_Special_Case := True;
            end if;
          end;
        end if;

        if Is_Double_Bracket_Special_Case then

            --  Type::[[...]] invokes the (binary) "meaning" op.


yyval := (One_Tree, Binary.Make (Binary.Meaning_Op,
              Left_Operand =>
yy.value_stack (yy.tos-4).Tree,
              Right_Operand =>
                Lists.Nth_Element (Invocation.Tree (
                  Tree_Ptr_Of
                    (Lists.Nth_Element (
yy.value_stack (yy.tos-1).List, 1)).all).Operands, 1)));
        else
            --  Normal case of Type::[...], create an invocation node.

yyval := (One_Tree, Invocation.Make (
              Kind => Invocation.Container_Aggregate,
              Prefix =>
yy.value_stack (yy.tos-4).Tree,
              Operands =>
yy.value_stack (yy.tos-1).List,
              Source_Pos =>
yy.value_stack (yy.tos-2).Source_Pos));
        end if;
      end;


when  701 =>
--#line  4610

yyval :=
yy.value_stack (yy.tos);

when  702 =>
--#line  4611


yyval := (One_List, Lists.Make ((1 =>
yy.value_stack (yy.tos).Tree)));


when  703 =>
--#line  4614


yyval := (One_List, Lists.Empty_List);


when  704 =>
--#line  4620


yyval := (One_List, Lists.Make ((1 =>
yy.value_stack (yy.tos).Tree)));


when  705 =>
--#line  4623


yyval :=
yy.value_stack (yy.tos-2);
        Lists.Append (
yyval.List,
yy.value_stack (yy.tos).Tree);


when  706 =>
--#line  4630

yyval :=
yy.value_stack (yy.tos);

when  707 =>
--#line  4631


yyval := (One_Tree, Reference.Make (
          Key =>
yy.value_stack (yy.tos-2).Tree,
          Referent =>
yy.value_stack (yy.tos).Tree));


when  708 =>
--#line  4636


yyval := (One_Tree, Reference.Make (
          Key =>
yy.value_stack (yy.tos-2).Tree,
          Referent =>
yy.value_stack (yy.tos).Tree));


when  709 =>
--#line  4642

        --  This gives an ID to an expression which can be used
        --  to parameterize the initial value expression for each element.
        --  TBD: Allow nested iterators, e.g.:
        --        [for I in 1..10 => for J in 1..10 => I + J]
        --      In such nested iterators, unless there is a "<|=" operator,
        --      number of keys must match number of "index" parameters in
        --      "var_indexing" operator.  If only the last iterator
        --      has an explicit key specified, then that is treated as
        --      the single index into "var_indexing."
      declare
        Value : Optional_Tree :=
yy.value_stack (yy.tos).Tree;
        use type PSC.Strings.U_String;
      begin
        if Not_Null (
yy.value_stack (yy.tos-2).Tree) then
           --  User has specified a key for the element
           Value := Reference.Make (
             Key =>
yy.value_stack (yy.tos-2).Tree,
             Referent => Value);
        end if;

        if
yy.value_stack (yy.tos-3).Str /= PSC.Strings.Null_U_String then
            --  Record "forward" or "reverse" ("forward" is the default)
            Iterator.Add_Direction (
yy.value_stack (yy.tos-5).Tree,
yy.value_stack (yy.tos-3).Str);
        end if;


yyval := (One_Tree, For_Loop_Construct.Make (
          Source_Pos =>
yy.value_stack (yy.tos-6).Source_Pos,
          Kind => For_Loop_Construct.Container_Comprehension,
          Iterators => Lists.Make ((1 =>
yy.value_stack (yy.tos-5).Tree)),
          Filter =>
yy.value_stack (yy.tos-4).List,
          Loop_Body => Value));
        Set_Source_Pos (
yyval.Tree, Source_Pos =>
yy.value_stack (yy.tos-6).Source_Pos);
      end;


when  710 =>
--#line  4680


yyval := (One_Tree, Null_Optional_Tree);


when  711 =>
--#line  4684


yyval :=
yy.value_stack (yy.tos);


when  712 =>
--#line  4690

yyval :=
yy.value_stack (yy.tos);

when  713 =>
--#line  4691

yyval :=
yy.value_stack (yy.tos);

when  714 =>
--#line  4697


yyval := (One_Tree, Conditional.Make (Kind => Conditional.If_Expr,
          Source_Pos =>
yy.value_stack (yy.tos-4).Source_Pos,
          Cond =>
yy.value_stack (yy.tos-3).Tree,
          Then_Part =>
yy.value_stack (yy.tos-1).Tree,
          Else_Part =>
yy.value_stack (yy.tos).Tree));
        Set_Source_Pos (
yyval.Tree, Source_Pos =>
yy.value_stack (yy.tos-4).Source_Pos);


when  715 =>
--#line  4709


yyval := (One_Tree, Conditional.Make (Kind => Conditional.Elsif_Expr,
          Source_Pos =>
yy.value_stack (yy.tos-4).Source_Pos,
          Cond =>
yy.value_stack (yy.tos-3).Tree,
          Then_Part =>
yy.value_stack (yy.tos-1).Tree,
          Else_Part =>
yy.value_stack (yy.tos).Tree));
        Set_Source_Pos (
yyval.Tree, Source_Pos =>
yy.value_stack (yy.tos-4).Source_Pos);


when  716 =>
--#line  4717


yyval :=
yy.value_stack (yy.tos);


when  717 =>
--#line  4720


yyval := (One_Tree, Null_Optional_Tree);


when  718 =>
--#line  4728


yyval := (One_Tree, Case_Construct.Make (
          Source_Pos =>
yy.value_stack (yy.tos-3).Source_Pos,
          Case_Selector =>
yy.value_stack (yy.tos-2).Tree,
          Case_Alt_List =>
yy.value_stack (yy.tos).List,
          Is_Case_Expr => True));
        Set_Source_Pos (
yyval.Tree, Source_Pos =>
yy.value_stack (yy.tos-3).Source_Pos);


when  719 =>
--#line  4739


yyval := (One_List, Lists.Make ((1 =>
yy.value_stack (yy.tos).Tree)));


when  720 =>
--#line  4742


yyval :=
yy.value_stack (yy.tos-2);
        Lists.Append (
yyval.List,
yy.value_stack (yy.tos).Tree);


when  721 =>
--#line  4749


yyval := (One_Tree, Reference.Make (
          Key => Invocation.Make (Invocation.Container_Aggregate,
            Prefix => Null_Optional_Tree,
            Operands => Lists.Make ((1 =>
yy.value_stack (yy.tos-2).Tree))),
          Referent =>
yy.value_stack (yy.tos).Tree));


when  722 =>
--#line  4756

        --  NOTE: "others" alternative must come last

yyval := (One_Tree, Reference.Make (
          Key => Invocation.Make (Invocation.Container_Aggregate,
            Prefix => Null_Optional_Tree,
            Operands => Lists.Make ((1 =>
yy.value_stack (yy.tos-2).Tree))),
          Referent =>
yy.value_stack (yy.tos).Tree));


when  723 =>
--#line  4768

        declare
            Kind_Of_For_Loop: constant array (Boolean) of
              For_Loop_Construct.For_Loop_Kind_Enum := (
                False => For_Loop_Construct.Existential_Quantified_Expr,
                True => For_Loop_Construct.Univ_Quantified_Expr);
        begin

yyval := (One_Tree, For_Loop_Construct.Make (
              Source_Pos =>
yy.value_stack (yy.tos-5).Source_Pos,
              Kind => Kind_Of_For_Loop (
yy.value_stack (yy.tos-4).Is_Present),
              Iterators => Lists.Make ((1 =>
yy.value_stack (yy.tos-3).Tree)),
              Filter =>
yy.value_stack (yy.tos-2).List,
              Loop_Body =>
yy.value_stack (yy.tos).Tree));
            Set_Source_Pos (
yyval.Tree, Source_Pos =>
yy.value_stack (yy.tos-5).Source_Pos);
        end;


when  724 =>
--#line  4785

        --  This is a set iterator without the set, meaning it applies
        --  to all values of the given type, even if the type lacks
        --  a "universal" set.
     declare
        Obj_Type : Optional_Tree :=
yy.value_stack (yy.tos-2).Tree;
     begin
        if Is_Null (Obj_Type) then
           --  Presume id is the type name when not both specified.
           Obj_Type :=
yy.value_stack (yy.tos-3).Tree;
        end if;

        if not
yy.value_stack (yy.tos-4).Is_Present then
           yyerror ("Must specify ""for all [E : ] T"" or " &
             """for all/some E in/of Container"" in quantified expression",
             At_Token =>
yy.value_stack (yy.tos-3));
        end if;


yyval := (One_Tree, For_Loop_Construct.Make (
          Source_Pos =>
yy.value_stack (yy.tos-5).Source_Pos,
          Kind => For_Loop_Construct.Univ_Quantified_Expr,
          Iterators => Lists.Make ((1 =>
            Iterator.Make (
              Kind => Iterator.Set_Iterator,
              Name => PSC.Trees.Identifier.Tree (Tree_Of (
yy.value_stack (yy.tos-3).Tree)),
              Is_Ref => False,
              Obj_Type => Obj_Type,
              Obj_Value => Null_Optional_Tree))),
          Filter => Lists.Empty_List,
          Loop_Body =>
yy.value_stack (yy.tos).Tree));
        Set_Source_Pos (
yyval.Tree, Source_Pos =>
yy.value_stack (yy.tos-5).Source_Pos);
     end;


when  725 =>
--#line  4819

        --  This is a set iterator without the set, meaning it applies
        --  to all values of the given type, even if the type lacks
        --  a "universal" set.
     declare
        Obj_Type : Optional_Tree :=
yy.value_stack (yy.tos-3).Tree;
     begin
        if Is_Null (Obj_Type) then
           --  Presume id is the type name when not both specified.
           Obj_Type :=
yy.value_stack (yy.tos-4).Tree;
        end if;

        if not
yy.value_stack (yy.tos-5).Is_Present then
           yyerror ("Must specify ""for all [E :] T"" or " &
             """for all/some E in/of Container"" in quantified expression",
             At_Token =>
yy.value_stack (yy.tos-4));
        end if;


yyval := (One_Tree, For_Loop_Construct.Make (
          Source_Pos =>
yy.value_stack (yy.tos-6).Source_Pos,
          Kind => For_Loop_Construct.Univ_Quantified_Expr,
          Iterators => Lists.Make ((1 =>
            Iterator.Make (
              Kind => Iterator.Set_Iterator,
              Name => PSC.Trees.Identifier.Tree (Tree_Of (
yy.value_stack (yy.tos-4).Tree)),
              Is_Ref => False,
              Obj_Type => Obj_Type,
              Obj_Value => Null_Optional_Tree))),
          Filter =>
yy.value_stack (yy.tos-2).List,
          Loop_Body =>
yy.value_stack (yy.tos).Tree));
        Set_Source_Pos (
yyval.Tree, Source_Pos =>
yy.value_stack (yy.tos-6).Source_Pos);
     end;


when  726 =>
--#line  4855

yyval :=
yy.value_stack (yy.tos);

when  727 =>
--#line  4856

yyval :=
yy.value_stack (yy.tos);

when  728 =>
--#line  4857

yyval :=
yy.value_stack (yy.tos);

when  729 =>
--#line  4861

yyval := (Optional, True);

when  730 =>
--#line  4862

yyval := (Optional, False);

when  731 =>
--#line  4866

yyval :=
yy.value_stack (yy.tos);

when  732 =>
--#line  4867

yyval :=
yy.value_stack (yy.tos);

when  733 =>
--#line  4868

yyval :=
yy.value_stack (yy.tos);

when  734 =>
--#line  4873

        --  This does a map/reduce operation where the initial/next result
        --  is given in <...> and the overall expression represents the
        --  reduction to be performed on each element.
      declare
        use type PSC.Strings.U_String;
      begin
        if
yy.value_stack (yy.tos-2).Str /= PSC.Strings.Null_U_String then
            --  Record "forward" or "reverse" ("unordered" is the default)
            Iterator.Add_Direction (
yy.value_stack (yy.tos-4).Tree,
yy.value_stack (yy.tos-2).Str);
        end if;


yyval := (One_Tree, For_Loop_Construct.Make (
          Source_Pos =>
yy.value_stack (yy.tos-5).Source_Pos,
          Kind => For_Loop_Construct.Map_Reduce_Expr,
          Iterators => Lists.Make ((1 =>
yy.value_stack (yy.tos-4).Tree)),
          Filter =>
yy.value_stack (yy.tos-3).List,
          Loop_Body =>
yy.value_stack (yy.tos).Tree));
        Set_Source_Pos (
yyval.Tree, Source_Pos =>
yy.value_stack (yy.tos-5).Source_Pos);
      end;


when  735 =>
--#line  4897

yyval :=
yy.value_stack (yy.tos);

when  736 =>
--#line  4898

yyval :=
yy.value_stack (yy.tos);

when  737 =>
--#line  4899

yyval :=
yy.value_stack (yy.tos);

                    when others => null;
                end case;


            --  Pop RHS states and goto next state
            yy.tos      := yy.tos - rule_length (yy.rule_id) + 1;
            if yy.tos > yy.stack_size then
                text_io.put_line (" Stack size exceeded on state_stack");
                raise yy_Tokens.syntax_error;
            end if;
            yy.state_stack (yy.tos) := goto_state (yy.state_stack (yy.tos-1) ,
                                 get_lhs_rule (yy.rule_id));

              yy.value_stack (yy.tos) := yyval;

            if yy.debug then
                reduce_debug (yy.rule_id,
                    goto_state (yy.state_stack (yy.tos - 1),
                               get_lhs_rule (yy.rule_id)));
            end if;

        end if;


    end loop;


end yyparse;

end Sparkel_Parser;
