------------------------------------------------------------------------------
--                              P A R A S A I L                             --
--                                                                          --
--                     Copyright (C) 2012-2019, AdaCore                     --
--                                                                          --
-- This is free software;  you can redistribute it  and/or modify it  under --
-- terms of the  GNU General Public License as published  by the Free Soft- --
-- ware  Foundation;  either version 3,  or (at your option) any later ver- --
-- sion.  This software is distributed in the hope  that it will be useful, --
-- but WITHOUT ANY WARRANTY;  without even the implied warranty of MERCHAN- --
-- TABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public --
-- License for  more details.  You should have  received  a copy of the GNU --
-- General  Public  License  distributed  with  this  software;   see  file --
-- COPYING3.  If not, go to http://www.gnu.org/licenses for a complete copy --
-- of the license.                                                          --
--                                                                          --
-- The ParaSail language and implementation were originally developed by    --
-- S. Tucker Taft.                                                          --
------------------------------------------------------------------------------

with PSC.Stream_Output;
with PSC.Trees.Annotation;
with PSC.Trees.Visitor;
with PSC.Trees.Iterator;
with PSC.Trees.Reference;
package body PSC.Trees.For_Loop_Construct is

   --------  Visible subprograms  ---------

   function Make
     (Source_Pos : Source_Positions.Source_Position;
      Kind : For_Loop_Kind_Enum;
      Iterators : Lists.List;
      Filter : Lists.List;
      Loop_Body : Optional_Tree;
      Direction : Strings.U_String := Strings.Null_U_String;
      Chunk_Spec : Optional_Tree := Null_Optional_Tree;
      End_With_Values : Optional_Tree := Null_Optional_Tree;
      Label : Optional_Tree := Null_Optional_Tree;
      Check_Label : Boolean := True)
      return Optional_Tree
   is
      Filtering_Annotation : Optional_Tree := Null_Optional_Tree;
      Result : Optional_Tree;
   begin
      if not Lists.Is_Empty (Filter) then
         --  Create the filtering annotation
         Filtering_Annotation := Annotation.Make (Filter);
      end if;

      Result := Optional
               (Tree'(Trees.Tree with
                      Kind => Kind,
                      Iterators => Iterators,
                      Filter => Filtering_Annotation,
                      Loop_Body => Loop_Body,
                      Direction => Direction,
                      Chunk_Spec => Chunk_Spec,
                      End_With_Values => End_With_Values,
                      Label => Label,
                      Check_Label => Check_Label));

      Set_Source_Pos (Result, Source_Pos);
      return Result;
   end Make;

   function Replace_Body
     (Original : Tree; New_Body : Optional_Tree) return Optional_Tree is
   --  Create a For_Loop_Construct identical to Original except for new body.
   begin
      return Optional
               (Tree'(Trees.Tree with
                      Kind => Original.Kind,
                      Iterators => Original.Iterators,
                      Filter => Original.Filter,
                      Loop_Body => New_Body,
                      Direction => Original.Direction,
                      Chunk_Spec => Original.Chunk_Spec,
                      End_With_Values => Original.End_With_Values,
                      Label => Original.Label,
                      Check_Label => Original.Check_Label));
   end Replace_Body;

   function Num_Operands (T : Tree) return Natural is
   --  Return number of operands of given Tree
   begin
      return Lists.Length (T.Iterators) +
             1 +
             Boolean'Pos (Not_Null (T.End_With_Values));
   end Num_Operands;

   function Nth_Operand (T : Tree; N : Positive) return Optional_Tree is
      --  Return Nth operand of given Tree
      Num_Iters : constant Natural := Lists.Length (T.Iterators);
      pragma Assert (N <= Num_Operands (T));
   begin
      if N <= Num_Iters then
         return Lists.Nth_Element (T.Iterators, N);
      elsif N = Num_Iters + 1 then
         return T.Loop_Body;
      else
         return T.End_With_Values;
      end if;
   end Nth_Operand;

   procedure Set_Nth_Operand
     (T : in out Tree;
      N : Positive;
      New_Operand : Optional_Tree) is
      --  Set Nth operand of given Tree
      Num_Iters : constant Natural := Lists.Length (T.Iterators);
      pragma Assert (N <= Num_Operands (T));
   begin
      if N <= Num_Iters then
         T.Iterators :=
            Lists.Replace_Nth_Element (T.Iterators, N, New_Operand);
      elsif N = Num_Iters + 1 then
         T.Loop_Body := New_Operand;
      else
         T.End_With_Values := New_Operand;
      end if;
   end Set_Nth_Operand;

   procedure Display_Subtree
     (T : Tree;
      On : access Ada.Streams.Root_Stream_Type'Class;
      Indent : Natural := 0;
      Use_Short_Form : Boolean := False) is
      --  Produce a human readable display of a subtree, at the given indent
      --  If Use_Short_Form is True, then elide some of the output for
      --  a module or an operation.
      use PSC.Stream_Output;
      use PSC.Trees.Iterator;
      use type PSC.Strings.U_String;

      function Each_If_Needed (Iter : Optional_Tree) return String is
      --  Return "each" if Iter is a For-Each style of iterator and
      --  for-loop is not a quantified expr.
      begin
         if T.Kind in Quantified_Expr_Kinds then
            return "";
         else
            case Iterator.Tree (Tree_Of (Iter)).Kind is
               when Each_Value | Each_Key_Value =>
                  return "each ";
               when others =>
                  return "";
            end case;
         end if;
      end Each_If_Needed;

   begin  --  Display_Subtree
      case T.Kind is
         when Univ_Quantified_Expr | Existential_Quantified_Expr |
           Map_Reduce_Expr =>
            --  Quantified expression or map-reduce expression
            pragma Assert (Is_Null (T.Label));
            pragma Assert (Is_Null (T.End_With_Values));
            pragma Assert (T.Kind = Map_Reduce_Expr
                           or else Lists.Length (T.Iterators) = 1);

            Put (On, "(for ");
            case T.Kind is
               when Univ_Quantified_Expr =>
                  Put (On, "all ");
               when Existential_Quantified_Expr =>
                  Put (On, "some ");
               when Map_Reduce_Expr => null;
                  if Lists.Length (T.Iterators) = 1 then
                     Put (On, Each_If_Needed
                       (Lists.Nth_Element (T.Iterators, 1)));
                  end if;
               when others =>
                  pragma Assert (False); null;
            end case;
            if Lists.Length (T.Iterators) = 1 then
               Display_Subtree (Lists.Nth_Element (T.Iterators, 1), On);
            else
               Put (On, "(");
               for I in 1 .. Lists.Length (T.Iterators) loop
                  declare
                     Iter : constant Optional_Tree :=
                       Lists.Nth_Element (T.Iterators, I);
                  begin
                     if I > 1 then
                        Put (On, "; ");
                     end if;
                     Put (On, Each_If_Needed (Iter));
                     Display_Subtree (Iter, On);
                  end;
               end loop;
               Put (On, ")");
            end if;
            if Not_Null (T.Filter) then
               Display_Subtree (T.Filter, On);
            end if;
            if T.Direction /= Strings.Null_U_String then
               Put (On, ' ');
               Put (On, Strings.To_String (T.Direction));
            end if;
            Put (On, " => ");
            if Use_Short_Form then
               Put (On, "... ");
            else
               if Indent > 0 then
                  New_Line (On, Indent => Indent + 2);
               end if;
               Display_Subtree (T.Loop_Body, On);
            end if;
            Put (On, ")");

         when Container_Comprehension =>
            --  [for I ... => expr]
            declare
               Loop_Body_Tree : Trees.Tree'Class renames
                 Tree_Ptr_Of (T.Loop_Body).all;
               Iter : constant Optional_Tree :=
                 Lists.Nth_Element (T.Iterators, 1);
            begin
               pragma Assert (Is_Null (T.Label));
               pragma Assert (Is_Null (T.End_With_Values));
               pragma Assert (Lists.Length (T.Iterators) = 1);

               Put (On, "for ");
               Put (On, Each_If_Needed (Iter));
               Display_Subtree (Iter, On);
               if Not_Null (T.Filter) then
                  Display_Subtree (T.Filter, On);
               end if;
               if T.Direction /= Strings.Null_U_String then
                  Put (On, ' ');
                  Put (On, Strings.To_String (T.Direction));
               end if;

               if Loop_Body_Tree in Reference.Tree then
                  --  A key was specified to use instead of loop parameter
                  --  So display, e.g. "for I in 1..10, I*2 => I**2"
                  Put (On, ", ");
               else
                  Put (On, " => ");
               end if;
               if Use_Short_Form then
                  Put (On, "... ");
               else
                  if Indent > 0 then
                     New_Line (On, Indent => Indent + 2);
                  end if;
                  Display_Subtree (T.Loop_Body, On);
               end if;
            end;

         when For_Loop_Statement =>
            --  For-Loop Statement
            if Not_Null (T.Label) then
               --  Put out label at indent-1 after a blank line
               New_Line (On, Indent => Indent - 1);
               Put (On, '*');
               Display_Subtree (T.Label, On);
               Put_Line (On, "*");
            end if;
            if Not_Null (T.Chunk_Spec) then
               --  Ada 202X chunking specification
               Put_Indent (On, Indent);
               Put (On, "parallel (");
               Display_Subtree (T.Chunk_Spec, On);
               Put_Line (On, ")");
            end if;
            Put_Indent (On, Indent);
            Put (On, "for ");
            if Lists.Length (T.Iterators) > 1 then
               --  We have multiple iterators, surround in "()"
               Put (On, "(");
               Lists.Display_List
                 (T.Iterators,
                  On,
                  Separator => ";",
                  Indent => Indent + 5);
               --  TBD: "each" won't be printed out where appropriate
               Put (On, ")");
            else
               --  Just one iterator, check for need to display "each"
               declare
                  Single_Iterator : constant Optional_Tree :=
                    Lists.Nth_Element (T.Iterators, 1);
               begin
                  Put (On, Each_If_Needed (Single_Iterator));
                  Display_Subtree (Single_Iterator, On);
               end;
            end if;
            if Not_Null (T.Filter) then
               Put (On, ' ');
               Display_Subtree (T.Filter, On);
            end if;
            if T.Direction /= Strings.Null_U_String
              and then Is_Null (T.Chunk_Spec)
            then
               Put (On, ' ');
               Put (On, Strings.To_String (T.Direction));
            end if;
            if Use_Short_Form then
               Put_Line (On, " loop ...");
               return;
            end if;

            Put_Line (On, " loop");
            Display_Subtree (T.Loop_Body, On, Indent => Indent + 4);
            New_Line (On, Indent => Indent);
            Put (On, "end loop");
            if Not_Null (T.Label) then
               Put (On, ' ');
               Display_Subtree (T.Label, On);
            end if;
            if Not_Null (T.End_With_Values) then
               New_Line (On, Indent => Indent + 2);
               Put (On, "with ");
               Display_Subtree (T.End_With_Values, On);
            end if;
      end case;
   end Display_Subtree;

   use PSC.Trees.Visitor;

   procedure Visit (T : Tree; Visitor : in out Root_RO_Tree_Visitor'Class) is
   --  Call appropriate RO *_Action procedure on Visitor
   begin
      For_Loop_Construct_Action (RO_Tree_Visitor'Class (Visitor), T);
   end Visit;

   procedure Visit
     (T : in out Tree;
      Visitor : in out Root_RW_Tree_Visitor'Class) is
   --  Call appropriate RW *_Action procedure on Visitor
   begin
      For_Loop_Construct_Action (RW_Tree_Visitor'Class (Visitor), T);
   end Visit;

   function Find_Source_Pos
     (T : Tree)
      return Source_Positions.Source_Position
   is
      --  Walk into tree to try to find a meaningful source position
      use Source_Positions;
      T_Source_Pos : Source_Position := T.Source_Pos;
   begin
      if T_Source_Pos = Null_Source_Position then
         if Lists.Length (T.Iterators) > 0 then
            T_Source_Pos :=
               Find_Source_Pos (Lists.Nth_Element (T.Iterators, 1));
         end if;
         if T_Source_Pos = Null_Source_Position then
            T_Source_Pos := Find_Source_Pos (T.Loop_Body);
         end if;
         if T_Source_Pos = Null_Source_Position then
            T_Source_Pos := Find_Source_Pos (T.Label);
         end if;
      end if;

      return T_Source_Pos;
   end Find_Source_Pos;

end PSC.Trees.For_Loop_Construct;
