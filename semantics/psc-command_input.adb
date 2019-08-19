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

with Ada.Text_IO;
package body PSC.Command_Input is
   --  Input from the command line
   --  These will use the GNU "readline" package if available

   --  Routines to support readline functionality
   EOF : End_Of_File_Func := null;
   RL  : Readline_Func    := null;
   AH  : Add_History_Proc := null;

   type String_Ptr is access String;

   Prompt_Emitted : Boolean := False;

   function End_Of_File (Prompt : String := "") return Boolean is
      --  Return True if at end-of-file.
      --  If unknown, call Get_Line and save result to determine if at EOF.
   begin
      if EOF /= null then
         --  Just pass the buck
         return EOF (Prompt);
      else
         --  Use text-io
         if not Prompt_Emitted and then Prompt /= "" then
            Prompt_Emitted := True;
            Ada.Text_IO.Put (Prompt);
         end if;
         return Ada.Text_IO.End_Of_File (Ada.Text_IO.Standard_Input);
      end if;
   end End_Of_File;

   function Get_Line (Prompt : String := "") return String is
      --  Return next line from standard input.
      --  Remember non-blank lines in history, if available.
      --  Raise Ada.IO_Exceptions.End_Of_File if reach end-of-file
   begin
      if RL /= null then
         --  Just pass the buck
         declare
            Result : constant String := RL (Prompt);
         begin
            if Result /= "" and then AH /= null then
               --  Add to history
               AH (Result);
            end if;
            return Result;
         end;
      else
         --  Use text-io
         if not Prompt_Emitted and then Prompt /= "" then
            Ada.Text_IO.Put (Prompt);
         end if;
         Prompt_Emitted := False;  --  So will be emitted again next time.

         --  Return next line, up to Max_Line in length.
         declare
            Result : String (1 .. Max_Line);
            Last   : Natural := 0;
         begin
            Ada.Text_IO.Get_Line (Ada.Text_IO.Standard_Input, Result, Last);
            return Result (1 .. Last);
         end;
      end if;
   end Get_Line;

   procedure Install_Readline_Support
     (EOF : End_Of_File_Func; RL : Readline_Func; AH : Add_History_Proc) is
      --  Install routines that support readline/history mechanism.
   begin
      Command_Input.EOF := EOF;
      Command_Input.RL  := RL;
      Command_Input.AH  := AH;
   end Install_Readline_Support;

end PSC.Command_Input;
