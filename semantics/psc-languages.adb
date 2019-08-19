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

package body PSC.Languages is
   --  Language-specific information within the ParaSail "family" of languages

   Current_Language : Language_Enum := ParaSail;

   ----------------  Visible Subprograms  -----------------

   procedure Set_Language (Language : Language_Enum) is
   --  Set the Language
   begin
      Current_Language := Language;
   end Set_Language;

   function Language return Language_Enum is
   --  Return the current language (ParaSail, Sparkel, Parython, or Javallel)
   begin
      return Current_Language;
   end Language;

   function Language_Name return String is
   --  Return the Language Name ("ParaSail," "Sparkel," "Parython",
   --  or "Javallel")
   begin
      case Current_Language is
         when ParaSail => return "ParaSail";
         when Sparkel  => return "Sparkel";
         when Parython => return "Parython";
         when Javallel => return "Javallel";
      end case;
   end Language_Name;

   function Language_Name_LC return String is
   --  Return the Language Name in lower case
   --  ("parasail", "sparkel", "parython", "javallel");
   begin
      case Current_Language is
         when ParaSail => return "parasail";
         when Sparkel  => return "sparkel";
         when Parython => return "parython";
         when Javallel => return "javallel";
      end case;
   end Language_Name_LC;

   function Language_Uses_Selection_For_Modules return Boolean is
   --  Return True if language uses selection syntax (e.g. ".") for
   --  selecting from modules (and types).
   begin
      case Current_Language is
         when ParaSail => return False;
         when Sparkel  => return True;
         when Parython => return True;
         when Javallel => return True;
      end case;
   end Language_Uses_Selection_For_Modules;

   function Module_Name_Separator return String is
   --  Return character sequence used to separate parts of a module name
   --  (e.g. "::" or ".").
   begin
      case Current_Language is
         when ParaSail => return "::";
         when Sparkel  => return ".";
         when Parython => return ".";
         when Javallel => return ".";
      end case;
   end Module_Name_Separator;

   function Standard_Library_Prefix return String is
   --  Return the prefix to use for the standard library
   --  (e.g. "PSL" or "SSL").
   begin
      case Current_Language is
         when ParaSail => return "PSL";
         when Sparkel  => return "SSL";
         when Parython => return "PSL";
         when Javallel => return "java";
      end case;
   end Standard_Library_Prefix;

   function Standard_Library_Core_Module return String is
   --  Return the core module to use for the standard library
   --  (e.g. "Core" or "lang").
   begin
      case Current_Language is
         when ParaSail => return "Core";
         when Sparkel  => return "Core";
         when Parython => return "Core";
         when Javallel => return "lang";
      end case;
   end Standard_Library_Core_Module;

   function Standard_Library_Containers_Module return String is
   --  Return the container module to use for the standard library
   --  (e.g. "Containers" or "util").
   begin
      case Current_Language is
         when ParaSail => return "Containers";
         when Sparkel  => return "Containers";
         when Parython => return "Containers";
         when Javallel => return "util";
      end case;
   end Standard_Library_Containers_Module;

   --  Return language-specific module and operation names
   function Any_Module_Name return String is
   begin
      case Current_Language is
         when ParaSail => return "Any";
         when Sparkel  => return "Any";
         when Parython => return "Any";
         when Javallel => return "Any";
      end case;
   end Any_Module_Name;

   function Assignable_Module_Name return String is
   begin
      case Current_Language is
         when ParaSail => return "Assignable";
         when Sparkel  => return "Assignable";
         when Parython => return "Assignable";
         when Javallel => return "Assignable";
      end case;
   end Assignable_Module_Name;

   function Boolean_Module_Name return String is
   begin
      case Current_Language is
         when ParaSail => return "Boolean";
         when Sparkel  => return "Boolean";
         when Parython => return "Boolean";
         when Javallel => return "Boolean";
      end case;
   end Boolean_Module_Name;

   function Ordering_Module_Name return String is
   begin
      case Current_Language is
         when ParaSail => return "Ordering";
         when Sparkel  => return "Ordering";
         when Parython => return "Ordering";
         when Javallel => return "Ordering";
      end case;
   end Ordering_Module_Name;

   function Univ_Integer_Module_Name return String is
   begin
      case Current_Language is
         when ParaSail => return "Univ_Integer";
         when Sparkel  => return "Univ_Integer";
         when Parython => return "Univ_Integer";
         when Javallel => return "UnivInteger";
      end case;
   end Univ_Integer_Module_Name;

   function Univ_Real_Module_Name return String is
   begin
      case Current_Language is
         when ParaSail => return "Univ_Real";
         when Sparkel  => return "Univ_Real";
         when Parython => return "Univ_Real";
         when Javallel => return "UnivReal";
      end case;
   end Univ_Real_Module_Name;

   function Univ_Character_Module_Name return String is
   begin
      case Current_Language is
         when ParaSail => return "Univ_Character";
         when Sparkel  => return "Univ_Character";
         when Parython => return "Univ_Character";
         when Javallel => return "UnivCharacter";
      end case;
   end Univ_Character_Module_Name;

   function Univ_String_Module_Name return String is
   begin
      case Current_Language is
         when ParaSail => return "Univ_String";
         when Sparkel  => return "Univ_String";
         when Parython => return "Univ_String";
         when Javallel => return "UnivString";
      end case;
   end Univ_String_Module_Name;

   function Univ_Enumeration_Module_Name return String is
   begin
      case Current_Language is
         when ParaSail => return "Univ_Enumeration";
         when Sparkel  => return "Univ_Enumeration";
         when Parython => return "Univ_Enumeration";
         when Javallel => return "UnivEnumeration";
      end case;
   end Univ_Enumeration_Module_Name;

   function Optional_Module_Name return String is
   begin
      case Current_Language is
         when ParaSail => return "Optional";
         when Sparkel  => return "Optional";
         when Parython => return "Optional";
         when Javallel => return "Optional";
      end case;
   end Optional_Module_Name;

   function Null_Literal_Spelling return String is
   begin
      case Current_Language is
         when ParaSail => return "null";
         when Sparkel  => return "null";
         when Parython => return "null";
         when Javallel => return "null";
      end case;
   end Null_Literal_Spelling;

   function Default_Integer_Module_Name return String is
   begin
      case Current_Language is
         when ParaSail => return "Integer";
         when Sparkel  => return "Integer";
         when Parython => return "Integer";
         when Javallel => return "Integer";
      end case;
   end Default_Integer_Module_Name;

   function Default_Float_Module_Name return String is
   begin
      case Current_Language is
         when ParaSail => return "Float";
         when Sparkel  => return "Float";
         when Parython => return "Float";
         when Javallel => return "Float";
      end case;
   end Default_Float_Module_Name;

   function Basic_Array_Module_Name return String is
   begin
      case Current_Language is
         when ParaSail => return "Basic_Array";
         when Sparkel  => return "Basic_Array";
         when Parython => return "Basic_Array";
         when Javallel => return "BasicArray";
      end case;
   end Basic_Array_Module_Name;

   function Debug_Console_Full_Name return String is
   begin
      case Current_Language is
         when ParaSail => return "PSC::Debugging::Console";
         when Sparkel  => return "SSC.Debugging.Console";
         when Parython => return "PSC.Debugging.Console";
         when Javallel => return "java.util.debugging.Console";
      end case;
   end Debug_Console_Full_Name;

   function From_Univ_Op_Name return String is
   begin
      case Current_Language is
         when ParaSail => return """from_univ""";
         when Sparkel  => return """from_univ""";
         when Parython => return """from_univ""";
         when Javallel => return """from_univ""";
      end case;
   end From_Univ_Op_Name;

   function To_Univ_Op_Name return String is
   begin
      case Current_Language is
         when ParaSail => return """to_univ""";
         when Sparkel  => return """to_univ""";
         when Parython => return """to_univ""";
         when Javallel => return """to_univ""";
      end case;
   end To_Univ_Op_Name;

   function Remove_First_Op_Name return String is
   begin
      case Current_Language is
         when ParaSail => return "Remove_First";
         when Sparkel  => return "Remove_First";
         when Parython => return "Remove_First";
         when Javallel => return "removeFirst";
      end case;
   end Remove_First_Op_Name;

   function Remove_Last_Op_Name return String is
   begin
      case Current_Language is
         when ParaSail => return "Remove_Last";
         when Sparkel  => return "Remove_Last";
         when Parython => return "Remove_Last";
         when Javallel => return "removeLast";
      end case;
   end Remove_Last_Op_Name;

   function Remove_Any_Op_Name return String is
   begin
      case Current_Language is
         when ParaSail => return "Remove_Any";
         when Sparkel  => return "Remove_Any";
         when Parython => return "Remove_Any";
         when Javallel => return "removeAny";
      end case;
   end Remove_Any_Op_Name;

   function Compare_Op_Name return String is
   begin
      case Current_Language is
         when ParaSail => return "=?";
         when Sparkel  => return "=?";
         when Parython => return "=?";
         when Javallel => return "=?";
      end case;
   end Compare_Op_Name;

   --  Test whether is a module defining a "universal" type
   function Is_Univ_Module_Name (Name : String) return Boolean is
   begin
      if Name'Length <= 5
        or else Name (Name'First .. Name'First + 3) /= "Univ"
      then
         --  Cannot be a univ type.
         --  NOTE: This presumes they all start with "Univ";
         --        above test will need revision if that changes.
         return False;
      else
         --  Might be a "univ" type.
         return Name = Univ_String_Module_Name
           or else Name = Univ_Character_Module_Name
           or else Name = Univ_Integer_Module_Name
           or else Name = Univ_Real_Module_Name
           or else Name = Univ_Enumeration_Module_Name;
      end if;
   end Is_Univ_Module_Name;

   --  Return full canonical name for certain types of interest,
   --  useful for calls on Get_Type_Desc_By_Name.

   function Univ_String_Type_Name return String is
   begin
      case Current_Language is
         when ParaSail => return "PSL::Core::Univ_String";
         when Sparkel  => return "SSL.Core.Univ_String";
         when Parython => return "PSL.Core.Univ_String";
         when Javallel => return "java.lang.UnivString";
      end case;
   end Univ_String_Type_Name;

   function Operation_Descriptor_Type_Name return String is
   begin
      case Current_Language is
         when ParaSail => return "PSL::Core::Operation_Descriptor";
         when Sparkel  => return "SSL.Core.Operation_Descriptor";
         when Parython => return "PSL.Core.Operation_Descriptor";
         when Javallel => return "java.lang.OperationDescriptor";
      end case;
   end Operation_Descriptor_Type_Name;

   function Optional_Univ_Integer_Basic_Array_Type_Name return String is
   begin
      case Current_Language is
         when ParaSail => return
           "PSL::Containers::Basic_Array<optional PSL::Core::Univ_Integer>";
         when Sparkel  => return
           "SSL.Containers.Basic_Array<optional SSL.Core.Univ_Integer>";
         when Parython => return
           "PSL.Containers.Basic_Array<optional PSL.Core.Univ_Integer>";
         when Javallel => return
           "java.util.BasicArray<optional java.lang.UnivInteger>";
      end case;
   end Optional_Univ_Integer_Basic_Array_Type_Name;

   function Univ_String_Basic_Array_Type_Name return String is
   begin
      case Current_Language is
         when ParaSail => return
           "PSL::Containers::Basic_Array<PSL::Core::Univ_String>";
         when Sparkel  => return
           "SSL.Containers.Basic_Array<SSL.Core.Univ_String>";
         when Parython => return
           "PSL.Containers.Basic_Array<PSL.Core.Univ_String>";
         when Javallel => return
           "java.util.BasicArray<java.lang.UnivString>";
      end case;
   end Univ_String_Basic_Array_Type_Name;

end PSC.Languages;
