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

with Ada.Streams; use Ada.Streams;
with PSC.Write_Const_To_Stream;
with System;
package PSC.String_Streams is
   --  A stream which saves up the output and spits
   --  it back out as a string.

   type String_Stream (Max : Stream_Element_Offset) is new
     Ada.Streams.Root_Stream_Type with private;
   --  "Max" is count of number of stream elements
   --  that can be buffered up in the stream.

   procedure Read
     (Stream : in out String_Stream;
      Item : out Stream_Element_Array;
      Last : out Stream_Element_Offset);

   procedure Write
     (Stream : in out String_Stream;
      Item : Stream_Element_Array);

   function String_Of (Stream : access String_Stream) return String;
   --  Return what's left in buffer as a string and set back to empty

   --  A buffered stream which grows as needed

   type Buffered_Stream is new Root_Stream_Type with private;

   type Stream_Element_Array_Ptr is access Stream_Element_Array;

   --  Create 'Write which writes nothing at all
   procedure Write_Stream_Ptr
     (Stream : access Ada.Streams.Root_Stream_Type'Class;
      Item : Stream_Element_Array_Ptr);
   for Stream_Element_Array_Ptr'Write use Write_Stream_Ptr;

   --  Create 'Read which always produces a null value
   procedure Read_Stream_Ptr
     (Stream : access Ada.Streams.Root_Stream_Type'Class;
      Item : out Stream_Element_Array_Ptr);
   for Stream_Element_Array_Ptr'Read use Read_Stream_Ptr;

   procedure Write
     (Stream : in out Buffered_Stream; Data : Stream_Element_Array);

   procedure Read
     (Stream : in out Buffered_Stream; Data : out Stream_Element_Array;
      Last : out Stream_Element_Offset);

   function Copy_To_Heap (Stream : access Buffered_Stream)
     return Stream_Element_Array_Ptr;
   --  Copy contents of stream into the heap and reset stream to empty.
   --  NOTE: This includes only amount written but not yet read.

   function Stream_Length (Stream : Buffered_Stream)
     return Stream_Element_Count;
   --  Return current amount of buffered stream that has not been read

   procedure Reset_Stream (Stream : in out Buffered_Stream);
   --  Release all of the storage of a buffered stream

   --  Stream used for reading in from a fixed-length array
   subtype Stream_Rep_Array is
     Ada.Streams.Stream_Element_Array (0 .. 2**16 - 1);

   type Buffered_Reader (Data : access Stream_Rep_Array)
     is new Root_Stream_Type with record
      Next_To_Read : Stream_Element_Offset := Stream_Rep_Array'First;
   end record;

   procedure Write
     (Stream : in out Buffered_Reader; Data : Stream_Element_Array);
   --  This will always raise Program_Error

   procedure Read
     (Stream : in out Buffered_Reader; Data : out Stream_Element_Array;
      Last : out Stream_Element_Offset);
   --  This reads from Next_To_Read

private

   type String_Stream (Max : Stream_Element_Offset) is new
     Ada.Streams.Root_Stream_Type with
      record
         Data : Stream_Element_Array (1 .. Max);
         Read_Count : Stream_Element_Offset := 0;
         Write_Count : Stream_Element_Offset := 0;
      end record;

   type Buffered_Stream is new Root_Stream_Type with record
      Amount_Written : Stream_Element_Count := 0;
      Amount_Read    : Stream_Element_Count := 0;
      Contents       : Stream_Element_Array_Ptr := null;
   end record;

end PSC.String_Streams;
