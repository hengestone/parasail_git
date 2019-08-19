------------------------------------------------------------------------------
--                              P A R A S A I L                             --
--                                                                          --
--                     Copyright (C) 2012-2016, AdaCore                     --
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

with PSC.Strings;
with PSC.Source_Positions;
package PSC.Syntax is

   Lines          : Natural := 0;
   Char_Count     : Natural := 0;
   Col_Count      : Natural := 0;
   Cur_File       : Strings.U_String := Strings.Null_U_String;
   Trace          : Boolean := False;
   Spaces_Per_Tab : Positive := 8;  --  Can be overridden
   Echo_Input     : Boolean := True;  --  Can be overridden

   function Cur_Source_Pos return Source_Positions.Source_Position;
   --  Return File/Lines/Char_Count as a source-position

   procedure Display_Linenum;
   --  Display current line number for listing

   procedure Echo_Token (Token : String);
   --  Update Char_Count/Col_Count, and display current token
   --  if Echo_Input.

   generic
      with procedure Lexer_Open_Input (File : String);
      with procedure Lexer_Init;
      with procedure Lexer_Close_Input;
      with procedure YYParse;
   procedure Parse_All
     (Total_Errors : out Natural; Command_Given : out Boolean);
   --  Handle command line, and/or interactive input of file names
   --  and parse them all.

end PSC.Syntax;
