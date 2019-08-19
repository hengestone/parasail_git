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
   type Key_Type is private;
   with function Equiv (Key1, Key2 : Key_Type) return Boolean is "=";
   type Hash_Type is mod <>;
   with function Hash (Key : Key_Type) return Hash_Type;

package PSC.Hash_Tables is

   --  Hash table; indexed by keys, where Equiv compares keys, and Hash
   --  on two Equiv keys must be equal.

   type Element_Ref is access all Element_Type;
   --  Reference to an element in the hash table

   for Element_Ref'Storage_Size use 0;  --  Not for allocation/deallocation

   type Key_Ref is access constant Key_Type;
   --  Reference to a key in the hash table

   for Key_Ref'Storage_Size use 0;  --  Not for allocation/deallocation

   type Hash_Table is private;
   --  Hash table mapping Key => Element

   function Empty_Hash_Table return Hash_Table;
   --  An empty hash table

   function Num_Entries (Table : Hash_Table) return Natural;
   --  Number of entries in hash table.

   procedure Enter_Element
     (Table : in out Hash_Table;
      Key : Key_Type;
      Elem : Element_Type;
      Existing_Elem : out Element_Ref);
   --  Add element to hash table, unless element with same key
   --  already there, in which case Existing_Elem will be set non-null.

   function Find_Element
     (Table : Hash_Table;
      Key : Key_Type)
      return Element_Ref;
   --  Find element in table with given Key.  Return null if not found

   ------- Versions returning key/element pairs -------

   type Pair_Ref is private;
   --  Reference to a key/element pair

   procedure Enter_Element_Pair
     (Table : in out Hash_Table;
      Key : Key_Type;
      Elem : Element_Type;
      Existing_Pair : out Pair_Ref);
   --  Add element to hash table, unless element with same key
   --  already there, in which case Existing_Pair will be set non-null.

   function Find_Element_Pair
     (Table : Hash_Table;
      Key : Key_Type)
      return Pair_Ref;
   --  Find key/element pair in table with given Key.
   --  Return null if not found

   function Key (Pair : Pair_Ref) return Key_Ref;
   --  Return R/O reference to key of pair

   function Element (Pair : Pair_Ref) return Element_Ref;
   --  Return R/W reference to element of pair

   generic
      with procedure Action (Pair : Pair_Ref);
   procedure Iterate (Table : Hash_Table);
   --  Iterate over each entry in the table.

   generic
      with procedure Action (Key : Key_Type; Elem : Element_Type);
   procedure Iterate_And_Remove (Table : in out Hash_Table);
   --  Iterate over the table and remove each entry.
   --  Reclaim the storage occupied by the table.

   procedure Reclaim (Table : in out Hash_Table);
   --  Reclaim the storage occupied by the table.
   --  Leave the table empty.

private

   type Hash_Table_Rec;  --  completed in package body
   type Hash_Table is access Hash_Table_Rec;

   type Hash_Table_Entry;  --  completed in package body
   type Pair_Ref is access all Hash_Table_Entry;

end PSC.Hash_Tables;
