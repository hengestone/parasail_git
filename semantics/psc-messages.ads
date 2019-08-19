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

with PSC.Source_Positions;
package PSC.Messages is

   Number_Of_Errors : Natural := 0;

   procedure Put_Message
     (S : String;
      Src_Pos : Source_Positions.Source_Position;
      Message_Kind : String;
      Suppress_Duplicates : Boolean := True);
      --  Produce a message on the standard error output
      --  and in the error file.
      --  Suppress duplicate messages by default.

   procedure Put_Error
     (S : String;
      Src_Pos : Source_Positions.Source_Position;
      Message_Kind : String := "Error";
      Suppress_Duplicates : Boolean := True) renames Put_Message;
      --  Produce an error message on the standard error output
      --  and in the error file.
      --  Suppress duplicate messages by default.

   procedure Put_RT_Error
     (S : String;
      Src_Pos : Source_Positions.Source_Position;
      Message_Kind : String := "Runtime error";
      Suppress_Duplicates : Boolean := False) renames Put_Message;
      --  Produce an error message on the standard error output
      --  and in the error file.
      --  Do not suppress duplicate messages by default.

   procedure Put_Warning
     (S : String;
      Src_Pos : Source_Positions.Source_Position;
      Message_Kind : String := "Warning";
      Suppress_Duplicates : Boolean := True) renames Put_Message;
      --  Produce a warning message on the standard error output
      --  and in the error file.
      --  Suppress duplicate messages by default.

   procedure Parser_Error (S : String := "syntax error";
     Src_Pos : Source_Positions.Source_Position :=
       Source_Positions.Null_Source_Position);

   procedure Parser_Warning (S : String;
     Src_Pos : Source_Positions.Source_Position :=
       Source_Positions.Null_Source_Position);

   function Is_Error_File (Name : String) return Boolean;
      --  Return True if Name matches name of file where errors are logged.

   procedure Close_Error_File;
      --  Close error-messages file if it is open
      --  so it can be re-opened by a separate package or by compiled code.

end PSC.Messages;
