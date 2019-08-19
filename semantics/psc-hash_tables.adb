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

with Ada.Unchecked_Deallocation;
package body PSC.Hash_Tables is

   ------- Hash_Table implementation --------

   Initial_Modulus : constant := 61;  --  A medium-sized prime number

   type Backbone_Index is new Positive;

   type Hash_Table_Entry_Ptr is access Hash_Table_Entry;

   type Hash_Table_Entry is record
      Key : aliased Key_Type;
      Elem : aliased Element_Type;
      Next_Same_Hash : Hash_Table_Entry_Ptr;
   end record;

   type Table_Entry_Array is
     array (Backbone_Index range <>) of Hash_Table_Entry_Ptr;

   type Hash_Table_Rec (Modulus : Backbone_Index) is record
      Backbone : Table_Entry_Array (1 .. Modulus);
      Num_Entries : Natural := 0;
   end record;

   procedure Do_Nothing (Key : Key_Type; Elem : Element_Type) is
   begin
      null;
   end Do_Nothing;

   ------- Visible Subprograms ----------

   function Empty_Hash_Table return Hash_Table is
   --  An empty hash table
   begin
      return null;
   end Empty_Hash_Table;

   function Num_Entries (Table : Hash_Table) return Natural is
   --  Number of entries in hash table.
   begin
      if Table = null then
         return 0;
      else
         return Table.Num_Entries;
      end if;
   end Num_Entries;

   procedure Enter_Element
     (Table : in out Hash_Table;
      Key : Key_Type;
      Elem : Element_Type;
      Existing_Elem : out Element_Ref) is
      --  Add element to hash table, unless element with same key
      --  already there, in which case Existing_Elem will be set non-null.
      Existing_Pair : Pair_Ref;
   begin
      --  Pass the buck to "pair" routine
      Enter_Element_Pair (Table, Key, Elem, Existing_Pair);

      if Existing_Pair /= null then
         Existing_Elem := Existing_Pair.Elem'Access;
      else
         Existing_Elem := null;
      end if;
   end Enter_Element;

   function Find_Element
     (Table : Hash_Table;
      Key : Key_Type)
      return Element_Ref
   is
      --  Find element in table with given Key.  Return null if not found

      Element_Pair : constant Pair_Ref := Find_Element_Pair (Table, Key);
   --  Pass the buck to "pair" routine
   begin
      if Element_Pair /= null then
         --  Found
         return Element_Pair.Elem'Access;
      else
         --  Key not in table
         return null;
      end if;
   end Find_Element;

   procedure Free is new Ada.Unchecked_Deallocation (
      Hash_Table_Entry,
      Hash_Table_Entry_Ptr);

   procedure Free is new Ada.Unchecked_Deallocation (
      Hash_Table_Rec,
      Hash_Table);

   ------- Versions returning key/element pairs -------

   procedure Enter_Element_Pair
     (Table : in out Hash_Table;
      Key : Key_Type;
      Elem : Element_Type;
      Existing_Pair : out Pair_Ref) is
   --  Add element to hash table, unless element with same key
   --  already there, in which case Existing_Pair will be set non-null.
   begin
      if Table = null then
         --  First element in table
         Table := new Hash_Table_Rec (Modulus => Initial_Modulus);
      end if;

      declare
         Tab_Index : constant Backbone_Index :=
           Backbone_Index (Hash (Key) mod Hash_Type (Table.Modulus) + 1);
         First_In_Bucket : Hash_Table_Entry_Ptr renames Table.Backbone (
           Tab_Index);
         Ptr : Hash_Table_Entry_Ptr := First_In_Bucket;
      begin
         while Ptr /= null loop
            if Equiv (Key, Ptr.Key) then
               --  Already in table
               Existing_Pair := Pair_Ref (Ptr);
               return;
            end if;
            --  Go to next entry in chunk
            Ptr := Ptr.Next_Same_Hash;
         end loop;

         --  Element with given key not in table yet,
         --  add as first entry in bucket
         Existing_Pair := null;
         First_In_Bucket :=
           new Hash_Table_Entry'
           (Key => Key,
            Elem => Elem,
            Next_Same_Hash => First_In_Bucket);

         Table.Num_Entries := Table.Num_Entries + 1;
         --  TBD: Consider lengthening hash table backbone
      end;
   end Enter_Element_Pair;

   function Find_Element_Pair
     (Table : Hash_Table;
      Key : Key_Type)
      return Pair_Ref
   is
   --  Find key/element pair in table with given Key.
   --  Return null if not found
   begin
      if Table /= null then
         declare
            Tab_Index : constant Backbone_Index :=
              Backbone_Index (Hash (Key) mod Hash_Type (Table.Modulus) + 1);
            Ptr : Hash_Table_Entry_Ptr := Table.Backbone (Tab_Index);
         begin
            while Ptr /= null loop
               if Equiv (Ptr.Key, Key) then
                  --  Found
                  return Pair_Ref (Ptr);
               end if;
               --  Go to next entry in chunk
               Ptr := Ptr.Next_Same_Hash;
            end loop;
         end;
      end if;

      --  Key not in table
      return null;
   end Find_Element_Pair;

   function Key (Pair : Pair_Ref) return Key_Ref is
   --  Return R/O reference to key of pair
   begin
      return Pair.Key'Access;
   end Key;

   function Element (Pair : Pair_Ref) return Element_Ref is
   --  Return R/W reference to element of pair
   begin
      return Pair.Elem'Access;
   end Element;

   procedure Iterate (Table : Hash_Table) is
   --  Iterate over each entry in the table.
   begin
      if Table /= null then
         for I in Table.Backbone'Range loop
            declare
               Ptr : Hash_Table_Entry_Ptr := Table.Backbone (I);
            begin
               while Ptr /= null loop
                  Action (Pair_Ref (Ptr));
                  Ptr := Ptr.Next_Same_Hash;
               end loop;
            end;
         end loop;
      end if;
   end Iterate;

   procedure Iterate_And_Remove (Table : in out Hash_Table) is
   --  Iterate over the table and remove each entry.
   --  Reclaim the storage occupied by the table.
   begin
      if Table /= null then
         for I in Table.Backbone'Range loop
            declare
               Ptr : Hash_Table_Entry_Ptr renames Table.Backbone (I);
            --  Renaming allow us to remove elements as they are processed
            begin
               while Ptr /= null loop
                  declare
                     Next : Hash_Table_Entry_Ptr := Ptr.Next_Same_Hash;
                  begin
                     --  Call Action with Key/Element pair and then
                     --  Reclaim the storage.
                     Action (Ptr.Key, Ptr.Elem);
                     Free (Ptr);
                     Ptr := Next;  --  Carve element out of bucket.
                  end;
               end loop;
            end;
         end loop;
         --  Release the backbone
         Free (Table);
      end if;
   end Iterate_And_Remove;

   procedure Reclaim_Inst is new Iterate_And_Remove (Do_Nothing);
   --  Create instance that reclaims the elements but doesn't otherwise
   --  do anything.

   procedure Reclaim (Table : in out Hash_Table) renames Reclaim_Inst;
   --  Reclaim the storage occupied by the table.
   --  Leave the table empty.

end PSC.Hash_Tables;
