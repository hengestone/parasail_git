declare void @_psc_execute_compiled_nth_op_of_type(i64*, i64*, i64*, i16, i16)
declare void @_psc_reconstruct_strings(i16, i8**, i64*)
declare void @_psc_register_compiled_operations(i16, i16*, void(i64*, i64*, i64*)**, i32*, i64*, i32, i16*, i32(i64*, i64*, i64*)**)
declare void @"_psc_runtime_message"(i64*, i64*, i64*)

@$Module_Op_Indices = internal constant [4 x i16] [
i16 1, i16 4, i16 1, i16 2]

@$Local_Funcs = internal constant [2 x void(i64*, i64*, i64*)*] [

void(i64*, i64*, i64*)* bitcast( i64 (i64, i64, i64*, i64*)* @"PSL.Core.Closed_Interval.$=?$" to void(i64*, i64*, i64*)*)
, void(i64*, i64*, i64*)* bitcast( i64 (i64, i64, i64*, i64*)* @"PSL.Core.Closed_Interval.$in$" to void(i64*, i64*, i64*)*)]

@$Local_Funcs_Conv_Descs = internal constant [2 x i32] [
i32 66048, i32 66048]

@$Internal_Precond_Indices = internal constant [0 x i16] [
]

@$Internal_Precond_Blocks = internal constant [0 x i32(i64*, i64*, i64*)*] [
]

; LLVM types used for type descriptors:
%struct.ElemInfo = type { %struct.TD*, i64, i6}
%struct.ParamInfo = type { i8, %struct.ElemInfo }
%struct.CompInfo = type {%struct.TD*, i8, i8}
%struct.ConstInfo = type {i32*, %struct.ElemInfo}
%struct.RoutInfo = type {i16, %struct.TD*, i8, i16, i8,
   [8 x i8]}
%struct.VMOID =  type <{i3, i1, i3, i3, i32, i32}>
%struct.OL = type {i16, i32, %struct.VMOID}
%struct.TD = type {i64, i8, i32, %struct.OL, %struct.TD*,
   i8, %struct.TD*, %struct.TD*,
   i16, i32*, i32*,
   i8, i8, i8, i8, i8, i8, i64,
    %struct.TD*, i32, i8, i8, i8,
   %struct.TD*, %struct.TD*,
   i32, %struct.ParamInfo*, i32*,
   i32, %struct.ParamInfo*, i32*,
   i32, %struct.CompInfo*, i32*,
   i32, %struct.TD**, i32*,
   i32, %struct.ConstInfo*, i32*,
   %struct.RoutInfo*, i16*}
%struct.OpMap = type {i64, i8, i16, %struct.OL, %struct.TD*,
   i8, %struct.TD*, %struct.TD*,
   i16, i32*, i32*,
   i8, i8, i8, i8, i8, i8, i64,
   i16*, i16*,
   %struct.TD*,
   i32*}

