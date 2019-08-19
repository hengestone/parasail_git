------------------------------------------------------------------------------
--                              P A R A S A I L                             --
--                                                                          --
--                     Copyright (C) 2012-2015, AdaCore                     --
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
package Generic_Lists is

   --  Lists of tree nodes, useful for statement sequences, etc.

   type List is private;
   --  A possibly empty list

   function Length (L : List) return Natural;
   --  Length of list

   function Nth_Element (L : List; N : Positive) return Element_Type;
   --  Return Nth element of list.
   --  Requires N <= Length(L)

   procedure Append (L : in out List; Element : Element_Type);
   --  Add element to end of list

   procedure Append (L : in out List; Tail : List);
   --  Add list to end of list

   type Element_Array is array (Positive range <>) of Element_Type;

   function Make (Elements : Element_Array) return List;
   --  Create list out of element array

   function Empty_List return List;
   --  Create empty list

   generic
      with procedure Action (Elem : Element_Type);
   procedure Apply_To_List (L : List);
   --  Apply Action to all elements of list

   generic
      with procedure Action (Elem : in out Element_Type);
   procedure Apply_To_List_RW (L : in out List);
   --  Apply RW Action to all elements of list

   generic
      type Result_Type is private;
      with function New_Result (Old_Result : Result_Type;
                                Next_Elem  : Element_Type) return Result_Type;
      Initial_Result : Result_Type;
      Quit_On_Result : Result_Type;
   function Apply_Function (L : List) return Result_Type;
   --  Iterate through List applying
   --  "New_Result" function to Old_Result and next Elem.
   --  Start with Old_Result being Initial_Result.
   --  Quit as soon as New_Result returns Quit_On_Result.
   --  Requires: Initial_Result /= Quit_On_Result;
   --           List must not be altered by New_Result

private

   type List_Element;
   type List_Element_Ptr is access List_Element;

   type List_Element is record
   --  An element of a list
      Item : Element_Type;
      Next : List_Element_Ptr;
   end record;

   type List is record
   --  The header of a list
      First : List_Element_Ptr := null;
      Last : List_Element_Ptr := null;
      Length : Natural := 0;
   end record;

end Generic_Lists;
