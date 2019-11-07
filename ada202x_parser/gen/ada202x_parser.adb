

with Ada202x_tokens, Ada202x_lex_io, Ada202x_goto, Ada202x_shift_reduce;
with Ada202x_lex, text_io;

use  Ada202x_tokens, Ada202x_lex_io, Ada202x_goto, Ada202x_shift_reduce;
use  Ada202x_lex, text_io;

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

package body Ada202x_Parser is

    use type Param_Decl.Param_Kind;
    use type PSC.Strings.U_String;

    Concurrent_Str : constant PSC.Strings.U_String :=
      PSC.Strings.String_Lookup("concurrent");

    Forward_Str : constant PSC.Strings.U_String :=
      PSC.Strings.String_Lookup("forward");

    Reverse_Str : constant PSC.Strings.U_String :=
      PSC.Strings.String_Lookup("reverse");

    Func_Str : constant PSC.Strings.U_String :=
      PSC.Strings.String_Lookup("func");

    Function_Str : constant PSC.Strings.U_String :=
      PSC.Strings.String_Lookup("function");

    Proc_Str : constant PSC.Strings.U_String :=
      PSC.Strings.String_Lookup("proc");

    Procedure_Str : constant PSC.Strings.U_String :=
      PSC.Strings.String_Lookup("procedure");

    Last_Import_File : PSC.Strings.U_String := PSC.Strings.Null_U_String;
    Last_Import_List : PSC.Trees.Lists.List;

    function List_Or_Empty(S : YYSType) return Lists.List is
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
     At_Token : Ada202x_Tokens.YYSType := (Ada202x_Tokens.Optional,
       Is_Present => False)) is
    begin
	PSC.Messages.Parser_Error(S, Src_Pos => Token_Src_Pos (At_Token));
    end yyerror;

   procedure Parser_Warning (S : String;
     At_Token : Ada202x_Tokens.YYSType := (Ada202x_Tokens.Optional,
       Is_Present => False)) is
    begin
	PSC.Messages.Parser_Warning(S, Src_Pos => Token_Src_Pos (At_Token));
    end Parser_Warning;

    function Name_For_Module(Defining_Name : Optional_Tree) 
      return Optional_Tree is
	-- Return Optional_Name for package, extracting it
	-- from the "name[#label]" construct if necessary.
	Def_Name : Tree'Class renames Tree_Ptr_Of(Defining_Name).all;
    begin
	if Def_Name not in Invocation.Tree'Class then
	    -- No Add-on label
	    return Defining_Name;
	else
	    -- Has an add-on label
	    return Invocation.Tree(Def_Name).Prefix;
	end if;
    end Name_For_Module;

    procedure Check_Id_Match(Starting_Id : Optional_Tree;
      Ending_Id : Optional_Tree) is
      -- Check that starting and ending id's match 
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
                End_Token : constant YYSType(One_Tree) :=
                  (One_Tree, Ending_Id);
            begin
		yyerror("Start and end designators must match",
                  At_Token => End_Token);
            end;
	end if;
    end Check_Id_Match;

    procedure Check_Func_Proc_Match(Op_Decl : Operation.Tree;
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
                   yyerror("Should be ""end func""",
                     At_Token => End_Construct_Token);
                end if;
             when Function_Operation =>
                if End_Construct_Token.End_Construct_Str /= Function_Str then
                   yyerror("Should be ""end function""",
                     At_Token => End_Construct_Token);
                end if;
             when Proc_Operation =>
                if End_Construct_Token.End_Construct_Str /= Proc_Str then
                   yyerror("Should be ""end proc""",
                     At_Token => End_Construct_Token);
                end if;
             when Procedure_Operation =>
                if End_Construct_Token.End_Construct_Str /= Procedure_Str then
                   yyerror("Should be ""end procedure""",
                     At_Token => End_Construct_Token);
                end if;
          end case;
       end if;
    end Check_Func_Proc_Match;

    function Add_On_For_Module(Defining_Name : Optional_Tree)
      return Lists.List is
	-- Return add-on label(s), if any, as a list
	Def_Name : Tree'Class renames Tree_Ptr_Of(Defining_Name).all;
    begin
	if Def_Name not in Invocation.Tree'Class then
	    -- No Add-on label
	    return Lists.Empty_List;
	else
	    -- Has an add-on label
	    return Invocation.Tree(Def_Name).Operands;
	end if;
    end Add_On_For_Module;

    function Conditionally_Complement(Cond : Optional_Tree;
      Complement : Boolean) return Optional_Tree is
	-- Return Tree, optionally surrounded by a "not" operator
    begin
	if Complement then
	    return Unary.Make(
	      Operator => Unary.Not_Op,
	      Operand => Cond);
	else
	    return Cond;
	end if;
    end Conditionally_Complement;

    procedure Check_Stmt_Label(Compound_Stmt : YYSType;
      Start_Label_Token : YYSType) is
	-- Make sure that starting label matches
	-- ending label.
        pragma Assert (Compound_Stmt.Kind = One_Tree);
        Compound_Stmt_OT : constant Optional_Tree := Compound_Stmt.Tree;
    begin
	if Is_Null(Compound_Stmt_OT) then
	    -- Must have already been some error in the compound statement
	    return;
	else
	  declare
	    pragma Assert(Tree_Ptr_Of(Compound_Stmt_OT).all in 
	      PSC.Trees.Compound_Stmt.Tree'Class);
            Compound_Tree : PSC.Trees.Compound_Stmt.Tree'Class renames
	      PSC.Trees.Compound_Stmt.Tree'Class
                (Tree_Ptr_Of(Compound_Stmt_OT).all);
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
	    elsif Is_Null(Start_Label) then
		if Is_Null(End_Label) then
		    -- Both null, that's fine
		    return;
		else
		    yyerror("Missing start label",
                      At_Token => Compound_Stmt);
		end if;
	    elsif Is_Null(End_Label) then
		yyerror("Missing end label",
                  At_Token => Compound_Stmt);
	    else
	      declare
		pragma Assert(
		  Tree_Ptr_Of(Start_Label).all in PSC.Trees.Identifier.Tree);
		pragma Assert(
		  Tree_Ptr_Of(End_Label).all in PSC.Trees.Identifier.Tree);
		use PSC.Strings;
		Start_Label_Id : constant U_String :=
		  PSC.Trees.Identifier.Tree(Tree_Ptr_Of(Start_Label).all).Str;
		End_Label_Id : constant U_String :=
		  PSC.Trees.Identifier.Tree(Tree_Ptr_Of(End_Label).all).Str;
	      begin
		if Start_Label_Id /= End_Label_Id then
		    yyerror("Start label " & 
		      To_String(Start_Label_Id) & 
		      " does not match end label " & 
		      To_String(End_Label_Id),
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

   -- Rename User Defined Packages to Internal Names.
    package yy_goto_tables         renames
      Ada202x_Goto;
    package yy_shift_reduce_tables renames
      Ada202x_Shift_Reduce;
    package yy_tokens              renames
      Ada202x_Tokens;

   use yy_tokens, yy_goto_tables, yy_shift_reduce_tables;

   procedure yyerrok;
   procedure yyclearin;


   package yy is

       -- the size of the value and state stacks
       stack_size : constant Natural := 3000;

       -- subtype rule         is natural;
       subtype parse_state  is natural;
       -- subtype nonterminal  is integer;

       -- encryption constants
       default           : constant := -1;
       first_shift_entry : constant :=  0;
       accept_code       : constant := -3001;
       error_code        : constant := -3000;

       -- stack data used by the parser
       tos                : natural := 0;
       value_stack        : array(0..stack_size) of yy_tokens.yystype;
       state_stack        : array(0..stack_size) of parse_state;

       -- current input symbol and action the parser is on
       action             : integer;
       rule_id            : rule;
       input_symbol       : yy_tokens.token;


       -- error recovery flag
       error_flag : natural := 0;
          -- indicates  3 - (number of valid shifts after an error occurs)

       look_ahead : boolean := true;
       index      : integer;

       -- Is Debugging option on or off
        DEBUG : constant boolean := FALSE;

    end yy;


    function goto_state
      (state : yy.parse_state;
       sym   : nonterminal) return yy.parse_state;

    function parse_action
      (state : yy.parse_state;
       t     : yy_tokens.token) return integer;

    pragma inline(goto_state, parse_action);


    function goto_state(state : yy.parse_state;
                        sym   : nonterminal) return yy.parse_state is
        index : integer;
    begin
        index := goto_offset(state);
        while  integer(goto_matrix(index).nonterm) /= sym loop
            index := index + 1;
        end loop;
        return integer(goto_matrix(index).newstate);
    end goto_state;


    function parse_action(state : yy.parse_state;
                          t     : yy_tokens.token) return integer is
        index      : integer;
        tok_pos    : integer;
        default    : constant integer := -1;
    begin
        tok_pos := yy_tokens.token'pos(t);
        index   := shift_reduce_offset(state);
        while integer(shift_reduce_matrix(index).t) /= tok_pos and then
              integer(shift_reduce_matrix(index).t) /= default
        loop
            index := index + 1;
        end loop;
        return integer(shift_reduce_matrix(index).act);
    end parse_action;

-- error recovery stuff

    procedure handle_error is
      temp_action : integer;
    begin

      if yy.error_flag = 3 then -- no shift yet, clobber input.
      if yy.debug then
          text_io.put_line("Ayacc.YYParse: Error Recovery Clobbers " &
                   yy_tokens.token'image(yy.input_symbol));
      end if;
        if yy.input_symbol = yy_tokens.end_of_input then  -- don't discard,
        if yy.debug then
            text_io.put_line("Ayacc.YYParse: Can't discard END_OF_INPUT, quiting...");
        end if;
        raise yy_tokens.syntax_error;
        end if;

            yy.look_ahead := true;   -- get next token
        return;                  -- and try again...
    end if;

    if yy.error_flag = 0 then -- brand new error
        yyerror("Syntax Error");
    end if;

    yy.error_flag := 3;

    -- find state on stack where error is a valid shift --

    if yy.debug then
        text_io.put_line("Ayacc.YYParse: Looking for state with error as valid shift");
    end if;

    loop
        if yy.debug then
          text_io.put_line("Ayacc.YYParse: Examining State " &
               yy.parse_state'image(yy.state_stack(yy.tos)));
        end if;
        temp_action := parse_action(yy.state_stack(yy.tos), error);

            if temp_action >= yy.first_shift_entry then
                if yy.tos = yy.stack_size then
                    text_io.put_line(" Stack size exceeded on state_stack");
                    raise yy_Tokens.syntax_error;
                end if;
                yy.tos := yy.tos + 1;
                yy.state_stack(yy.tos) := temp_action;
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
            text_io.put_line("Ayacc.YYParse: Error recovery popped entire stack, aborting...");
          end if;
          raise yy_tokens.syntax_error;
        end if;
    end loop;

    if yy.debug then
        text_io.put_line("Ayacc.YYParse: Shifted error token in state " &
              yy.parse_state'image(yy.state_stack(yy.tos)));
    end if;

    end handle_error;

   -- print debugging information for a shift operation
   procedure shift_debug(state_id: yy.parse_state; lexeme: yy_tokens.token) is
   begin
       text_io.put_line("Ayacc.YYParse: Shift "& yy.parse_state'image(state_id)&" on input symbol "&
               yy_tokens.token'image(lexeme) );
   end;

   -- print debugging information for a reduce operation
   procedure reduce_debug(rule_id: rule; state_id: yy.parse_state) is
   begin
       text_io.put_line("Ayacc.YYParse: Reduce by rule "&rule'image(rule_id)&" goto state "&
               yy.parse_state'image(state_id));
   end;

   -- make the parser believe that 3 valid shifts have occured.
   -- used for error recovery.
   procedure yyerrok is
   begin
       yy.error_flag := 0;
   end yyerrok;

   -- called to clear input symbol that caused an error.
   procedure yyclearin is
   begin
       -- yy.input_symbol := yylex;
       yy.look_ahead := true;
   end yyclearin;


begin
    -- initialize by pushing state 0 and getting the first input symbol
    yy.state_stack(yy.tos) := 0;


    loop

        yy.index := shift_reduce_offset(yy.state_stack(yy.tos));
        if integer(shift_reduce_matrix(yy.index).t) = yy.default then
            yy.action := integer(shift_reduce_matrix(yy.index).act);
        else
            if yy.look_ahead then
                yy.look_ahead   := false;

                yy.input_symbol := yylex;
            end if;
            yy.action :=
             parse_action(yy.state_stack(yy.tos), yy.input_symbol);
        end if;


        if yy.action >= yy.first_shift_entry then  -- SHIFT

            if yy.debug then
                shift_debug(yy.action, yy.input_symbol);
            end if;

            -- Enter new state
            if yy.tos = yy.stack_size then
                text_io.put_line(" Stack size exceeded on state_stack");
                raise yy_Tokens.syntax_error;
            end if;
            yy.tos := yy.tos + 1;
            yy.state_stack(yy.tos) := yy.action;
              yy.value_stack(yy.tos) := yylval;

        if yy.error_flag > 0 then  -- indicate a valid shift
            yy.error_flag := yy.error_flag - 1;
        end if;

            -- Advance lookahead
            yy.look_ahead := true;

        elsif yy.action = yy.error_code then       -- ERROR

            handle_error;

        elsif yy.action = yy.accept_code then
            if yy.debug then
                text_io.put_line("Ayacc.YYParse: Accepting Grammar...");
            end if;
            exit;

        else -- Reduce Action

            -- Convert action into a rule
            yy.rule_id  := -1 * yy.action;

            -- Execute User Action
            -- user_action(yy.rule_id);


                case yy.rule_id is

when  3 =>
--#line  274

	Semantics.Add_Top_Level_Tree(
yy.value_stack(yy.tos).Tree, Imports => 
yy.value_stack(yy.tos-1).List);
        if PSC.Syntax.Echo_Input then
           New_Line;
           Dump_Subtree(
yy.value_stack(yy.tos).Tree);
        end if;
    

when  4 =>
--#line  281

	Semantics.Add_Top_Level_Tree(
yy.value_stack(yy.tos).Tree, Imports => 
yy.value_stack(yy.tos-1).List);
        if PSC.Syntax.Echo_Input then
           New_Line;
           Dump_Subtree(
yy.value_stack(yy.tos).Tree);
        end if;
    

when  5 =>
--#line  288

	Semantics.Add_Top_Level_Tree(
yy.value_stack(yy.tos).Tree, Imports => 
yy.value_stack(yy.tos-1).List);
        if PSC.Syntax.Echo_Input then
           New_Line;
           Dump_Subtree(
yy.value_stack(yy.tos).Tree);
        end if;
    

when  6 =>
--#line  295

	Semantics.Add_Top_Level_Tree(
yy.value_stack(yy.tos).Tree, Imports => 
yy.value_stack(yy.tos-1).List);
        if PSC.Syntax.Echo_Input then
           New_Line;
           Dump_Subtree(
yy.value_stack(yy.tos).Tree);
        end if;
    

when  7 =>
--#line  302

	null;
    

when  11 =>
--#line  310

	
yyval := (One_List, Lists.Make((1 => 
yy.value_stack(yy.tos).Tree)));
    

when  12 =>
--#line  313

	
yyval := 
yy.value_stack(yy.tos-2);
	Lists.Append(
yyval.List, 
yy.value_stack(yy.tos).Tree);
    

when  13 =>
--#line  320

        
yyval := (One_Tree, PSC.Trees.Identifier.Make (
yy.value_stack(yy.tos).Str, 
yy.value_stack(yy.tos).Source_Pos)); 
    

when  14 =>
--#line  323

        
yyval := 
yy.value_stack(yy.tos);
    

when  15 =>
--#line  326

	
yyval := (One_Tree, Qualified_Name.Make (  -- TBD: Selection?
	  Prefix => 
yy.value_stack(yy.tos-2).Tree,
	  Id => PSC.Trees.Identifier.Make (
yy.value_stack(yy.tos).Str, 
yy.value_stack(yy.tos).Source_Pos))); 
    

when  16 =>
--#line  333

        if not Lists.Is_Empty (
yy.value_stack(yy.tos).List)
          or else PSC.Syntax.Cur_File /= Last_Import_File then
            --  We have a new non-empty list of imports, or a new file;
            --  this list overrides any earlier list
            Last_Import_List := 
yy.value_stack(yy.tos).List;
            Last_Import_File := PSC.Syntax.Cur_File;
        end if;
        
yyval := (One_List, Last_Import_List);
    

when  17 =>
--#line  345

        
yyval := (One_List, Lists.Empty_List);
    

when  18 =>
--#line  348

        
yyval := 
yy.value_stack(yy.tos-1);
        Lists.Append (
yyval.List, 
yy.value_stack(yy.tos).List);
    

when  19 =>
--#line  358

        
yyval := 
yy.value_stack(yy.tos-1);
    

when  20 =>
--#line  371

	
yyval := 
yy.value_stack(yy.tos);
	declare
	    Mod_Tree : Module.Tree renames 
	      Module.Tree(Tree_Ptr_Of(
yyval.Tree).all);
	begin
	    Mod_Tree.Has_Formals := True;
	    Mod_Tree.Module_Formals := 
yy.value_stack(yy.tos-1).List;
	end;
    

when  21 =>
--#line  383

        
yyval := 
yy.value_stack(yy.tos-1); --  TBD
    

when  22 =>
--#line  389

        
yyval := (One_List, Lists.Empty_List);
    

when  23 =>
--#line  392

        
yyval := 
yy.value_stack(yy.tos);
    

when  24 =>
--#line  397

        
yyval := 
yy.value_stack(yy.tos-1);
    

when  25 =>
--#line  400

        
yyval := 
yy.value_stack(yy.tos-2);
        Lists.Append (
yyval.List, 
yy.value_stack(yy.tos-1).List);
    

when  26 =>
--#line  407

        
yyval := (One_List, Lists.Make ((1 => 
yy.value_stack(yy.tos).Tree)));
    

when  27 =>
--#line  410

        
yyval := 
yy.value_stack(yy.tos);
    

when  28 =>
--#line  416

	
yyval := (One_Tree, Type_Decl.Make(
	  Name => 
yy.value_stack(yy.tos-3).Tree,
	  Is_New_Type => False,  --  Note, not really a "new" type
	  Type_Definition => 
yy.value_stack(yy.tos).Tree));
    

when  29 =>
--#line  422

        yyerror ("""new"" required", At_Token => 
yy.value_stack(yy.tos));
	
yyval := (One_Tree, Type_Decl.Make(
	  Name => 
yy.value_stack(yy.tos-3).Tree,
	  Is_New_Type => False,  --  Note, not really a "new" type
	  Type_Definition => 
yy.value_stack(yy.tos).Tree));
    

when  30 =>
--#line  432

        
yyval := 
yy.value_stack(yy.tos);
    

when  31 =>
--#line  438
 
yyval := 
yy.value_stack(yy.tos); 

when  32 =>
--#line  445

      declare
	Elem_List : Lists.List := 
yy.value_stack(yy.tos-5).List;
      begin
	--  if $1.Is_Private and then $4.Has_Module_Formals then
	--     yyerror("Private pkg_spec may not add package parameters");
	--  end if;
	if not Lists.Is_Empty(
yy.value_stack(yy.tos-4).List) then
	    -- Include the opt_annotation
	    Lists.Append(Elem_List, Annotation.Make(Annotations => 
yy.value_stack(yy.tos-4).List));
	end if;
	
yyval := (One_Tree, Tree => PSC.Trees.Module.Make(
	  Name => Name_For_Module(
yy.value_stack(yy.tos-7).Tree),
	  Add_On_Label => Add_On_For_Module(
yy.value_stack(yy.tos-7).Tree),
	  Is_Interface => True,
	  Is_Abstract => False,
	  Is_Private => 
yy.value_stack(yy.tos-9).Is_Present,
	  Is_Concurrent => False,
          Is_Limited => True,  --  Packages are never assignable
	  Has_Formals => False,
	  Module_Formals => Lists.Empty_List,
	  Extends_Interface => Null_Optional_Tree,
	  Implements_Interfaces => Lists.Empty_List,
	  Class_Locals => Lists.Empty_List,
	  Module_Exports => Elem_List,
	  Module_New_Exports => 
yy.value_stack(yy.tos-3).List,
	  Module_Implements => 
yy.value_stack(yy.tos-2).List));

        if 
yy.value_stack(yy.tos).Check_Label then
            Check_Id_Match(Starting_Id => Name_For_Module(
yy.value_stack(yy.tos-7).Tree),
              Ending_Id => 
yy.value_stack(yy.tos).Label);
        end if;

      end;
    

when  33 =>
--#line  482

	--  if $1.Is_Private and then $4.Has_Module_Formals then
	--     yyerror("Private pkg_spec may not add package parameters");
	--  end if;
	
yyval := (One_Tree, Tree => PSC.Trees.Module.Make(
	  Name => Name_For_Module(
yy.value_stack(yy.tos-5).Tree),
	  Add_On_Label => Add_On_For_Module(
yy.value_stack(yy.tos-5).Tree),
	  Is_Interface => True,
	  Is_Abstract => False,
	  Is_Private => 
yy.value_stack(yy.tos-7).Is_Present,
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

	Check_Id_Match(Starting_Id => Name_For_Module(
yy.value_stack(yy.tos-5).Tree),
	  Ending_Id => 
yy.value_stack(yy.tos-1).Tree);
    

when  34 =>
--#line  510
 
yyval := 
yy.value_stack(yy.tos-1); 

when  35 =>
--#line  514

        --  Instantiate a package, not intended to be used as a type.
	
yyval := (One_Tree, Tree => PSC.Trees.Module.Make(
          Name => 
yy.value_stack(yy.tos-2).Tree,
          Add_On_Label => Lists.Empty_List,
          Is_Interface => True,
          Is_Abstract => False,
          Is_Private => 
yy.value_stack(yy.tos-4).Is_Present,
          Is_Concurrent => False,
          Is_Limited => True,
          Has_Formals => True,
          Treat_As_Type => False,
          Module_Formals => Lists.Empty_List,
          Extends_Interface => 
yy.value_stack(yy.tos).Tree,
          Implements_Interfaces => Lists.Empty_List,
          Class_Locals => Lists.Empty_List,
          Module_Exports => Lists.Empty_List,
          Module_New_Exports => Lists.Empty_List,
          Module_Implements => Lists.Empty_List));
    

when  37 =>
--#line  537

        yyerror ("Syntax error before ""is""", At_Token => 
yy.value_stack(yy.tos-1));
    

when  41 =>
--#line  550

        
yyval := (Optional_End_Token,
                Source_Pos => PSC.Source_Positions.Null_Source_Position, 
                End_Construct_Str => PSC.Strings.Null_U_String,
                Check_Label => False,
                others => Null_Optional_Tree);
    

when  42 =>
--#line  557

        
yyval := (Optional_End_Token,
                Source_Pos => 
yy.value_stack(yy.tos-3).Source_Pos,
                End_Construct_Str => 
yy.value_stack(yy.tos-2).Str, Check_Label => True,
                Label => 
yy.value_stack(yy.tos-1).Tree, others => Null_Optional_Tree);
    

when  44 =>
--#line  567
 
yyval := 
yy.value_stack(yy.tos); 

when  45 =>
--#line  568
 
	
yyval := (One_Token, 
	  PSC.Source_Positions.Null_Source_Position, 
	  PSC.Strings.Null_U_String); 
    

when  46 =>
--#line  576
 
yyval := 
yy.value_stack(yy.tos); 

when  47 =>
--#line  577

	
yyval := (Construct_Qualifier,
               Source_Pos => PSC.Source_Positions.Null_Source_Position,
               others => False);
    

when  48 =>
--#line  585
 
yyval := 
yy.value_stack(yy.tos); 

when  49 =>
--#line  586

	
yyval := (Construct_Qualifier, 
          Source_Pos => 
yy.value_stack(yy.tos-1).Source_Pos,
	  Is_Abstract => True, 
	  Is_Concurrent => 
yy.value_stack(yy.tos).Is_Concurrent,
	  others => False);
    

when  50 =>
--#line  593

	
yyval := (Construct_Qualifier, 
          Source_Pos => 
yy.value_stack(yy.tos-1).Source_Pos,
	  Is_Private => True, 
	  Is_Concurrent => 
yy.value_stack(yy.tos).Is_Concurrent,
	  others => False);
    

when  51 =>
--#line  603
 
yyval := 
yy.value_stack(yy.tos); 

when  52 =>
--#line  604
 
	
yyval := (Construct_Qualifier,
               Source_Pos => PSC.Source_Positions.Null_Source_Position,
               others => False);
    

when  53 =>
--#line  611

	
yyval := (Construct_Qualifier, 
               Source_Pos => 
yy.value_stack(yy.tos).Source_Pos,
	       Is_Concurrent => True, others => False);
    

when  54 =>
--#line  618

        
yyval := 
yy.value_stack(yy.tos);
    

when  55 =>
--#line  621
 
yyval := 
yy.value_stack(yy.tos-1); 

when  56 =>
--#line  622
 
yyval := 
yy.value_stack(yy.tos-1); 

when  57 =>
--#line  626
 
yyval := 
yy.value_stack(yy.tos-1); 

when  58 =>
--#line  627
 
yyval := (One_List, Lists.Empty_List); 

when  60 =>
--#line  630

        if Ada202x_Lex.Debug_Indent
          and then Ada202x_Lex.Expecting_Indent
        then
            Text_IO.Put(" [colon with indent off] "); Text_IO.Flush;
        end if;
        Ada202x_Lex.Expecting_Indent := False;
    

when  61 =>
--#line  640
 
yyval := 
yy.value_stack(yy.tos); 

when  62 =>
--#line  641
 
	
yyval := (Optional, Is_Present => False);
    

when  63 =>
--#line  646
 
yyval := 
yy.value_stack(yy.tos); 

when  64 =>
--#line  649
 
yyval := 
yy.value_stack(yy.tos); 

when  65 =>
--#line  650
 
	
yyval := (One_Tree, Invocation.Make(
	  Kind => Invocation.Container_Indexing,
	  Prefix => 
yy.value_stack(yy.tos-1).Tree,
	  Operands => 
yy.value_stack(yy.tos).List));
    

when  66 =>
--#line  659

	
yyval := 
yy.value_stack(yy.tos-1);
    

when  67 =>
--#line  664
 
yyval := 
yy.value_stack(yy.tos); 

when  68 =>
--#line  665

	
yyval := (One_List, Lists.Empty_List);
    

when  69 =>
--#line  670
 
yyval := 
yy.value_stack(yy.tos); 

when  70 =>
--#line  671

	
yyval := 
yy.value_stack(yy.tos-2);
	Lists.Append(
yyval.List, 
yy.value_stack(yy.tos).List);
    

when  71 =>
--#line  678

	Annotation.Add_Annotation(
yy.value_stack(yy.tos-1).Tree, 
yy.value_stack(yy.tos-2).List, Precedes => True);
	Annotation.Add_Annotation(
yy.value_stack(yy.tos-1).Tree, 
yy.value_stack(yy.tos).List);
	
yyval := (One_List, Lists.Make((1 => 
yy.value_stack(yy.tos-1).Tree)));
    

when  72 =>
--#line  687

	
yyval := 
yy.value_stack(yy.tos-1);
	if not Lists.Is_Empty(
yy.value_stack(yy.tos-2).List) then
	    -- Add annotation to first element
	    Annotation.Add_Annotation(
	      Lists.Nth_Element(
yyval.List, 1), 
yy.value_stack(yy.tos-2).List, Precedes => True);
	end if;

	if not Lists.Is_Empty(
yy.value_stack(yy.tos).List) then
	    -- Add annotation to last element
	    Annotation.Add_Annotation(
	      Lists.Nth_Element(
yyval.List, Lists.Length(
yyval.List)), 
yy.value_stack(yy.tos).List);
	end if;
    

when  73 =>
--#line  704
 
yyval := 
yy.value_stack(yy.tos); 

when  74 =>
--#line  705

	
yyval := (One_List, Lists.Empty_List);
    

when  75 =>
--#line  711
 
yyval := 
yy.value_stack(yy.tos); 

when  76 =>
--#line  712

	
yyval := (One_List, Lists.Empty_List);
    

when  77 =>
--#line  718

	
yyval := (One_Tree, Type_Decl.Make(
	  Name => 
yy.value_stack(yy.tos-2).Tree,
	  Is_New_Type => False,
	  Type_Definition => 
yy.value_stack(yy.tos).Tree));
    

when  78 =>
--#line  724
 
	
yyval := (One_Tree, Type_Decl.Make(
	  Name => Null_Optional_Tree,
	  Is_New_Type => False,
	  Type_Definition => 
yy.value_stack(yy.tos).Tree));
    

when  79 =>
--#line  732

        if Ada202x_Lex.Debug_Indent
          and then Ada202x_Lex.Expecting_Indent
        then
            Text_IO.Put(" [is with indent off] "); Text_IO.Flush;
        end if;
        Ada202x_Lex.Expecting_Indent := False;
    

when  80 =>
--#line  773
 
yyval := 
yy.value_stack(yy.tos); 

when  81 =>
--#line  774
 
yyval := (One_Tree, Null_Optional_Tree); 

when  82 =>
--#line  780

	-- "simple_expression" to avoid use of '>'
	
yyval := (One_List, Lists.Empty_List);
	for I in 1..Lists.Length(
yy.value_stack(yy.tos-4).List) loop
	    Lists.Append(
yyval.List, Param_Decl.Make(
	      Name => Lists.Nth_Element(
yy.value_stack(yy.tos-4).List, I),
	      Kind => Param_Decl.Default_Param,
	      Locking => Param_Decl.Not_Locked,
	      Is_Optional => 
yy.value_stack(yy.tos-2).Is_Optional,
	      Param_Type => 
yy.value_stack(yy.tos-1).Tree,
	      Param_Default => 
yy.value_stack(yy.tos).Tree));
	end loop;
    

when  83 =>
--#line  795

	-- "simple_expression" to avoid use of '>'
	
yyval := (One_List, Lists.Empty_List);
	for I in 1..Lists.Length(
yy.value_stack(yy.tos-4).List) loop
	    Lists.Append(
yyval.List, Param_Decl.Make(
	      Name => Lists.Nth_Element(
yy.value_stack(yy.tos-4).List, I),
	      Kind => 
yy.value_stack(yy.tos-5).Param_Kind,
	      Locking => Param_Decl.Not_Locked,
	      Is_Optional => 
yy.value_stack(yy.tos-2).Is_Optional,
	      Param_Type => 
yy.value_stack(yy.tos-1).Tree,
	      Param_Default => 
yy.value_stack(yy.tos).Tree));
	end loop;
    

when  84 =>
--#line  809
 
	
yyval := (One_List, Lists.Make((1 => Param_Decl.Make(
	  Name => Null_Optional_Tree,
	  Kind => 
yy.value_stack(yy.tos-1).Param_Kind,
	  Locking => Param_Decl.Not_Locked,
	  Is_Optional => False,
	  Param_Type => 
yy.value_stack(yy.tos).Tree,
	  Param_Default => Null_Optional_Tree))));
    

when  85 =>
--#line  820
 
yyval := 
yy.value_stack(yy.tos); 

when  86 =>
--#line  823
 
yyval := 
yy.value_stack(yy.tos); 

when  87 =>
--#line  824
 
yyval := (One_Tree, Null_Optional_Tree); 

when  88 =>
--#line  828

	
yyval := (One_Tree, PSC.Trees.Identifier.Make(
yy.value_stack(yy.tos).Str, 
yy.value_stack(yy.tos).Source_Pos));
    

when  89 =>
--#line  837

	
yyval := (One_List, Lists.Make((1 => 
yy.value_stack(yy.tos).Tree)));
    

when  90 =>
--#line  840

	
yyval := 
yy.value_stack(yy.tos-2);
	Lists.Append(
yyval.List, 
yy.value_stack(yy.tos).Tree);
    

when  91 =>
--#line  847
 
yyval := 
yy.value_stack(yy.tos); 

when  92 =>
--#line  848
 
yyval := 
yy.value_stack(yy.tos); 

when  93 =>
--#line  851

	
yyval := (One_Tree, Qualifier.Qualify(
	    Qualifiers => (Qualifier.Is_Polymorphic => True, others => False),
	    Operand => 
yy.value_stack(yy.tos-1).Tree));
    

when  94 =>
--#line  858
 
	
yyval := 
yy.value_stack(yy.tos);
    

when  95 =>
--#line  861

	
yyval := (One_Tree, Selection.Make(
	  Prefix => 
yy.value_stack(yy.tos-2).Tree,
	  Selector => 
yy.value_stack(yy.tos).Tree));
    

when  96 =>
--#line  866

	
yyval := (One_Tree, Qualified_Name.Make(
	  Prefix => 
yy.value_stack(yy.tos-2).Tree,
	  Id => 
yy.value_stack(yy.tos).Tree));
    

when  97 =>
--#line  874
 
yyval := 
yy.value_stack(yy.tos); 

when  98 =>
--#line  875
 
yyval := 
yy.value_stack(yy.tos); 

when  99 =>
--#line  878

        -- String_Literal can be used as a "name" when it is an operator
	
yyval := (One_Tree, PSC.Trees.Identifier.Make(
yy.value_stack(yy.tos).Str, 
yy.value_stack(yy.tos).Source_Pos)); 
    

when  100 =>
--#line  885

	
yyval := (One_Tree, Invocation.Make(
	  Kind => Invocation.Module_Instantiation,
	  Prefix => 
yy.value_stack(yy.tos-3).Tree,
	  Operands => 
yy.value_stack(yy.tos-1).List));
    

when  101 =>
--#line  891

	-- Include extension label in package name
	
yyval := (One_Tree, Invocation.Make(
	  Kind => Invocation.Module_Instantiation,
	  Prefix => 
	    Invocation.Make(
	      Kind => Invocation.Container_Indexing,
	      Prefix => 
yy.value_stack(yy.tos-6).Tree,
	      Operands => 
yy.value_stack(yy.tos-4).List),
	  Operands => 
yy.value_stack(yy.tos-1).List));
    

when  102 =>
--#line  905
 
yyval := 
yy.value_stack(yy.tos); 

when  103 =>
--#line  906
 
	
yyval := (One_List, Lists.Empty_List);
    

when  104 =>
--#line  912
 
yyval := 
yy.value_stack(yy.tos); 

when  105 =>
--#line  913

	
yyval := (One_List, Lists.Empty_List);
    

when  106 =>
--#line  919

	
yyval := (One_List, Lists.Make((1 => 
yy.value_stack(yy.tos).Tree)));
    

when  107 =>
--#line  922

	
yyval := 
yy.value_stack(yy.tos-2);
	Lists.Append(
yyval.List, 
yy.value_stack(yy.tos).Tree);
    

when  108 =>
--#line  929
 
yyval := 
yy.value_stack(yy.tos); 

when  109 =>
--#line  930

	
yyval := (One_Tree, Reference.Make(
	  Key => 
yy.value_stack(yy.tos-2).Tree,
	  Referent => 
yy.value_stack(yy.tos).Tree));
    

when  110 =>
--#line  939
 
	-- polymorphic type name not allowed here
	
yyval := 
yy.value_stack(yy.tos-1);
	Annotation.Add_Annotation(
yyval.Tree, 
yy.value_stack(yy.tos).List);
    

when  111 =>
--#line  944
 
	
yyval := 
yy.value_stack(yy.tos-1);
	Annotation.Add_Annotation(
yyval.Tree, 
yy.value_stack(yy.tos).List);
    

when  112 =>
--#line  948

	-- This is a polymorphic type name, presumably.
	-- We use adding_expression instead of expanded_name
	-- to avoid reduce/reduce conflicts in the grammar.
	
yyval := (One_Tree, Qualifier.Qualify(
	    Qualifiers => (Qualifier.Is_Polymorphic => True, others => False),
	    Operand => 
yy.value_stack(yy.tos-1).Tree));
    

when  113 =>
--#line  956
 
yyval := 
yy.value_stack(yy.tos); 

when  114 =>
--#line  958
 
yyval := 
yy.value_stack(yy.tos); 

when  115 =>
--#line  959
 
yyval := 
yy.value_stack(yy.tos); 

when  116 =>
--#line  963
 
yyval := 
yy.value_stack(yy.tos); 

when  117 =>
--#line  964

	
yyval := 
yy.value_stack(yy.tos-1);
	Annotation.Add_Annotation(
yyval.Tree, 
yy.value_stack(yy.tos).List);
    

when  118 =>
--#line  971
 
yyval := 
yy.value_stack(yy.tos); 

when  119 =>
--#line  972

	
yyval := 
yy.value_stack(yy.tos-1);
	Annotation.Add_Annotation(
yyval.Tree, 
yy.value_stack(yy.tos).List);
    

when  120 =>
--#line  976

        
yyval := 
yy.value_stack(yy.tos);
    

when  121 =>
--#line  982
 
yyval := 
yy.value_stack(yy.tos); 

when  122 =>
--#line  983
 
yyval := 
yy.value_stack(yy.tos); 

when  123 =>
--#line  987
 
	
yyval := 
yy.value_stack(yy.tos);
    

when  124 =>
--#line  990
 
	
yyval := 
yy.value_stack(yy.tos);
    

when  125 =>
--#line  993
 
	
yyval := (One_Tree, Invocation.Add_Extends(
	  Instantiation => 
yy.value_stack(yy.tos-2).Tree, 
	  Extends => 
yy.value_stack(yy.tos).Tree));
    

when  126 =>
--#line  1001
 
	
yyval := (One_Tree, Qualifier.Qualify(
	  Qualifiers => (Is_Optional => 
yy.value_stack(yy.tos-1).Is_Optional,
	    Is_Concurrent => 
yy.value_stack(yy.tos-1).Is_Concurrent,
	    others => False), 
	  Operand => 
yy.value_stack(yy.tos).Tree));
    

when  127 =>
--#line  1008
 
	
yyval := (One_Tree, Qualifier.Qualify(
	  Qualifiers => (Is_Optional => 
yy.value_stack(yy.tos-1).Is_Optional,
	    Is_Concurrent => 
yy.value_stack(yy.tos-1).Is_Concurrent,
	    others => False), 
	  Operand => 
yy.value_stack(yy.tos).Tree));
    

when  128 =>
--#line  1016
 
	
yyval := (One_Tree, Qualifier.Qualify(
	  Qualifiers => (Is_Optional => 
yy.value_stack(yy.tos-3).Is_Optional,
	    Is_Concurrent => 
yy.value_stack(yy.tos-3).Is_Concurrent,
	    others => False), 
	  Operand => Invocation.Add_Extends(
	    Instantiation => 
yy.value_stack(yy.tos-2).Tree, 
	    Extends => 
yy.value_stack(yy.tos).Tree)));
    

when  129 =>
--#line  1028
 
	
yyval := (Construct_Qualifier,
          Source_Pos => 
yy.value_stack(yy.tos-1).Source_Pos,
          Is_Optional => True, 
	  Is_Concurrent => 
yy.value_stack(yy.tos).Is_Present,
	  others => False);
    

when  130 =>
--#line  1035

	
yyval := (Construct_Qualifier, 
               Source_Pos => 
yy.value_stack(yy.tos).Source_Pos,
               Is_Concurrent => True, others => False);
    

when  131 =>
--#line  1043

	
yyval := (Optional, True);
    

when  132 =>
--#line  1046

	
yyval := (Optional, False);
    

when  133 =>
--#line  1052

	
yyval := (One_Tree, Operation.Make(
	  Name => Null_Optional_Tree,
	  Operation_Kind => Operation.Proc_Type_Specifier,
	  Operation_Inputs => 
yy.value_stack(yy.tos).List,
	  Operation_Outputs => Lists.Empty_List,
	  Preconditions => Null_Optional_Tree,
	  Postconditions => Null_Optional_Tree,
	  Is_Abstract => False,
	  Is_Optional => False,
	  Is_Queued => False,
	  Is_Def => False,
	  Statements => Null_Optional_Tree)); 
    

when  134 =>
--#line  1066

	
yyval := (One_Tree, Operation.Make(
	  Name => Null_Optional_Tree,
	  Operation_Kind => Operation.Func_Type_Specifier,
	  Operation_Inputs => 
yy.value_stack(yy.tos-2).List,
	  Operation_Outputs => 
yy.value_stack(yy.tos).List,
	  Preconditions => Null_Optional_Tree,
	  Postconditions => Null_Optional_Tree,
	  Is_Abstract => False,
	  Is_Optional => False,
	  Is_Queued => False,
	  Is_Def => False,
	  Statements => Null_Optional_Tree)); 
    

when  135 =>
--#line  1082
 
yyval := (One_List, Lists.Empty_List); 

when  136 =>
--#line  1083

	if Lists.Is_Empty(
yy.value_stack(yy.tos-1).List) then
	    -- We want to make sure that we return a non-empty list
	    
yyval := (One_List, 
	      Lists.Make((1 => Annotation.Make(Annotations => 
yy.value_stack(yy.tos).List))));
	else
	    
yyval := 
yy.value_stack(yy.tos-1);
	    if not Lists.Is_Empty(
yy.value_stack(yy.tos).List) then
		-- Add annotation to item at end of list
		Annotation.Add_Annotation(
		  Lists.Nth_Element(
yyval.List, Lists.Length(
yyval.List)), 
		  
yy.value_stack(yy.tos).List);
	    end if;
	end if;
    

when  139 =>
--#line  1102

	
yyval := (One_List, Lists.Empty_List);
    

when  140 =>
--#line  1105

	
yyval := 
yy.value_stack(yy.tos-2);
	if not Lists.Is_Empty(
yy.value_stack(yy.tos-1).List) then
	    -- Add annotation to pkg_spec_element
	    Annotation.Add_Annotation(
	      
yy.value_stack(yy.tos).Tree, 
yy.value_stack(yy.tos-1).List, Precedes => True);
	end if;
	Lists.Append(
yyval.List, 
yy.value_stack(yy.tos).Tree);
    

when  141 =>
--#line  1115

	
yyval := 
yy.value_stack(yy.tos-3);
	if not Lists.Is_Empty(
yy.value_stack(yy.tos-2).List) then
	    -- Add annotation to pkg_spec_element
	    Annotation.Add_Annotation(
	      
yy.value_stack(yy.tos-1).Tree, 
yy.value_stack(yy.tos-2).List, Precedes => True);
	end if;
	Lists.Append(
yyval.List, 
yy.value_stack(yy.tos-1).Tree);
    

when  142 =>
--#line  1125

	
yyval := 
yy.value_stack(yy.tos-3);
	if not Lists.Is_Empty(
yy.value_stack(yy.tos-2).List) then
	    -- Add annotation to pkg_spec_element
	    Annotation.Add_Annotation(
	      
yy.value_stack(yy.tos-1).Tree, 
yy.value_stack(yy.tos-2).List, Precedes => True);
	end if;
	Lists.Append(
yyval.List, 
yy.value_stack(yy.tos-1).Tree);
    

when  143 =>
--#line  1138

	
yyval := 
yy.value_stack(yy.tos-2);
    

when  144 =>
--#line  1144
 
yyval := 
yy.value_stack(yy.tos-1); 

when  145 =>
--#line  1145
 
yyval := 
yy.value_stack(yy.tos); 

when  146 =>
--#line  1149
 
yyval := 
yy.value_stack(yy.tos); 

when  147 =>
--#line  1150
 
yyval := 
yy.value_stack(yy.tos); 

when  148 =>
--#line  1151
 
yyval := 
yy.value_stack(yy.tos); 

when  149 =>
--#line  1152
 
yyval := 
yy.value_stack(yy.tos); 

when  150 =>
--#line  1156
 
yyval := 
yy.value_stack(yy.tos); 

when  151 =>
--#line  1157
 
yyval := 
yy.value_stack(yy.tos); 

when  152 =>
--#line  1158
 
yyval := 
yy.value_stack(yy.tos); 

when  153 =>
--#line  1159
 
yyval := 
yy.value_stack(yy.tos); 

when  154 =>
--#line  1163
 
yyval := 
yy.value_stack(yy.tos); 

when  155 =>
--#line  1164

	
yyval := (One_List, Lists.Empty_List);
    

when  156 =>
--#line  1170
 
      declare
	Elem_List : Lists.List := 
yy.value_stack(yy.tos-1).List;
      begin
	if not Lists.Is_Empty(
yy.value_stack(yy.tos).List) then
	    -- Include the opt_annotation
	    Lists.Append(Elem_List, Annotation.Make(Annotations => 
yy.value_stack(yy.tos).List));
	end if;
	
yyval := (One_List, Lists.Make((1 => Implements_Element.Make(
	  For_Interfaces => Lists.Empty_List, 
	  Elements => Elem_List))));
      end;
    

when  159 =>
--#line  1188
 
yyval := 
yy.value_stack(yy.tos); 

when  160 =>
--#line  1189

	
yyval := (One_List, Lists.Empty_List);
    

when  161 =>
--#line  1195
 
      declare
	Elem_List : Lists.List := 
yy.value_stack(yy.tos).List;
      begin
	
yyval := (One_List, Lists.Make((1 => Implements_Element.Make(
	  For_Interfaces => Lists.Empty_List, 
	  Elements => Elem_List))));
      end;
    

when  162 =>
--#line  1207

      
yyval := (One_Tree, Operation.Add_Import_Info(
	Op_Decl => 
yy.value_stack(yy.tos-2).Tree, Import_Info => 
yy.value_stack(yy.tos).List));
    

when  164 =>
--#line  1215

        --  Pop the indent stack
        if Ada202x_Lex.Debug_Indent then
            Text_IO.Put(" [IS: popping top indent] "); Text_IO.Flush;
        end if;
        Ada202x_Lex.Top := Ada202x_Lex.Top - 1;
    

when  165 =>
--#line  1224

	
yyval := (One_Tree, Operation.Add_Op_Equiv(
	  Op_Decl => 
yy.value_stack(yy.tos-2).Tree, Op_Equiv => 
yy.value_stack(yy.tos).Tree));
    

when  166 =>
--#line  1228

	-- Indicate that operation should be found in given type
	
yyval := (One_Tree, Operation.Add_Op_Location(
	  Op_Decl => 
yy.value_stack(yy.tos-3).Tree, Op_Location => 
yy.value_stack(yy.tos).Tree));
    

when  167 =>
--#line  1233

	
yyval := (One_Tree, Operation.Add_Op_Equiv(
	  Op_Decl => 
yy.value_stack(yy.tos-4).Tree, Op_Equiv => 
yy.value_stack(yy.tos-2).Tree));
	
yyval := (One_Tree, Operation.Add_Op_Location(
	  Op_Decl => 
yy.value_stack(yy.tos-4).Tree, Op_Location => 
yy.value_stack(yy.tos).Tree));
    

when  168 =>
--#line  1239

        declare
	    Op_Decl : Operation.Tree := 
	      Operation.Tree(Tree_Of(
yy.value_stack(yy.tos-4).Tree));
	begin
	    Op_Decl.Is_Def := True;
	    Op_Decl.Is_Expression_Function := True;
	    Op_Decl.Statements := Invocation.Make
	      (Kind => Invocation.Class_Aggregate,
	       Prefix => Null_Optional_Tree,
	       Operands => 
yy.value_stack(yy.tos-1).List,
	       Source_Pos => 
yy.value_stack(yy.tos-2).Source_Pos);
	    
yyval := (One_Tree, Optional(Op_Decl));
	end;
    

when  169 =>
--#line  1254

	
yyval := (One_Tree, Operation.Add_Op_Equiv(
	  Op_Decl => 
yy.value_stack(yy.tos-2).Tree, Op_Equiv => 
yy.value_stack(yy.tos).Tree));
        if Ada202x_Lex.Debug_Indent then
            Text_IO.Put(" [IS: popping top indent] "); Text_IO.Flush;
        end if;
        Ada202x_Lex.Top := Ada202x_Lex.Top - 1;  --  Pop the indent stack
    

when  170 =>
--#line  1262

	
yyval := (One_Tree, Operation.Add_Op_Equiv(
	  Op_Decl => 
yy.value_stack(yy.tos-4).Tree, Op_Equiv => 
yy.value_stack(yy.tos-2).Tree));
	
yyval := (One_Tree, Operation.Add_Op_Location(
	  Op_Decl => 
yy.value_stack(yy.tos-4).Tree, Op_Location => 
yy.value_stack(yy.tos).Tree));
        if Ada202x_Lex.Debug_Indent then
            Text_IO.Put(" [IS: popping top indent] "); Text_IO.Flush;
        end if;
        Ada202x_Lex.Top := Ada202x_Lex.Top - 1;  --  Pop the indent stack
    

when  171 =>
--#line  1272

        declare
	    Op_Decl : Operation.Tree := 
	      Operation.Tree(Tree_Of(
yy.value_stack(yy.tos-4).Tree));
	begin
	    Op_Decl.Is_Def := True;
	    Op_Decl.Is_Expression_Function := True;
	    Op_Decl.Statements := Invocation.Make
	      (Kind => Invocation.Class_Aggregate,
	       Prefix => Null_Optional_Tree,
	       Operands => 
yy.value_stack(yy.tos-1).List,
	       Source_Pos => 
yy.value_stack(yy.tos-2).Source_Pos);
	    
yyval := (One_Tree, Optional(Op_Decl));
            if Ada202x_Lex.Debug_Indent then
                Text_IO.Put(" [IS: popping top indent] "); Text_IO.Flush;
            end if;
            Ada202x_Lex.Top := Ada202x_Lex.Top - 1;  --  Pop the indent stack
	end;
    

when  172 =>
--#line  1293
 
yyval := (One_List, Lists.Empty_List); 

when  173 =>
--#line  1294

	if Lists.Is_Empty(
yy.value_stack(yy.tos).List) then
	    -- We want to make sure that we return a non-empty list
	    
yyval := (One_List, Lists.Make((1 => Null_Optional_Tree)));
	else
	    
yyval := 
yy.value_stack(yy.tos);
	end if;
    

when  174 =>
--#line  1306

	
yyval := (Two_Lists, Lists.Empty_List, 
yy.value_stack(yy.tos).List);
    

when  175 =>
--#line  1317

	-- Include annotation at end of locals
      declare
	Locals : Lists.List := 
yy.value_stack(yy.tos-3).List;
      begin
        if not Lists.Is_Empty (
yy.value_stack(yy.tos-2).List) then
            Lists.Append(Locals, Annotation.Make(Annotations => 
yy.value_stack(yy.tos-2).List));
        end if;

	
yyval := (Two_Lists, Locals, 
yy.value_stack(yy.tos).List);
      end;
    

when  176 =>
--#line  1329

	yyerror("Missing ""exports"" keyword");
	
yyval := (Two_Lists, Lists.Empty_List, 
yy.value_stack(yy.tos).List);
    

when  180 =>
--#line  1337

	
yyval := (One_List, Lists.Empty_List);
    

when  181 =>
--#line  1340

	
yyval := 
yy.value_stack(yy.tos-1);
	Lists.Append(
yyval.List, 
yy.value_stack(yy.tos).Tree);
    

when  182 =>
--#line  1347
 
yyval := 
yy.value_stack(yy.tos); 

when  183 =>
--#line  1348
 
yyval := 
yy.value_stack(yy.tos-1); 

when  184 =>
--#line  1349
 
yyval := 
yy.value_stack(yy.tos-1); 

when  185 =>
--#line  1350
 
yyval := 
yy.value_stack(yy.tos); 

when  186 =>
--#line  1353

	
yyval := (One_List, Lists.Empty_List);
    

when  187 =>
--#line  1356

	
yyval := 
yy.value_stack(yy.tos-1);
	Lists.Append(
yyval.List, 
yy.value_stack(yy.tos).Tree);
    

when  188 =>
--#line  1360

	
yyval := 
yy.value_stack(yy.tos-2);
	Lists.Append(
yyval.List, 
yy.value_stack(yy.tos-1).Tree);
    

when  189 =>
--#line  1364

	
yyval := 
yy.value_stack(yy.tos-2);
	Lists.Append(
yyval.List, 
yy.value_stack(yy.tos-1).Tree);
    

when  190 =>
--#line  1368

	yyerror("This kind of declaration not permitted after ""exports""",
          At_Token => 
yy.value_stack(yy.tos));
	
yyval := 
yy.value_stack(yy.tos-1);
	Lists.Append(
yyval.List, 
yy.value_stack(yy.tos).Tree);
    

when  191 =>
--#line  1374

	
yyval := 
yy.value_stack(yy.tos-2);
    

when  192 =>
--#line  1380
 
yyval := 
yy.value_stack(yy.tos); 

when  193 =>
--#line  1381
 
	
yyval := (One_Tree, Annotation.Make(Annotations => 
yy.value_stack(yy.tos).List));
    

when  194 =>
--#line  1384

	
yyval := 
yy.value_stack(yy.tos);
	Annotation.Add_Annotation(
yyval.Tree, 
yy.value_stack(yy.tos-1).List, Precedes => True);
    

when  195 =>
--#line  1391
 
yyval := 
yy.value_stack(yy.tos); 

when  196 =>
--#line  1392
 
yyval := 
yy.value_stack(yy.tos); 

when  197 =>
--#line  1393
 
yyval := 
yy.value_stack(yy.tos); 

when  198 =>
--#line  1402

        -- TBD: allow an annotation after pkg_body_element_list
	
yyval := (One_Tree, PSC.Trees.Module.Make(
	  Name => Name_For_Module(
yy.value_stack(yy.tos-6).Tree),
	  Add_On_Label => Add_On_For_Module(
yy.value_stack(yy.tos-6).Tree),
	  Is_Interface => False,
	  Is_Abstract => False,
	  Is_Private => 
yy.value_stack(yy.tos-9).Is_Present,
	  Is_Concurrent => False,
          Is_Limited => True,  --  Packages are never assignable
	  Has_Formals => False,
	  Module_Formals => Lists.Empty_List,
	  Extends_Interface => Null_Optional_Tree,
	  Implements_Interfaces => Lists.Empty_List,
	  Class_Locals => 
yy.value_stack(yy.tos-4).First_List,
	  Module_Exports => 
yy.value_stack(yy.tos-4).Second_List,
	  Module_New_Exports => 
yy.value_stack(yy.tos-3).List,
	  Module_Implements => 
yy.value_stack(yy.tos-2).List));
	    -- NOTE: Module_Implements is where bodies would go
	    --       if there is some ambiguity between operations that
	    --       are in the "normal" pkg_spec part vs. in the
	    --       "implements" part of the pkg_spec.

        if 
yy.value_stack(yy.tos).Check_Label then
	    Check_Id_Match(Starting_Id => Name_For_Module(
yy.value_stack(yy.tos-6).Tree),
	      Ending_Id => 
yy.value_stack(yy.tos).Label);
        end if;
    

when  199 =>
--#line  1432

        
yyval := (Optional, Is_Present => False); 
    

when  200 =>
--#line  1435

        
yyval := (Optional, Is_Present => True);
    

when  201 =>
--#line  1440
 
yyval := 
yy.value_stack(yy.tos); 

when  202 =>
--#line  1441
 
yyval := 
yy.value_stack(yy.tos); 

when  203 =>
--#line  1442

	
yyval := 
yy.value_stack(yy.tos-1);
	Lists.Append(
yyval.List, 
yy.value_stack(yy.tos).List);
    

when  204 =>
--#line  1449
 
yyval := 
yy.value_stack(yy.tos-1); 

when  205 =>
--#line  1450

	
yyval := 
yy.value_stack(yy.tos-2);
	Lists.Append(
yyval.List, 
yy.value_stack(yy.tos-1).List);
    

when  206 =>
--#line  1456
 
yyval := 
yy.value_stack(yy.tos-1); 

when  207 =>
--#line  1457

	
yyval := 
yy.value_stack(yy.tos-3);
	Lists.Append(
yyval.List, 
yy.value_stack(yy.tos-1).List);
    

when  208 =>
--#line  1464

        
yyval := 
yy.value_stack(yy.tos);
    

when  209 =>
--#line  1467

        --  A labeled annotation list becomes a separate nested annotation
        
yyval := (One_List, Lists.Make
                 ((1 => Annotation.Make
                   (Annotations => 
yy.value_stack(yy.tos).List, Label => 
yy.value_stack(yy.tos-1).Tree))));
    

when  210 =>
--#line  1477

	
yyval := (One_List, Lists.Make((1 => 
yy.value_stack(yy.tos).Tree)));
    

when  211 =>
--#line  1480

	
yyval := 
yy.value_stack(yy.tos-2);
	Lists.Append(
yyval.List, 
yy.value_stack(yy.tos).Tree);
    

when  212 =>
--#line  1484

	
yyval := 
yy.value_stack(yy.tos-2);
    

when  213 =>
--#line  1490
 
yyval := 
yy.value_stack(yy.tos); 

when  214 =>
--#line  1491
 
yyval := 
yy.value_stack(yy.tos); 

when  215 =>
--#line  1492
 
yyval := 
yy.value_stack(yy.tos); 

when  216 =>
--#line  1493
 
yyval := 
yy.value_stack(yy.tos); 

when  217 =>
--#line  1494
 
yyval := 
yy.value_stack(yy.tos); 

when  218 =>
--#line  1495

	-- Nested annotations are intended to represent
	-- "correctness" rather than "safety" concerns,
	-- and as such are *not* required to be provable 
	-- at compile-time, though a warning is expected,
	-- and a debugger breakpoint if running in debug mode.
	
yyval := (One_Tree, Annotation.Make(Annotations => 
yy.value_stack(yy.tos).List));
    

when  219 =>
--#line  1505
 
yyval := 
yy.value_stack(yy.tos); 

when  220 =>
--#line  1508
 
	
yyval := (Construct_Qualifier,
               Source_Pos => 
yy.value_stack(yy.tos).Source_Pos,
               Is_Abstract => True, others => False); 
    

when  221 =>
--#line  1513
 
	
yyval := (Construct_Qualifier,
               Source_Pos => 
yy.value_stack(yy.tos).Source_Pos,
               Is_Optional => True, others => False); 
    

when  222 =>
--#line  1518
 
yyval := (Construct_Qualifier,
             Source_Pos => PSC.Source_Positions.Null_Source_Position,
             others => False); 

when  223 =>
--#line  1524
 
	
yyval := (Construct_Qualifier, 
          Source_Pos => 
yy.value_stack(yy.tos-1).Source_Pos,
	  Is_Abstract => True, Is_Queued => 
yy.value_stack(yy.tos).Is_Present, others => False); 
    

when  224 =>
--#line  1529
 
	
yyval := (Construct_Qualifier, 
          Source_Pos => 
yy.value_stack(yy.tos-1).Source_Pos,
	  Is_Optional => True, Is_Queued => 
yy.value_stack(yy.tos).Is_Present, others => False); 
    

when  225 =>
--#line  1534
 
	
yyval := (Construct_Qualifier, 
          Source_Pos => PSC.Source_Positions.Null_Source_Position,
	  Is_Queued => 
yy.value_stack(yy.tos).Is_Present, others => False); 
    

when  226 =>
--#line  1542

	
yyval := (Optional, Is_Present => True);
    

when  227 =>
--#line  1545

	
yyval := (Optional, Is_Present => False);
    

when  228 =>
--#line  1551
 
	
yyval := 
yy.value_stack(yy.tos);
    

when  229 =>
--#line  1554

	yyerror("Operator designator must be in quotes");
	
yyval := 
yy.value_stack(yy.tos);
    

when  230 =>
--#line  1561

	
yyval := 
yy.value_stack(yy.tos);
	declare
	    Func_Tree : Operation.Tree renames 
	      Operation.Tree(Tree_Ptr_Of(
yyval.Tree).all);
	begin
	    Func_Tree.Is_Abstract := 
yy.value_stack(yy.tos-1).Is_Abstract;
	    Func_Tree.Is_Optional := 
yy.value_stack(yy.tos-1).Is_Optional;
	    Func_Tree.Is_Queued := 
yy.value_stack(yy.tos-1).Is_Queued;
	end;
    

when  231 =>
--#line  1575

	
yyval := (One_Tree, Operation.Make(
	  Name => 
yy.value_stack(yy.tos-2).Tree,
	  Operation_Kind => Operation.Proc_Operation,
	  Operation_Inputs => 
yy.value_stack(yy.tos-1).List,
	  Operation_Outputs => Lists.Empty_List,
	  Preconditions => Null_Optional_Tree,
	  Postconditions => Annotation.Make (
yy.value_stack(yy.tos).List),
	  Is_Abstract => False,
	  Is_Optional => False,
	  Is_Queued => False,
	  Is_Def => False,
	  Statements => Null_Optional_Tree)); 
    

when  232 =>
--#line  1590

	
yyval := (One_Tree, Operation.Make(
	  Name => 
yy.value_stack(yy.tos-5).Tree,
	  Operation_Kind => Operation.Func_Operation,
	  Operation_Inputs => 
yy.value_stack(yy.tos-4).List,
	  Operation_Outputs => 
yy.value_stack(yy.tos-1).List,
	  Preconditions => Annotation.Make (
yy.value_stack(yy.tos-3).List),
	  Postconditions => Annotation.Make (
yy.value_stack(yy.tos).List),
	  Is_Abstract => False,
	  Is_Optional => False,
	  Is_Queued => False,
	  Is_Def => False,
	  Statements => Null_Optional_Tree)); 
    

when  233 =>
--#line  1607

	
yyval := 
yy.value_stack(yy.tos);
    

when  234 =>
--#line  1613
 
	
yyval := (One_List, Lists.Make((1 => 
yy.value_stack(yy.tos).Tree)));
    

when  235 =>
--#line  1616

	
yyval := 
yy.value_stack(yy.tos-1);
    

when  236 =>
--#line  1619

      declare
	Id_List : Lists.List := 
yy.value_stack(yy.tos-3).List;
      begin
	yyerror("Parameter types must be separated by "";""",
          At_Token => 
yy.value_stack(yy.tos-2));
	
yyval := (One_List, Lists.Empty_List);
	Lists.Append(Id_List, 
yy.value_stack(yy.tos-1).Tree);
	for I in 1..Lists.Length(Id_List) loop
	    Lists.Append(
yyval.List, Param_Decl.Make(
	      Name => Null_Optional_Tree,
	      Kind => Param_Decl.Default_Param,
	      Locking => Param_Decl.Not_Locked,
	      Is_Optional => False,
	      Param_Type => Lists.Nth_Element(Id_List, I),
	      Param_Default => Null_Optional_Tree));
	end loop;
      end;
    

when  237 =>
--#line  1638

	yyerror("Ada202x requires at least ""()"" in operation definition");
	
yyval := (One_List, Lists.Empty_List);
    

when  238 =>
--#line  1645
 
yyval := 
yy.value_stack(yy.tos); 

when  239 =>
--#line  1646

        yyerror ("Expecting one ')'", At_Token => 
yy.value_stack(yy.tos));
        
yyval := (One_Token,
	  PSC.Source_Positions.Null_Source_Position, 
	  PSC.Strings.String_Lookup(")")); 
    

when  240 =>
--#line  1656

	
yyval := (One_Tree, Param_Decl.Make(
	  Name => 
yy.value_stack(yy.tos-3).Tree,
	  Kind => 
yy.value_stack(yy.tos-4).Param_Kind,
	  Locking => 
yy.value_stack(yy.tos-4).Param_Locking,
	  Is_Optional => 
yy.value_stack(yy.tos-1).Is_Optional,
	  Param_Type => 
yy.value_stack(yy.tos).Tree,
	  Param_Default => Null_Optional_Tree));
    

when  241 =>
--#line  1665

	
yyval := (One_Tree, Param_Decl.Make(
	  Name => Null_Optional_Tree,
	  Kind => 
yy.value_stack(yy.tos-2).Param_Kind,
	  Locking => 
yy.value_stack(yy.tos-2).Param_Locking,
	  Is_Optional => 
yy.value_stack(yy.tos-1).Is_Optional,
	  Param_Type => 
yy.value_stack(yy.tos).Tree,
	  Param_Default => Null_Optional_Tree));
    

when  242 =>
--#line  1674
 
	
yyval := (One_Tree, Param_Decl.Make(
	  Name => Null_Optional_Tree,
	  Kind => 
yy.value_stack(yy.tos-1).Param_Kind,
	  Locking => Param_Decl.Not_Locked,
	  Is_Optional => False,
	  Param_Type => 
yy.value_stack(yy.tos).Tree,
	  Param_Default => Null_Optional_Tree));
    

when  243 =>
--#line  1686
 
yyval := 
yy.value_stack(yy.tos); 

when  244 =>
--#line  1687

	
yyval := (Param_Mode, 
	  Param_Kind => Param_Decl.Default_Param,
	  Param_Locking => Param_Decl.Not_Locked);
    

when  245 =>
--#line  1695
 
yyval := 
yy.value_stack(yy.tos); 

when  246 =>
--#line  1696
 
yyval := 
yy.value_stack(yy.tos); 

when  247 =>
--#line  1697

	
yyval := (Param_Mode, 
	  Param_Kind => Param_Decl.Default_Param,
	  Param_Locking => Param_Decl.Queued_Param);
    

when  248 =>
--#line  1702

	
yyval := (Param_Mode, 
	  Param_Kind => Param_Decl.Var_Param,
	  Param_Locking => Param_Decl.Queued_Param);
    

when  249 =>
--#line  1707

	
yyval := (Param_Mode, 
	  Param_Kind => 
yy.value_stack(yy.tos).Param_Kind,
	  Param_Locking => Param_Decl.Queued_Param);
    

when  250 =>
--#line  1712

	
yyval := (Param_Mode, 
	  Param_Kind => Param_Decl.Default_Param,
	  Param_Locking => Param_Decl.Locked_Param);
    

when  251 =>
--#line  1717

	
yyval := (Param_Mode, 
	  Param_Kind => Param_Decl.Var_Param,
	  Param_Locking => Param_Decl.Locked_Param);
    

when  252 =>
--#line  1722

	
yyval := (Param_Mode, 
	  Param_Kind => 
yy.value_stack(yy.tos).Param_Kind,
	  Param_Locking => Param_Decl.Locked_Param);
    

when  253 =>
--#line  1727

	
yyval := (Param_Mode, 
	  Param_Kind => Param_Decl.Var_Param,
	  Param_Locking => Param_Decl.Not_Locked);
    

when  254 =>
--#line  1735
 
yyval := 
yy.value_stack(yy.tos); 

when  255 =>
--#line  1736

	
yyval := (Param_Mode, 
	  Param_Kind => Param_Decl.Default_Param,
	  Param_Locking => Param_Decl.Not_Locked);
    

when  256 =>
--#line  1744

	
yyval := (Param_Mode, 
	  Param_Kind => Param_Decl.Ref_Param,
	  Param_Locking => Param_Decl.Not_Locked);
    

when  257 =>
--#line  1749

	
yyval := (Param_Mode, 
	  Param_Kind => Param_Decl.Ref_Const_Param,
	  Param_Locking => Param_Decl.Not_Locked);
    

when  258 =>
--#line  1754

	
yyval := (Param_Mode, 
	  Param_Kind => Param_Decl.Ref_Var_Param,
	  Param_Locking => Param_Decl.Not_Locked);
    

when  259 =>
--#line  1762

	
yyval := (Param_Mode, 
	  Param_Kind => Param_Decl.Global_Param,
	  Param_Locking => Param_Decl.Not_Locked);
    

when  260 =>
--#line  1767

	
yyval := (Param_Mode, 
	  Param_Kind => Param_Decl.Global_Var_Param,
	  Param_Locking => Param_Decl.Not_Locked);
    

when  261 =>
--#line  1775
 
yyval := 
yy.value_stack(yy.tos); 

when  262 =>
--#line  1776

	
yyval := (One_List, Lists.Empty_List);
    

when  263 =>
--#line  1782
 
yyval := 
yy.value_stack(yy.tos); 

when  264 =>
--#line  1783

	
yyval := 
yy.value_stack(yy.tos-2);
	Lists.Append(
yyval.List, 
yy.value_stack(yy.tos).List);
    

when  265 =>
--#line  1790

	if not Lists.Is_Empty(
yy.value_stack(yy.tos).List) then
	    -- Add annotations to last element of list
	    
yyval := 
yy.value_stack(yy.tos-1);
	    Annotation.Add_Annotation(
	      Lists.Nth_Element(
yyval.List, Lists.Length(
yyval.List)), 
yy.value_stack(yy.tos).List);
	else
	    
yyval := 
yy.value_stack(yy.tos-1);
	end if;
    

when  266 =>
--#line  1800

	-- Add annotations to first/last element of list
	
yyval := 
yy.value_stack(yy.tos-1);
	Annotation.Add_Annotation(
	  Lists.Nth_Element(
yyval.List, 1), 
yy.value_stack(yy.tos-2).List, Precedes => True);
	if not Lists.Is_Empty(
yy.value_stack(yy.tos).List) then
	    Annotation.Add_Annotation(
	      Lists.Nth_Element(
yyval.List, Lists.Length(
yyval.List)), 
yy.value_stack(yy.tos).List);
	end if;
    

when  267 =>
--#line  1822

	
yyval := (One_List, Lists.Empty_List);
	for I in 1..Lists.Length(
yy.value_stack(yy.tos-5).List) loop
	    Lists.Append(
yyval.List, Param_Decl.Make(
	      Name => Lists.Nth_Element(
yy.value_stack(yy.tos-5).List, I),
	      Kind => Param_Decl.Default_Param,
	      Locking => Param_Decl.Not_Locked,
	      Is_Optional => 
yy.value_stack(yy.tos-3).Is_Optional,
              In_Region => 
yy.value_stack(yy.tos-1).Tree,
	      Param_Type => 
yy.value_stack(yy.tos-2).Tree,
	      Param_Default => 
yy.value_stack(yy.tos).Tree));
	end loop;
    

when  268 =>
--#line  1837

	
yyval := (One_List, Lists.Empty_List);
	for I in 1..Lists.Length(
yy.value_stack(yy.tos-5).List) loop
	    Lists.Append(
yyval.List, Param_Decl.Make(
	      Name => Lists.Nth_Element(
yy.value_stack(yy.tos-5).List, I),
	      Kind => 
yy.value_stack(yy.tos-6).Param_Kind,
	      Locking => 
yy.value_stack(yy.tos-6).Param_Locking,
	      Is_Optional => 
yy.value_stack(yy.tos-3).Is_Optional,
              In_Region => 
yy.value_stack(yy.tos-1).Tree,
	      Param_Type => 
yy.value_stack(yy.tos-2).Tree,
	      Param_Default => 
yy.value_stack(yy.tos).Tree));
	end loop;
    

when  269 =>
--#line  1850

	
yyval := (One_List, Lists.Make((1 => Param_Decl.Make(
	  Name => Null_Optional_Tree,
	  Kind => Param_Decl.Default_Param,
	  Locking => Param_Decl.Not_Locked,
	  Is_Optional => False,
	  Param_Type => 
yy.value_stack(yy.tos-1).Tree,
	  Param_Default => 
yy.value_stack(yy.tos).Tree))));
    

when  270 =>
--#line  1860

	
yyval := (One_List, Lists.Make((1 => Param_Decl.Make(
	  Name => Null_Optional_Tree,
	  Kind => 
yy.value_stack(yy.tos-3).Param_Kind,
	  Locking => 
yy.value_stack(yy.tos-3).Param_Locking,
	  Is_Optional => 
yy.value_stack(yy.tos-2).Is_Optional,
	  Param_Type => 
yy.value_stack(yy.tos-1).Tree,
	  Param_Default => 
yy.value_stack(yy.tos).Tree))));
    

when  271 =>
--#line  1869

	
yyval := (One_List, Lists.Make((1 => Param_Decl.Make(
	  Name => Null_Optional_Tree,
	  Kind => 
yy.value_stack(yy.tos-2).Param_Kind,
	  Locking => 
yy.value_stack(yy.tos-2).Param_Locking,
	  Is_Optional => False,
	  Param_Type => 
yy.value_stack(yy.tos-1).Tree,
	  Param_Default => 
yy.value_stack(yy.tos).Tree))));
    

when  272 =>
--#line  1879

	
yyval := (One_List, Lists.Make((1 => Param_Decl.Make(
	  Name => Null_Optional_Tree,
	  Kind => Param_Decl.Default_Param,
	  Locking => Param_Decl.Not_Locked,
	  Is_Optional => 
yy.value_stack(yy.tos-2).Is_Optional,
	  Param_Type => 
yy.value_stack(yy.tos-1).Tree,
	  Param_Default => 
yy.value_stack(yy.tos).Tree))));
    

when  273 =>
--#line  1888

	
yyval := 
yy.value_stack(yy.tos-1);
	-- Set Is_Implicit_Module_Param on each parameter
	for I in 1..Lists.Length(
yyval.List) loop
	  declare
	    Param_Decl_Tree : Param_Decl.Tree renames
	      Param_Decl.Tree(Tree_Ptr_Of(Lists.Nth_Element(
yyval.List, I)).all);
	  begin
	    Param_Decl_Tree.Is_Implicit_Module_Param := True;
	  end;
	end loop;
    

when  274 =>
--#line  1903
 
yyval := 
yy.value_stack(yy.tos); 

when  275 =>
--#line  1904

	
yyval := (Construct_Qualifier,
               Source_Pos => PSC.Source_Positions.Null_Source_Position,
               others => False);
    

when  276 =>
--#line  1912
 
yyval := 
yy.value_stack(yy.tos); 

when  277 =>
--#line  1913
 
yyval := 
yy.value_stack(yy.tos); 

when  278 =>
--#line  1917
 
yyval := 
yy.value_stack(yy.tos); 

when  279 =>
--#line  1918

         -- NOTE: Operation can have "type" parameters 
         -- such as "Left_Type is Integer<>"
	
yyval := (One_Tree, Type_Decl.Make(
	  Name => 
yy.value_stack(yy.tos-2).Tree,
	  Is_New_Type => False,
	  Type_Definition => 
yy.value_stack(yy.tos).Tree));
    

when  280 =>
--#line  1926

        
yyval := 
yy.value_stack(yy.tos);
    

when  281 =>
--#line  1932

	
yyval := (Construct_Qualifier,
          Source_Pos => 
yy.value_stack(yy.tos).Source_Pos,
	  Is_Optional => True,
	  others => False);
    

when  282 =>
--#line  1941
 
yyval := 
yy.value_stack(yy.tos); 

when  283 =>
--#line  1942

	
yyval := (Construct_Qualifier,
               Source_Pos => PSC.Source_Positions.Null_Source_Position,
               others => False);
    

when  284 =>
--#line  1950

	
yyval := (Construct_Qualifier,
          Source_Pos => 
yy.value_stack(yy.tos).Source_Pos,
	  Is_Optional => True,
	  others => False);
    

when  285 =>
--#line  1960
 
yyval := (Optional, Is_Present => True); 

when  286 =>
--#line  1961
 
yyval := (Optional, Is_Present => False); 

when  287 =>
--#line  1965

	
yyval := (One_List, Lists.Make((1 => 
yy.value_stack(yy.tos).Tree)));
    

when  288 =>
--#line  1968

	Annotation.Add_Annotation(
yy.value_stack(yy.tos).Tree, 
yy.value_stack(yy.tos-1).List, Precedes => True);
	
yyval := (One_List, Lists.Make((1 => 
yy.value_stack(yy.tos).Tree)));
    

when  289 =>
--#line  1972

	
yyval := 
yy.value_stack(yy.tos-1);
    

when  290 =>
--#line  1975

      declare
	Id_List : Lists.List := 
yy.value_stack(yy.tos-3).List;
      begin
	yyerror("Parameter types must be separated by "";""",
          At_Token => 
yy.value_stack(yy.tos-3));
	
yyval := (One_List, Lists.Empty_List);
	Lists.Append(Id_List, 
yy.value_stack(yy.tos-1).Tree);
	for I in 1..Lists.Length(Id_List) loop
	    Lists.Append(
yyval.List, Param_Decl.Make(
	      Name => Null_Optional_Tree,
	      Kind => Param_Decl.Default_Param,
	      Locking => Param_Decl.Not_Locked,
	      Is_Optional => False,
	      Param_Type => Lists.Nth_Element(Id_List, I),
	      Param_Default => Null_Optional_Tree));
	end loop;
      end;
    

when  291 =>
--#line  1994

      declare
	Id_List : Lists.List := 
yy.value_stack(yy.tos-3).List;
      begin
	yyerror("Parameter types must be separated by "";""",
          At_Token => 
yy.value_stack(yy.tos-2));
	
yyval := (One_List, Lists.Empty_List);
	Lists.Append(Id_List, 
yy.value_stack(yy.tos-1).Tree);
	for I in 1..Lists.Length(Id_List) loop
	    Lists.Append(
yyval.List, Param_Decl.Make(
	      Name => Null_Optional_Tree,
	      Kind => Param_Decl.Default_Param,
	      Locking => Param_Decl.Not_Locked,
	      Is_Optional => False,
	      Param_Type => Lists.Nth_Element(Id_List, I),
	      Param_Default => Null_Optional_Tree));
	end loop;
      end;
    

when  292 =>
--#line  2017

	
yyval := (One_Tree, Param_Decl.Make(
	  Name => 
yy.value_stack(yy.tos-3).Tree,
	  Kind => 
yy.value_stack(yy.tos-4).Param_Kind,
	  Locking => 
yy.value_stack(yy.tos-4).Param_Locking,
	  Is_Optional => 
yy.value_stack(yy.tos-1).Is_Optional,
	  Param_Type => 
yy.value_stack(yy.tos).Tree,
	  Param_Default => Null_Optional_Tree));
    

when  293 =>
--#line  2026

	
yyval := (One_Tree, Param_Decl.Make(
	  Name => Null_Optional_Tree,
	  Kind => 
yy.value_stack(yy.tos-2).Param_Kind,
	  Locking => 
yy.value_stack(yy.tos-2).Param_Locking,
	  Is_Optional => 
yy.value_stack(yy.tos-1).Is_Optional,
	  Param_Type => 
yy.value_stack(yy.tos).Tree,
	  Param_Default => Null_Optional_Tree));
    

when  294 =>
--#line  2035

	
yyval := (One_Tree, Param_Decl.Make(
	  Name => Null_Optional_Tree,
	  Kind => 
yy.value_stack(yy.tos-1).Param_Kind,
	  Locking => 
yy.value_stack(yy.tos-1).Param_Locking,
	  Is_Optional => False,
	  Param_Type => 
yy.value_stack(yy.tos).Tree,
	  Param_Default => Null_Optional_Tree));
    

when  295 =>
--#line  2045

	
yyval := (One_Tree, Param_Decl.Make(
	  Name => 
yy.value_stack(yy.tos-3).Tree,
	  Kind => Param_Decl.Default_Param,
	  Locking => Param_Decl.Not_Locked,
	  Is_Optional => 
yy.value_stack(yy.tos-1).Is_Optional,
	  Param_Type => 
yy.value_stack(yy.tos).Tree,
	  Param_Default => Null_Optional_Tree));
    

when  296 =>
--#line  2054

	
yyval := (One_Tree, Param_Decl.Make(
	  Name => Null_Optional_Tree,
	  Kind => Param_Decl.Default_Param,
	  Locking => Param_Decl.Not_Locked,
	  Is_Optional => 
yy.value_stack(yy.tos-1).Is_Optional,
	  Param_Type => 
yy.value_stack(yy.tos).Tree,
	  Param_Default => Null_Optional_Tree));
    

when  297 =>
--#line  2063

	
yyval := (One_Tree, Param_Decl.Make(
	  Name => Null_Optional_Tree,
	  Kind => Param_Decl.Default_Param,
	  Locking => Param_Decl.Not_Locked,
	  Is_Optional => False,
	  Param_Type => 
yy.value_stack(yy.tos).Tree,
	  Param_Default => Null_Optional_Tree));
    

when  298 =>
--#line  2075

	
yyval := 
yy.value_stack(yy.tos);
    

when  299 =>
--#line  2078

	
yyval := 
yy.value_stack(yy.tos-2);
	Lists.Append(
yyval.List, 
yy.value_stack(yy.tos).List);
    

when  300 =>
--#line  2085

	if not Lists.Is_Empty(
yy.value_stack(yy.tos).List) then
	    -- Add annotations to last element of list
	    
yyval := 
yy.value_stack(yy.tos-1);
	    Annotation.Add_Annotation(
	      Lists.Nth_Element(
yyval.List, Lists.Length(
yyval.List)), 
yy.value_stack(yy.tos).List);
	else
	    
yyval := 
yy.value_stack(yy.tos-1);
	end if;
    

when  301 =>
--#line  2095

	-- Add annotations to first/last element of list
	
yyval := 
yy.value_stack(yy.tos-1);
	if not Lists.Is_Empty(
yy.value_stack(yy.tos-2).List) then
	    Annotation.Add_Annotation(
	      Lists.Nth_Element(
yyval.List, 1), 
yy.value_stack(yy.tos-2).List, Precedes => True);
	end if;
	if not Lists.Is_Empty(
yy.value_stack(yy.tos).List) then
	    Annotation.Add_Annotation(
	      Lists.Nth_Element(
yyval.List, Lists.Length(
yyval.List)), 
yy.value_stack(yy.tos).List);
	end if;
    

when  302 =>
--#line  2111

	
yyval := (One_List, Lists.Empty_List);
	for I in 1..Lists.Length(
yy.value_stack(yy.tos-3).List) loop
	    Lists.Append(
yyval.List, Param_Decl.Make(
	      Name => Lists.Nth_Element(
yy.value_stack(yy.tos-3).List, I),
	      Kind => Param_Decl.Default_Param,
	      Locking => Param_Decl.Not_Locked,
	      Is_Optional => 
yy.value_stack(yy.tos-1).Is_Optional,
	      Param_Type => 
yy.value_stack(yy.tos).Tree,
	      Param_Default => Null_Optional_Tree));
	end loop;
    

when  303 =>
--#line  2125

	
yyval := (One_List, Lists.Empty_List);
	for I in 1..Lists.Length(
yy.value_stack(yy.tos-3).List) loop
	    Lists.Append(
yyval.List, Param_Decl.Make(
	      Name => Lists.Nth_Element(
yy.value_stack(yy.tos-3).List, I),
	      Kind => 
yy.value_stack(yy.tos-4).Param_Kind,
	      Locking => 
yy.value_stack(yy.tos-4).Param_Locking,
	      Is_Optional => 
yy.value_stack(yy.tos-1).Is_Optional,
	      Param_Type => 
yy.value_stack(yy.tos).Tree,
	      Param_Default => Null_Optional_Tree));
	end loop;
    

when  304 =>
--#line  2137

	
yyval := (One_List, Lists.Make((1 => Param_Decl.Make(
	  Name => Null_Optional_Tree,
	  Kind => Param_Decl.Default_Param,
	  Locking => Param_Decl.Not_Locked,
	  Is_Optional => False,
	  Param_Type => 
yy.value_stack(yy.tos).Tree,
	  Param_Default => Null_Optional_Tree))));
    

when  305 =>
--#line  2146

	
yyval := (One_List, Lists.Make((1 => Param_Decl.Make(
	  Name => Null_Optional_Tree,
	  Kind => 
yy.value_stack(yy.tos-2).Param_Kind,
	  Locking => 
yy.value_stack(yy.tos-2).Param_Locking,
	  Is_Optional => 
yy.value_stack(yy.tos-1).Is_Optional,
	  Param_Type => 
yy.value_stack(yy.tos).Tree,
	  Param_Default => Null_Optional_Tree))));
    

when  306 =>
--#line  2155

	
yyval := (One_List, Lists.Make((1 => Param_Decl.Make(
	  Name => Null_Optional_Tree,
	  Kind => 
yy.value_stack(yy.tos-1).Param_Kind,
	  Locking => 
yy.value_stack(yy.tos-1).Param_Locking,
	  Is_Optional => False,
	  Param_Type => 
yy.value_stack(yy.tos).Tree,
	  Param_Default => Null_Optional_Tree))));
    

when  307 =>
--#line  2164

	
yyval := (One_List, Lists.Make((1 => Param_Decl.Make(
	  Name => Null_Optional_Tree,
	  Kind => Param_Decl.Default_Param,
	  Locking => Param_Decl.Not_Locked,
	  Is_Optional => 
yy.value_stack(yy.tos-1).Is_Optional,
	  Param_Type => 
yy.value_stack(yy.tos).Tree,
	  Param_Default => Null_Optional_Tree))));
    

when  308 =>
--#line  2176
 
yyval := 
yy.value_stack(yy.tos); 

when  309 =>
--#line  2177
 
yyval := 
yy.value_stack(yy.tos); 

when  310 =>
--#line  2182

	
yyval := (One_Tree, Obj_Decl.Make(
	  Name => PSC.Trees.Identifier.Tree(Tree_Of(
yy.value_stack(yy.tos-4).Tree)),
	  Is_Var => True,
	  Is_Const => False,
	  Is_Ref => False,
	  Is_Optional => False, -- TBD
	  In_Region => 
yy.value_stack(yy.tos-1).Tree,
	  Obj_Type => 
yy.value_stack(yy.tos-2).Tree,
	  Obj_Value => 
yy.value_stack(yy.tos).Tree));
    

when  311 =>
--#line  2193

        
yyval := 
yy.value_stack(yy.tos);
    

when  312 =>
--#line  2201

	yyerror("Must specify ""var,"" ""const,"" or ""ref""",
          At_Token => 
yy.value_stack(yy.tos-2));
	
yyval := (One_Tree, Obj_Decl.Make(
	  Name => PSC.Trees.Identifier.Tree(Tree_Of(
yy.value_stack(yy.tos-2).Tree)),
	  Is_Var => True,
	  Is_Const => False,
	  Is_Ref => False,
	  Is_Optional => False, -- TBD
	  Obj_Type => 
yy.value_stack(yy.tos-1).Tree,
	  Obj_Value => 
yy.value_stack(yy.tos).Tree));
    

when  313 =>
--#line  2217

	
yyval := (One_Tree, Obj_Decl.Make(
	  Name => PSC.Trees.Identifier.Tree(Tree_Of(
yy.value_stack(yy.tos-4).Tree)),
	  Is_Var => False,
	  Is_Const => True,
	  Is_Ref => False,
	  Is_Optional => False, -- TBD
          In_Region => 
yy.value_stack(yy.tos-1).Tree,
	  Obj_Type => 
yy.value_stack(yy.tos-2).Tree,
	  Obj_Value => 
yy.value_stack(yy.tos).Tree));
    

when  314 =>
--#line  2228

	
yyval := (One_Tree, Obj_Decl.Make(
	  Name => PSC.Trees.Identifier.Tree(Tree_Of(
yy.value_stack(yy.tos-3).Tree)),
	  Is_Var => False,
	  Is_Const => True,
	  Is_Ref => False,
	  Is_Optional => False, -- TBD
          In_Region => 
yy.value_stack(yy.tos-2).Tree,
	  Obj_Type => Null_Optional_Tree,
	  Obj_Value => 
yy.value_stack(yy.tos).Tree));
    

when  315 =>
--#line  2241

	
yyval := (One_Tree, Obj_Decl.Make(
	  Name => PSC.Trees.Identifier.Tree(Tree_Of(
yy.value_stack(yy.tos-3).Tree)),
	  Is_Var => True,
	  Is_Const => False,
	  Is_Ref => True,
	  Is_Optional => False, -- TBD
	  Obj_Type => 
yy.value_stack(yy.tos-1).Tree,
	  Obj_Value => 
yy.value_stack(yy.tos).Tree));
    

when  316 =>
--#line  2253

	
yyval := (One_Tree, Obj_Decl.Make(
	  Name => PSC.Trees.Identifier.Tree(Tree_Of(
yy.value_stack(yy.tos-3).Tree)),
	  Is_Var => False,
	  Is_Const => True,
	  Is_Ref => True,
	  Is_Optional => False, -- TBD
	  Obj_Type => 
yy.value_stack(yy.tos-1).Tree,
	  Obj_Value => 
yy.value_stack(yy.tos).Tree));
    

when  317 =>
--#line  2265

	
yyval := (One_Tree, Obj_Decl.Make(
	  Name => PSC.Trees.Identifier.Tree(Tree_Of(
yy.value_stack(yy.tos-3).Tree)),
	  Is_Var => False,
	  Is_Const => False,
	  Is_Ref => True,
	  Is_Optional => False, -- TBD
	  Obj_Type => 
yy.value_stack(yy.tos-1).Tree,
	  Obj_Value => 
yy.value_stack(yy.tos).Tree));
    

when  318 =>
--#line  2278
 
yyval := 
yy.value_stack(yy.tos); 

when  319 =>
--#line  2279

	
yyval := (One_Tree, Null_Optional_Tree);
    

when  320 =>
--#line  2285
 
yyval := 
yy.value_stack(yy.tos); 

when  321 =>
--#line  2286

	
yyval := (One_Tree, Null_Optional_Tree);
    

when  322 =>
--#line  2292
 
yyval := 
yy.value_stack(yy.tos); 

when  323 =>
--#line  2293

	
yyval := (One_Tree, Null_Optional_Tree);
    

when  324 =>
--#line  2298
 
yyval := 
yy.value_stack(yy.tos-1); 

when  325 =>
--#line  2301

	
yyval := (One_Tree, Obj_Decl.Make(
	  Name => PSC.Trees.Identifier.Tree(Tree_Of(
yy.value_stack(yy.tos-3).Tree)),
	  Is_Var => True,
	  Is_Const => False,
	  Is_Ref => False,
	  Is_Optional => False, -- TBD
	  In_Region => 
yy.value_stack(yy.tos-2).Tree,
	  Obj_Type => Null_Optional_Tree,
	  Obj_Value => 
yy.value_stack(yy.tos).Tree));
    

when  326 =>
--#line  2312

	
yyval := (One_Tree, Obj_Decl.Make(
	  Name => PSC.Trees.Identifier.Tree(Tree_Of(
yy.value_stack(yy.tos-2).Tree)),
	  Is_Var => False,
	  Is_Const => True,
	  Is_Ref => True,
	  Is_Optional => False, -- TBD
	  Obj_Type => Null_Optional_Tree,
	  Obj_Value => 
yy.value_stack(yy.tos).Tree));
    

when  327 =>
--#line  2322

	
yyval := (One_Tree, Obj_Decl.Make(
	  Name => PSC.Trees.Identifier.Tree(Tree_Of(
yy.value_stack(yy.tos-2).Tree)),
	  Is_Var => True,
	  Is_Const => False,
	  Is_Ref => True,
	  Is_Optional => False, -- TBD
	  Obj_Type => Null_Optional_Tree,
	  Obj_Value => 
yy.value_stack(yy.tos).Tree));
    

when  328 =>
--#line  2332

	
yyval := (One_Tree, Obj_Decl.Make(
	  Name => PSC.Trees.Identifier.Tree(Tree_Of(
yy.value_stack(yy.tos-2).Tree)),
	  Is_Var => False,
	  Is_Const => False,
	  Is_Ref => True,
	  Is_Optional => False, -- TBD
	  Obj_Type => Null_Optional_Tree,
	  Obj_Value => 
yy.value_stack(yy.tos).Tree));
    

when  329 =>
--#line  2342

	
yyval := (One_Tree, Obj_Decl.Make(
	  Name => PSC.Trees.Identifier.Tree(Tree_Of(
yy.value_stack(yy.tos-2).Tree)),
	  Is_Var => False,
	  Is_Const => True,
	  Is_Ref => False,
	  Is_Optional => False, -- TBD
	  Is_Move => True,
	  Obj_Type => Null_Optional_Tree,
	  Obj_Value => 
yy.value_stack(yy.tos).Tree));
    

when  330 =>
--#line  2353

	
yyval := (One_Tree, Obj_Decl.Make(
	  Name => PSC.Trees.Identifier.Tree(Tree_Of(
yy.value_stack(yy.tos-2).Tree)),
	  Is_Var => True,
	  Is_Const => False,
	  Is_Ref => False,
	  Is_Optional => False, -- TBD
	  Is_Move => True,
	  Obj_Type => Null_Optional_Tree,
	  Obj_Value => 
yy.value_stack(yy.tos).Tree));
    

when  331 =>
--#line  2366
 
yyval := 
yy.value_stack(yy.tos); 

when  332 =>
--#line  2367
 
yyval := 
yy.value_stack(yy.tos); 

when  333 =>
--#line  2370
 
yyval := 
yy.value_stack(yy.tos); 

when  334 =>
--#line  2373

        
yyval := 
yy.value_stack(yy.tos);
    

when  335 =>
--#line  2377
  -- TBD: discrims, abstract
        declare
           Rec_Mod : Module.Tree
             renames Module.Tree (Tree_Ptr_Of (
yy.value_stack(yy.tos).Tree).all);
        begin
           --  Fill in name and is-abstract
           Rec_Mod.Name := 
yy.value_stack(yy.tos-3).Tree;
           Rec_Mod.Is_Abstract := 
yy.value_stack(yy.tos-1).Is_Abstract;

           --  Now build a type-decl
           
yyval := (One_Tree, Type_Decl.Make(
             Name => 
yy.value_stack(yy.tos-3).Tree,
             Is_New_Type => True,
             Type_Definition => Invocation.Make(
               Kind => Invocation.Module_Instantiation,
               --  NOTE: Private/Record type decl has module as Prefix of inst
               Prefix => 
yy.value_stack(yy.tos).Tree,
               Operands => Lists.Empty_List)));
        end;
    

when  336 =>
--#line  2397
  -- TBD: discrims
	
yyval := (One_Tree, Type_Decl.Make(
	  Name => 
yy.value_stack(yy.tos-2).Tree,
	  Is_New_Type => True,
	  Type_Definition => 
yy.value_stack(yy.tos).Tree));
    

when  337 =>
--#line  2404
  -- TBD: discrims
	
yyval := (One_Tree, Type_Decl.Make(
	  Name => 
yy.value_stack(yy.tos-4).Tree,
	  Is_New_Type => True,
	  Type_Definition => Invocation.Make(
            Kind => Invocation.Module_Instantiation,
            --  NOTE: Private/Record type decl has module as Prefix of inst
            Prefix => Module.Make(
              Name => 
yy.value_stack(yy.tos-4).Tree,
              Add_On_Label => Lists.Empty_List,
              Is_Interface => True,
              Is_Abstract => 
yy.value_stack(yy.tos-2).Is_Abstract,
              Is_Private => True,
              Is_Concurrent => 
yy.value_stack(yy.tos-1).Is_Concurrent,
              Is_Limited => 
yy.value_stack(yy.tos-1).Is_Limited,
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
--#line  2432

        
yyval := (Construct_Qualifier,
          Source_Pos => PSC.Source_Positions.Null_Source_Position,
          others => False);
    

when  339 =>
--#line  2437

        
yyval := (Construct_Qualifier,
          Source_Pos => 
yy.value_stack(yy.tos).Source_Pos,
          Is_Abstract => True,
          others => False);
    

when  340 =>
--#line  2446

        
yyval := (Construct_Qualifier,
          Source_Pos => 
yy.value_stack(yy.tos).Source_Pos,
          Is_Limited => True,
          others => False);
    

when  341 =>
--#line  2452

        
yyval := (Construct_Qualifier,
          Source_Pos => 
yy.value_stack(yy.tos).Source_Pos,
          Is_Concurrent => True,
          others => False);
    

when  342 =>
--#line  2458

        
yyval := (Construct_Qualifier,
          Source_Pos => PSC.Source_Positions.Null_Source_Position,
          others => False);
    

when  343 =>
--#line  2467

        -- TBD: discrims, abstract
	
yyval := (One_Tree, Type_Decl.Make
	  (Name => 
yy.value_stack(yy.tos-4).Tree,
	   Is_New_Type => True,
           Type_Definition => Invocation.Make
            (Kind => Invocation.Module_Instantiation,
             --  NOTE: type decl has module as Prefix of inst
             Prefix => PSC.Trees.Module.Make(
               Name => 
yy.value_stack(yy.tos-4).Tree,
               Add_On_Label => Lists.Empty_List,
               Is_Interface => True,
               Is_Abstract => 
yy.value_stack(yy.tos-2).Is_Abstract,
               Is_Private => False,
               Is_Concurrent => 
yy.value_stack(yy.tos-1).Is_Concurrent,
               Is_Limited => 
yy.value_stack(yy.tos-1).Is_Limited,
               Has_Formals => False,
               Treat_As_Type => True,
               Module_Formals => Lists.Empty_List,
               Extends_Interface => 
yy.value_stack(yy.tos).Tree,
               Implements_Interfaces => Lists.Empty_List,
               Class_Locals => Lists.Empty_List,
               Module_Exports => Lists.Empty_List,
               Module_New_Exports => Lists.Empty_List,
               Module_Implements => Lists.Empty_List),
             Operands => Lists.Empty_List)));
    

when  344 =>
--#line  2495

        -- TBD: discrims, abstract
	
yyval := (One_Tree, Type_Decl.Make
	  (Name => 
yy.value_stack(yy.tos-6).Tree,
	   Is_New_Type => True,
           Type_Definition => Invocation.Make
            (Kind => Invocation.Module_Instantiation,
             --  NOTE: type decl has module as Prefix of inst
             Prefix => PSC.Trees.Module.Make(
               Name => 
yy.value_stack(yy.tos-6).Tree,
               Add_On_Label => Lists.Empty_List,
               Is_Interface => True,
               Is_Abstract => 
yy.value_stack(yy.tos-4).Is_Abstract,
               Is_Private => True,
               Is_Concurrent => 
yy.value_stack(yy.tos-3).Is_Concurrent,
               Is_Limited => 
yy.value_stack(yy.tos-3).Is_Limited,
               Has_Formals => False,
               Treat_As_Type => True,
               Module_Formals => Lists.Empty_List,
               Extends_Interface => 
yy.value_stack(yy.tos-2).Tree,
               Implements_Interfaces => Lists.Empty_List,
               Class_Locals => Lists.Empty_List,
               Module_Exports => Lists.Empty_List,
               Module_New_Exports => Lists.Empty_List,
               Module_Implements => Lists.Empty_List),
             Operands => Lists.Empty_List)));
    

when  345 =>
--#line  2524
  -- TBD: discrims
        declare
           Rec_Mod : Module.Tree
             renames Module.Tree (Tree_Ptr_Of (
yy.value_stack(yy.tos).Tree).all);
        begin
           --  Fill in name and other info
           Rec_Mod.Name := 
yy.value_stack(yy.tos-6).Tree;
           Rec_Mod.Is_Abstract := 
yy.value_stack(yy.tos-4).Is_Abstract;
           Rec_Mod.Is_Limited := 
yy.value_stack(yy.tos-3).is_Limited;
           Rec_Mod.Is_Concurrent := 
yy.value_stack(yy.tos-3).is_Concurrent;
           Rec_Mod.Extends_Interface := 
yy.value_stack(yy.tos-2).Tree;

           --  Now build a type-decl
           
yyval := (One_Tree, Type_Decl.Make(
             Name => 
yy.value_stack(yy.tos-6).Tree,
             Is_New_Type => True,
             Type_Definition => Invocation.Make(
               Kind => Invocation.Module_Instantiation,
               --  NOTE: type decl has module as Prefix of inst
               Prefix => 
yy.value_stack(yy.tos).Tree,
               Operands => Lists.Empty_List)));
        end;
    

when  346 =>
--#line  2550

        --  We use a param-decl for the parent type for uniformity
        
yyval := (One_Tree, Tree => Param_Decl.Make
           (Name => Null_Optional_Tree,
            Kind => Param_Decl.Default_Param,
            Locking => Param_Decl.Not_Locked,
            Is_Optional => False,
            Param_Type => 
yy.value_stack(yy.tos).Tree,
            Param_Default => Null_Optional_Tree));
    

when  347 =>
--#line  2560

        --  We use a param-decl for the parent type for uniformity
        yyerror("""new"" required unless defining a subtype",
           At_Token => 
yy.value_stack(yy.tos));
        
yyval := (One_Tree, Tree => Param_Decl.Make
           (Name => Null_Optional_Tree,
            Kind => Param_Decl.Default_Param,
            Locking => Param_Decl.Not_Locked,
            Is_Optional => False,
            Param_Type => 
yy.value_stack(yy.tos).Tree,
            Param_Default => Null_Optional_Tree));

    

when  348 =>
--#line  2576

	
yyval := (One_Tree, Tree => PSC.Trees.Module.Make(
	  Name => Null_Optional_Tree,
	  Add_On_Label => Lists.Empty_List,
	  Is_Interface => True,
	  Is_Abstract => False,
	  Is_Private => False,
	  Is_Concurrent => 
yy.value_stack(yy.tos-2).Is_Concurrent,
          Is_Limited => 
yy.value_stack(yy.tos-2).Is_Limited,
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
--#line  2598

	
yyval := (One_Tree, Tree => PSC.Trees.Module.Make(
	  Name => Null_Optional_Tree,
	  Add_On_Label => Lists.Empty_List,
	  Is_Interface => True,
	  Is_Abstract => False,
	  Is_Private => False,
	  Is_Concurrent => 
yy.value_stack(yy.tos-5).Is_Concurrent,
          Is_Limited => 
yy.value_stack(yy.tos-5).Is_Limited,
	  Has_Formals => False,
          Treat_As_Type => True,
	  Module_Formals => Lists.Empty_List,
	  Extends_Interface => Null_Optional_Tree,
	  Implements_Interfaces => Lists.Empty_List,
	  Class_Locals => Lists.Empty_List,
	  Module_Exports => 
yy.value_stack(yy.tos-2).List,
	  Module_New_Exports => Lists.Empty_List,
	  Module_Implements => Lists.Empty_List));
    

when  350 =>
--#line  2620

        
yyval := (One_List, Lists.Make ((1 => 
yy.value_stack(yy.tos-1).Tree)));
    

when  351 =>
--#line  2623

        
yyval := 
yy.value_stack(yy.tos-2);
        Lists.Append (
yyval.List, 
yy.value_stack(yy.tos-1).Tree);
    

when  352 =>
--#line  2630

        
yyval := 
yy.value_stack(yy.tos);
    

when  353 =>
--#line  2634

	
yyval := (One_Tree, Obj_Decl.Make(
	  Name => PSC.Trees.Identifier.Tree(Tree_Of(
yy.value_stack(yy.tos-4).Tree)),
	  Is_Var => True,
	  Is_Const => False,
	  Is_Ref => False,
	  Is_Optional => False, -- TBD
	  In_Region => 
yy.value_stack(yy.tos-1).Tree,
	  Obj_Type => 
yy.value_stack(yy.tos-2).Tree,
	  Obj_Value => 
yy.value_stack(yy.tos).Tree));
    

when  354 =>
--#line  2649

        
yyval := (Optional_End_Token, 
                Source_Pos => PSC.Source_Positions.Null_Source_Position, 
                End_Construct_Str => PSC.Strings.Null_U_String,
                Check_Label => False,
                others => Null_Optional_Tree);
    

when  355 =>
--#line  2656

        
yyval := (Optional_End_Token, 
                Source_Pos => 
yy.value_stack(yy.tos-2).Source_Pos,
                End_Construct_Str => 
yy.value_stack(yy.tos-1).Str,
                Check_Label => Not_Null (
yy.value_stack(yy.tos).Tree),
                Label => 
yy.value_stack(yy.tos).Tree, others => Null_Optional_Tree);
    

when  356 =>
--#line  2665
 
yyval := 
yy.value_stack(yy.tos); 

when  357 =>
--#line  2666

	yyerror("Should be ""end record [id]"" rather than ""end [id]""");
	
yyval := (One_Token, 
	  PSC.Source_Positions.Null_Source_Position, 
	  PSC.Strings.Null_U_String); 
    

when  358 =>
--#line  2675

	
yyval := (One_Tree, Type_Decl.Make(
	  Name => 
yy.value_stack(yy.tos-2).Tree,
	  Is_New_Type => False,
	  Type_Definition => 
yy.value_stack(yy.tos).Tree));
    

when  359 =>
--#line  2686

        declare
	    Op_Decl : Operation.Tree := 
	      Operation.Tree(Tree_Of(
yy.value_stack(yy.tos-4).Tree));
	begin
	    Op_Decl.Is_Def := True;
	    Op_Decl.Statements := 
yy.value_stack(yy.tos-2).Tree;
	    
yyval := (One_Tree, Optional(Op_Decl));

            if 
yy.value_stack(yy.tos).Check_Label then
                Check_Id_Match(Starting_Id => Op_Decl.Name,
	          Ending_Id => 
yy.value_stack(yy.tos).Label);
                Check_Func_Proc_Match(Op_Decl, 
yy.value_stack(yy.tos));
            end if;
	end;
    

when  360 =>
--#line  2704

        declare
	    Op_Decl : Operation.Tree := 
	      Operation.Tree(Tree_Of(
yy.value_stack(yy.tos-5).Tree));
	begin
	    Op_Decl.Is_Def := True;
	    Op_Decl.Dequeue_Condition := 
yy.value_stack(yy.tos-3).Tree;
	    Op_Decl.Statements := 
yy.value_stack(yy.tos-2).Tree;
	    
yyval := (One_Tree, Optional(Op_Decl));

            if 
yy.value_stack(yy.tos).Check_Label then
                Check_Id_Match(Starting_Id => Op_Decl.Name,
	          Ending_Id => 
yy.value_stack(yy.tos).Label);
                Check_Func_Proc_Match(Op_Decl, 
yy.value_stack(yy.tos));
            end if;
	end;
    

when  361 =>
--#line  2723

        declare
	    Op_Decl : Operation.Tree := 
	      Operation.Tree(Tree_Of(
yy.value_stack(yy.tos-6).Tree));
	begin
            Parser_Warning ("Statements should be indented",
              At_Token => 
yy.value_stack(yy.tos-4));
	    Op_Decl.Is_Def := True;
	    Op_Decl.Statements := 
yy.value_stack(yy.tos-4).Tree;
	    
yyval := (One_Tree, Optional(Op_Decl));

	    Check_Id_Match(Starting_Id => Op_Decl.Name,
	      Ending_Id => 
yy.value_stack(yy.tos-1).Tree);
	end;
    

when  362 =>
--#line  2740

        declare
	    Op_Decl : Operation.Tree := 
	      Operation.Tree(Tree_Of(
yy.value_stack(yy.tos-7).Tree));
	begin
            Parser_Warning ("Statements should be indented",
              At_Token => 
yy.value_stack(yy.tos-4));
	    Op_Decl.Is_Def := True;
	    Op_Decl.Dequeue_Condition := 
yy.value_stack(yy.tos-5).Tree;
	    Op_Decl.Statements := 
yy.value_stack(yy.tos-4).Tree;
	    
yyval := (One_Tree, Optional(Op_Decl));

	    Check_Id_Match(Starting_Id => Op_Decl.Name,
	      Ending_Id => 
yy.value_stack(yy.tos-1).Tree);
	end;
    

when  363 =>
--#line  2759

        
yyval := 
yy.value_stack(yy.tos);
    

when  364 =>
--#line  2762

        
yyval := 
yy.value_stack(yy.tos);
    

when  365 =>
--#line  2765

	
yyval := (One_Token, 
	  PSC.Source_Positions.Null_Source_Position, 
	  PSC.Strings.Null_U_String); 
    

when  366 =>
--#line  2773
 
yyval := 
yy.value_stack(yy.tos); 

when  367 =>
--#line  2774
 
yyval := (One_Tree, Null_Optional_Tree); 

when  368 =>
--#line  2778
 
yyval := 
yy.value_stack(yy.tos); 

when  369 =>
--#line  2781
 
yyval := 
yy.value_stack(yy.tos-1); 

when  370 =>
--#line  2785

	
yyval := (One_Tree, Conditionally_Complement(
	  
yy.value_stack(yy.tos).Tree,
	  Complement => 
yy.value_stack(yy.tos-2).Is_While));  
	    -- Complement cond if "while" present
	Set_Source_Pos(
yyval.Tree, Source_Pos => 
yy.value_stack(yy.tos-3).Source_Pos);
    

when  371 =>
--#line  2793
 
        --  Pop the indent stack
        if Ada202x_Lex.Debug_Indent then
            Text_IO.Put(" [QUEUED: popping top indent] "); Text_IO.Flush;
        end if;
        Ada202x_Lex.Top := Ada202x_Lex.Top - 1;
    

when  375 =>
--#line  2806

        
yyval := (Optional_End_Token,
                Source_Pos => PSC.Source_Positions.Null_Source_Position, 
                End_Construct_Str => PSC.Strings.Null_U_String,
                Check_Label => False,
                others => Null_Optional_Tree);
    

when  376 =>
--#line  2813

        
yyval := (Optional_End_Token,
                Source_Pos => 
yy.value_stack(yy.tos-3).Source_Pos,
                End_Construct_Str => 
yy.value_stack(yy.tos-2).Str,
                Check_Label => True,
                Label => 
yy.value_stack(yy.tos-1).Tree, others => Null_Optional_Tree);
    

when  377 =>
--#line  2823

	
yyval := 
yy.value_stack(yy.tos-1);
    

when  378 =>
--#line  2828
 
yyval := 
yy.value_stack(yy.tos); 

when  379 =>
--#line  2829
 
yyval := 
yy.value_stack(yy.tos); 

when  380 =>
--#line  2833
 
yyval := 
yy.value_stack(yy.tos); 

when  381 =>
--#line  2834

	
yyval := (One_Tree, Binary.Make(
	  Operator => Binary.Next_Stmt_Op,
	  Left_Operand => 
yy.value_stack(yy.tos-1).Tree,
	  Right_Operand => 
yy.value_stack(yy.tos).Tree));
    

when  382 =>
--#line  2843
 
yyval := 
yy.value_stack(yy.tos); 

when  383 =>
--#line  2844

	
yyval := (One_Tree, Binary.Make(
	  Operator => Binary.Next_Stmt_Op,
	  Left_Operand => 
yy.value_stack(yy.tos-1).Tree,
	  Right_Operand => 
yy.value_stack(yy.tos).Tree));
    

when  384 =>
--#line  2853
 
yyval := 
yy.value_stack(yy.tos); 

when  385 =>
--#line  2854
 
yyval := 
yy.value_stack(yy.tos); 

when  386 =>
--#line  2858
 
yyval := 
yy.value_stack(yy.tos); 

when  387 =>
--#line  2859

	-- "then" forces sequential processing; it has lower precedence
	-- than "||" so declarations preceding "then" are visible to both
	-- sides of the "||".
	
yyval := (One_Tree, Binary.Make(
	  Operator => Binary.Then_Stmt_Op,
	  Left_Operand => 
yy.value_stack(yy.tos-2).Tree,
	  Right_Operand => 
yy.value_stack(yy.tos).Tree,
          Source_Pos => 
yy.value_stack(yy.tos-1).Source_Pos));
    

when  388 =>
--#line  2869

	-- "then" forces sequential processing; it has lower precedence
	-- than "||" so declarations preceding "then" are visible to both
	-- sides of the "||".
	
yyval := (One_Tree, Binary.Make(
	  Operator => Binary.Then_Stmt_Op,
	  Left_Operand => 
yy.value_stack(yy.tos-2).Tree,
	  Right_Operand => 
yy.value_stack(yy.tos).Tree,
          Source_Pos => 
yy.value_stack(yy.tos-1).Source_Pos));
    

when  389 =>
--#line  2880

	-- "begin" is not used in Ada202x; treat like "then" for now
	
yyval := (One_Tree, Binary.Make(
	  Operator => Binary.Then_Stmt_Op,
	  Left_Operand => 
yy.value_stack(yy.tos-2).Tree,
	  Right_Operand => 
yy.value_stack(yy.tos).Tree));
    

when  390 =>
--#line  2887

	-- "begin" is not used in Ada202x
	
yyval := 
yy.value_stack(yy.tos);
    

when  391 =>
--#line  2893

        if Ada202x_Lex.Debug_Indent
          and then Ada202x_Lex.Expecting_Indent
        then
            Text_IO.Put(" [then with indent off] "); Text_IO.Flush;
        end if;
        Ada202x_Lex.Expecting_Indent := False;
        
yyval := 
yy.value_stack(yy.tos);
    

when  392 =>
--#line  2903

        if Ada202x_Lex.Debug_Indent
          and then Ada202x_Lex.Expecting_Indent
        then
            Text_IO.Put(" [record with indent off] "); Text_IO.Flush;
        end if;
        Ada202x_Lex.Expecting_Indent := False;
    

when  393 =>
--#line  2913

        
yyval := 
yy.value_stack(yy.tos);
    

when  394 =>
--#line  2916

        
yyval := 
yy.value_stack(yy.tos-1);
    

when  397 =>
--#line  2922

        if Ada202x_Lex.Debug_Indent
          and then Ada202x_Lex.Expecting_Indent
        then
            Text_IO.Put(" [else with indent off] "); Text_IO.Flush;
        end if;
        Ada202x_Lex.Expecting_Indent := False;
    

when  398 =>
--#line  2931

	yyerror("No need for ""begin"" in Ada202x operation definition");
    

when  399 =>
--#line  2937
 
yyval := 
yy.value_stack(yy.tos); 

when  400 =>
--#line  2938

	-- "then" forces sequential processing; it has lower precedence
	-- than "||" so declarations preceding "then" are visible to both
	-- sides of the "||".
	
yyval := (One_Tree, Binary.Make(
	  Operator => Binary.Then_Stmt_Op,
	  Left_Operand => 
yy.value_stack(yy.tos-2).Tree,
	  Right_Operand => 
yy.value_stack(yy.tos).Tree,
          Source_Pos => 
yy.value_stack(yy.tos-1).Source_Pos));
    

when  401 =>
--#line  2948

	-- "then" forces sequential processing; it has lower precedence
	-- than "||" so declarations preceding "then" are visible to both
	-- sides of the "||".
	
yyval := (One_Tree, Binary.Make(
	  Operator => Binary.Then_Stmt_Op,
	  Left_Operand => 
yy.value_stack(yy.tos-2).Tree,
	  Right_Operand => 
yy.value_stack(yy.tos).Tree));
    

when  402 =>
--#line  2960
 
	
yyval := 
yy.value_stack(yy.tos); 
    

when  403 =>
--#line  2963

	
yyval := (One_Tree, Binary.Make(
	  Operator => Binary.Parallel_Stmt_Op,
	  Left_Operand => 
yy.value_stack(yy.tos-2).Tree,
	  Right_Operand => 
yy.value_stack(yy.tos).Tree,
          Source_Pos => 
yy.value_stack(yy.tos-1).Source_Pos));
    

when  404 =>
--#line  2970

	
yyval := (One_Tree, Binary.Make(
	  Operator => Binary.Parallel_Stmt_Op,
	  Left_Operand => 
yy.value_stack(yy.tos-2).Tree,
	  Right_Operand => 
yy.value_stack(yy.tos).Tree,
          Source_Pos => 
yy.value_stack(yy.tos-1).Source_Pos));
    

when  405 =>
--#line  2979

        
yyval := 
yy.value_stack(yy.tos);
    

when  406 =>
--#line  2982

        
yyval := 
yy.value_stack(yy.tos-1);
    

when  407 =>
--#line  2987
 
	
yyval := 
yy.value_stack(yy.tos); 
    

when  408 =>
--#line  2990

	
yyval := (One_Tree, Binary.Make(
	  Operator => Binary.Parallel_Stmt_Op,
	  Left_Operand => 
yy.value_stack(yy.tos-2).Tree,
	  Right_Operand => 
yy.value_stack(yy.tos).Tree,
          Source_Pos => 
yy.value_stack(yy.tos-1).Source_Pos));
    

when  409 =>
--#line  2997

	
yyval := (One_Tree, Binary.Make(
	  Operator => Binary.Parallel_Stmt_Op,
	  Left_Operand => 
yy.value_stack(yy.tos-2).Tree,
	  Right_Operand => 
yy.value_stack(yy.tos).Tree,
          Source_Pos => 
yy.value_stack(yy.tos-1).Source_Pos));
    

when  410 =>
--#line  3007
 
yyval := 
yy.value_stack(yy.tos); 

when  411 =>
--#line  3008

	
yyval := (One_Tree, Binary.Make(
	  Operator => Binary.Next_Stmt_Op,
	  Left_Operand => 
yy.value_stack(yy.tos-1).Tree,
	  Right_Operand => 
yy.value_stack(yy.tos).Tree));
    

when  412 =>
--#line  3017
 
yyval := 
yy.value_stack(yy.tos); 

when  413 =>
--#line  3018

	
yyval := (One_Tree, Binary.Make(
	  Operator => Binary.Next_Stmt_Op,
	  Left_Operand => 
yy.value_stack(yy.tos-1).Tree,
	  Right_Operand => 
yy.value_stack(yy.tos).Tree));
    

when  414 =>
--#line  3027

        
yyval := 
yy.value_stack(yy.tos);
    

when  415 =>
--#line  3030

        
yyval := 
yy.value_stack(yy.tos);
    

when  416 =>
--#line  3036

        
yyval := 
yy.value_stack(yy.tos-1);
    

when  417 =>
--#line  3042

	
yyval := 
yy.value_stack(yy.tos-1);
	Annotation.Add_Annotation(
yyval.Tree, 
yy.value_stack(yy.tos-2).List, Precedes => True);
	Annotation.Add_Annotation(
yyval.Tree, 
yy.value_stack(yy.tos).List);
    

when  418 =>
--#line  3047

	
yyval := 
yy.value_stack(yy.tos-1);
	Annotation.Add_Annotation(
yyval.Tree, 
yy.value_stack(yy.tos).List);
    

when  419 =>
--#line  3051

	-- An annotation can appear by itself
	
yyval := (One_Tree, Annotation.Make(Annotations => 
yy.value_stack(yy.tos).List));
    

when  420 =>
--#line  3058

            -- NOTE: these already allow trailing annotations
	
yyval := 
yy.value_stack(yy.tos);
	Annotation.Add_Annotation(
yyval.Tree, 
yy.value_stack(yy.tos-1).List, Precedes => True);
    

when  421 =>
--#line  3063

	
yyval := 
yy.value_stack(yy.tos);
	Annotation.Add_Annotation(
yyval.Tree, 
yy.value_stack(yy.tos-1).List, Precedes => True);
    

when  422 =>
--#line  3067
 
yyval := 
yy.value_stack(yy.tos); 

when  423 =>
--#line  3069

	
yyval := 
yy.value_stack(yy.tos);
    

when  424 =>
--#line  3075
 
yyval := 
yy.value_stack(yy.tos-1); 

when  425 =>
--#line  3078
 
yyval := 
yy.value_stack(yy.tos); 

when  426 =>
--#line  3079
 
	if Not_Null(
yy.value_stack(yy.tos).Tree) then
	    -- Stmt might be null if there was an error.
	    Check_Stmt_Label(
	      Compound_Stmt => 
yy.value_stack(yy.tos), Start_Label_Token => 
yy.value_stack(yy.tos-1));
	end if;

	
yyval := 
yy.value_stack(yy.tos);
    

when  427 =>
--#line  3088
 
	if Not_Null(
yy.value_stack(yy.tos).Tree) then
	    -- Stmt might be null if there was an error.
	    Check_Stmt_Label(
	      Compound_Stmt => 
yy.value_stack(yy.tos),
                Start_Label_Token => (Optional, Is_Present => False));
	end if;

	
yyval := 
yy.value_stack(yy.tos); 
    

when  428 =>
--#line  3101

	
yyval := 
yy.value_stack(yy.tos);
    

when  429 =>
--#line  3104

	
yyval := (One_Tree, Assign_Stmt.Make(
	  Assign_Operator => Assign_Stmt.Assign_Op,
	  LHS => 
yy.value_stack(yy.tos-2).Tree,
	  RHS => 
yy.value_stack(yy.tos).Tree));
    

when  430 =>
--#line  3110
 
	-- A "null" statement (i.e. a no-op)
	
yyval := (One_Tree, Control_Stmt.Make(
	  Kind => Control_Stmt.Null_Stmt,
	  Applies_To => Control_Stmt.Operation_Body,
	  Id => Null_Optional_Tree,
	  Values => Null_Optional_Tree,
	  Source_Pos => 
yy.value_stack(yy.tos).Source_Pos));
    

when  431 =>
--#line  3119

	
yyval := (One_Tree, Invocation.Make(
	  Kind => Invocation.Operation_Call,
	  Prefix => 
yy.value_stack(yy.tos-3).Tree,
	  Operands => 
yy.value_stack(yy.tos-1).List));
    

when  432 =>
--#line  3125
 
yyval := 
yy.value_stack(yy.tos); 

when  433 =>
--#line  3126

	
yyval := (One_Tree, Control_Stmt.Make(
	  Kind => Control_Stmt.Continue_Stmt,
	  Applies_To => Control_Stmt.Loop_Stmt,
	  Id => 
yy.value_stack(yy.tos-1).Tree,
	  Values => 
yy.value_stack(yy.tos).Tree,
	  Source_Pos => 
yy.value_stack(yy.tos-3).Source_Pos));
    

when  434 =>
--#line  3134

	
yyval := (One_Tree, Control_Stmt.Make(
	  Kind => Control_Stmt.Exit_Stmt,
	  Applies_To => 
yy.value_stack(yy.tos-2).Exitable_Construct,
	  Id => 
yy.value_stack(yy.tos-1).Tree,
	  Values => 
yy.value_stack(yy.tos).Tree,
	  Source_Pos => 
yy.value_stack(yy.tos-3).Source_Pos));
    

when  435 =>
--#line  3143

	
yyval := (One_Tree, Conditional.Make(Kind => Conditional.If_Stmt,
          Source_Pos => 
yy.value_stack(yy.tos-5).Source_Pos,
	  Cond => 
yy.value_stack(yy.tos).Tree,
	  Then_Part => Control_Stmt.Make(
             Kind => Control_Stmt.Exit_Stmt,
             Applies_To => 
yy.value_stack(yy.tos-4).Exitable_Construct,
             Id => 
yy.value_stack(yy.tos-3).Tree,
             Values => 
yy.value_stack(yy.tos-2).Tree,
             Source_Pos => 
yy.value_stack(yy.tos-5).Source_Pos),
	  Else_Part => Null_Optional_Tree,
	  End_With_Values => Null_Optional_Tree,
	  Check_Label => False,
          Label => Null_Optional_Tree));
    

when  436 =>
--#line  3158

        yyerror ("Extra ')'", At_Token => 
yy.value_stack(yy.tos));
        
yyval := 
yy.value_stack(yy.tos-1);
    

when  437 =>
--#line  3165

        if Ada202x_Lex.Debug_Indent
          and then Ada202x_Lex.Expecting_Indent
        then
            Text_IO.Put(" [loop with indent off] "); Text_IO.Flush;
        end if;
        Ada202x_Lex.Expecting_Indent := False;
        
yyval := 
yy.value_stack(yy.tos);
    

when  438 =>
--#line  3176

	
yyval := (One_Tree, Control_Stmt.Make(
	  Kind => Control_Stmt.Return_Stmt,
	  Applies_To => Control_Stmt.Operation_Body,
	  Id => Null_Optional_Tree,
	  Values => 
yy.value_stack(yy.tos).Tree,
	  Source_Pos => 
yy.value_stack(yy.tos-1).Source_Pos));
    

when  439 =>
--#line  3184

	
yyval := (One_Tree, Control_Stmt.Make(
	  Kind => Control_Stmt.Return_Stmt,
	  Applies_To => Control_Stmt.Operation_Body,
	  Id => Null_Optional_Tree,
	  Values => 
yy.value_stack(yy.tos).Tree,
	  Source_Pos => 
yy.value_stack(yy.tos-1).Source_Pos));
    

when  440 =>
--#line  3195
 
yyval := 
yy.value_stack(yy.tos); 

when  441 =>
--#line  3196

	yyerror("""loop"" required after ""continue""");
	
yyval := (One_Token, 
	  PSC.Source_Positions.Null_Source_Position, 
	  PSC.Strings.Null_U_String); 
    

when  442 =>
--#line  3205

	
yyval := (One_Tree, Assign_Stmt.Make(
	  Assign_Operator => 
yy.value_stack(yy.tos-1).Assign_Op,
	  LHS => 
yy.value_stack(yy.tos-2).Tree,
	  RHS => 
yy.value_stack(yy.tos).Tree));
    

when  443 =>
--#line  3211

	
yyval := (One_Tree, Assign_Stmt.Make(
	  Assign_Operator => Assign_Stmt.Divide_Assign_Op,
	  LHS => 
yy.value_stack(yy.tos-2).Tree,
	  RHS => 
yy.value_stack(yy.tos).Tree));
    

when  444 =>
--#line  3217

	
yyval := (One_Tree, Assign_Stmt.Make(
	  Assign_Operator => Assign_Stmt.Combine_Move_Op,
	  LHS => 
yy.value_stack(yy.tos-2).Tree,
	  RHS => 
yy.value_stack(yy.tos).Tree));
    

when  445 =>
--#line  3223

	
yyval := (One_Tree, Assign_Stmt.Make(
	  Assign_Operator => Assign_Stmt.Move_Op,
	  LHS => 
yy.value_stack(yy.tos-2).Tree,
	  RHS => 
yy.value_stack(yy.tos).Tree));
    

when  446 =>
--#line  3229

	
yyval := (One_Tree, Assign_Stmt.Make(
	  Assign_Operator => Assign_Stmt.Swap_Op,
	  LHS => 
yy.value_stack(yy.tos-2).Tree,
	  RHS => 
yy.value_stack(yy.tos).Tree));
    

when  447 =>
--#line  3235

	-- multiple assignment 
	-- NOTE: Using "opt_operation_actual_list" rather 
	--       than "operation_actual_list" to avoid ambiguity
	
yyval := (One_Tree, Assign_Stmt.Make(
	  Assign_Operator => Assign_Stmt.Assign_Op,
	  LHS => Invocation.Make(
	    Kind => Invocation.Class_Aggregate,
	    Prefix => Null_Optional_Tree,
	    Operands => 
yy.value_stack(yy.tos-3).List,
	    Source_Pos => 
yy.value_stack(yy.tos-4).Source_Pos),
	  RHS => 
yy.value_stack(yy.tos).Tree));
    

when  448 =>
--#line  3248

	
yyval := (One_Tree, Annotation.Make
                 (Annotations => Lists.Make((1 => 
yy.value_stack(yy.tos).Tree))));
    

when  449 =>
--#line  3252

	
yyval := (One_Tree, Annotation.Make
                 (Annotations => Lists.Make((1 => 
yy.value_stack(yy.tos-2).Tree)),
                  Label => 
yy.value_stack(yy.tos).Tree));
    

when  450 =>
--#line  3260
 
yyval := 
yy.value_stack(yy.tos); 

when  451 =>
--#line  3261

	
yyval := (One_List, Lists.Empty_List);
    

when  452 =>
--#line  3267
 
yyval := 
yy.value_stack(yy.tos); 

when  453 =>
--#line  3268

	
yyval := (One_Tree, Null_Optional_Tree);
    

when  454 =>
--#line  3273

	-- NOTE: This used to be '(' operation_actual_list ')'
	--       but that prevented continuing with a single expression.
	
yyval := 
yy.value_stack(yy.tos);
    

when  455 =>
--#line  3280
 
yyval := 
yy.value_stack(yy.tos); 

when  456 =>
--#line  3281

	
yyval := (One_Tree, Null_Optional_Tree);
    

when  457 =>
--#line  3287
 
yyval := 
yy.value_stack(yy.tos); 

when  458 =>
--#line  3288
 
	yyerror(
	  """loop,"" ""if,"" ""case,"" or ""block"" must follow ""exit""");
	
yyval := (Construct_Kind, Control_Stmt.Loop_Stmt);
    

when  459 =>
--#line  3296

	
yyval := (Construct_Kind, Control_Stmt.Loop_Stmt);
    

when  460 =>
--#line  3299

	
yyval := (Construct_Kind, Control_Stmt.If_Stmt);
    

when  461 =>
--#line  3302

	
yyval := (Construct_Kind, Control_Stmt.Case_Stmt);
    

when  462 =>
--#line  3305

	
yyval := (Construct_Kind, Control_Stmt.Block_Stmt);
    

when  463 =>
--#line  3308

	
yyval := (Construct_Kind, Control_Stmt.Block_Stmt); --  TBD: Parallel_Stmt
    

when  464 =>
--#line  3313

        if Ada202x_Lex.Debug_Indent
          and then Ada202x_Lex.Expecting_Indent
        then
            Text_IO.Put(" [block with indent off] "); Text_IO.Flush;
        end if;
        Ada202x_Lex.Expecting_Indent := False;
        
yyval := 
yy.value_stack(yy.tos);
    

when  465 =>
--#line  3323

        if Ada202x_Lex.Debug_Indent
          and then Ada202x_Lex.Expecting_Indent
        then
            Text_IO.Put(" [parallel with indent off] "); Text_IO.Flush;
        end if;
        Ada202x_Lex.Expecting_Indent := False;
        
yyval := 
yy.value_stack(yy.tos);
    

when  466 =>
--#line  3334
 
yyval := 
yy.value_stack(yy.tos); 

when  467 =>
--#line  3335
 
yyval := 
yy.value_stack(yy.tos); 

when  468 =>
--#line  3336
 
yyval := 
yy.value_stack(yy.tos); 

when  469 =>
--#line  3337
 
yyval := 
yy.value_stack(yy.tos); 

when  470 =>
--#line  3341
 
yyval := 
yy.value_stack(yy.tos); 

when  471 =>
--#line  3342
 
yyval := 
yy.value_stack(yy.tos); 

when  472 =>
--#line  3343
 
yyval := 
yy.value_stack(yy.tos-1); 

when  473 =>
--#line  3344
 
yyval := 
yy.value_stack(yy.tos); 

when  474 =>
--#line  3345
 
yyval := 
yy.value_stack(yy.tos); 

when  475 =>
--#line  3348
 
yyval := 
yy.value_stack(yy.tos); 

when  476 =>
--#line  3349
 
yyval := 
yy.value_stack(yy.tos-1); 

when  477 =>
--#line  3350
 
yyval := 
yy.value_stack(yy.tos-1); 

when  478 =>
--#line  3353
 
yyval := 
yy.value_stack(yy.tos-1); 

when  479 =>
--#line  3356
 
yyval := 
yy.value_stack(yy.tos); 

when  480 =>
--#line  3357
 
yyval := 
yy.value_stack(yy.tos); 

when  481 =>
--#line  3358
 
yyval := 
yy.value_stack(yy.tos); 

when  482 =>
--#line  3359
 
yyval := 
yy.value_stack(yy.tos); 

when  483 =>
--#line  3360
 
yyval := 
yy.value_stack(yy.tos); 

when  484 =>
--#line  3361
 
yyval := 
yy.value_stack(yy.tos); 

when  485 =>
--#line  3362
 
yyval := 
yy.value_stack(yy.tos); 

when  486 =>
--#line  3363
 
yyval := (One_Tree, Null_Optional_Tree); 

when  487 =>
--#line  3369

	
yyval := (One_Tree, Conditional.Make(Kind => Conditional.If_Stmt,
          Source_Pos => 
yy.value_stack(yy.tos-5).Source_Pos,
	  Cond => 
yy.value_stack(yy.tos-4).Tree,
	  Then_Part => 
yy.value_stack(yy.tos-2).Tree,
	  Else_Part => 
yy.value_stack(yy.tos-1).Tree,
	  End_With_Values => 
yy.value_stack(yy.tos).End_With_Values,
	  Check_Label => 
yy.value_stack(yy.tos).Check_Label,
          Label => 
yy.value_stack(yy.tos).Label));
    

when  488 =>
--#line  3384

	
yyval := (One_Tree, Conditional.Make(Kind => Conditional.Elsif_Stmt,
          Source_Pos => 
yy.value_stack(yy.tos-4).Source_Pos,
	  Cond => 
yy.value_stack(yy.tos-3).Tree,
	  Then_Part => 
yy.value_stack(yy.tos-1).Tree,
	  Else_Part => 
yy.value_stack(yy.tos).Tree));
    

when  489 =>
--#line  3392

	
yyval := 
yy.value_stack(yy.tos-1);
    

when  490 =>
--#line  3395

	
yyval := (One_Tree, Null_Optional_Tree);
    

when  491 =>
--#line  3400
 
yyval := 
yy.value_stack(yy.tos); 

when  493 =>
--#line  3406

        
yyval := (Optional_End_Token,
                Source_Pos => PSC.Source_Positions.Null_Source_Position, 
                End_Construct_Str => PSC.Strings.Null_U_String,
                Check_Label => False,
                others => Null_Optional_Tree);
    

when  494 =>
--#line  3413

        
yyval := (Optional_End_Token,
                Source_Pos => 
yy.value_stack(yy.tos-4).Source_Pos,
                End_Construct_Str => 
yy.value_stack(yy.tos-3).Str,
                Check_Label => True,
                Label => 
yy.value_stack(yy.tos-2).Tree, End_With_Values => 
yy.value_stack(yy.tos-1).Tree);
    

when  495 =>
--#line  3426

	declare
	    Case_Alt_List : Lists.List := 
yy.value_stack(yy.tos-3).List;
	begin
	    if Not_Null(
yy.value_stack(yy.tos-2).Tree) then
		Lists.Append(Case_Alt_List, 
yy.value_stack(yy.tos-2).Tree);
	    end if;
	    
yyval := (One_Tree, Case_Construct.Make(
              Source_Pos => 
yy.value_stack(yy.tos-6).Source_Pos,
	      Case_Selector => 
yy.value_stack(yy.tos-5).Tree,
	      Case_Alt_List => Case_Alt_List,
	      End_With_Values => 
yy.value_stack(yy.tos).End_With_Values,
	      Check_Label => 
yy.value_stack(yy.tos).Check_Label,
              Label => 
yy.value_stack(yy.tos).Label));
	end;
    

when  496 =>
--#line  3445

        
yyval := (Optional_End_Token,
                Source_Pos => PSC.Source_Positions.Null_Source_Position, 
                End_Construct_Str => PSC.Strings.Null_U_String,
                Check_Label => False,
                others => Null_Optional_Tree);
    

when  497 =>
--#line  3452

        
yyval := (Optional_End_Token,
                Source_Pos => 
yy.value_stack(yy.tos-4).Source_Pos,
                End_Construct_Str => 
yy.value_stack(yy.tos-3).Str,
                Check_Label => True,
                Label => 
yy.value_stack(yy.tos-2).Tree, End_With_Values => 
yy.value_stack(yy.tos-1).Tree);
    

when  498 =>
--#line  3462

	
yyval := (One_List, Lists.Make((1 => 
yy.value_stack(yy.tos).Tree)));
    

when  499 =>
--#line  3465

	
yyval := 
yy.value_stack(yy.tos-1);
	Lists.Append(
yyval.List, 
yy.value_stack(yy.tos).Tree);
    

when  500 =>
--#line  3473

	
yyval := (One_Tree, Reference.Make(
	  Key => Invocation.Make(Invocation.Container_Aggregate,
	    Prefix => Null_Optional_Tree,
	    Operands => Lists.Make((1 => 
yy.value_stack(yy.tos-2).Tree))),
	  Referent => 
yy.value_stack(yy.tos).Tree));
    

when  501 =>
--#line  3482

        if Ada202x_Lex.Debug_Indent then
           Text_IO.Put(" [indent on] "); Text_IO.Flush;
        end if;
        Ada202x_Lex.Bracketing_Token := REFERS_TO;
        Ada202x_Lex.Expecting_Indent := True;
        
yyval := 
yy.value_stack(yy.tos);
    

when  502 =>
--#line  3492
 
yyval := 
yy.value_stack(yy.tos); 

when  503 =>
--#line  3494
 
	
yyval := (One_Tree, Param_Decl.Make(
          Name => 
yy.value_stack(yy.tos-2).Tree,
          Kind => Param_Decl.Default_Param,
          Locking => Param_Decl.Not_Locked,
          Is_Optional => False,
          Param_Type => 
yy.value_stack(yy.tos).Tree,
          Param_Default => Null_Optional_Tree));
     

when  504 =>
--#line  3507

	
yyval := (One_Tree, Reference.Make(
	  Key => Invocation.Make(Invocation.Container_Aggregate,
	    Prefix => Null_Optional_Tree,
	    Operands => Lists.Make((1 => 
yy.value_stack(yy.tos-2).Tree))),
	  Referent => 
yy.value_stack(yy.tos).Tree));
    

when  505 =>
--#line  3514

	
yyval := (One_Tree, Null_Optional_Tree);
    

when  506 =>
--#line  3520
 
	
yyval := (One_Tree, Binary.Make(Binary.Closed_Interval_Op,
	  Left_Operand => Null_Optional_Tree,
	  Right_Operand => Null_Optional_Tree));
    

when  507 =>
--#line  3528
 
yyval := 
yy.value_stack(yy.tos-1); 

when  508 =>
--#line  3529
 
yyval := 
yy.value_stack(yy.tos-2); 

when  509 =>
--#line  3530
 
yyval := 
yy.value_stack(yy.tos); 

when  510 =>
--#line  3534
 
yyval := 
yy.value_stack(yy.tos); 

when  511 =>
--#line  3535

	
yyval := (One_Tree, Param_Decl.Make(
          Name => 
yy.value_stack(yy.tos-2).Tree,
          Kind => Param_Decl.Default_Param,
          Locking => Param_Decl.Not_Locked,
          Is_Optional => False,
          Param_Type => 
yy.value_stack(yy.tos).Tree,
          Param_Default => Null_Optional_Tree));
     

when  512 =>
--#line  3546

	
yyval := (One_Tree, Binary.Make(Binary.Closed_Interval_Op,
	  Left_Operand => Null_Optional_Tree,
	  Right_Operand => Null_Optional_Tree));
     

when  513 =>
--#line  3556

	
yyval := (One_Tree, While_Stmt.Make(
          Source_Pos => 
yy.value_stack(yy.tos-4).Source_Pos,
	  While_Cond => Null_Optional_Tree,
	  Loop_Body => 
yy.value_stack(yy.tos-2).Tree,
	  End_With_Values => 
yy.value_stack(yy.tos).End_With_Values,
          Check_Label => 
yy.value_stack(yy.tos).Check_Label,
          Label => 
yy.value_stack(yy.tos).Label));
    

when  514 =>
--#line  3570

	
yyval := (One_Tree, While_Stmt.Make(
          Source_Pos => 
yy.value_stack(yy.tos-5).Source_Pos,
	  While_Cond => Conditionally_Complement(
yy.value_stack(yy.tos-4).Tree,
	    Complement => 
yy.value_stack(yy.tos-5).Is_Until),
	  Loop_Body => 
yy.value_stack(yy.tos-2).Tree,
	  End_With_Values => 
yy.value_stack(yy.tos).End_With_Values,
          Check_Label => 
yy.value_stack(yy.tos).Check_Label,
          Label => 
yy.value_stack(yy.tos).Label));
    

when  515 =>
--#line  3583
 
yyval := (Construct_Qualifier,
                      Source_Pos => 
yy.value_stack(yy.tos).Source_Pos,
                      Is_While => True, others => False); 

when  516 =>
--#line  3586
 
yyval := (Construct_Qualifier,
                      Source_Pos => 
yy.value_stack(yy.tos).Source_Pos,
                      Is_Until => True, others => False); 

when  519 =>
--#line  3594

        
yyval := (Optional_End_Token,
                Source_Pos => PSC.Source_Positions.Null_Source_Position, 
                End_Construct_Str => PSC.Strings.Null_U_String,
                Check_Label => False,
                others => Null_Optional_Tree);
    

when  520 =>
--#line  3601

        
yyval := (Optional_End_Token,
                Source_Pos => 
yy.value_stack(yy.tos-4).Source_Pos,
                End_Construct_Str => 
yy.value_stack(yy.tos-3).Str,
                Check_Label => True,
                Label => 
yy.value_stack(yy.tos-2).Tree, End_With_Values => 
yy.value_stack(yy.tos-1).Tree);
    

when  521 =>
--#line  3615

	
yyval := (One_Tree, For_Loop_Construct.Make(
          Source_Pos => 
yy.value_stack(yy.tos-7).Source_Pos,
	  Kind => For_Loop_Construct.For_Loop_Statement,
	  Iterators => 
yy.value_stack(yy.tos-6).List,
	  Filter => 
yy.value_stack(yy.tos-5).List,
	  Loop_Body => 
yy.value_stack(yy.tos-2).Tree,
	  Direction => 
yy.value_stack(yy.tos-4).Str,
	  End_With_Values => 
yy.value_stack(yy.tos).End_With_Values,
          Check_Label => 
yy.value_stack(yy.tos).Check_Label,
          Label => 
yy.value_stack(yy.tos).Label));
    

when  522 =>
--#line  3630

	
yyval := (One_Tree, For_Loop_Construct.Make(
          Source_Pos => 
yy.value_stack(yy.tos-6).Source_Pos,
	  Kind => For_Loop_Construct.For_Loop_Statement,
	  Iterators => 
yy.value_stack(yy.tos-5).List,
	  Filter => 
yy.value_stack(yy.tos-4).List,
	  Loop_Body => 
yy.value_stack(yy.tos-2).Tree,
	  Direction => Concurrent_Str,
          Chunk_Spec => 
yy.value_stack(yy.tos-7).Tree,
	  End_With_Values => 
yy.value_stack(yy.tos).End_With_Values,
          Check_Label => 
yy.value_stack(yy.tos).Check_Label,
          Label => 
yy.value_stack(yy.tos).Label));
    

when  523 =>
--#line  3646

	
yyval := (One_List, Lists.Make((1 => 
yy.value_stack(yy.tos).Tree)));
    

when  524 =>
--#line  3649
 
yyval := 
yy.value_stack(yy.tos-1); 

when  525 =>
--#line  3653

	declare
	    use type PSC.Strings.U_String;
	    Iterator_Tree : constant Optional_Tree := 
yy.value_stack(yy.tos-1).Tree;
	begin
	    if 
yy.value_stack(yy.tos).Str /= PSC.Strings.Null_U_String then
		Iterator.Add_Direction(Iterator_Tree, 
yy.value_stack(yy.tos).Str);
	    end if;
	    
yyval := (One_List, Lists.Make((1 => Iterator_Tree)));
	end;
    

when  526 =>
--#line  3664

	declare
	    use type PSC.Strings.U_String;
	    Iterator_Tree : Optional_Tree := 
yy.value_stack(yy.tos-1).Tree;
	begin
	    if 
yy.value_stack(yy.tos).Str /= PSC.Strings.Null_U_String then
		Iterator.Add_Direction(Iterator_Tree, 
yy.value_stack(yy.tos).Str);
	    end if;
	    
yyval := 
yy.value_stack(yy.tos-3);
	    Lists.Append(
yyval.List, Iterator_Tree);
	end;
    

when  527 =>
--#line  3676

	declare
	    use type PSC.Strings.U_String;
	    Iterator_Tree : constant Optional_Tree := 
yy.value_stack(yy.tos-1).Tree;
	begin
	    yyerror("Iterators must be separated by "";""",
              At_Token => 
yy.value_stack(yy.tos-2));
	    if 
yy.value_stack(yy.tos).Str /= PSC.Strings.Null_U_String then
		Iterator.Add_Direction(Iterator_Tree, 
yy.value_stack(yy.tos).Str);
	    end if;
	    
yyval := 
yy.value_stack(yy.tos-3);
	    Lists.Append(
yyval.List, Iterator_Tree);
	end;
    

when  528 =>
--#line  3693
 
yyval := 
yy.value_stack(yy.tos); 

when  529 =>
--#line  3694

	
yyval := (One_Token, 
	  PSC.Source_Positions.Null_Source_Position, 
	  PSC.Strings.Null_U_String); 
    

when  530 =>
--#line  3702
 
yyval := 
yy.value_stack(yy.tos); 

when  531 =>
--#line  3703
 
	yyerror("Use ""for ..."" or ""for each ..."" rather " &
          "than ""for all ..."" in iterator of for-loop",
          At_Token => 
yy.value_stack(yy.tos-1));
	
yyval := 
yy.value_stack(yy.tos); 
    

when  532 =>
--#line  3709
 
yyval := 
yy.value_stack(yy.tos); 

when  533 =>
--#line  3710
 
	yyerror("""for-each"" iterator uses ""of"" rather than ""in""",
          At_Token => 
yy.value_stack(yy.tos-1));
	
yyval := 
yy.value_stack(yy.tos); 
    

when  534 =>
--#line  3715
 
	yyerror("Use ""for each ..."" rather than ""for all ..."" in " &
          "container element iterator",
          At_Token => 
yy.value_stack(yy.tos-1));
	
yyval := 
yy.value_stack(yy.tos); 
    

when  535 =>
--#line  3721
 
	yyerror("Missing ""each"" in container element ""for-each"" iterator",
          At_Token => 
yy.value_stack(yy.tos));
	
yyval := 
yy.value_stack(yy.tos); 
    

when  536 =>
--#line  3726
 
yyval := 
yy.value_stack(yy.tos); 

when  537 =>
--#line  3727
 
yyval := 
yy.value_stack(yy.tos); 

when  538 =>
--#line  3731

	
yyval := (One_Tree, Iterator.Make(
	  Kind => Iterator.Set_Iterator,
	  Name => PSC.Trees.Identifier.Tree(Tree_Of(
yy.value_stack(yy.tos-4).Tree)),
	  Is_Ref => False,
	  Obj_Type => 
yy.value_stack(yy.tos-3).Tree,
	  Obj_Value => 
yy.value_stack(yy.tos).Tree));
    

when  540 =>
--#line  3741

	yyerror("The ""reverse"" keyword goes immediately before ""loop""");
        --  TBD: But not in Ada 202X!
    

when  541 =>
--#line  3747

	
yyval := (One_Tree, Iterator.Make(
	  Kind => Iterator.Each_Value,
	  Name => PSC.Trees.Identifier.Tree(Tree_Of(
yy.value_stack(yy.tos-3).Tree)),
	  Is_Ref => True,
	  Obj_Type => 
yy.value_stack(yy.tos-2).Tree,
	  Obj_Value => 
yy.value_stack(yy.tos).Tree));
    

when  542 =>
--#line  3755

	
yyval := (One_Tree, Iterator.Make(
	  Kind => Iterator.Each_Key_Value,
	  Name => PSC.Trees.Identifier.Tree(Tree_Of(
yy.value_stack(yy.tos-3).Tree)),
	  Is_Ref => True,
	  Obj_Type => Null_Optional_Tree,
	  Obj_Value => 
yy.value_stack(yy.tos).Tree,
	  Key_Name => 
yy.value_stack(yy.tos-5).Tree));
    

when  543 =>
--#line  3766

        if Ada202x_Lex.Debug_Indent
          and then Ada202x_Lex.Expecting_Indent
        then
            Text_IO.Put(" [of with indent off] "); Text_IO.Flush;
        end if;
        Ada202x_Lex.Expecting_Indent := False;
    

when  544 =>
--#line  3777

	
yyval := (One_Tree, Iterator.Make(
	  Kind => Iterator.Initial_Next_Value,
	  Name => PSC.Trees.Identifier.Tree(Tree_Of(
yy.value_stack(yy.tos-6).Tree)),
	  Is_Ref => False,
	  Obj_Type => 
yy.value_stack(yy.tos-5).Tree,
	  Obj_Value => 
yy.value_stack(yy.tos-3).Tree,
	  Next_Values => 
yy.value_stack(yy.tos-1).List,
	  While_Cond => 
yy.value_stack(yy.tos).Tree));
    

when  545 =>
--#line  3788

	
yyval := (One_Tree, Iterator.Make(
	  Kind => Iterator.Initial_Next_Value,
	  Name => PSC.Trees.Identifier.Tree(Tree_Of(
yy.value_stack(yy.tos-6).Tree)),
	  Is_Ref => True,
	  Obj_Type => 
yy.value_stack(yy.tos-5).Tree,
	  Obj_Value => 
yy.value_stack(yy.tos-3).Tree,
	  Next_Values => 
yy.value_stack(yy.tos-1).List,
	  While_Cond => 
yy.value_stack(yy.tos).Tree));
    

when  546 =>
--#line  3801

	
yyval := (One_Tree, Iterator.Make(
	  Kind => Iterator.Initial_Value,
	  Name => PSC.Trees.Identifier.Tree(Tree_Of(
yy.value_stack(yy.tos-4).Tree)),
	  Is_Ref => False,
	  Obj_Type => 
yy.value_stack(yy.tos-3).Tree,
	  Obj_Value => 
yy.value_stack(yy.tos-1).Tree,
	  While_Cond => 
yy.value_stack(yy.tos).Tree));
    

when  547 =>
--#line  3810

	
yyval := (One_Tree, Iterator.Make(
	  Kind => Iterator.Initial_Value,
	  Name => PSC.Trees.Identifier.Tree(Tree_Of(
yy.value_stack(yy.tos-4).Tree)),
	  Is_Ref => True,
	  Obj_Type => 
yy.value_stack(yy.tos-3).Tree,
	  Obj_Value => 
yy.value_stack(yy.tos-1).Tree,
	  While_Cond => 
yy.value_stack(yy.tos).Tree));
    

when  548 =>
--#line  3822

	
yyval := 
yy.value_stack(yy.tos);
    

when  549 =>
--#line  3825

	
yyval := (One_Tree, Null_Optional_Tree);
    

when  550 =>
--#line  3831
 
	
yyval := (One_List, Lists.Make((1 => 
yy.value_stack(yy.tos).Tree))); 
    

when  551 =>
--#line  3834

	
yyval := 
yy.value_stack(yy.tos-2);
	Lists.Append(
yyval.List, 
yy.value_stack(yy.tos).Tree);
    

when  552 =>
--#line  3841
 
	
yyval := (One_List, Lists.Make((1 => 
yy.value_stack(yy.tos).Tree))); 
    

when  553 =>
--#line  3844

	
yyval := 
yy.value_stack(yy.tos-2);
	Lists.Append(
yyval.List, 
yy.value_stack(yy.tos).Tree);
    

when  554 =>
--#line  3851

	
yyval := (One_Tree, Conditionally_Complement(
	  
yy.value_stack(yy.tos).Tree, Complement => 
yy.value_stack(yy.tos-1).Is_Until));
	    -- Complement condition if used "until"
    

when  555 =>
--#line  3856

	
yyval := (One_Tree, Null_Optional_Tree);
    

when  556 =>
--#line  3861
 
yyval := 
yy.value_stack(yy.tos); 

when  557 =>
--#line  3862
 
	
yyval := (One_Token, 
	  PSC.Source_Positions.Null_Source_Position, 
	  PSC.Strings.Null_U_String); 
    

when  558 =>
--#line  3870
 
yyval := 
yy.value_stack(yy.tos); 

when  559 =>
--#line  3871
 
yyval := 
yy.value_stack(yy.tos); 

when  560 =>
--#line  3875

	
yyval := (One_Token, PSC.Syntax.Cur_Source_Pos, Concurrent_Str);
    

when  561 =>
--#line  3881

	
yyval := (One_Tree, Null_Optional_Tree); 
    

when  562 =>
--#line  3884

        
yyval := 
yy.value_stack(yy.tos-1);
    

when  563 =>
--#line  3887

        
yyval := 
yy.value_stack(yy.tos-1);
    

when  564 =>
--#line  3893

        
yyval := 
yy.value_stack(yy.tos);
    

when  565 =>
--#line  3897

        
yyval := 
yy.value_stack(yy.tos-1);
    

when  566 =>
--#line  3903

	
yyval := (One_Token, PSC.Syntax.Cur_Source_Pos, Forward_Str);
    

when  567 =>
--#line  3906

	
yyval := (One_Token, PSC.Syntax.Cur_Source_Pos, Reverse_Str);
    

when  568 =>
--#line  3914

	
yyval := (One_Tree, Block_Stmt.Make(
          Source_Pos => 
yy.value_stack(yy.tos-4).Source_Pos,
	  Block_Body => 
yy.value_stack(yy.tos-2).Tree,
	  End_With_Values => 
yy.value_stack(yy.tos).End_With_Values,
          Check_Label => 
yy.value_stack(yy.tos).Check_Label,
          Label => 
yy.value_stack(yy.tos).Label));
    

when  569 =>
--#line  3924
 
yyval := 
yy.value_stack(yy.tos); 

when  570 =>
--#line  3925

	yyerror("Should be ""end block <id>"" rather than ""end <id>""");
	
yyval := (One_Token, 
	  PSC.Source_Positions.Null_Source_Position, 
	  PSC.Strings.Null_U_String); 
    

when  571 =>
--#line  3934

        
yyval := (Optional_End_Token,
                Source_Pos => PSC.Source_Positions.Null_Source_Position, 
                End_Construct_Str => PSC.Strings.Null_U_String,
                Check_Label => False,
                others => Null_Optional_Tree);
    

when  572 =>
--#line  3941

        
yyval := (Optional_End_Token,
                Source_Pos => 
yy.value_stack(yy.tos-4).Source_Pos,
                End_Construct_Str => 
yy.value_stack(yy.tos-3).Str,
                Check_Label => True,
                Label => 
yy.value_stack(yy.tos-2).Tree, End_With_Values => 
yy.value_stack(yy.tos-1).Tree);
    

when  573 =>
--#line  3953

	
yyval := (One_Tree, Block_Stmt.Make(
          Source_Pos => 
yy.value_stack(yy.tos-4).Source_Pos,
	  Block_Body => 
yy.value_stack(yy.tos-2).Tree,
	  End_With_Values => 
yy.value_stack(yy.tos).End_With_Values,
          Check_Label => 
yy.value_stack(yy.tos).Check_Label,
          Label => 
yy.value_stack(yy.tos).Label));
    

when  574 =>
--#line  3963
 
yyval := 
yy.value_stack(yy.tos); 

when  575 =>
--#line  3964

	yyerror("Should be ""end parallel <id>"" rather than ""end <id>""");
	
yyval := (One_Token, 
	  PSC.Source_Positions.Null_Source_Position, 
	  PSC.Strings.Null_U_String); 
    

when  576 =>
--#line  3973

        
yyval := (Optional_End_Token,
                Source_Pos => PSC.Source_Positions.Null_Source_Position, 
                End_Construct_Str => PSC.Strings.Null_U_String,
                Check_Label => False,
                others => Null_Optional_Tree);
    

when  577 =>
--#line  3980

        
yyval := (Optional_End_Token,
                Source_Pos => 
yy.value_stack(yy.tos-4).Source_Pos,
                End_Construct_Str => 
yy.value_stack(yy.tos-3).Str,
                Check_Label => True,
                Label => 
yy.value_stack(yy.tos-2).Tree, End_With_Values => 
yy.value_stack(yy.tos-1).Tree);
    

when  578 =>
--#line  3990

	
yyval := 
yy.value_stack(yy.tos);
    

when  579 =>
--#line  4003
 
	-- Treat "/=" equiv to "!=" in an expression
	
yyval := (One_Binary_Op, 
yy.value_stack(yy.tos).Source_Pos, Binary.NEQ_Op);
    

when  580 =>
--#line  4010
 
yyval := 
yy.value_stack(yy.tos); 

when  581 =>
--#line  4013

	
yyval := (One_Tree, Conditional.Make(Kind => Conditional.Quest_Colon,
          Source_Pos => 
yy.value_stack(yy.tos-3).Source_Pos,
	  Cond => 
yy.value_stack(yy.tos-4).Tree,
	  Then_Part => 
yy.value_stack(yy.tos-2).Tree,
	  Else_Part => 
yy.value_stack(yy.tos).Tree));
	Set_Source_Pos(
yyval.Tree, Source_Pos => 
yy.value_stack(yy.tos-3).Source_Pos);
    

when  582 =>
--#line  4021
 
yyval := 
yy.value_stack(yy.tos); 

when  583 =>
--#line  4026

	
yyval := (One_Tree, Operation.Make(
	  Name => Null_Optional_Tree,
	  Operation_Kind => Operation.Lambda_Operation,
	  Operation_Inputs => 
yy.value_stack(yy.tos-2).List,
	  Operation_Outputs => Lists.Empty_List,
	  Preconditions => Null_Optional_Tree,
	  Postconditions => Null_Optional_Tree,
	  Is_Abstract => False,
	  Is_Optional => False,
	  Is_Def => True,
	  Statements => 
yy.value_stack(yy.tos).Tree)); 
    

when  584 =>
--#line  4041

	
yyval := (One_List, Lists.Empty_List);
    

when  585 =>
--#line  4044

        
yyval := (One_List, Lists.Make ((1 => 
yy.value_stack(yy.tos).Tree)));
    

when  586 =>
--#line  4047

        
yyval := 
yy.value_stack(yy.tos-1);
    

when  587 =>
--#line  4052

        
yyval := (One_List, Lists.Make ((1 => 
yy.value_stack(yy.tos).Tree)));
    

when  588 =>
--#line  4055

	
yyval := 
yy.value_stack(yy.tos-2);
	Lists.Append(
yyval.List, 
yy.value_stack(yy.tos).Tree);
    

when  589 =>
--#line  4061

        
yyval := (One_Tree, Param_Decl.Make(
          Name => 
yy.value_stack(yy.tos).Tree,
          Kind => Param_Decl.Default_Param,
          Locking => Param_Decl.Not_Locked,
          Is_Optional => False,
          Param_Type => Null_Optional_Tree,
          Param_Default => Null_Optional_Tree));
    

when  590 =>
--#line  4073
 
yyval := 
yy.value_stack(yy.tos); 

when  591 =>
--#line  4074

	
yyval := (One_Tree, Invocation.Make(
	  Kind => Invocation.Class_Aggregate,
	  Prefix => Null_Optional_Tree,
	  Operands => Lists.Make((1 => 
yy.value_stack(yy.tos-1).Tree))));
    

when  592 =>
--#line  4082

	
yyval := (One_Tree, Binary.Make(
	  Operator => Binary.Next_Stmt_Op,
	  Left_Operand => 
yy.value_stack(yy.tos-2).Tree,
	  Right_Operand => 
yy.value_stack(yy.tos).Tree));
    

when  593 =>
--#line  4088

	
yyval := (One_Tree, Binary.Make(
	  Operator => Binary.Next_Stmt_Op,
	  Left_Operand => 
yy.value_stack(yy.tos-2).Tree,
	  Right_Operand => 
yy.value_stack(yy.tos).Tree));
     

when  594 =>
--#line  4097
 
yyval := 
yy.value_stack(yy.tos); 

when  595 =>
--#line  4098
 
yyval := 
yy.value_stack(yy.tos); 

when  596 =>
--#line  4102
 
yyval := 
yy.value_stack(yy.tos); 

when  597 =>
--#line  4103

      declare
	Left_Tree : PSC.Trees.Tree'Class renames Tree_Ptr_Of(
yy.value_stack(yy.tos-2).Tree).all;
	use type Binary.Binary_Operator_Enum;
      begin
	if Left_Tree in Binary.Tree'Class and then
	  Binary.Tree(Left_Tree).Operator in Binary.Logical_Ops then
	    if Binary.Tree(Left_Tree).Operator /= 
yy.value_stack(yy.tos-1).Binary_Op then
		-- logical operators are associative only with same op
		yyerror(
		  "must use parentheses in sequence of " &
		    "distinct logical operators",
                  At_Token => 
yy.value_stack(yy.tos-1));
	    elsif 
yy.value_stack(yy.tos-1).Binary_Op = Binary.Implies_Op then
		-- Implication should associate right-to-left but that
		-- is too confusing.
		yyerror(
		  "must use parentheses in sequence of implication operators",
                  At_Token => 
yy.value_stack(yy.tos-1));
	    end if;
	end if;

	
yyval := (One_Tree, Binary.Make(
	  Operator => 
yy.value_stack(yy.tos-1).Binary_Op,
	  Left_Operand => 
yy.value_stack(yy.tos-2).Tree,
	  Right_Operand => 
yy.value_stack(yy.tos).Tree));
      end;
    

when  598 =>
--#line  4134
 
yyval := 
yy.value_stack(yy.tos); 

when  599 =>
--#line  4135

	
yyval := (One_Tree, Binary.Make(
	  Operator => 
yy.value_stack(yy.tos-1).Binary_Op,
	  Left_Operand => 
yy.value_stack(yy.tos-2).Tree,
	  Right_Operand => 
yy.value_stack(yy.tos).Tree));
    

when  600 =>
--#line  4144
 
yyval := 
yy.value_stack(yy.tos); 

when  601 =>
--#line  4145

	
yyval := (One_Tree, Binary.Make(
	  Operator => Binary.In_Op,
	  Left_Operand => 
yy.value_stack(yy.tos-2).Tree,
	  Right_Operand => 
yy.value_stack(yy.tos).Tree));
    

when  602 =>
--#line  4151

	
yyval := (One_Tree, Binary.Make(
	  Operator => Binary.Not_In_Op,
	  Left_Operand => 
yy.value_stack(yy.tos-3).Tree,
	  Right_Operand => 
yy.value_stack(yy.tos).Tree));
    

when  603 =>
--#line  4157

	
yyval := (One_Tree, Unary.Make(
	  Operator => Unary.Is_Null_Op,
	  Operand => 
yy.value_stack(yy.tos-2).Tree));
    

when  604 =>
--#line  4162

	-- We use adding_expression before "NOT" instead of simple_expression
	-- to avoid ambiguity associated with polymorphic type names
        -- (which are included in simple_expression but not adding_expression):
	--    Integer+ not null 
	-- could be interpreted as:
	--    Integer + not(null)
	
yyval := (One_Tree, Unary.Make(
	  Operator => Unary.Not_Null_Op,
	  Operand => 
yy.value_stack(yy.tos-2).Tree));
    

when  605 =>
--#line  4173

	
yyval := (One_Tree, Invocation.Make(
	  Kind => Invocation.Is_Function_Of,
	  Prefix => 
yy.value_stack(yy.tos-5).Tree,
	  Operands => 
yy.value_stack(yy.tos-1).List));
    

when  606 =>
--#line  4182
 
yyval := 
yy.value_stack(yy.tos); 

when  607 =>
--#line  4183

	
yyval := (One_Tree, Binary.Make(
	  Operator => Binary.Combine_Op,
	  Left_Operand => 
yy.value_stack(yy.tos-2).Tree,
	  Right_Operand => 
yy.value_stack(yy.tos).Tree));
    

when  608 =>
--#line  4192
 
yyval := 
yy.value_stack(yy.tos); 

when  609 =>
--#line  4193
 
	
yyval := (One_Tree, Binary.Make(
	  Operator => 
yy.value_stack(yy.tos-1).Binary_Op,
	  Left_Operand => 
yy.value_stack(yy.tos-2).Tree,
	  Right_Operand => 
yy.value_stack(yy.tos).Tree));
    

when  610 =>
--#line  4216
 
yyval := 
yy.value_stack(yy.tos); 

when  611 =>
--#line  4217

        --  NOTE: We treat '+' here separately to avoid
        --        reduce/reduce conflicts
	
yyval := (One_Tree, Binary.Make(
	  Operator => Binary.Plus_Op,
	  Left_Operand => 
yy.value_stack(yy.tos-2).Tree,
	  Right_Operand => 
yy.value_stack(yy.tos).Tree));
    

when  612 =>
--#line  4225

	
yyval := (One_Tree, Binary.Make(
	  Operator => 
yy.value_stack(yy.tos-1).Binary_Op,
	  Left_Operand => 
yy.value_stack(yy.tos-2).Tree,
	  Right_Operand => 
yy.value_stack(yy.tos).Tree));
    

when  613 =>
--#line  4234
 
yyval := 
yy.value_stack(yy.tos); 

when  614 =>
--#line  4235

	
yyval := (One_Tree, Binary.Make(
	  Operator => 
yy.value_stack(yy.tos-1).Binary_Op,
	  Left_Operand => 
yy.value_stack(yy.tos-2).Tree,
	  Right_Operand => 
yy.value_stack(yy.tos).Tree));
    

when  615 =>
--#line  4244
 
yyval := 
yy.value_stack(yy.tos); 

when  616 =>
--#line  4245

	 -- right associative
	
yyval := (One_Tree, Binary.Make(
	  Operator => 
yy.value_stack(yy.tos-1).Binary_Op,
	  Left_Operand => 
yy.value_stack(yy.tos-2).Tree,
	  Right_Operand => 
yy.value_stack(yy.tos).Tree));
    

when  617 =>
--#line  4252

	-- unary ops have higher precedence 
	-- than every operator except the power_operator.
	
yyval := (One_Tree, Unary.Make(
	  Operator => 
yy.value_stack(yy.tos-1).Unary_Op,
	  Operand => 
yy.value_stack(yy.tos).Tree));
    

when  618 =>
--#line  4262
 
yyval := 
yy.value_stack(yy.tos); 

when  619 =>
--#line  4263
 
yyval := 
yy.value_stack(yy.tos); 

when  620 =>
--#line  4264
 
yyval := 
yy.value_stack(yy.tos-1); 

when  621 =>
--#line  4265
 
yyval := 
yy.value_stack(yy.tos-1); 

when  622 =>
--#line  4266
 
yyval := 
yy.value_stack(yy.tos-1); 

when  623 =>
--#line  4267

        
yyval := (One_Tree, Unary.Make(Unary.Magnitude_Op,
          Operand => 
yy.value_stack(yy.tos-1).Tree));
    

when  624 =>
--#line  4271
 
yyval := 
yy.value_stack(yy.tos); 

when  625 =>
--#line  4272

        --  An Ada202x Reduce expression
	
yyval := (One_Tree, Qualified_Name.Make(
	  Prefix => 
yy.value_stack(yy.tos-2).Tree,
	  Id => 
yy.value_stack(yy.tos).Tree));
    

when  626 =>
--#line  4278

        --  An Ada202x Reduce expression
	
yyval := (One_Tree, Invocation.Make(
	  Kind => Invocation.Operation_Call,
	  Prefix => Qualified_Name.Make(
             Prefix => 
yy.value_stack(yy.tos-5).Tree,
             Id => 
yy.value_stack(yy.tos-3).Tree),
	  Operands => 
yy.value_stack(yy.tos-3).List));
    

when  627 =>
--#line  4287

        --  This is used in a map_reduce expression to specify the initial val
        
yyval := (One_Tree, Unary.Make(Unary.Initial_Value_Op,
          Operand => 
yy.value_stack(yy.tos-1).Tree));
    

when  628 =>
--#line  4295
 
	
yyval := (One_Tree, PSC.Trees.Identifier.Make(
yy.value_stack(yy.tos).Str, 
yy.value_stack(yy.tos).Source_Pos)); 
    

when  629 =>
--#line  4298
 
	
yyval := (One_Tree, PSC.Trees.Identifier.Make(
yy.value_stack(yy.tos).Str, 
yy.value_stack(yy.tos).Source_Pos)); 
    

when  630 =>
--#line  4301
 
	
yyval := (One_Tree, PSC.Trees.Identifier.Make(
yy.value_stack(yy.tos).Str, 
yy.value_stack(yy.tos).Source_Pos)); 
    

when  631 =>
--#line  4304
 
	
yyval := (One_Tree, PSC.Trees.Identifier.Make(
yy.value_stack(yy.tos).Str, 
yy.value_stack(yy.tos).Source_Pos)); 
    

when  632 =>
--#line  4307
 
	
yyval := (One_Tree, PSC.Trees.Identifier.Make("null", 
yy.value_stack(yy.tos).Source_Pos)); 
    

when  633 =>
--#line  4313

        
yyval := 
yy.value_stack(yy.tos);
    

when  634 =>
--#line  4316

        
yyval := 
yy.value_stack(yy.tos);
    

when  635 =>
--#line  4322

	
yyval := (One_Tree, Invocation.Make(
	  Kind => Invocation.Operation_Call,
	  Prefix => 
yy.value_stack(yy.tos-3).Tree,
	  Operands => 
yy.value_stack(yy.tos-1).List));
    

when  636 =>
--#line  4328

	
yyval := (One_Tree, Invocation.Make(
	  Kind => Invocation.Container_Indexing,
	  Prefix => 
yy.value_stack(yy.tos-3).Tree,
	  Operands => 
yy.value_stack(yy.tos-1).List));
    

when  637 =>
--#line  4334

	
yyval := (One_Tree, Invocation.Make(
	  Kind => Invocation.Container_Indexing,
	  Prefix => 
yy.value_stack(yy.tos-3).Tree,
	  Operands => Lists.Make((1 => 
yy.value_stack(yy.tos-1).Tree))));
    

when  638 =>
--#line  4340

	
yyval := (One_Tree, Selection.Make(
	  Prefix => 
yy.value_stack(yy.tos-2).Tree,
	  Selector => 
yy.value_stack(yy.tos).Tree));
    

when  639 =>
--#line  4348

	
yyval := (One_List, Lists.Make((1 => 
yy.value_stack(yy.tos).Tree)));
    

when  640 =>
--#line  4351

	
yyval := 
yy.value_stack(yy.tos-2);
	Lists.Append(
yyval.List, 
yy.value_stack(yy.tos).Tree);
    

when  641 =>
--#line  4358
 
yyval := 
yy.value_stack(yy.tos); 

when  642 =>
--#line  4359

	
yyval := (One_Tree, Reference.Make(
	  Key => 
yy.value_stack(yy.tos-2).Tree,
	  Referent => 
yy.value_stack(yy.tos).Tree));
    

when  643 =>
--#line  4366
 
yyval := 
yy.value_stack(yy.tos); 

when  644 =>
--#line  4369
 
yyval := (One_Unary_Op, 
yy.value_stack(yy.tos).Source_Pos, Unary.Plus_Op); 

when  645 =>
--#line  4370
 
yyval := (One_Unary_Op, 
yy.value_stack(yy.tos).Source_Pos, Unary.Minus_Op); 

when  646 =>
--#line  4371
 
yyval := (One_Unary_Op, 
yy.value_stack(yy.tos).Source_Pos, Unary.Abs_Op); 

when  647 =>
--#line  4372
 
yyval := (One_Unary_Op, 
yy.value_stack(yy.tos).Source_Pos, Unary.Not_Op); 

when  648 =>
--#line  4373
 
yyval := (One_Unary_Op, 
yy.value_stack(yy.tos).Source_Pos, Unary.Plus_Op); 

when  649 =>
--#line  4374
 
yyval := (One_Unary_Op, 
yy.value_stack(yy.tos).Source_Pos, Unary.Minus_Op); 

when  650 =>
--#line  4378
 
yyval := (One_Binary_Op, 
yy.value_stack(yy.tos).Source_Pos, Binary.Minus_Op); 

when  651 =>
--#line  4379
 
yyval := (One_Binary_Op, 
yy.value_stack(yy.tos).Source_Pos, Binary.Plus_Op); 

when  652 =>
--#line  4380
 
yyval := (One_Binary_Op, 
yy.value_stack(yy.tos).Source_Pos, Binary.Minus_Op); 

when  653 =>
--#line  4381
 
yyval := (One_Binary_Op, 
yy.value_stack(yy.tos).Source_Pos, Binary.Ampersand_Op); 

when  654 =>
--#line  4385
 
yyval := (One_Binary_Op, 
yy.value_stack(yy.tos).Source_Pos, Binary.Times_Op); 

when  655 =>
--#line  4386
 
yyval := (One_Binary_Op, 
yy.value_stack(yy.tos).Source_Pos, Binary.Divide_Op); 

when  656 =>
--#line  4387
 
yyval := (One_Binary_Op, 
yy.value_stack(yy.tos).Source_Pos, Binary.Mod_Op); 

when  657 =>
--#line  4388
 
yyval := (One_Binary_Op, 
yy.value_stack(yy.tos).Source_Pos, Binary.Rem_Op); 

when  658 =>
--#line  4391
 
	
yyval := (One_Binary_Op, 
yy.value_stack(yy.tos).Source_Pos, Binary.Power_Op); 
    

when  659 =>
--#line  4395
 
yyval := 
yy.value_stack(yy.tos); 

when  660 =>
--#line  4396
 
	
yyval := (One_Assign_Op, 
yy.value_stack(yy.tos).Source_Pos, Assign_Stmt.Divide_Assign_Op); 
    

when  661 =>
--#line  4402

	
yyval := (One_Assign_Op, 
yy.value_stack(yy.tos).Source_Pos, Assign_Stmt.Assign_Op); 
     

when  662 =>
--#line  4405
 
	
yyval := (One_Assign_Op, 
yy.value_stack(yy.tos).Source_Pos, Assign_Stmt.Plus_Assign_Op); 
    

when  663 =>
--#line  4408
 
	
yyval := (One_Assign_Op, 
yy.value_stack(yy.tos).Source_Pos, Assign_Stmt.Minus_Assign_Op); 
    

when  664 =>
--#line  4411
 
	
yyval := (One_Assign_Op, 
yy.value_stack(yy.tos).Source_Pos, Assign_Stmt.Times_Assign_Op); 
    

when  665 =>
--#line  4414
 
	
yyval := (One_Assign_Op, 
yy.value_stack(yy.tos).Source_Pos, Assign_Stmt.Power_Assign_Op); 
    

when  666 =>
--#line  4417
 
	
yyval := (One_Assign_Op, 
yy.value_stack(yy.tos).Source_Pos, Assign_Stmt.Combine_Assign_Op); 
    

when  667 =>
--#line  4420
 
	
yyval := (One_Assign_Op, 
yy.value_stack(yy.tos).Source_Pos, Assign_Stmt.Ampersand_Assign_Op); 
    

when  668 =>
--#line  4423
 
	
yyval := (One_Assign_Op, 
yy.value_stack(yy.tos).Source_Pos, Assign_Stmt.And_Assign_Op); 
    

when  669 =>
--#line  4426
 
	
yyval := (One_Assign_Op, 
yy.value_stack(yy.tos).Source_Pos, Assign_Stmt.Or_Assign_Op); 
    

when  670 =>
--#line  4429
 
	
yyval := (One_Assign_Op, 
yy.value_stack(yy.tos).Source_Pos, Assign_Stmt.Xor_Assign_Op); 
    

when  671 =>
--#line  4432

	
yyval := (One_Assign_Op, 
yy.value_stack(yy.tos).Source_Pos, Assign_Stmt.Left_Shift_Assign_Op);
    

when  672 =>
--#line  4435

	
yyval := (One_Assign_Op, 
yy.value_stack(yy.tos).Source_Pos, Assign_Stmt.Right_Shift_Assign_Op);
    

when  673 =>
--#line  4440
 
	
yyval := (One_Assign_Op, 
yy.value_stack(yy.tos).Source_Pos, Assign_Stmt.Assign_Op); 
    

when  674 =>
--#line  4443
 
yyval := 
yy.value_stack(yy.tos); 

when  675 =>
--#line  4446

	yyerror("Use "":="" rather than ""="" in Ada202x");
	
yyval := (One_Assign_Op, 
yy.value_stack(yy.tos).Source_Pos, Assign_Stmt.Assign_Op); 
    

when  676 =>
--#line  4453
 
yyval := (One_Binary_Op, 
yy.value_stack(yy.tos).Source_Pos, Binary.Compare_Op); 

when  677 =>
--#line  4454
 
yyval := (One_Binary_Op, 
yy.value_stack(yy.tos).Source_Pos, Binary.Equal_Op); 

when  678 =>
--#line  4455
 
yyval := (One_Binary_Op, 
yy.value_stack(yy.tos).Source_Pos, Binary.NEQ_Op); 

when  679 =>
--#line  4456
 
yyval := (One_Binary_Op, 
yy.value_stack(yy.tos).Source_Pos, Binary.NEQ_Op); 

when  680 =>
--#line  4457
 
yyval := (One_Binary_Op, 
yy.value_stack(yy.tos).Source_Pos, Binary.Less_Op); 

when  681 =>
--#line  4458
 
yyval := (One_Binary_Op, 
yy.value_stack(yy.tos).Source_Pos, Binary.LEQ_Op); 

when  682 =>
--#line  4459
 
yyval := (One_Binary_Op, 
yy.value_stack(yy.tos).Source_Pos, Binary.Greater_Op); 

when  683 =>
--#line  4460
 
yyval := (One_Binary_Op, 
yy.value_stack(yy.tos).Source_Pos, Binary.GEQ_Op); 

when  684 =>
--#line  4461
 
yyval := (One_Binary_Op, 
yy.value_stack(yy.tos).Source_Pos, Binary.Left_Shift_Op ); 

when  685 =>
--#line  4462
 
yyval := (One_Binary_Op, 
yy.value_stack(yy.tos-1).Source_Pos, Binary.Right_Shift_Op); 

when  686 =>
--#line  4463
 
	yyerror("Use ""="" rather than ""=="" in Ada202x");
	
yyval := (One_Binary_Op, 
yy.value_stack(yy.tos).Source_Pos, Binary.Equal_Op);
    

when  687 =>
--#line  4470
 
yyval := (One_Binary_Op, 
yy.value_stack(yy.tos).Source_Pos, Binary.And_Op); 

when  688 =>
--#line  4471
 
yyval := (One_Binary_Op, 
yy.value_stack(yy.tos).Source_Pos, Binary.Or_Op); 

when  689 =>
--#line  4472
 
yyval := (One_Binary_Op, 
yy.value_stack(yy.tos).Source_Pos, Binary.Xor_Op); 

when  690 =>
--#line  4474
 
yyval := (One_Binary_Op, 
yy.value_stack(yy.tos-1).Source_Pos, Binary.And_Then_Op); 

when  691 =>
--#line  4476
 
yyval := (One_Binary_Op, 
yy.value_stack(yy.tos-1).Source_Pos, Binary.Or_Else_Op); 

when  692 =>
--#line  4477
 
yyval := (One_Binary_Op, 
yy.value_stack(yy.tos).Source_Pos, Binary.Implies_Op); 

when  693 =>
--#line  4481
 
	
yyval := (One_Binary_Op, 
yy.value_stack(yy.tos).Source_Pos, Binary.Closed_Interval_Op); 
    

when  694 =>
--#line  4484
 
	
yyval := (One_Binary_Op, 
yy.value_stack(yy.tos).Source_Pos, Binary.Open_Interval_Op); 
    

when  695 =>
--#line  4487
 
	
yyval := (One_Binary_Op, 
yy.value_stack(yy.tos).Source_Pos, Binary.Closed_Open_Interval_Op); 
    

when  696 =>
--#line  4490
 
	
yyval := (One_Binary_Op, 
yy.value_stack(yy.tos).Source_Pos, Binary.Open_Closed_Interval_Op); 
    

when  697 =>
--#line  4496
 
yyval := 
yy.value_stack(yy.tos); 

when  698 =>
--#line  4497
 
yyval := 
yy.value_stack(yy.tos); 

when  699 =>
--#line  4501

	
yyval := (One_Tree, Invocation.Make(
	  Kind => Invocation.Class_Aggregate,
	  Prefix => Null_Optional_Tree,
	  Operands => 
yy.value_stack(yy.tos-1).List,
          Source_Pos => 
yy.value_stack(yy.tos-2).Source_Pos));
    

when  700 =>
--#line  4518

	-- Type of aggregate specified
	
yyval := (One_Tree, Invocation.Make(
	  Kind => Invocation.Class_Aggregate,
	  Prefix => 
yy.value_stack(yy.tos-4).Tree,
	  Operands => 
yy.value_stack(yy.tos-1).List,
          Source_Pos => 
yy.value_stack(yy.tos-2).Source_Pos));
    

when  701 =>
--#line  4529

	
yyval := 
yy.value_stack(yy.tos);
    

when  702 =>
--#line  4532

	
yyval := (One_List, Lists.Empty_List);
    

when  703 =>
--#line  4538

	
yyval := (One_List, Lists.Make((1 => 
yy.value_stack(yy.tos).Tree)));
    

when  704 =>
--#line  4541

	
yyval := 
yy.value_stack(yy.tos-2);
	Lists.Append(
yyval.List, 
yy.value_stack(yy.tos).Tree);
    

when  705 =>
--#line  4548
 
yyval := 
yy.value_stack(yy.tos); 

when  706 =>
--#line  4549

	
yyval := (One_Tree, Reference.Make(
	  Key => 
yy.value_stack(yy.tos-2).Tree,
	  Referent => 
yy.value_stack(yy.tos).Tree));
    

when  707 =>
--#line  4554

	
yyval := (One_Tree, Assign_Stmt.Make(
	  Assign_Operator => Assign_Stmt.Move_Op,
	  LHS => 
yy.value_stack(yy.tos-2).Tree,
	  RHS => 
yy.value_stack(yy.tos).Tree));
    

when  708 =>
--#line  4564

      declare
	use type Invocation.Invocation_Kind_Enum;
	Is_Double_Bracket_Special_Case : Boolean := False;
      begin
-- TBD: The following fails at execution time due to a master
--      being init'ed in a short-circuit, and then finalized
--      outside the short-circuit:
-- 	if Lists.Length($2.List) = 1 and then
-- 	  Tree_Of(Lists.Nth_Element($2.List, 1)) in Invocation.Tree and then
-- 	  Invocation.Tree(Tree_Of(Lists.Nth_Element($2.List, 1))).Kind = 
-- 	    Invocation.Container_Aggregate and then
-- 	  Is_Null(Invocation.Tree(
-- 	    Tree_Of(Lists.Nth_Element($2.List, 1))).Prefix) then

	if Lists.Length(
yy.value_stack(yy.tos-1).List) = 1 then
	  declare
	    Solo_Operand : PSC.Trees.Tree'Class renames 
	      Tree_Ptr_Of(Lists.Nth_Element(
yy.value_stack(yy.tos-1).List, 1)).all;
	  begin
	    if Solo_Operand in Invocation.Tree
              and then Invocation.Tree (Solo_Operand).Kind = 
		Invocation.Container_Aggregate
              and then
                Lists.Length (Invocation.Tree (Solo_Operand).Operands) = 1
              and then Is_Null(Invocation.Tree (Solo_Operand).Prefix)
            then
		-- We have the special case of "[[...]]"
		Is_Double_Bracket_Special_Case := True;
	    end if;
	  end;
	end if;

	if Is_Double_Bracket_Special_Case then

	    -- [[...]] is a special case, and invokes the "meaning" op.
	    -- TBD: Should we recognize this later as part of name resolution?

	    
yyval := (One_Tree, Unary.Make(Unary.Meaning_Op,
	      Operand => 
		Lists.Nth_Element(Invocation.Tree(
		  Tree_Ptr_Of
                    (Lists.Nth_Element(
yy.value_stack(yy.tos-1).List, 1)).all).Operands, 1)));
	else
	    -- Normal case of [...], create an invocation node.
	    
yyval := (One_Tree, Invocation.Make(
	      Kind => Invocation.Container_Aggregate,
	      Prefix => Null_Optional_Tree,
	      Operands => 
yy.value_stack(yy.tos-1).List,
	      Source_Pos => 
yy.value_stack(yy.tos-2).Source_Pos));
	end if;
      end;
    

when  709 =>
--#line  4617

	-- Type of result specified
      declare
	use type Invocation.Invocation_Kind_Enum;
	Is_Double_Bracket_Special_Case : Boolean := False;
      begin
	if Lists.Length(
yy.value_stack(yy.tos-1).List) = 1 then
	  declare
	    Solo_Operand : PSC.Trees.Tree'Class renames 
	      Tree_Ptr_Of(Lists.Nth_Element(
yy.value_stack(yy.tos-1).List, 1)).all;
	  begin
	    if Solo_Operand in Invocation.Tree
              and then
	        Invocation.Tree(Solo_Operand).Kind = 
		  Invocation.Container_Aggregate
              and then
                Lists.Length (Invocation.Tree (Solo_Operand).Operands) = 1
              and then
	        Is_Null(Invocation.Tree(Solo_Operand).Prefix)
            then
		-- We have the special case of "[[...]]"
		Is_Double_Bracket_Special_Case := True;
	    end if;
	  end;
	end if;

	if Is_Double_Bracket_Special_Case then

	    -- Type::[[...]] invokes the (binary) "meaning" op.

	    
yyval := (One_Tree, Binary.Make(Binary.Meaning_Op,
	      Left_Operand => 
yy.value_stack(yy.tos-4).Tree,
	      Right_Operand => 
		Lists.Nth_Element(Invocation.Tree(
		  Tree_Ptr_Of
                    (Lists.Nth_Element(
yy.value_stack(yy.tos-1).List, 1)).all).Operands, 1)));
	else
	    -- Normal case of Type::[...], create an invocation node.
	    
yyval := (One_Tree, Invocation.Make(
	      Kind => Invocation.Container_Aggregate,
	      Prefix => 
yy.value_stack(yy.tos-4).Tree,
	      Operands => 
yy.value_stack(yy.tos-1).List,
              Source_Pos => 
yy.value_stack(yy.tos-2).Source_Pos));
	end if;
      end;
    

when  710 =>
--#line  4666
 
yyval := 
yy.value_stack(yy.tos); 

when  711 =>
--#line  4667

	
yyval := (One_List, Lists.Make((1 => 
yy.value_stack(yy.tos).Tree)));
    

when  712 =>
--#line  4670

	
yyval := (One_List, Lists.Empty_List);
    

when  713 =>
--#line  4676

	
yyval := (One_List, Lists.Make((1 => 
yy.value_stack(yy.tos).Tree)));
    

when  714 =>
--#line  4679

	
yyval := 
yy.value_stack(yy.tos-2);
	Lists.Append(
yyval.List, 
yy.value_stack(yy.tos).Tree);
    

when  715 =>
--#line  4686
 
yyval := 
yy.value_stack(yy.tos); 

when  716 =>
--#line  4687

	
yyval := (One_Tree, Reference.Make(
	  Key => 
yy.value_stack(yy.tos-2).Tree,
	  Referent => 
yy.value_stack(yy.tos).Tree));
    

when  717 =>
--#line  4692

	
yyval := (One_Tree, Reference.Make(
	  Key => 
yy.value_stack(yy.tos-2).Tree,
	  Referent => 
yy.value_stack(yy.tos).Tree));
    

when  718 =>
--#line  4698

	-- This gives an ID to an expression which can be used
	-- to parameterize the initial value expression for each element.
        -- TBD: Allow nested iterators, e.g.:
        --        [for I in 1..10 => for J in 1..10 => I + J]
        --      In such nested iterators, unless there is a "<|=" operator,
        --      number of keys must match number of "index" parameters in
        --      "var_indexing" operator.  If only the last iterator
        --      has an explicit key specified, then that is treated as
        --      the single index into "var_indexing."
      declare
        Value : Optional_Tree := 
yy.value_stack(yy.tos).Tree;
        use type PSC.Strings.U_String;
      begin
        if Not_Null(
yy.value_stack(yy.tos-2).Tree) then
           -- User has specified a key for the element
           Value := Reference.Make(
             Key => 
yy.value_stack(yy.tos-2).Tree,
             Referent => Value);
        end if;

        if 
yy.value_stack(yy.tos-3).Str /= PSC.Strings.Null_U_String then
            --  Record "forward" or "reverse" ("forward" is the default)
            Iterator.Add_Direction(
yy.value_stack(yy.tos-5).Tree, 
yy.value_stack(yy.tos-3).Str);
        end if;

        
yyval := (One_Tree, For_Loop_Construct.Make(
          Source_Pos => 
yy.value_stack(yy.tos-6).Source_Pos,
          Kind => For_Loop_Construct.Container_Comprehension,
          Iterators => Lists.Make((1 => 
yy.value_stack(yy.tos-5).Tree)),
          Filter => 
yy.value_stack(yy.tos-4).List,
          Loop_Body => Value));
        Set_Source_Pos(
yyval.Tree, Source_Pos => 
yy.value_stack(yy.tos-6).Source_Pos);
      end;
    

when  719 =>
--#line  4736

        
yyval := (One_Tree, Null_Optional_Tree);
    

when  720 =>
--#line  4740

        
yyval := 
yy.value_stack(yy.tos);
    

when  721 =>
--#line  4746
 
yyval := 
yy.value_stack(yy.tos); 

when  722 =>
--#line  4747
 
yyval := 
yy.value_stack(yy.tos); 

when  723 =>
--#line  4753

	
yyval := (One_Tree, Conditional.Make(Kind => Conditional.If_Expr,
          Source_Pos => 
yy.value_stack(yy.tos-4).Source_Pos,
	  Cond => 
yy.value_stack(yy.tos-3).Tree,
	  Then_Part => 
yy.value_stack(yy.tos-1).Tree,
	  Else_Part => 
yy.value_stack(yy.tos).Tree));
	Set_Source_Pos(
yyval.Tree, Source_Pos => 
yy.value_stack(yy.tos-4).Source_Pos);
    

when  724 =>
--#line  4765

	
yyval := (One_Tree, Conditional.Make(Kind => Conditional.Elsif_Expr,
          Source_Pos => 
yy.value_stack(yy.tos-4).Source_Pos,
	  Cond => 
yy.value_stack(yy.tos-3).Tree,
	  Then_Part => 
yy.value_stack(yy.tos-1).Tree,
	  Else_Part => 
yy.value_stack(yy.tos).Tree));
	Set_Source_Pos(
yyval.Tree, Source_Pos => 
yy.value_stack(yy.tos-4).Source_Pos);
    

when  725 =>
--#line  4773

	
yyval := 
yy.value_stack(yy.tos);
    

when  726 =>
--#line  4776

	
yyval := (One_Tree, Null_Optional_Tree);
    

when  727 =>
--#line  4784

	
yyval := (One_Tree, Case_Construct.Make(
          Source_Pos => 
yy.value_stack(yy.tos-3).Source_Pos,
	  Case_Selector => 
yy.value_stack(yy.tos-2).Tree,
	  Case_Alt_List => 
yy.value_stack(yy.tos).List,
          Is_Case_Expr => True));
	Set_Source_Pos(
yyval.Tree, Source_Pos => 
yy.value_stack(yy.tos-3).Source_Pos);
    

when  728 =>
--#line  4795

	
yyval := (One_List, Lists.Make((1 => 
yy.value_stack(yy.tos).Tree)));
    

when  729 =>
--#line  4798

	
yyval := 
yy.value_stack(yy.tos-2);
	Lists.Append(
yyval.List, 
yy.value_stack(yy.tos).Tree);
    

when  730 =>
--#line  4805

	
yyval := (One_Tree, Reference.Make(
	  Key => Invocation.Make(Invocation.Container_Aggregate,
	    Prefix => Null_Optional_Tree,
	    Operands => Lists.Make((1 => 
yy.value_stack(yy.tos-2).Tree))),
	  Referent => 
yy.value_stack(yy.tos).Tree));
    

when  731 =>
--#line  4812

	-- NOTE: "others" alternative must come last
	
yyval := (One_Tree, Reference.Make(
	  Key => Invocation.Make(Invocation.Container_Aggregate,
	    Prefix => Null_Optional_Tree,
	    Operands => Lists.Make((1 => 
yy.value_stack(yy.tos-2).Tree))),
	  Referent => 
yy.value_stack(yy.tos).Tree));
    

when  732 =>
--#line  4824

	declare
	    Kind_Of_For_Loop: constant array(Boolean) of 
	      For_Loop_Construct.For_Loop_Kind_Enum := (
		False => For_Loop_Construct.Existential_Quantified_Expr,
		True => For_Loop_Construct.Univ_Quantified_Expr);
	begin
	    
yyval := (One_Tree, For_Loop_Construct.Make(
              Source_Pos => 
yy.value_stack(yy.tos-5).Source_Pos,
	      Kind => Kind_Of_For_Loop(
yy.value_stack(yy.tos-4).Is_Present),
	      Iterators => Lists.Make((1 => 
yy.value_stack(yy.tos-3).Tree)),
	      Filter => 
yy.value_stack(yy.tos-2).List,
	      Loop_Body => 
yy.value_stack(yy.tos).Tree));
            Set_Source_Pos(
yyval.Tree, Source_Pos => 
yy.value_stack(yy.tos-5).Source_Pos);
	end;
    

when  733 =>
--#line  4841

        -- This is a set iterator without the set, meaning it applies
        -- to all values of the given type, even if the type lacks
        -- a "universal" set.
     declare
        Obj_Type : Optional_Tree := 
yy.value_stack(yy.tos-2).Tree;
     begin
        if Is_Null (Obj_Type) then
           --  Presume id is the type name when not both specified.
           Obj_Type := 
yy.value_stack(yy.tos-3).Tree;
        end if;

        if not 
yy.value_stack(yy.tos-4).Is_Present then
           yyerror ("Must specify ""for all [E : ] T"" or " &
             """for all/some E in/of Container"" in quantified expression",
             At_Token => 
yy.value_stack(yy.tos-3));
        end if;

        
yyval := (One_Tree, For_Loop_Construct.Make(
          Source_Pos => 
yy.value_stack(yy.tos-5).Source_Pos,
          Kind => For_Loop_Construct.Univ_Quantified_Expr,
          Iterators => Lists.Make((1 =>
            Iterator.Make(
              Kind => Iterator.Set_Iterator,
              Name => PSC.Trees.Identifier.Tree(Tree_Of(
yy.value_stack(yy.tos-3).Tree)),
              Is_Ref => False,
              Obj_Type => Obj_Type,
              Obj_Value => Null_Optional_Tree))),
          Filter => Lists.Empty_List,
          Loop_Body => 
yy.value_stack(yy.tos).Tree));
        Set_Source_Pos(
yyval.Tree, Source_Pos => 
yy.value_stack(yy.tos-5).Source_Pos);
     end;
    

when  734 =>
--#line  4875

        -- This is a set iterator without the set, meaning it applies
        -- to all values of the given type, even if the type lacks
        -- a "universal" set.
     declare
        Obj_Type : Optional_Tree := 
yy.value_stack(yy.tos-3).Tree;
     begin
        if Is_Null (Obj_Type) then
           --  Presume id is the type name when not both specified.
           Obj_Type := 
yy.value_stack(yy.tos-4).Tree;
        end if;

        if not 
yy.value_stack(yy.tos-5).Is_Present then
           yyerror ("Must specify ""for all [E :] T"" or " &
             """for all/some E in/of Container"" in quantified expression",
             At_Token => 
yy.value_stack(yy.tos-4));
        end if;

        
yyval := (One_Tree, For_Loop_Construct.Make(
          Source_Pos => 
yy.value_stack(yy.tos-6).Source_Pos,
          Kind => For_Loop_Construct.Univ_Quantified_Expr,
          Iterators => Lists.Make((1 =>
            Iterator.Make(
              Kind => Iterator.Set_Iterator,
              Name => PSC.Trees.Identifier.Tree(Tree_Of(
yy.value_stack(yy.tos-4).Tree)),
              Is_Ref => False,
              Obj_Type => Obj_Type,
              Obj_Value => Null_Optional_Tree))),
          Filter => 
yy.value_stack(yy.tos-2).List,
          Loop_Body => 
yy.value_stack(yy.tos).Tree));
        Set_Source_Pos(
yyval.Tree, Source_Pos => 
yy.value_stack(yy.tos-6).Source_Pos);
     end;
    

when  735 =>
--#line  4911
 
yyval := 
yy.value_stack(yy.tos); 

when  736 =>
--#line  4912
 
yyval := 
yy.value_stack(yy.tos); 

when  737 =>
--#line  4913
 
yyval := 
yy.value_stack(yy.tos); 

when  738 =>
--#line  4917
 
yyval := (Optional, True); 

when  739 =>
--#line  4918
 
yyval := (Optional, False); 

when  740 =>
--#line  4922
 
yyval := 
yy.value_stack(yy.tos); 

when  741 =>
--#line  4923
 
yyval := 
yy.value_stack(yy.tos); 

when  742 =>
--#line  4924
 
yyval := 
yy.value_stack(yy.tos); 

when  743 =>
--#line  4929

	-- This does a map/reduce operation where the initial/next result
        -- is given in <...> and the overall expression represents the
        -- reduction to be performed on each element.
      declare
        use type PSC.Strings.U_String;
      begin
        if 
yy.value_stack(yy.tos-2).Str /= PSC.Strings.Null_U_String then
            --  Record "forward" or "reverse" ("unordered" is the default)
            Iterator.Add_Direction(
yy.value_stack(yy.tos-4).Tree, 
yy.value_stack(yy.tos-2).Str);
        end if;

        
yyval := (One_Tree, For_Loop_Construct.Make(
          Source_Pos => 
yy.value_stack(yy.tos-5).Source_Pos,
          Kind => For_Loop_Construct.Map_Reduce_Expr,
          Iterators => Lists.Make((1 => 
yy.value_stack(yy.tos-4).Tree)),
          Filter => 
yy.value_stack(yy.tos-3).List,
          Loop_Body => 
yy.value_stack(yy.tos).Tree));
        Set_Source_Pos(
yyval.Tree, Source_Pos => 
yy.value_stack(yy.tos-5).Source_Pos);
      end;
    

when  744 =>
--#line  4953
 
yyval := 
yy.value_stack(yy.tos); 

when  745 =>
--#line  4954
 
yyval := 
yy.value_stack(yy.tos); 

when  746 =>
--#line  4955
 
yyval := 
yy.value_stack(yy.tos); 

                    when others => null;
                end case;


            -- Pop RHS states and goto next state
            yy.tos      := yy.tos - rule_length(yy.rule_id) + 1;
            if yy.tos > yy.stack_size then
                text_io.put_line(" Stack size exceeded on state_stack");
                raise yy_Tokens.syntax_error;
            end if;
            yy.state_stack(yy.tos) := goto_state(yy.state_stack(yy.tos-1) ,
                                 get_lhs_rule(yy.rule_id));

              yy.value_stack(yy.tos) := yyval;

            if yy.debug then
                reduce_debug(yy.rule_id,
                    goto_state(yy.state_stack(yy.tos - 1),
                               get_lhs_rule(yy.rule_id)));
            end if;

        end if;


    end loop;


end yyparse;

end Ada202x_Parser;