; LLVM types for Exec_Context and Stg_Rgn
%struct.ExecCtx = type {i64*, i64}
%struct.StgRgn = type {i64, i32, i16, %struct.StgRgn*}
@"$Anon_Const_2_1" = internal constant i64 0; "from_univ"(#less)
@"$Anon_Const_2_2" = internal constant i64 2; "from_univ"(#greater)
@"$Anon_Const_2_3" = internal constant i64 1; "from_univ"(#equal)
@"$Anon_Const_2_4" = internal constant i64 3; "from_univ"(#unordered)
@$str_stream1 = internal constant [30 x i8] 

[i8 26, i8 0, i8 0, i8 0, i8 80, i8 83, i8 76, i8 58, i8 58, i8 67, i8 111
, i8 114, i8 101, i8 58, i8 58, i8 67, i8 108, i8 111, i8 115, i8 101, i8 100
, i8 95, i8 73, i8 110, i8 116, i8 101, i8 114, i8 118, i8 97, i8 108]

@$str_stream2 = internal constant [8 x i8] 

[i8 4, i8 0, i8 0, i8 0, i8 34, i8 105, i8 110, i8 34]

@$str_stream3 = internal constant [104 x i8] 

[i8 100, i8 0, i8 0, i8 0, i8 47, i8 85, i8 115, i8 101, i8 114, i8 115, i8 47
, i8 115, i8 116, i8 116, i8 47, i8 95, i8 112, i8 97, i8 114, i8 97, i8 115
, i8 97, i8 105, i8 108, i8 47, i8 108, i8 105, i8 98, i8 47, i8 97, i8 97
, i8 97, i8 47, i8 97, i8 97, i8 97, i8 48, i8 50, i8 49, i8 99, i8 108, i8 111
, i8 115, i8 101, i8 100, i8 95, i8 105, i8 110, i8 116, i8 101, i8 114, i8 118
, i8 97, i8 108, i8 46, i8 112, i8 115, i8 105, i8 58, i8 49, i8 52, i8 58
, i8 57, i8 58, i8 32, i8 69, i8 114, i8 114, i8 111, i8 114, i8 58, i8 32
, i8 78, i8 117, i8 108, i8 108, i8 32, i8 118, i8 97, i8 108, i8 117, i8 101
, i8 32, i8 110, i8 111, i8 116, i8 32, i8 112, i8 101, i8 114, i8 109, i8 105
, i8 116, i8 116, i8 101, i8 100, i8 32, i8 104, i8 101, i8 114, i8 101, i8 58
, i8 32, i8 10]

@$str_stream4 = internal constant [8 x i8] 

[i8 4, i8 0, i8 0, i8 0, i8 34, i8 61, i8 63, i8 34]

@$str_stream5 = internal constant [105 x i8] 

[i8 101, i8 0, i8 0, i8 0, i8 47, i8 85, i8 115, i8 101, i8 114, i8 115, i8 47
, i8 115, i8 116, i8 116, i8 47, i8 95, i8 112, i8 97, i8 114, i8 97, i8 115
, i8 97, i8 105, i8 108, i8 47, i8 108, i8 105, i8 98, i8 47, i8 97, i8 97
, i8 97, i8 47, i8 97, i8 97, i8 97, i8 48, i8 50, i8 49, i8 99, i8 108, i8 111
, i8 115, i8 101, i8 100, i8 95, i8 105, i8 110, i8 116, i8 101, i8 114, i8 118
, i8 97, i8 108, i8 46, i8 112, i8 115, i8 105, i8 58, i8 50, i8 51, i8 58
, i8 49, i8 51, i8 58, i8 32, i8 69, i8 114, i8 114, i8 111, i8 114, i8 58
, i8 32, i8 78, i8 117, i8 108, i8 108, i8 32, i8 118, i8 97, i8 108, i8 117
, i8 101, i8 32, i8 110, i8 111, i8 116, i8 32, i8 112, i8 101, i8 114, i8 109
, i8 105, i8 116, i8 116, i8 101, i8 100, i8 32, i8 104, i8 101, i8 114, i8 101
, i8 58, i8 32, i8 10]

@$str_stream6 = internal constant [105 x i8] 

[i8 101, i8 0, i8 0, i8 0, i8 47, i8 85, i8 115, i8 101, i8 114, i8 115, i8 47
, i8 115, i8 116, i8 116, i8 47, i8 95, i8 112, i8 97, i8 114, i8 97, i8 115
, i8 97, i8 105, i8 108, i8 47, i8 108, i8 105, i8 98, i8 47, i8 97, i8 97
, i8 97, i8 47, i8 97, i8 97, i8 97, i8 48, i8 50, i8 49, i8 99, i8 108, i8 111
, i8 115, i8 101, i8 100, i8 95, i8 105, i8 110, i8 116, i8 101, i8 114, i8 118
, i8 97, i8 108, i8 46, i8 112, i8 115, i8 105, i8 58, i8 50, i8 53, i8 58
, i8 49, i8 51, i8 58, i8 32, i8 69, i8 114, i8 114, i8 111, i8 114, i8 58
, i8 32, i8 78, i8 117, i8 108, i8 108, i8 32, i8 118, i8 97, i8 108, i8 117
, i8 101, i8 32, i8 110, i8 111, i8 116, i8 32, i8 112, i8 101, i8 114, i8 109
, i8 105, i8 116, i8 116, i8 101, i8 100, i8 32, i8 104, i8 101, i8 114, i8 101
, i8 58, i8 32, i8 10]

@$str_stream7 = internal constant [105 x i8] 

[i8 101, i8 0, i8 0, i8 0, i8 47, i8 85, i8 115, i8 101, i8 114, i8 115, i8 47
, i8 115, i8 116, i8 116, i8 47, i8 95, i8 112, i8 97, i8 114, i8 97, i8 115
, i8 97, i8 105, i8 108, i8 47, i8 108, i8 105, i8 98, i8 47, i8 97, i8 97
, i8 97, i8 47, i8 97, i8 97, i8 97, i8 48, i8 50, i8 49, i8 99, i8 108, i8 111
, i8 115, i8 101, i8 100, i8 95, i8 105, i8 110, i8 116, i8 101, i8 114, i8 118
, i8 97, i8 108, i8 46, i8 112, i8 115, i8 105, i8 58, i8 50, i8 56, i8 58
, i8 49, i8 51, i8 58, i8 32, i8 69, i8 114, i8 114, i8 111, i8 114, i8 58
, i8 32, i8 78, i8 117, i8 108, i8 108, i8 32, i8 118, i8 97, i8 108, i8 117
, i8 101, i8 32, i8 110, i8 111, i8 116, i8 32, i8 112, i8 101, i8 114, i8 109
, i8 105, i8 116, i8 116, i8 101, i8 100, i8 32, i8 104, i8 101, i8 114, i8 101
, i8 58, i8 32, i8 10]

@$str_stream8 = internal constant [105 x i8] 

[i8 101, i8 0, i8 0, i8 0, i8 47, i8 85, i8 115, i8 101, i8 114, i8 115, i8 47
, i8 115, i8 116, i8 116, i8 47, i8 95, i8 112, i8 97, i8 114, i8 97, i8 115
, i8 97, i8 105, i8 108, i8 47, i8 108, i8 105, i8 98, i8 47, i8 97, i8 97
, i8 97, i8 47, i8 97, i8 97, i8 97, i8 48, i8 50, i8 49, i8 99, i8 108, i8 111
, i8 115, i8 101, i8 100, i8 95, i8 105, i8 110, i8 116, i8 101, i8 114, i8 118
, i8 97, i8 108, i8 46, i8 112, i8 115, i8 105, i8 58, i8 51, i8 48, i8 58
, i8 49, i8 51, i8 58, i8 32, i8 69, i8 114, i8 114, i8 111, i8 114, i8 58
, i8 32, i8 78, i8 117, i8 108, i8 108, i8 32, i8 118, i8 97, i8 108, i8 117
, i8 101, i8 32, i8 110, i8 111, i8 116, i8 32, i8 112, i8 101, i8 114, i8 109
, i8 105, i8 116, i8 116, i8 101, i8 100, i8 32, i8 104, i8 101, i8 114, i8 101
, i8 58, i8 32, i8 10]

@$Str_Streams = internal constant [8 x i8*] [
i8* bitcast ([30 x i8]* @$str_stream1 to i8*), 
i8* bitcast ([8 x i8]* @$str_stream2 to i8*), 
i8* bitcast ([104 x i8]* @$str_stream3 to i8*), 
i8* bitcast ([8 x i8]* @$str_stream4 to i8*), 
i8* bitcast ([105 x i8]* @$str_stream5 to i8*), 
i8* bitcast ([105 x i8]* @$str_stream6 to i8*), 
i8* bitcast ([105 x i8]* @$str_stream7 to i8*), 
i8* bitcast ([105 x i8]* @$str_stream8 to i8*)]
@$String_Table = internal global [8 x i64] 
[i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0]
@$Strings = internal constant i64* bitcast ([8 x i64]* @$String_Table to i64*)
@_psc_global_to_do = external global {i64*, void()*}*
define internal void @$initialize_streams() {
   %_Str_Tab = load i64*, i64** @$Strings
   call void @_psc_reconstruct_strings(i16 8, i8** bitcast ([8 x i8*]* @$Str_Streams to i8**), i64* %_Str_Tab)
   call void @_psc_register_compiled_operations(i16 2, i16* bitcast ([4 x i16]* @$Module_Op_Indices to i16*), void(i64*, i64*, i64*)** bitcast ([2 x void(i64*, i64*, i64*)*]* @$Local_Funcs to void(i64*, i64*, i64*)**), i32* bitcast ([2 x i32]* @$Local_Funcs_Conv_Descs to i32*), i64* %_Str_Tab, i32 0, i16* bitcast ([0 x i16]* @$Internal_Precond_Indices to i16*), i32(i64*, i64*, i64*)** bitcast ([0 x i32(i64*, i64*, i64*)*]* @$Internal_Precond_Blocks to i32(i64*, i64*, i64*)**))
   ret void
}
@"_node_/Users/stt/_parasail/lib/aaa/aaa021closed_interval.psi" = global {i64*, void()*} {i64* null, void()* @$initialize_streams}
define internal void @$add_to_todo() {
   %_next = load {i64*, void()*}*, {i64*, void()*}** @_psc_global_to_do
   %_nextc = bitcast {i64*, void()*}* %_next to i64*
   %_node.next_ptr = getelementptr {i64*, void()*}, {i64*, void()*}* @"_node_/Users/stt/_parasail/lib/aaa/aaa021closed_interval.psi", i32 0, i32 0
   store i64* %_nextc, i64** %_node.next_ptr
   store {i64*, void()*}* @"_node_/Users/stt/_parasail/lib/aaa/aaa021closed_interval.psi", {i64*, void()*}** @_psc_global_to_do
   ret void
}
@llvm.global_ctors = appending global [1 x {i32, void ()*}] [{i32, void()*} {i32 65535, void ()* @$add_to_todo}]

define i64 @"PSL.Core.Closed_Interval.$in$"(i64 %_formal_param_1, i64 %_formal_param_2, i64* %_Context, i64* %_Static_Link) {
   %_Local_Area = alloca i64, i64 4
   %_sl = ptrtoint i64* %_Static_Link to i64
   store i64 %_sl, i64* %_Local_Area

   %_Param_Area = alloca i64
   %_loc_2 = alloca i64
   %_call5_Param_Area = alloca i64, i64 3
   %_call12_Param_Area = alloca i64, i64 3
   %_print_param18 = alloca i64

   
   ; #Declare_Obj_Op at 14:34

   ; #Copy_Word_Op at 14:16
   %_source_val2 = bitcast i64 %_formal_param_1 to i64
   %_loc_7 = bitcast i64 %_source_val2 to i64

   ; #Copy_Word_Op at 14:24
   %_source_val3 = bitcast i64 %_formal_param_2 to i64
   %_loc_9 = bitcast i64 %_source_val3 to i64

   ; #Copy_Word_Op at 14:30
   %_reg4_1 = inttoptr i64 %_loc_9 to i64*
   %_source4 = getelementptr i64, i64* %_reg4_1, i64 1
   %_source_val4 = load i64, i64* %_source4
   %_loc_8 = bitcast i64 %_source_val4 to i64

   ; #Call_Op at 14:21
   %_cur_td5 = bitcast i64* %_Static_Link to %struct.TD*
   %_param_arr_ptr5 = getelementptr %struct.TD, %struct.TD* %_cur_td5, i32 0, i32 26
   %_param_arr5 = load %struct.ParamInfo*, %struct.ParamInfo** %_param_arr_ptr5
   %_formal_td_ptr_ptr5 = getelementptr %struct.ParamInfo, %struct.ParamInfo* %_param_arr5, i32 0, i32 1, i32 0
   %_formal_td5 = load %struct.TD*, %struct.TD** %_formal_td_ptr_ptr5
   %_call5_Static_Link = bitcast %struct.TD* %_formal_td5 to i64*
   %_new_arg_addr5_1 = getelementptr i64, i64* %_call5_Param_Area, i64 1
   store i64 %_loc_7, i64* %_new_arg_addr5_1
   %_new_arg_addr5_2 = getelementptr i64, i64* %_call5_Param_Area, i64 2
   store i64 %_loc_8, i64* %_new_arg_addr5_2
   call void @_psc_execute_compiled_nth_op_of_type(i64* %_Context, i64* %_call5_Param_Area, i64* %_call5_Static_Link, i16 3, i16 1)
   %_new_result_addr5_0 = getelementptr i64, i64* %_call5_Param_Area, i64 0
   %_new_result5_0 = load i64, i64* %_new_result_addr5_0
   %_loc_4 = bitcast i64 %_new_result5_0 to i64

   ; #Store_Int_Lit_Op at 14:21
   %_loc_5 = bitcast i64 6 to i64

   ; #Call_Op at 14:21
   %_first_arg7 = bitcast i64 %_loc_4 to i64
   %_secon_arg7 = bitcast i64 %_loc_5 to i64
   %_mask_shifted7 = lshr i64 %_secon_arg7, %_first_arg7
   %_resul7 = and i64 1, %_mask_shifted7
   %_resul7_ptr = bitcast i64* %_loc_2 to i64* 
   store i64 %_resul7, i64* %_resul7_ptr

   ; #If_Op at 14:34
   %_if_source_ptr8 = bitcast i64* %_loc_2 to i64* 
   %_if_source_val8 = load i64, i64* %_if_source_ptr8
   %_if_source_trunc8 = icmp eq i64 %_if_source_val8, 1
   br i1 %_if_source_trunc8, label %_lbl9, label %_lbl16

_lbl9:
   ; #Copy_Word_Op at 14:43
   %_source_val9 = bitcast i64 %_formal_param_1 to i64
   %_loc_14 = bitcast i64 %_source_val9 to i64

   ; #Copy_Word_Op at 14:51
   %_source_val10 = bitcast i64 %_formal_param_2 to i64
   %_loc_16 = bitcast i64 %_source_val10 to i64

   ; #Copy_Word_Op at 14:57
   %_reg11_1 = inttoptr i64 %_loc_16 to i64*
   %_source11 = getelementptr i64, i64* %_reg11_1, i64 2
   %_source_val11 = load i64, i64* %_source11
   %_loc_15 = bitcast i64 %_source_val11 to i64

   ; #Call_Op at 14:48
   %_cur_td12 = bitcast i64* %_Static_Link to %struct.TD*
   %_param_arr_ptr12 = getelementptr %struct.TD, %struct.TD* %_cur_td12, i32 0, i32 26
   %_param_arr12 = load %struct.ParamInfo*, %struct.ParamInfo** %_param_arr_ptr12
   %_formal_td_ptr_ptr12 = getelementptr %struct.ParamInfo, %struct.ParamInfo* %_param_arr12, i32 0, i32 1, i32 0
   %_formal_td12 = load %struct.TD*, %struct.TD** %_formal_td_ptr_ptr12
   %_call12_Static_Link = bitcast %struct.TD* %_formal_td12 to i64*
   %_new_arg_addr12_1 = getelementptr i64, i64* %_call12_Param_Area, i64 1
   store i64 %_loc_14, i64* %_new_arg_addr12_1
   %_new_arg_addr12_2 = getelementptr i64, i64* %_call12_Param_Area, i64 2
   store i64 %_loc_15, i64* %_new_arg_addr12_2
   call void @_psc_execute_compiled_nth_op_of_type(i64* %_Context, i64* %_call12_Param_Area, i64* %_call12_Static_Link, i16 3, i16 1)
   %_new_result_addr12_0 = getelementptr i64, i64* %_call12_Param_Area, i64 0
   %_new_result12_0 = load i64, i64* %_new_result_addr12_0
   %_loc_11 = bitcast i64 %_new_result12_0 to i64

   ; #Store_Int_Lit_Op at 14:48
   %_loc_12 = bitcast i64 3 to i64

   ; #Call_Op at 14:48
   %_first_arg14 = bitcast i64 %_loc_11 to i64
   %_secon_arg14 = bitcast i64 %_loc_12 to i64
   %_mask_shifted14 = lshr i64 %_secon_arg14, %_first_arg14
   %_resul14 = and i64 1, %_mask_shifted14
   %_resul14_ptr = bitcast i64* %_loc_2 to i64* 
   store i64 %_resul14, i64* %_resul14_ptr

   ; #Skip_Op at 14:34
   br label %_lbl16

_lbl16:
   ; #Copy_Word_Op at 14:34
   %_source16 = bitcast i64* %_loc_2 to i64* 
   %_source_val16 = load i64, i64* %_source16
   %_loc_1 = bitcast i64 %_source_val16 to i64

   ; #Copy_Word_Op at 14:9
   %_source_val17 = bitcast i64 %_loc_1 to i64
   %_dest17 = getelementptr i64, i64* %_Param_Area, i64 0
   store i64 %_source_val17, i64* %_dest17

   ; #Check_Not_Null_Op at 14:9
   %_arg_ptr18 = getelementptr i64, i64* %_Param_Area, i64 0
   %_arg18 = load i64, i64* %_arg_ptr18
   %_is_null18 = icmp eq i64 %_arg18, shl (i64 1, i64 63)
   br i1 %_is_null18, label %_fail18, label %_lbl19
   _fail18:
   %_str_ptr_ptr18 = load i64*, i64** @$Strings
   %_str_ptr18 = getelementptr i64, i64* %_str_ptr_ptr18, i64 2
   %_assert_str18 = load i64, i64* %_str_ptr18
   store i64 %_assert_str18, i64* %_print_param18
   call void @_psc_runtime_message(i64* %_Context, i64* %_print_param18, i64* null)

   br label %_lbl19

_lbl19:
   ; #Return_Op at 14:9
   %_result_reg19 = load i64, i64* %_Param_Area
   ret i64 %_result_reg19

}

define i64 @"PSL.Core.Closed_Interval.$=?$"(i64 %_formal_param_1, i64 %_formal_param_2, i64* %_Context, i64* %_Static_Link) {
   %_Local_Area = alloca i64, i64 4
   %_sl = ptrtoint i64* %_Static_Link to i64
   store i64 %_sl, i64* %_Local_Area

   %_Param_Area = alloca i64
   %_call5_Param_Area = alloca i64, i64 3
   %_print_param11 = alloca i64
   %_call17_Param_Area = alloca i64, i64 3
   %_print_param23 = alloca i64
   %_loc_22 = alloca i64
   %_call30_Param_Area = alloca i64, i64 3
   %_call38_Param_Area = alloca i64, i64 3
   %_print_param46 = alloca i64
   %_print_param50 = alloca i64

   
   ; #Copy_Word_Op at 22:12
   %_source_val1 = bitcast i64 %_formal_param_1 to i64
   %_loc_8 = bitcast i64 %_source_val1 to i64

   ; #Copy_Word_Op at 22:17
   %_reg2_1 = inttoptr i64 %_loc_8 to i64*
   %_source2 = getelementptr i64, i64* %_reg2_1, i64 2
   %_source_val2 = load i64, i64* %_source2
   %_loc_6 = bitcast i64 %_source_val2 to i64

   ; #Copy_Word_Op at 22:24
   %_source_val3 = bitcast i64 %_formal_param_2 to i64
   %_loc_9 = bitcast i64 %_source_val3 to i64

   ; #Copy_Word_Op at 22:30
   %_reg4_1 = inttoptr i64 %_loc_9 to i64*
   %_source4 = getelementptr i64, i64* %_reg4_1, i64 1
   %_source_val4 = load i64, i64* %_source4
   %_loc_7 = bitcast i64 %_source_val4 to i64

   ; #Call_Op at 22:22
   %_cur_td5 = bitcast i64* %_Static_Link to %struct.TD*
   %_param_arr_ptr5 = getelementptr %struct.TD, %struct.TD* %_cur_td5, i32 0, i32 26
   %_param_arr5 = load %struct.ParamInfo*, %struct.ParamInfo** %_param_arr_ptr5
   %_formal_td_ptr_ptr5 = getelementptr %struct.ParamInfo, %struct.ParamInfo* %_param_arr5, i32 0, i32 1, i32 0
   %_formal_td5 = load %struct.TD*, %struct.TD** %_formal_td_ptr_ptr5
   %_call5_Static_Link = bitcast %struct.TD* %_formal_td5 to i64*
   %_new_arg_addr5_1 = getelementptr i64, i64* %_call5_Param_Area, i64 1
   store i64 %_loc_6, i64* %_new_arg_addr5_1
   %_new_arg_addr5_2 = getelementptr i64, i64* %_call5_Param_Area, i64 2
   store i64 %_loc_7, i64* %_new_arg_addr5_2
   call void @_psc_execute_compiled_nth_op_of_type(i64* %_Context, i64* %_call5_Param_Area, i64* %_call5_Static_Link, i16 3, i16 1)
   %_new_result_addr5_0 = getelementptr i64, i64* %_call5_Param_Area, i64 0
   %_new_result5_0 = load i64, i64* %_new_result_addr5_0
   %_loc_3 = bitcast i64 %_new_result5_0 to i64

   ; #Store_Int_Lit_Op at 22:22
   %_loc_4 = bitcast i64 1 to i64

   ; #Call_Op at 22:22
   %_first_arg7 = bitcast i64 %_loc_3 to i64
   %_secon_arg7 = bitcast i64 %_loc_4 to i64
   %_mask_shifted7 = lshr i64 %_secon_arg7, %_first_arg7
   %_resul7 = and i64 1, %_mask_shifted7
   %_loc_1 = bitcast i64 %_resul7 to i64

   ; #If_Op at 22:22
   %_if_source_val8 = bitcast i64 %_loc_1 to i64
   %_if_source_trunc8 = icmp eq i64 %_if_source_val8, 1
   br i1 %_if_source_trunc8, label %_lbl9, label %_lbl13

_lbl9:
   ; #Copy_Word_Op at 23:20
   %_source9 = getelementptr i64, i64* @$Anon_Const_2_1, i64 0
   %_source_val9 = load i64, i64* %_source9
   %_loc_10 = bitcast i64 %_source_val9 to i64

   ; #Copy_Word_Op at 23:13
   %_source_val10 = bitcast i64 %_loc_10 to i64
   %_dest10 = getelementptr i64, i64* %_Param_Area, i64 0
   store i64 %_source_val10, i64* %_dest10

   ; #Check_Not_Null_Op at 23:13
   %_arg_ptr11 = getelementptr i64, i64* %_Param_Area, i64 0
   %_arg11 = load i64, i64* %_arg_ptr11
   %_is_null11 = icmp eq i64 %_arg11, shl (i64 1, i64 63)
   br i1 %_is_null11, label %_fail11, label %_lbl12
   _fail11:
   %_str_ptr_ptr11 = load i64*, i64** @$Strings
   %_str_ptr11 = getelementptr i64, i64* %_str_ptr_ptr11, i64 4
   %_assert_str11 = load i64, i64* %_str_ptr11
   store i64 %_assert_str11, i64* %_print_param11
   call void @_psc_runtime_message(i64* %_Context, i64* %_print_param11, i64* null)

   br label %_lbl12

_lbl12:
   ; #Return_Op at 23:13
   %_result_reg12 = load i64, i64* %_Param_Area
   ret i64 %_result_reg12

_lbl13:
   ; #Copy_Word_Op at 24:15
   %_source_val13 = bitcast i64 %_formal_param_1 to i64
   %_loc_18 = bitcast i64 %_source_val13 to i64

   ; #Copy_Word_Op at 24:20
   %_reg14_1 = inttoptr i64 %_loc_18 to i64*
   %_source14 = getelementptr i64, i64* %_reg14_1, i64 1
   %_source_val14 = load i64, i64* %_source14
   %_loc_16 = bitcast i64 %_source_val14 to i64

   ; #Copy_Word_Op at 24:26
   %_source_val15 = bitcast i64 %_formal_param_2 to i64
   %_loc_19 = bitcast i64 %_source_val15 to i64

   ; #Copy_Word_Op at 24:32
   %_reg16_1 = inttoptr i64 %_loc_19 to i64*
   %_source16 = getelementptr i64, i64* %_reg16_1, i64 2
   %_source_val16 = load i64, i64* %_source16
   %_loc_17 = bitcast i64 %_source_val16 to i64

   ; #Call_Op at 24:24
   %_cur_td17 = bitcast i64* %_Static_Link to %struct.TD*
   %_param_arr_ptr17 = getelementptr %struct.TD, %struct.TD* %_cur_td17, i32 0, i32 26
   %_param_arr17 = load %struct.ParamInfo*, %struct.ParamInfo** %_param_arr_ptr17
   %_formal_td_ptr_ptr17 = getelementptr %struct.ParamInfo, %struct.ParamInfo* %_param_arr17, i32 0, i32 1, i32 0
   %_formal_td17 = load %struct.TD*, %struct.TD** %_formal_td_ptr_ptr17
   %_call17_Static_Link = bitcast %struct.TD* %_formal_td17 to i64*
   %_new_arg_addr17_1 = getelementptr i64, i64* %_call17_Param_Area, i64 1
   store i64 %_loc_16, i64* %_new_arg_addr17_1
   %_new_arg_addr17_2 = getelementptr i64, i64* %_call17_Param_Area, i64 2
   store i64 %_loc_17, i64* %_new_arg_addr17_2
   call void @_psc_execute_compiled_nth_op_of_type(i64* %_Context, i64* %_call17_Param_Area, i64* %_call17_Static_Link, i16 3, i16 1)
   %_new_result_addr17_0 = getelementptr i64, i64* %_call17_Param_Area, i64 0
   %_new_result17_0 = load i64, i64* %_new_result_addr17_0
   %_loc_13 = bitcast i64 %_new_result17_0 to i64

   ; #Store_Int_Lit_Op at 24:24
   %_loc_14 = bitcast i64 4 to i64

   ; #Call_Op at 24:24
   %_first_arg19 = bitcast i64 %_loc_13 to i64
   %_secon_arg19 = bitcast i64 %_loc_14 to i64
   %_mask_shifted19 = lshr i64 %_secon_arg19, %_first_arg19
   %_resul19 = and i64 1, %_mask_shifted19
   %_loc_11 = bitcast i64 %_resul19 to i64

   ; #If_Op at 24:24
   %_if_source_val20 = bitcast i64 %_loc_11 to i64
   %_if_source_trunc20 = icmp eq i64 %_if_source_val20, 1
   br i1 %_if_source_trunc20, label %_lbl21, label %_lbl25

_lbl21:
   ; #Copy_Word_Op at 25:20
   %_source21 = getelementptr i64, i64* @$Anon_Const_2_2, i64 0
   %_source_val21 = load i64, i64* %_source21
   %_loc_20 = bitcast i64 %_source_val21 to i64

   ; #Copy_Word_Op at 25:13
   %_source_val22 = bitcast i64 %_loc_20 to i64
   %_dest22 = getelementptr i64, i64* %_Param_Area, i64 0
   store i64 %_source_val22, i64* %_dest22

   ; #Check_Not_Null_Op at 25:13
   %_arg_ptr23 = getelementptr i64, i64* %_Param_Area, i64 0
   %_arg23 = load i64, i64* %_arg_ptr23
   %_is_null23 = icmp eq i64 %_arg23, shl (i64 1, i64 63)
   br i1 %_is_null23, label %_fail23, label %_lbl24
   _fail23:
   %_str_ptr_ptr23 = load i64*, i64** @$Strings
   %_str_ptr23 = getelementptr i64, i64* %_str_ptr_ptr23, i64 5
   %_assert_str23 = load i64, i64* %_str_ptr23
   store i64 %_assert_str23, i64* %_print_param23
   call void @_psc_runtime_message(i64* %_Context, i64* %_print_param23, i64* null)

   br label %_lbl24

_lbl24:
   ; #Return_Op at 25:13
   %_result_reg24 = load i64, i64* %_Param_Area
   ret i64 %_result_reg24

_lbl25:
   ; #Declare_Obj_Op at 26:37

   ; #Copy_Word_Op at 26:15
   %_source_val26 = bitcast i64 %_formal_param_1 to i64
   %_loc_29 = bitcast i64 %_source_val26 to i64

   ; #Copy_Word_Op at 26:20
   %_reg27_1 = inttoptr i64 %_loc_29 to i64*
   %_source27 = getelementptr i64, i64* %_reg27_1, i64 1
   %_source_val27 = load i64, i64* %_source27
   %_loc_27 = bitcast i64 %_source_val27 to i64

   ; #Copy_Word_Op at 26:27
   %_source_val28 = bitcast i64 %_formal_param_2 to i64
   %_loc_30 = bitcast i64 %_source_val28 to i64

   ; #Copy_Word_Op at 26:33
   %_reg29_1 = inttoptr i64 %_loc_30 to i64*
   %_source29 = getelementptr i64, i64* %_reg29_1, i64 1
   %_source_val29 = load i64, i64* %_source29
   %_loc_28 = bitcast i64 %_source_val29 to i64

   ; #Call_Op at 26:24
   %_cur_td30 = bitcast i64* %_Static_Link to %struct.TD*
   %_param_arr_ptr30 = getelementptr %struct.TD, %struct.TD* %_cur_td30, i32 0, i32 26
   %_param_arr30 = load %struct.ParamInfo*, %struct.ParamInfo** %_param_arr_ptr30
   %_formal_td_ptr_ptr30 = getelementptr %struct.ParamInfo, %struct.ParamInfo* %_param_arr30, i32 0, i32 1, i32 0
   %_formal_td30 = load %struct.TD*, %struct.TD** %_formal_td_ptr_ptr30
   %_call30_Static_Link = bitcast %struct.TD* %_formal_td30 to i64*
   %_new_arg_addr30_1 = getelementptr i64, i64* %_call30_Param_Area, i64 1
   store i64 %_loc_27, i64* %_new_arg_addr30_1
   %_new_arg_addr30_2 = getelementptr i64, i64* %_call30_Param_Area, i64 2
   store i64 %_loc_28, i64* %_new_arg_addr30_2
   call void @_psc_execute_compiled_nth_op_of_type(i64* %_Context, i64* %_call30_Param_Area, i64* %_call30_Static_Link, i16 3, i16 1)
   %_new_result_addr30_0 = getelementptr i64, i64* %_call30_Param_Area, i64 0
   %_new_result30_0 = load i64, i64* %_new_result_addr30_0
   %_loc_24 = bitcast i64 %_new_result30_0 to i64

   ; #Store_Int_Lit_Op at 26:24
   %_loc_25 = bitcast i64 2 to i64

   ; #Call_Op at 26:24
   %_first_arg32 = bitcast i64 %_loc_24 to i64
   %_secon_arg32 = bitcast i64 %_loc_25 to i64
   %_mask_shifted32 = lshr i64 %_secon_arg32, %_first_arg32
   %_resul32 = and i64 1, %_mask_shifted32
   %_resul32_ptr = bitcast i64* %_loc_22 to i64* 
   store i64 %_resul32, i64* %_resul32_ptr

   ; #If_Op at 26:37
   %_if_source_ptr33 = bitcast i64* %_loc_22 to i64* 
   %_if_source_val33 = load i64, i64* %_if_source_ptr33
   %_if_source_trunc33 = icmp eq i64 %_if_source_val33, 1
   br i1 %_if_source_trunc33, label %_lbl34, label %_lbl42

_lbl34:
   ; #Copy_Word_Op at 27:11
   %_source_val34 = bitcast i64 %_formal_param_1 to i64
   %_loc_37 = bitcast i64 %_source_val34 to i64

   ; #Copy_Word_Op at 27:16
   %_reg35_1 = inttoptr i64 %_loc_37 to i64*
   %_source35 = getelementptr i64, i64* %_reg35_1, i64 2
   %_source_val35 = load i64, i64* %_source35
   %_loc_35 = bitcast i64 %_source_val35 to i64

   ; #Copy_Word_Op at 27:24
   %_source_val36 = bitcast i64 %_formal_param_2 to i64
   %_loc_38 = bitcast i64 %_source_val36 to i64

   ; #Copy_Word_Op at 27:30
   %_reg37_1 = inttoptr i64 %_loc_38 to i64*
   %_source37 = getelementptr i64, i64* %_reg37_1, i64 2
   %_source_val37 = load i64, i64* %_source37
   %_loc_36 = bitcast i64 %_source_val37 to i64

   ; #Call_Op at 27:21
   %_cur_td38 = bitcast i64* %_Static_Link to %struct.TD*
   %_param_arr_ptr38 = getelementptr %struct.TD, %struct.TD* %_cur_td38, i32 0, i32 26
   %_param_arr38 = load %struct.ParamInfo*, %struct.ParamInfo** %_param_arr_ptr38
   %_formal_td_ptr_ptr38 = getelementptr %struct.ParamInfo, %struct.ParamInfo* %_param_arr38, i32 0, i32 1, i32 0
   %_formal_td38 = load %struct.TD*, %struct.TD** %_formal_td_ptr_ptr38
   %_call38_Static_Link = bitcast %struct.TD* %_formal_td38 to i64*
   %_new_arg_addr38_1 = getelementptr i64, i64* %_call38_Param_Area, i64 1
   store i64 %_loc_35, i64* %_new_arg_addr38_1
   %_new_arg_addr38_2 = getelementptr i64, i64* %_call38_Param_Area, i64 2
   store i64 %_loc_36, i64* %_new_arg_addr38_2
   call void @_psc_execute_compiled_nth_op_of_type(i64* %_Context, i64* %_call38_Param_Area, i64* %_call38_Static_Link, i16 3, i16 1)
   %_new_result_addr38_0 = getelementptr i64, i64* %_call38_Param_Area, i64 0
   %_new_result38_0 = load i64, i64* %_new_result_addr38_0
   %_loc_32 = bitcast i64 %_new_result38_0 to i64

   ; #Store_Int_Lit_Op at 27:21
   %_loc_33 = bitcast i64 2 to i64

   ; #Call_Op at 27:21
   %_first_arg40 = bitcast i64 %_loc_32 to i64
   %_secon_arg40 = bitcast i64 %_loc_33 to i64
   %_mask_shifted40 = lshr i64 %_secon_arg40, %_first_arg40
   %_resul40 = and i64 1, %_mask_shifted40
   %_resul40_ptr = bitcast i64* %_loc_22 to i64* 
   store i64 %_resul40, i64* %_resul40_ptr

   ; #Skip_Op at 26:37
   br label %_lbl42

_lbl42:
   ; #Copy_Word_Op at 26:37
   %_source42 = bitcast i64* %_loc_22 to i64* 
   %_source_val42 = load i64, i64* %_source42
   %_loc_21 = bitcast i64 %_source_val42 to i64

   ; #If_Op at 26:37
   %_if_source_val43 = bitcast i64 %_loc_21 to i64
   %_if_source_trunc43 = icmp eq i64 %_if_source_val43, 1
   br i1 %_if_source_trunc43, label %_lbl44, label %_lbl48

_lbl44:
   ; #Copy_Word_Op at 28:20
   %_source44 = getelementptr i64, i64* @$Anon_Const_2_3, i64 0
   %_source_val44 = load i64, i64* %_source44
   %_loc_39 = bitcast i64 %_source_val44 to i64

   ; #Copy_Word_Op at 28:13
   %_source_val45 = bitcast i64 %_loc_39 to i64
   %_dest45 = getelementptr i64, i64* %_Param_Area, i64 0
   store i64 %_source_val45, i64* %_dest45

   ; #Check_Not_Null_Op at 28:13
   %_arg_ptr46 = getelementptr i64, i64* %_Param_Area, i64 0
   %_arg46 = load i64, i64* %_arg_ptr46
   %_is_null46 = icmp eq i64 %_arg46, shl (i64 1, i64 63)
   br i1 %_is_null46, label %_fail46, label %_lbl47
   _fail46:
   %_str_ptr_ptr46 = load i64*, i64** @$Strings
   %_str_ptr46 = getelementptr i64, i64* %_str_ptr_ptr46, i64 6
   %_assert_str46 = load i64, i64* %_str_ptr46
   store i64 %_assert_str46, i64* %_print_param46
   call void @_psc_runtime_message(i64* %_Context, i64* %_print_param46, i64* null)

   br label %_lbl47

_lbl47:
   ; #Return_Op at 28:13
   %_result_reg47 = load i64, i64* %_Param_Area
   ret i64 %_result_reg47

_lbl48:
   ; #Copy_Word_Op at 30:20
   %_source48 = getelementptr i64, i64* @$Anon_Const_2_4, i64 0
   %_source_val48 = load i64, i64* %_source48
   %_loc_40 = bitcast i64 %_source_val48 to i64

   ; #Copy_Word_Op at 30:13
   %_source_val49 = bitcast i64 %_loc_40 to i64
   %_dest49 = getelementptr i64, i64* %_Param_Area, i64 0
   store i64 %_source_val49, i64* %_dest49

   ; #Check_Not_Null_Op at 30:13
   %_arg_ptr50 = getelementptr i64, i64* %_Param_Area, i64 0
   %_arg50 = load i64, i64* %_arg_ptr50
   %_is_null50 = icmp eq i64 %_arg50, shl (i64 1, i64 63)
   br i1 %_is_null50, label %_fail50, label %_lbl51
   _fail50:
   %_str_ptr_ptr50 = load i64*, i64** @$Strings
   %_str_ptr50 = getelementptr i64, i64* %_str_ptr_ptr50, i64 7
   %_assert_str50 = load i64, i64* %_str_ptr50
   store i64 %_assert_str50, i64* %_print_param50
   call void @_psc_runtime_message(i64* %_Context, i64* %_print_param50, i64* null)

   br label %_lbl51

_lbl51:
   ; #Return_Op at 30:13
   %_result_reg51 = load i64, i64* %_Param_Area
   ret i64 %_result_reg51

}

