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

--  Package defining locks used by the Runtime. This version implements the
--  locks using Ada 95

pragma Style_Checks (All_Checks);
--  Turn off subprogram ordering, not used for this unit

package PSC.Interpreter.Locks is

   type Simple_Lock is limited private;
   procedure Initialize (Lock : in out Simple_Lock);
   procedure Acquire    (Lock : in out Simple_Lock);
   procedure Release    (Lock : in out Simple_Lock);
   procedure Destroy    (Lock : in out Simple_Lock);

private
   protected type Simple_Lock is
      entry Acquire;
      procedure Release;
   private
      Is_Locked : Boolean := False;
   end Simple_Lock;

   pragma Inline (Acquire);
   pragma Inline (Destroy);
   pragma Inline (Initialize);
   pragma Inline (Release);
end PSC.Interpreter.Locks;
