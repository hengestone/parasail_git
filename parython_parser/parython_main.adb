------------------------------------------------------------------------------
--                              P A R Y T H O N                             --
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
------------------------------------------------------------------------------

pragma Style_Checks (Off);

with Parython_Parser, Parython_Lex_IO, Parython_Lex,
  Text_IO;
use  Parython_Parser, Text_IO;
with PSC.Languages;
with PSC.Messages;
with PSC.Strings;
with PSC.Syntax;
with PSC.Trees.Semantics;
with PSC.Interpreter;
with PSC.Interpreter.IO;  --  Pull in I/O builtins
with PSC.Trees.Semantics.Translator;  --  So will have translator primitives

with Parython_Lex_DFA;

with RL_C_Interface;  --  Pull in readline interface

with Ada.Command_Line; use Ada.Command_Line;
with Ada.Exceptions;

procedure Parython_Main is
--  Main procedure for Parython.
--  See Parython_Main_GTK for version that pulls in builtins for GTK graphics.
   Total_Errors  : Natural := 0;
   Command_Given : Boolean := False;

   procedure Lex_Initialize is
   begin
      Parython_Lex.Top := 0;
   end Lex_Initialize;

   procedure Parse_Parython is new PSC.Syntax.Parse_All
     (Parython_Lex_IO.Open_Input,
      Lex_Initialize,
      Parython_Lex_IO.Close_Input,
      Parython_Parser.YYParse);

begin  --  Parython_Main

   PSC.Trees.Semantics.Set_Language (PSC.Languages.Parython);

   Parse_Parython (Total_Errors, Command_Given);

   PSC.Trees.Semantics.Analyze_And_Interpret_All (Total_Errors, Command_Given);
end Parython_Main;
