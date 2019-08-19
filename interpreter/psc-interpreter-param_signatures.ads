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

with System;
with PSC.Interpreter.Param_Sig;
package PSC.Interpreter.Param_Signatures is
   pragma Elaborate_Body;
   --  Instances of a generic signature package for parameters to
   --  builtin operations, for Word_Type, Univ_Real, System.Address,
   --  and a Large_Obj.

   procedure Store_Word
     (Context : Exec_Context;
      Base    : Word_Ptr;
      Offset  : Offset_Within_Area;
      Value   : Word_Type);
   --  Store value into Base[Offset]
   --  NOTE: Context parameter is ignored, but is needed to match
   --        signature of Param_Sig generic.

   --  Param Signature for Word_Type
   package Word_Param is new Param_Sig
     (Param_Type => Word_Type,
      Fetch_Input => Fetch_Word,
      Store_Output => Store_Word,
      Fetch_From_Phys_Addr => Fetch_Word,
      Store_To_Phys_Addr => Store_Word);

   --  Param Signature for non-null Word_Type
   package Nonnull_Word_Param is new Param_Sig
     (Param_Type => Word_Type,
      Fetch_Input => Fetch_Nonnull_Word,
      Store_Output => Store_Word,
      Fetch_From_Phys_Addr => Fetch_Word,
      Store_To_Phys_Addr => Store_Word);  --  TBD: Create a Store_Nonnull_Word?

   procedure Store_Real
     (Context : Exec_Context;
      Base    : Word_Ptr;
      Offset  : Offset_Within_Area;
      Value   : Univ_Real);
   --  Store value into Base[Offset]
   --  NOTE: Context parameter is ignored, but is needed to match
   --        signature of Param_Sig generic.

   --  Param Signature for Univ_Real
   package Real_Param is new Param_Sig
     (Param_Type => Univ_Real,
      Fetch_Input => Fetch_Real,
      Store_Output => Store_Real,
      Fetch_From_Phys_Addr => Fetch_Real,
      Store_To_Phys_Addr => Store_Real);

   --  Param Signature for non-null Univ_Real
   package Nonnull_Real_Param is new Param_Sig
     (Param_Type => Univ_Real,
      Fetch_Input => Fetch_Nonnull_Real,
      Store_Output => Store_Real,
      Fetch_From_Phys_Addr => Fetch_Nonnull_Real,
      Store_To_Phys_Addr => Store_Real);

   --  Functions for fetching/storing System.Address
   function Fetch_Input
       (Params : Word_Ptr;
        Offset : Offset_Within_Area)
        return System.Address;

   procedure Store_Output
       (Context : Exec_Context;
        Params : Word_Ptr;
        Offset : Offset_Within_Area;
        Value : System.Address);

   function Fetch_From_Phys_Addr
       (Addr : Word_Ptr;
        Offset : Offset_Within_Area)
        return System.Address;

   procedure Store_To_Phys_Addr
       (Addr : Word_Ptr;
        Offset : Offset_Within_Area;
        Value : System.Address);

   --  Param Signature for System.Address
   package Addr_Param is new Param_Sig
     (Param_Type => System.Address,
      Fetch_Input => Fetch_Input,
      Store_Output => Store_Output,
      Fetch_From_Phys_Addr => Fetch_From_Phys_Addr,
      Store_To_Phys_Addr => Store_To_Phys_Addr);

   --  Functions for fetching/storing Large_Obj
   --  The "Store" operations allocate a new large object in the region of
   --  the old object.

   function Fetch_Input
       (Params : Word_Ptr;
        Offset : Offset_Within_Area)
        return Large_Obj;
   --  Return a large object given the location of the word pointing at it

   procedure Store_Output
       (Context : Exec_Context;
        Params : Word_Ptr;
        Offset : Offset_Within_Area;
        Value : Large_Obj);
   --  Allocate a new large object given the location of the word to be
   --  replaced with the address of this new object.
   --  The word is presumed to currently contain a large "null"
   --  which determines the region to use for the new object.

   function Fetch_From_Phys_Addr
       (Addr : Word_Ptr;
        Offset : Offset_Within_Area)
        return Large_Obj;

   procedure Store_To_Phys_Addr
       (Addr : Word_Ptr;
        Offset : Offset_Within_Area;
        Value : Large_Obj);
   --  Allocate a new large object given the location of the word to be
   --  replaced with the address of this new object.
   --  The word is presumed to currently contain a large "null"
   --  which determines the region to use for the new object.

   --  Param Signature for Large_Obj
   package Large_Obj_Param is new Param_Sig
     (Param_Type => Large_Obj,
      Fetch_Input => Fetch_Input,
      Store_Output => Store_Output,
      Fetch_From_Phys_Addr => Fetch_From_Phys_Addr,
      Store_To_Phys_Addr => Store_To_Phys_Addr);

   --  Procedure for storing a Word_Ptr into the param area
   procedure Store_Word_Ptr
          (Context : Exec_Context;
           Params : Word_Ptr;
           Offset : Offset_Within_Area;
           Value : Word_Ptr);

   --  Param Signature for Word_Ptr
   package Word_Ptr_Param is new Param_Sig
     (Param_Type => Word_Ptr,
      Fetch_Input => Fetch_Word_Ptr,
      Store_Output => Store_Word_Ptr,
      Fetch_From_Phys_Addr => Fetch_Word_Ptr,
      Store_To_Phys_Addr => Store_Word_Ptr);
end PSC.Interpreter.Param_Signatures;
