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

generic
   type Element_Type is private;
package PSC.Vectors is

   --  Extensible Vector of elements

   Max_Elem_Index : constant := 1_000_000;
   --  Max number of elements in a vector

   type Elem_Index is range 0 .. Max_Elem_Index;

   No_Elem_Index : constant Elem_Index := 0;

   type Vector is private;
   --  Vector of elements

   function Num_Elements (Vec : Vector) return Elem_Index;
   --  Return number of Elements in Vec

   procedure Add_Element
     (Vec : in out Vector;
      Elem : Element_Type;
      Index : out Elem_Index);
   --  Add Element to Vector and return its Index

   function Nth_Element
     (Vec : Vector;
      Index : Elem_Index)
      return Element_Type;
   --  Retrieve Element at given index.

   procedure Set_Nth_Element
     (Vec : in out Vector;
      Index : Elem_Index;
      Elem : Element_Type);
   --  Overwrite nth element.

private

   type Vector_Rec;  --  completed in package body
   type Vector_Ptr is access Vector_Rec;

   type Vector is record
      Count : Elem_Index := 0;  --  Count of Vectors in list
      Data : Vector_Ptr;     --  actual list of Vectors
   end record;

end PSC.Vectors;
