------------------------------------------------------------------------------
--                              P A R A S A I L                             --
--                                                                          --
--                     Copyright (C) 2012-2014, AdaCore                     --
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

with System.Storage_Elements;
package body PSC.Interpreter.Param_Signatures is
   --  A generic signature package for parameters to builtin operations,
   --  and some particular instances of it for Word_Type and Univ_Real.

   procedure Store_Real
     (Context : Exec_Context;
      Base    : Word_Ptr;
      Offset  : Offset_Within_Area;
      Value   : Univ_Real) is
   --  Store value into Base[Offset]
   --  NOTE: Context parameter is ignored, but is needed to match
   --        signature of Param_Sig generic.
   begin
      Store_Word (Context, Base, Offset, From_Univ_Real (Value));
   end Store_Real;

   procedure Store_Word
     (Context : Exec_Context;
      Base    : Word_Ptr;
      Offset  : Offset_Within_Area;
      Value   : Word_Type)
   is
      pragma Unreferenced (Context);
   begin
      Add (Base, Offset).all := Value;
   end Store_Word;

   --  Functions for fetching/storing System.Address
   function Fetch_Input
       (Params : Word_Ptr; Offset : Offset_Within_Area)
        return System.Address is
      use System.Storage_Elements;
   begin
      return To_Address (Integer_Address (Fetch_Word (Params, Offset)));
   end Fetch_Input;

   procedure Store_Output
       (Context : Exec_Context;
        Params : Word_Ptr;
        Offset : Offset_Within_Area;
        Value : System.Address) is
      use System.Storage_Elements;
   begin
      Store_Word (Params, Offset, Word_Type (To_Integer (Value)));
   end Store_Output;

   function Fetch_From_Phys_Addr
       (Addr : Word_Ptr;
        Offset : Offset_Within_Area)
        return System.Address is
      use System.Storage_Elements;
   begin
      return To_Address (Integer_Address (Fetch_Word (Addr, Offset)));
   end Fetch_From_Phys_Addr;

   procedure Store_To_Phys_Addr
       (Addr : Word_Ptr;
        Offset : Offset_Within_Area;
        Value : System.Address) is
      use System.Storage_Elements;
   begin
      Store_Word (Addr, Offset, Word_Type (To_Integer (Value)));
   end Store_To_Phys_Addr;

   --  Functions for fetching/storing Large_Obj
   --  The "Store" operations allocate a new large object in the region of
   --  the old object.

   function To_Large_Obj_Ptr is
     new Ada.Unchecked_Conversion (Word_Ptr, Large_Obj_Ptr);

   function Fetch_Input
       (Params : Word_Ptr;
        Offset : Offset_Within_Area)
        return Large_Obj is
      use System.Storage_Elements;
   --  Return a large object given the location of the word pointing at it
   begin
      return To_Large_Obj_Ptr (Virtual_To_Physical_Address
        (Fetch_Word (Params, Offset))).all;
   end Fetch_Input;

   procedure Store_Output
       (Context : Exec_Context;
        Params : Word_Ptr;
        Offset : Offset_Within_Area;
        Value : Large_Obj) is
   --  Allocate a new large object given the location of the word to be
   --  replaced with the address of this new object.
   --  The word is presumed to currently contain a large "null"
   --  which determines the region to use for the new object.
      use System.Storage_Elements;
      Old_Value : constant Word_Type := Fetch_Word (Params, Offset);
      Target_Stg_Rgn : constant Stg_Rgn_Ptr :=
        Stg_Rgn_Of_Large_Obj (Old_Value);
      New_Obj : constant Word_Type :=
        Allocate_From_Stg_Rgn
           (Target_Stg_Rgn,
            Value.Size,
            Context.Server_Index);
   begin
      --  This verifies the size matches
      To_Large_Obj_Ptr (Virtual_To_Physical_Address (New_Obj)).all := Value;
   end Store_Output;

   function Fetch_From_Phys_Addr
       (Addr : Word_Ptr;
        Offset : Offset_Within_Area)
        return Large_Obj is
      use System.Storage_Elements;
   begin
      return To_Large_Obj_Ptr (Virtual_To_Physical_Address
        (Fetch_Word (Addr, Offset))).all;
   end Fetch_From_Phys_Addr;

   procedure Store_To_Phys_Addr
       (Addr : Word_Ptr;
        Offset : Offset_Within_Area;
        Value : Large_Obj) is
   --  Allocate a new large object given the location of the word to be
   --  replaced with the address of this new object.
   --  The word is presumed to currently contain a large "null"
   --  which determines the region to use for the new object.
      use System.Storage_Elements;
      Old_Value : constant Word_Type := Fetch_Word (Addr, Offset);
      Target_Stg_Rgn : constant Stg_Rgn_Ptr :=
        Stg_Rgn_Of_Large_Obj (Old_Value);
      New_Obj : constant Word_Type :=
        Allocate_From_Stg_Rgn
           (Target_Stg_Rgn,
            Value.Size,
            Current_Server_Index);
   begin
      --  This verifies the size matches
      To_Large_Obj_Ptr (Virtual_To_Physical_Address (New_Obj)).all := Value;
      Set_Stg_Rgn_Of_Large_Obj (New_Obj, Target_Stg_Rgn);
   end Store_To_Phys_Addr;

   procedure Store_Word_Ptr
          (Context : Exec_Context;
           Params : Word_Ptr;
           Offset : Offset_Within_Area;
           Value : Word_Ptr) is
   --  Procedure for storing a Word_Ptr into the param area
   begin
      Store_Word (Context, Params, Offset, Word_Ptr_To_Word (Value));
   end Store_Word_Ptr;

end PSC.Interpreter.Param_Signatures;
