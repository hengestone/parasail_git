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

--  Package defining locks used by the Runtime. This version relies on the
--  OpenMP library implementaton for GCC (GOMP).

pragma Style_Checks (All_Checks);
--  Turn off subprogram ordering, not used for this unit

with omp_h; use omp_h;

package PSC.Interpreter.Locks is

   type Simple_Lock is limited private;
   procedure Initialize (Lock : in out Simple_Lock);
   procedure Acquire    (Lock : in out Simple_Lock);
   procedure Release    (Lock : in out Simple_Lock);
   procedure Destroy    (Lock : in out Simple_Lock);

private
   type Simple_Lock is limited record
      Lock : aliased omp_lock_t;
   end record;

   pragma Inline (Initialize);
   pragma Inline (Acquire);
   pragma Inline (Release);
   pragma Inline (Destroy);
end PSC.Interpreter.Locks;
