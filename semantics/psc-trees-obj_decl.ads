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

with PSC.Trees.Identifier;
with PSC.Trees.Qualified_Name;
with PSC.Trees.Lists;
package PSC.Trees.Obj_Decl is
   --  Representation for a declaration of an object

   use Lists;

   type Tree is new Trees.Tree with record
      Name : Identifier.Tree;
      Is_Var : Boolean := False;
      Is_Const : Boolean := False;
      Is_Ref : Boolean := False;
      Is_Optional : Boolean := False;
      Is_Move : Boolean := False;
      In_Region : Optional_Tree;
      Obj_Type : Optional_Tree;
      Obj_Value : Optional_Tree;
   end record;

   function Make
     (Name : Identifier.Tree;
      Is_Var : Boolean;
      Is_Const : Boolean;
      Is_Ref : Boolean;
      Is_Optional : Boolean;
      Obj_Type : Optional_Tree;
      Obj_Value : Optional_Tree;
      In_Region : Optional_Tree := Null_Optional_Tree;
      Is_Move : Boolean := False)
      return Optional_Tree;
   --  Build up an object declaration

   function Num_Operands (T : Tree) return Natural;
   --  Return number of operands of given Tree

   function Nth_Operand (T : Tree; N : Positive) return Optional_Tree;
   --  Return Nth operand of given Tree

   procedure Set_Nth_Operand
     (T : in out Tree;
      N : Positive;
      New_Operand : Optional_Tree);
   --  Set Nth operand of given Tree

   procedure Display_Subtree
     (T : Tree;
      On : access Ada.Streams.Root_Stream_Type'Class;
      Indent : Natural := 0;
      Use_Short_Form : Boolean := False);
   --  Produce a human readable display of a subtree, at the given indent
   --  If Use_Short_Form is True, then elide some of the output for
   --  a module or an operation.

   procedure Visit (T : Tree; Visitor : in out Root_RO_Tree_Visitor'Class);
   --  Call appropriate RO *_Action procedure on Visitor

   procedure Visit
     (T : in out Tree;
      Visitor : in out Root_RW_Tree_Visitor'Class);
   --  Call appropriate RW *_Action procedure on Visitor

   function Find_Source_Pos
     (T : Tree)
      return Source_Positions.Source_Position;
   --  Walk into tree to try to find a meaningful source position

end PSC.Trees.Obj_Decl;
