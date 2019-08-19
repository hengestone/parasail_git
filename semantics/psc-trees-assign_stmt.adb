------------------------------------------------------------------------------
--                              P A R A S A I L                             --
--                                                                          --
--                     Copyright (C) 2012-2013, AdaCore                     --
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
with PSC.Trees.Visitor;
package body PSC.Trees.Assign_Stmt is

   function Make
     (Assign_Operator : Assign_Operator_Enum;
      LHS : Optional_Tree;
      RHS : Optional_Tree)
      return Optional_Tree
   is
   --  Build up an Assign_Stmt tree.
   begin
      return Optional (Tree'(Trees.Tree with Assign_Operator, LHS, RHS));
   end Make;

   function Num_Operands (T : Tree) return Natural is
   --  Return number of operands of given Tree
   begin
      return 2;
   end Num_Operands;

   function Nth_Operand (T : Tree; N : Positive) return Optional_Tree is
      --  Return Nth operand of given Tree
      pragma Assert (N <= 2);
   begin
      if N = 1 then
         return T.LHS;
      else
         return T.RHS;
      end if;
   end Nth_Operand;

   procedure Set_Nth_Operand
     (T : in out Tree;
      N : Positive;
      New_Operand : Optional_Tree) is
      --  Set Nth operand of given Tree
      pragma Assert (N <= 2);
   begin
      if N = 1 then
         T.LHS := New_Operand;
      else
         T.RHS := New_Operand;
      end if;
   end Set_Nth_Operand;

   function Assign_Operator_Image
     (Assign_Operator : Assign_Operator_Enum)
      return String
   is
   begin
      case Assign_Operator is
      when Assign_Op =>
         return ":=";
      when Plus_Assign_Op =>
         return "+=";
      when Minus_Assign_Op =>
         return "-=";
      when Times_Assign_Op =>
         return "*=";
      when Divide_Assign_Op =>
         return "/=";
      when Power_Assign_Op =>
         return "**=";
      when Combine_Assign_Op =>
         return "|=";
      when Ampersand_Assign_Op =>
         return "&=";
      when And_Assign_Op =>
         return "and=";
      when Or_Assign_Op =>
         return "or=";
      when Xor_Assign_Op =>
         return "xor=";
      when Left_Shift_Assign_Op =>
         return "<<=";
      when Right_Shift_Assign_Op =>
         return ">>=";
      when Swap_Op =>
         return "<=>";
      when Move_Op =>
         return "<==";
      when Combine_Move_Op =>
         return "<|=";
      end case;
   end Assign_Operator_Image;

   function Assign_Operator_Designator
     (Op : Assign_Operator_Enum)
      return Strings.U_String
   is
   --  Return the designator to use when defining an assign operator.
   --  This includes the "" on either side of the operator symbol.
   begin
      return Strings.String_Lookup ('"' & Assign_Operator_Image (Op) & '"');
   end Assign_Operator_Designator;

   procedure Display_Subtree
     (T : Tree;
      On : access Ada.Streams.Root_Stream_Type'Class;
      Indent : Natural := 0;
      Use_Short_Form : Boolean := False) is
      --  Produce a human readable display of a subtree, at the given indent
      --  If Use_Short_Form is True, then elide some of the output for
      --  a module or an operation.
      use PSC.Stream_Output;
   begin
      Put_Indent (On, Indent);
      Display_Subtree (T.LHS, On);
      Put (On, ' ' & Assign_Operator_Image (T.Assign_Operator) & ' ');
      Display_Subtree (T.RHS, On);
   end Display_Subtree;

   use PSC.Trees.Visitor;

   procedure Visit (T : Tree; Visitor : in out Root_RO_Tree_Visitor'Class) is
   --  Call appropriate RO *_Action procedure on Visitor
   begin
      Assign_Stmt_Action (RO_Tree_Visitor'Class (Visitor), T);
   end Visit;

   procedure Visit
     (T : in out Tree;
      Visitor : in out Root_RW_Tree_Visitor'Class) is
   --  Call appropriate RW *_Action procedure on Visitor
   begin
      Assign_Stmt_Action (RW_Tree_Visitor'Class (Visitor), T);
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
         T_Source_Pos := Find_Source_Pos (T.LHS);
         if T_Source_Pos = Null_Source_Position then
            T_Source_Pos := Find_Source_Pos (T.RHS);
         end if;
      end if;

      return T_Source_Pos;
   end Find_Source_Pos;

end PSC.Trees.Assign_Stmt;
