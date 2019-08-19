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

with Ada.Text_IO; use Ada.Text_IO;
package body PSC.Interpreter.Locks is

   pragma Linker_Options ("-lgomp");

   procedure Initialize (Lock : in out Simple_Lock) is
   begin
      omp_init_lock (Lock.Lock'Access);
   end Initialize;

   procedure Acquire (Lock : in out Simple_Lock) is
   begin
      omp_set_lock (Lock.Lock'Access);
   end Acquire;

   procedure Release (Lock : in out Simple_Lock) is
   begin
      omp_unset_lock (Lock.Lock'Access);
   end Release;

   procedure Destroy (Lock : in out Simple_Lock) is
   begin
      omp_destroy_lock (Lock.Lock'Access);
   end Destroy;

end PSC.Interpreter.Locks;
