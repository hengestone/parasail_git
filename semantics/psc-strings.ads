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

with Ada.Streams;
with PSC.Hash_Tables;
with PSC.String_Streams;

pragma Elaborate (PSC.Hash_Tables);
pragma Elaborate (PSC.String_Streams);
package PSC.Strings is
   --  Package to represent each distinct string uniquely.

   type Hash_Type is mod 2 ** 32;

   type U_String is private;
   --  A uniquified string.

   procedure U_String_Write
     (Stream : access Ada.Streams.Root_Stream_Type'Class;
      Item : U_String);
   for U_String'Write use U_String_Write;
   --  Write out the contents of the string

   procedure U_String_Read
     (Stream : access Ada.Streams.Root_Stream_Type'Class;
      Item : out U_String);
   for U_String'Read use U_String_Read;
   --  Read in the contents of the string an uniquify it

   type U_String_Index is range 0 .. 2_000_000;
   --  A unique index for each unique string

   procedure U_String_Index_Write
     (Stream : access Ada.Streams.Root_Stream_Type'Class;
      Item : U_String_Index'Base);
   for U_String_Index'Write use U_String_Index_Write;
   --  Write out the contents of the string

   procedure U_String_Index_Read
     (Stream : access Ada.Streams.Root_Stream_Type'Class;
      Item : out U_String_Index'Base);
   for U_String_Index'Read use U_String_Index_Read;
   --  Read in the contents of the string and get its index

   Null_U_String : constant U_String;
   Null_U_String_Index : constant U_String_Index := 0;
   Empty_U_String : constant U_String;
   Empty_U_String_Index : constant U_String_Index := 1;

   function String_Lookup (S : String) return U_String;
   --  Get the U_String for the given string

   function To_String (U : U_String) return String;
   --  Get back the original string

   function Length (U : U_String) return Natural;
   --  Return length of U_String.  Length(Null_U_String) = 0.

   function Hash (U : U_String) return Hash_Type;
   --  Get a hash for the unique string.  Hash is
   --  case insensitive, so may be used for case-sensitive
   --  and case-insensitive data structures.

   function Index (U : U_String) return U_String_Index;
   --  Return unique index associated with string

   function To_U_String (Index : U_String_Index) return U_String;
   --  Return U_String given its unique index

   function Case_Insensitive_Equal (Left, Right : U_String) return Boolean;
   --  Return True if Left and Right are equal ignoring case.

   function Escaped_Char (Char : Character) return Character;
   --  Return meaning of Char when preceded by a back slash.
   --  NOTE: This does not handle the \#xx_xx# syntax.

   function To_UTF_8 (S : String) return String;
   --  Convert any escaped characters and produce a UTF-8 string.

   function To_UTF_16 (S : String) return Wide_String;
   --  Convert any escaped characters and produce a UTF-16 string

   type U_String_Array is array (Positive range <>) of Strings.U_String;

   function Tokenize (S : String; Seps : String := ' ' & ASCII.HT)
     return U_String_Array;
   --  Break up S into tokens and return as array of U_Strings.
   --  Seps specifies characters that act as separators.

   function Skip_Leading_Spaces (S : String) return String;
   --  Return S stripped of any leading spaces

   function Simple_Name (Full_Name : String) return String;
   --  Return Full_Name stripped of module parameters, if any
   --  and prefix.

   function Contains (S : String; Char : Character) return Boolean;
   --  Return True if S contains Char.

   function Hash_String (S : String; Prefix : Hash_Type := 0) return Hash_Type;
   --  Get a hash for the string.  Hash is
   --  case insensitive, so may be used for case-sensitive
   --  and case-insensitive data structures.
   --  Prefix is hash value of chars preceding S, if we are computing
   --  the "hash" for a concatenation.

private

   type U_String_Rec;

   type U_String is access U_String_Rec;

   type U_String_Rec (Len : Natural) is record
      Next : U_String := null;
      pragma Atomic (Next);
      Index : U_String_Index := 0;
      Hash : Hash_Type := 0;
      Str : String (1 .. Len);
   end record;

   Null_U_String : constant U_String := null;

   Empty_U_String : constant U_String :=
     new U_String_Rec '(Len => 0, Next => null,
                        Index => Empty_U_String_Index,
                        Hash => 0, Str => "");

end PSC.Strings;
