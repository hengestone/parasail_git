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

package PSC.Link_Names is
   --  This package can contain link names and link-name suffixes
   --  that might be target or compiler-dependent.
   --  This is the Mac-OS/X version of this file.
   Dot : constant String := ".";    --  This is the string to use
                                    --  when a "." appears in a link-name
   Link_Name_Prefix : constant String := "_";
                                    --  This is the Prefix to use when using
                                    --  the "Link_Name" argument of a pragma
                                    --  "Import" or "Export" so that it matches
                                    --  up with the llvm name.
                                    --  Mac-OS/X needs an extra "_"
   Internal_Precond_Prefix : constant String := Link_Name_Prefix & "_";
   Internal_Precond_Suffix : constant String := Dot & "0internal_precond";
end PSC.Link_Names;
