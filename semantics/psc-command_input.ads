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

package PSC.Command_Input is
   --  Input from the command line
   --  These will use the GNU "readline" package if available

   Max_Line : constant := 1000;  --  Max length for one line

   function End_Of_File (Prompt : String := "") return Boolean;
      --  Return True if at end-of-file.
      --  If unknown, call Get_Line and save result to determine if at EOF.

   function Get_Line (Prompt : String := "") return String;
      --  Return next line from standard input.
      --  Remember non-blank lines in history, if available.
      --  Raise Ada.IO_Exceptions.End_Of_File if reach end-of-file

   type End_Of_File_Func is access function (Prompt : String) return Boolean;
   type Readline_Func is access function (Prompt : String) return String;
   type Add_History_Proc is access procedure (Line : String);

   procedure Install_Readline_Support
     (EOF : End_Of_File_Func; RL : Readline_Func; AH : Add_History_Proc);
      --  Install routines that support readline/history mechanism.

end PSC.Command_Input;
