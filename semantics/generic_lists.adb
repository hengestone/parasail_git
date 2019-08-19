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

package body Generic_Lists is

   --  Lists of elements

   function Length (L : List) return Natural is
      --  Length of list
      Count : Natural := 0;
      Elem : List_Element_Ptr := L.First;
   begin
      while Elem /= null loop
         Count := Count + 1;
         Elem := Elem.Next;
      end loop;
      return Count;
   end Length;

   function Nth_Element (L : List; N : Positive) return Element_Type is
      --  Return Nth element of list.
      --  Requires N <= Length(L)
   begin
      if N = L.Length then
         --  Fast path to the last element
         return L.Last.Item;
      else
         --  Skip over the preceding elements
         declare
            Elem : List_Element_Ptr := L.First;
            pragma Assert (Elem /= null);
         begin
            for I in 2 .. N loop
               Elem := Elem.Next;
               pragma Assert (Elem /= null);
            end loop;

            return Elem.Item;
         end;
      end if;
   end Nth_Element;

   procedure Append (L : in out List; Element : Element_Type) is
      --  Add element to end of list
      New_Element : constant List_Element_Ptr :=
        new List_Element'(Item => Element, Next => null);
   begin
      if L.Last = null then
         --  This is the first element
         L.First := New_Element;
      else
         --  Append to end
         L.Last.Next := New_Element;
      end if;
      --  New last element
      L.Last := New_Element;
      L.Length := L.Length + 1;
   end Append;

   procedure Append (L : in out List; Tail : List) is
   --  Add list to end of list
   begin
      --  Just do it one at a time...
      for I in 1 .. Length (Tail) loop
         Append (L, Nth_Element (Tail, I));
      end loop;
   end Append;

   function Make (Elements : Element_Array) return List is
      --  Create list out of element array
      Result : List;
   begin
      for I in Elements'Range loop
         Append (Result, Elements (I));
      end loop;
      return Result;
   end Make;

   function Empty_List return List is
   --  Create empty list
   begin
      return List'(First => null, Last => null, Length => 0);
   end Empty_List;

   procedure Apply_To_List (L : List) is
      --  Apply Action to all elements of list
      Elem : List_Element_Ptr := L.First;
   begin
      while Elem /= null loop
         Action (Elem.Item);
         Elem := Elem.Next;
      end loop;
   end Apply_To_List;

   procedure Apply_To_List_RW (L : in out List) is
      --  Apply RW Action to all elements of list
      Elem : List_Element_Ptr := L.First;
   begin
      while Elem /= null loop
         Action (Elem.Item);
         Elem := Elem.Next;
      end loop;
   end Apply_To_List_RW;

   function Apply_Function (L : List) return Result_Type is
      --  Iterate through List applying
      --  "New_Result" function to Old_Result and next Elem.
      --  Start with Old_Result being Initial_Result.
      --  Quit as soon as New_Result returns Quit_On_Result.
      --  Requires: Initial_Result /= Quit_On_Result;
      --           List must not be altered by New_Result

      pragma Assert (Initial_Result /= Quit_On_Result);
      Result : Result_Type := Initial_Result;
      Elem : List_Element_Ptr := L.First;
   begin
      while Elem /= null loop
         Result := New_Result (Result, Elem.Item);

         exit when Result = Quit_On_Result;

         Elem := Elem.Next;
      end loop;

      return Result;
   end Apply_Function;

end Generic_Lists;
