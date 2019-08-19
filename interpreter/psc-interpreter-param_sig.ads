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

generic
   --  Signature package for a parameter type for a builtin operation
   type Param_Type (<>) is private;
   with function Fetch_Input
          (Params : Word_Ptr; Offset : Offset_Within_Area)
           return Param_Type;
   with procedure Store_Output
          (Context : Exec_Context;
           Params : Word_Ptr;
           Offset : Offset_Within_Area;
           Value : Param_Type);
   with function Fetch_From_Phys_Addr
          (Addr : Word_Ptr; Offset : Offset_Within_Area := 0)
           return Param_Type;
   with procedure Store_To_Phys_Addr
          (Addr : Word_Ptr;
           Offset : Offset_Within_Area := 0;
           Value : Param_Type);
package PSC.Interpreter.Param_Sig is
end PSC.Interpreter.Param_Sig;
