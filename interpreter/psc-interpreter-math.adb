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

--  Package providing support for builtin ParaSail math operations

with PSC.Interpreter.Builtins; use PSC.Interpreter.Builtins;
with PSC.Messages;
with PSC.Strings; use PSC.Strings;
with Ada.Numerics.Generic_Elementary_Functions;
with Ada.Text_IO;

pragma Elaborate (PSC.Interpreter.Builtins);
pragma Elaborate (PSC.Strings);

package body PSC.Interpreter.Math is

   package Real_Elementary_Functions is
     new Ada.Numerics.Generic_Elementary_Functions (Interpreter.Univ_Real);

   ----------  Builtin Subprograms  -------------

   procedure Real_Sqrt
     (Context : Exec_Context;
      Params : Word_Ptr;
      Static_Link : Non_Op_Map_Type_Ptr);
   --  64-bit Sqrt routine
   --  func Sqrt(Val : Univ_Real) {Val >= 0.0} -> Univ_Real
   --     is import(#real_sqrt)
   pragma Export (Ada, Real_Sqrt, "_psc_real_sqrt");

   ----------------- Implementations of builtin subprograms -----------

   ---------------
   -- Real_Sqrt --
   ---------------

   procedure Real_Sqrt
     (Context : Exec_Context;
      Params : Word_Ptr;
      Static_Link : Non_Op_Map_Type_Ptr) is
   --  64-bit Sqrt routine
   --  func Sqrt(Val : Univ_Real) {Val >= 0.0} -> Univ_Real
   --     is import(#real_sqrt)
      use Interpreter;
      Val : constant Univ_Real := Fetch_Nonnull_Real (Params, 1);
   begin
      if Val < 0.0 then
         Messages.Put_Error
           ("Assertion failed: Val >= 0.0",
            Src_Pos => Execution_Source_Pos);
         Store_Real
           (Params, 0, 0.0);
      else
         Store_Real
           (Params, 0,
            Real_Elementary_Functions.Sqrt (Val));
      end if;
   end Real_Sqrt;

begin

   Register_Builtin
     (String_Lookup ("#real_sqrt"),
      Real_Sqrt'Access);

end PSC.Interpreter.Math;
