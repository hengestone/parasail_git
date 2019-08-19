------------------------------------------------------------------------------
--                              P A R A S A I L                             --
--                                                                          --
--                     Copyright (C) 2012-2015, AdaCore                     --
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
package body PSC.Source_Positions is

   function Hash (Src_Pos : Source_Position) return Strings.Hash_Type is
      --  Return a hash of Src_Pos, ignoring End_Line and End_Col.
      use Strings;
   begin
      return Hash (To_U_String (Src_Pos.File)) +
        Hash_Type (Src_Pos.Line) + Hash_Type (Src_Pos.Col);
   end Hash;

   function Image (Src_Pos : Source_Position;
                   Sep : String := ":") return String is
      --  Create a readable representation of the source position
      --  in the form "<file>:<line>:<col>:".
      --  If Sep is specified, it takes the place of ":".

      use type Strings.U_String_Index;
      function File_Image return String is
         --  Return "<file>:" if Src_Pos.File non null
      begin
         if Src_Pos.File /= Strings.Null_U_String_Index then
            return
              Strings.To_String (Strings.To_U_String (Src_Pos.File)) & Sep;
         else
            return "";
         end if;
      end File_Image;

      function Line_Image return String is
         --  Return "<line>:" if Src_Pos.Line non zero
      begin
         if Src_Pos.Line /= 0 then
            return Strings.Skip_Leading_Spaces
              (Line_Number'Image (Src_Pos.Line)) & Sep;
         else
            return "";
         end if;
      end Line_Image;

      function Col_Image return String is
         --  Return "<col>:" if Src_Pos.Column non zero
      begin
         if Src_Pos.Line /= 0 and then Src_Pos.Col /= 0 then
            return Strings.Skip_Leading_Spaces
              (Column_Number'Image (Src_Pos.Col)) & Sep;
         else
            return "";
         end if;
      end Col_Image;

   begin
      if Src_Pos = Null_Source_Position then
         return "";
      else
         return File_Image & Line_Image & Col_Image;
      end if;
   end Image;

end PSC.Source_Positions;
