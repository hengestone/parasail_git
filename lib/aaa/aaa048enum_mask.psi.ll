declare void @_psc_execute_compiled_nth_op_of_type(i64*, i64*, i64*, i16, i16)
declare void @_psc_execute_compiled_parallel_op(i64*, i64*, i64*, i32(i64*, i64*, i64*)*, i64* , i1, i1, i1)
declare i32 @_psc_execute_wait_for_parallel_op(i64*, i64*)
declare void @_psc_finalize_stg_rgn(i64*, i64*)
declare void @_psc_initialize_stg_rgn(i64*, i64*)
declare void @_psc_reconstruct_strings(i16, i8**, i64*)
declare void @_psc_register_compiled_operations(i16, i16*, void(i64*, i64*, i64*)**, i32*, i64*, i32, i16*, i32(i64*, i64*, i64*)**)
declare void @"_psc_runtime_message"(i64*, i64*, i64*)

@$Module_Op_Indices = internal constant [2 x i16] [
i16 1, i16 2]

@$Local_Funcs = internal constant [1 x void(i64*, i64*, i64*)*] [

void(i64*, i64*, i64*)* bitcast( i64 (i64, i64, i64*, i64*, i64)* @"PSL.Core.Enum_Mask.$|$" to void(i64*, i64*, i64*)*)]

@$Local_Funcs_Conv_Descs = internal constant [1 x i32] [
i32 33620480]

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
@$str_stream1 = internal constant [24 x i8] 

[i8 20, i8 0, i8 0, i8 0, i8 80, i8 83, i8 76, i8 58, i8 58, i8 67, i8 111
, i8 114, i8 101, i8 58, i8 58, i8 69, i8 110, i8 117, i8 109, i8 95, i8 77
, i8 97, i8 115, i8 107]

@$str_stream2 = internal constant [7 x i8] 

[i8 3, i8 0, i8 0, i8 0, i8 34, i8 124, i8 34]

@$str_stream3 = internal constant [98 x i8] 

[i8 94, i8 0, i8 0, i8 0, i8 47, i8 85, i8 115, i8 101, i8 114, i8 115, i8 47
, i8 115, i8 116, i8 116, i8 47, i8 95, i8 112, i8 97, i8 114, i8 97, i8 115
, i8 97, i8 105, i8 108, i8 47, i8 108, i8 105, i8 98, i8 47, i8 97, i8 97
, i8 97, i8 47, i8 97, i8 97, i8 97, i8 48, i8 52, i8 56, i8 101, i8 110
, i8 117, i8 109, i8 95, i8 109, i8 97, i8 115, i8 107, i8 46, i8 112, i8 115
, i8 105, i8 58, i8 56, i8 58, i8 49, i8 49, i8 58, i8 32, i8 69, i8 114
, i8 114, i8 111, i8 114, i8 58, i8 32, i8 78, i8 117, i8 108, i8 108, i8 32
, i8 118, i8 97, i8 108, i8 117, i8 101, i8 32, i8 110, i8 111, i8 116, i8 32
, i8 112, i8 101, i8 114, i8 109, i8 105, i8 116, i8 116, i8 101, i8 100, i8 32
, i8 104, i8 101, i8 114, i8 101, i8 58, i8 32, i8 10]

@$Str_Streams = internal constant [3 x i8*] [
i8* bitcast ([24 x i8]* @$str_stream1 to i8*), 
i8* bitcast ([7 x i8]* @$str_stream2 to i8*), 
i8* bitcast ([98 x i8]* @$str_stream3 to i8*)]
@$String_Table = internal global [3 x i64] 
[i64 0, i64 0, i64 0]
@$Strings = internal constant i64* bitcast ([3 x i64]* @$String_Table to i64*)
@_psc_global_to_do = external global {i64*, void()*}*
define internal void @$initialize_streams() {
   %_Str_Tab = load i64*, i64** @$Strings
   call void @_psc_reconstruct_strings(i16 3, i8** bitcast ([3 x i8*]* @$Str_Streams to i8**), i64* %_Str_Tab)
   call void @_psc_register_compiled_operations(i16 1, i16* bitcast ([2 x i16]* @$Module_Op_Indices to i16*), void(i64*, i64*, i64*)** bitcast ([1 x void(i64*, i64*, i64*)*]* @$Local_Funcs to void(i64*, i64*, i64*)**), i32* bitcast ([1 x i32]* @$Local_Funcs_Conv_Descs to i32*), i64* %_Str_Tab, i32 0, i16* bitcast ([0 x i16]* @$Internal_Precond_Indices to i16*), i32(i64*, i64*, i64*)** bitcast ([0 x i32(i64*, i64*, i64*)*]* @$Internal_Precond_Blocks to i32(i64*, i64*, i64*)**))
   ret void
}
@"_node_/Users/stt/_parasail/lib/aaa/aaa048enum_mask.psi" = global {i64*, void()*} {i64* null, void()* @$initialize_streams}
define internal void @$add_to_todo() {
   %_next = load {i64*, void()*}*, {i64*, void()*}** @_psc_global_to_do
   %_nextc = bitcast {i64*, void()*}* %_next to i64*
   %_node.next_ptr = getelementptr {i64*, void()*}, {i64*, void()*}* @"_node_/Users/stt/_parasail/lib/aaa/aaa048enum_mask.psi", i32 0, i32 0
   store i64* %_nextc, i64** %_node.next_ptr
   store {i64*, void()*}* @"_node_/Users/stt/_parasail/lib/aaa/aaa048enum_mask.psi", {i64*, void()*}** @_psc_global_to_do
   ret void
}
@llvm.global_ctors = appending global [1 x {i32, void ()*}] [{i32, void()*} {i32 65535, void ()* @$add_to_todo}]

define i64 @"PSL.Core.Enum_Mask.$|$"(i64 %_formal_param_1, i64 %_formal_param_2, i64* %_Context, i64* %_Static_Link, i64 %_inited_output) {
   %_Local_Area = alloca i64, i64 7
   %_sl = ptrtoint i64* %_Static_Link to i64
   store i64 %_sl, i64* %_Local_Area
   call void @_psc_initialize_stg_rgn(i64* %_Context, i64* %_Local_Area)
   %_Master = alloca i64, i64 3
   %_ms = ptrtoint i64* %_Master to i64
   %_store_ms = getelementptr i64, i64* %_Local_Area, i64 3
   store i64 %_ms, i64* %_store_ms

   %_Param_Area = alloca i64
   %_loc_3 = alloca i64, i64 12
   %_call6_Param_Area = alloca i64, i64 2
   %_print_param9 = alloca i64

   store i64 %_inited_output, i64* %_Param_Area
   %_param_addr_1 = getelementptr i64, i64* %_Local_Area, i64 4
   store i64 %_formal_param_1, i64* %_param_addr_1
   %_param_addr_2 = getelementptr i64, i64* %_Local_Area, i64 5
   store i64 %_formal_param_2, i64* %_param_addr_2
   
   ; #Store_Large_Local_Null_Op at 8:34
   %_ctx1 = bitcast i64* %_Context to %struct.ExecCtx*
   %_large_null_ptr1 = getelementptr %struct.ExecCtx, %struct.ExecCtx* %_ctx1, i32 0, i32 1
   %_null1 = load i64, i64* %_large_null_ptr1
   %_loc_2 = bitcast i64 %_null1 to i64
   %_dest_ptr1 = getelementptr i64, i64* %_Local_Area, i64 6
   store i64 %_loc_2, i64* %_dest_ptr1

   ; #Start_Parallel_Op at 8:34
   %_master2 = bitcast i64* %_Master to i64*
   %_static_Link2 = getelementptr i64, i64* %_Local_Area, i64 0
   call void @_psc_execute_compiled_parallel_op(i64* %_Context, i64* %_master2, i64* %_loc_3, i32(i64*, i64*, i64*)* @"PSL.Core.Enum_Mask.$|$.10block", i64* %_static_Link2, i1 0, i1 1, i1 1)
   %_new_result_addr2_11 = getelementptr i64, i64* %_loc_3, i64 11

   ; #Store_Null_Of_Same_Stg_Rgn_Op at 8:12
   %_desc3 = getelementptr i64, i64* %_Static_Link, i64 0
   %_source_ptr3 = getelementptr i64, i64* %_Param_Area, i64 0
   %_source3 = load i64, i64* %_source_ptr3
   %_td3 = bitcast i64* %_desc3 to %struct.TD*
   %_is_small_ptr3 = getelementptr %struct.TD, %struct.TD* %_td3, i32 0, i32 13
   %_is_small3 = load i8, i8* %_is_small_ptr3
   %_is_small_bool3 = trunc i8 %_is_small3 to i1
   br i1 %_is_small_bool3, label %_small_label3, label %_large_label3
   _small_label3:
   %_small_null_ptr3 = getelementptr %struct.TD, %struct.TD* %_td3, i32 0, i32 17
   %_small_null3 = load i64, i64* %_small_null_ptr3
   br label %_join_small_and_large3
   _large_label3:
   %_high_and_low_bits3 = and i64 %_source3, or (i64 shl (i64 1, i64 63), i64 1)
   %_is_special_bit3 = icmp eq i64 %_high_and_low_bits3, or (i64 shl (i64 1, i64 63), i64 1)
   br i1 %_is_special_bit3, label %_is_special_label3, label %_not_special_label3
   _is_special_label3:
   %_spcl_rgn_times2_3 = and i64 %_source3, 4294967295
   br label %_last_large_label3
   _not_special_label3:
   %_header_ptr3 = inttoptr i64 %_source3 to i64*
   %_hdr_of_src3 = load i64, i64* %_header_ptr3
   %_region_bits3 = and i64 %_hdr_of_src3, 4294901760
   %_normal_rgn_times2_3 = lshr i64 %_region_bits3, 15
   br label %_last_large_label3
   _last_large_label3:
   %_rgn_times2_3 = phi i64 [%_spcl_rgn_times2_3, %_is_special_label3], [%_normal_rgn_times2_3, %_not_special_label3]
   %_large_null3 = or i64 -144115188075855871, %_rgn_times2_3
   br label %_join_small_and_large3
   _join_small_and_large3:
   %_null3 = phi i64 [%_small_null3, %_small_label3],[%_large_null3, %_last_large_label3]
   %_loc_5 = bitcast i64 %_null3 to i64

   ; #Wait_For_Parallel_Op at 8:34
   %_master4 = bitcast i64* %_Master to i64*
   %_level_skip4 = call i32 @_psc_execute_wait_for_parallel_op(i64* %_Context, i64* %_master4)
   %_level_diff32_4 = ashr i32 %_level_skip4, 16
   %_level_diff4 = trunc i32 %_level_diff32_4 to i16
   %_skip_count4 = trunc i32 %_level_skip4 to i16
   %_level_diff_nz4 = icmp ne i16 %_level_diff4, 0
   br i1 %_level_diff_nz4, label %_exit4, label %_switch4
   _exit4:
   call void @_psc_finalize_stg_rgn(i64* %_Context, i64* %_Local_Area)
   %_result_reg4 = load i64, i64* %_Param_Area
   ret i64 %_result_reg4
   _switch4:
   br label %_lbl5

_lbl5:
   ; #Copy_Word_Op at 8:34
   %_source5 = getelementptr i64, i64* %_loc_3, i64 11
   %_source_val5 = load i64, i64* %_source5
   %_loc_6 = bitcast i64 %_source_val5 to i64

   ; #Call_Op at 8:12
   %_call6_Static_Link = getelementptr i64, i64* %_Static_Link, i64 0
   %_new_arg_addr6_0 = getelementptr i64, i64* %_call6_Param_Area, i64 0
   store i64 %_loc_5, i64* %_new_arg_addr6_0
   %_new_arg_addr6_1 = getelementptr i64, i64* %_call6_Param_Area, i64 1
   store i64 %_loc_6, i64* %_new_arg_addr6_1
   call void @_psc_execute_compiled_nth_op_of_type(i64* %_Context, i64* %_call6_Param_Area, i64* %_call6_Static_Link, i16 3, i16 3)
   %_new_result_addr6_0 = getelementptr i64, i64* %_call6_Param_Area, i64 0
   %_new_result6_0 = load i64, i64* %_new_result_addr6_0
   %_loc_1 = bitcast i64 %_new_result6_0 to i64

   ; #Copy_Word_Op at 8:12

   ; #Copy_Word_Op at 8:11
   %_source_val8 = bitcast i64 %_loc_1 to i64
   %_dest8 = getelementptr i64, i64* %_Param_Area, i64 0
   store i64 %_source_val8, i64* %_dest8

   ; #Check_Not_Null_Op at 8:11
   %_arg_ptr9 = getelementptr i64, i64* %_Param_Area, i64 0
   %_arg9 = load i64, i64* %_arg_ptr9
   %_desc9 = getelementptr i64, i64* %_Static_Link, i64 0
   %_td9 = bitcast i64* %_desc9 to %struct.TD*
   %_is_small_ptr9 = getelementptr %struct.TD, %struct.TD* %_td9, i32 0, i32 13
   %_is_small9 = load i8, i8* %_is_small_ptr9
   %_is_small_bool9 = trunc i8 %_is_small9 to i1
   br i1 %_is_small_bool9, label %_is_small_lbl9, label %_is_large_lbl9
   _is_small_lbl9:
   %_small_null_ptr9 = getelementptr %struct.TD, %struct.TD* %_td9, i32 0, i32 17
   %_small_null9 = load i64, i64* %_small_null_ptr9
   %_small_result9 = icmp eq i64 %_arg9, %_small_null9
   br label %_join9
   _is_large_lbl9:
   %_val_no_reg9 = and i64 %_arg9, -4294967295
   %_large_result9 = icmp eq i64 %_val_no_reg9, -144115188075855871
   br label %_join9
   _join9:
   %_is_null9 = phi i1 [%_small_result9, %_is_small_lbl9], [%_large_result9, %_is_large_lbl9]
   br i1 %_is_null9, label %_fail9, label %_lbl10
   _fail9:
   %_str_ptr_ptr9 = load i64*, i64** @$Strings
   %_str_ptr9 = getelementptr i64, i64* %_str_ptr_ptr9, i64 2
   %_assert_str9 = load i64, i64* %_str_ptr9
   store i64 %_assert_str9, i64* %_print_param9
   call void @_psc_runtime_message(i64* %_Context, i64* %_print_param9, i64* null)

   br label %_lbl10

_lbl10:
   ; #Return_Op at 8:11
   call void @_psc_finalize_stg_rgn(i64* %_Context, i64* %_Local_Area)
   %_result_reg10 = load i64, i64* %_Param_Area
   ret i64 %_result_reg10

   ; #Begin_Nested_Block_Op at 8:34
}

define internal i32 @"PSL.Core.Enum_Mask.$|$.10block"(i64* %_Context, i64* %_Param_Area, i64* %_Static_Link) {
   %_Local_Area = alloca i64, i64 5
   %_sl = ptrtoint i64* %_Static_Link to i64
   %_pa = ptrtoint i64* %_Param_Area to i64
   %_store_pa = getelementptr i64, i64* %_Local_Area, i64 1
   store i64 %_pa, i64* %_store_pa
   store i64 %_sl, i64* %_Local_Area
   call void @_psc_initialize_stg_rgn(i64* %_Context, i64* %_Local_Area)
   %_Master = alloca i64, i64 3
   %_ms = ptrtoint i64* %_Master to i64
   %_store_ms = getelementptr i64, i64* %_Local_Area, i64 3
   store i64 %_ms, i64* %_store_ms

   %_loc_3 = alloca i64, i64 12
   %_call17_Param_Area = alloca i64, i64 2
   %_call20_Param_Area = alloca i64, i64 3

   ; #Store_Large_Local_Null_Op at 8:37
   %_ctx12 = bitcast i64* %_Context to %struct.ExecCtx*
   %_large_null_ptr12 = getelementptr %struct.ExecCtx, %struct.ExecCtx* %_ctx12, i32 0, i32 1
   %_null12 = load i64, i64* %_large_null_ptr12
   %_loc_2 = bitcast i64 %_null12 to i64
   %_dest_ptr12 = getelementptr i64, i64* %_Local_Area, i64 4
   store i64 %_loc_2, i64* %_dest_ptr12

   ; #Start_Parallel_Op at 8:37
   %_master13 = bitcast i64* %_Master to i64*
   %_static_Link13 = getelementptr i64, i64* %_Local_Area, i64 0
   call void @_psc_execute_compiled_parallel_op(i64* %_Context, i64* %_master13, i64* %_loc_3, i32(i64*, i64*, i64*)* @"PSL.Core.Enum_Mask.$|$.23block", i64* %_static_Link13, i1 0, i1 1, i1 1)
   %_new_result_addr13_11 = getelementptr i64, i64* %_loc_3, i64 11

   ; #Store_Null_Of_Same_Stg_Rgn_Op at 8:34
   %_ptr_val0_14 = load i64, i64* %_Static_Link
   %_ptr0_14 = inttoptr i64 %_ptr_val0_14 to i64*
   %_cur_td14 = bitcast i64* %_ptr0_14 to %struct.TD*
   %_param_arr_ptr14 = getelementptr %struct.TD, %struct.TD* %_cur_td14, i32 0, i32 26
   %_param_arr14 = load %struct.ParamInfo*, %struct.ParamInfo** %_param_arr_ptr14
   %_formal_td_ptr_ptr14 = getelementptr %struct.ParamInfo, %struct.ParamInfo* %_param_arr14, i32 0, i32 1, i32 0
   %_formal_td14 = load %struct.TD*, %struct.TD** %_formal_td_ptr_ptr14
   %_desc14 = bitcast %struct.TD* %_formal_td14 to i64*
   %_source_ptr14 = getelementptr i64, i64* %_Static_Link, i64 6
   %_source14 = load i64, i64* %_source_ptr14
   %_td14 = bitcast i64* %_desc14 to %struct.TD*
   %_is_small_ptr14 = getelementptr %struct.TD, %struct.TD* %_td14, i32 0, i32 13
   %_is_small14 = load i8, i8* %_is_small_ptr14
   %_is_small_bool14 = trunc i8 %_is_small14 to i1
   br i1 %_is_small_bool14, label %_small_label14, label %_large_label14
   _small_label14:
   %_small_null_ptr14 = getelementptr %struct.TD, %struct.TD* %_td14, i32 0, i32 17
   %_small_null14 = load i64, i64* %_small_null_ptr14
   br label %_join_small_and_large14
   _large_label14:
   %_high_and_low_bits14 = and i64 %_source14, or (i64 shl (i64 1, i64 63), i64 1)
   %_is_special_bit14 = icmp eq i64 %_high_and_low_bits14, or (i64 shl (i64 1, i64 63), i64 1)
   br i1 %_is_special_bit14, label %_is_special_label14, label %_not_special_label14
   _is_special_label14:
   %_spcl_rgn_times2_14 = and i64 %_source14, 4294967295
   br label %_last_large_label14
   _not_special_label14:
   %_header_ptr14 = inttoptr i64 %_source14 to i64*
   %_hdr_of_src14 = load i64, i64* %_header_ptr14
   %_region_bits14 = and i64 %_hdr_of_src14, 4294901760
   %_normal_rgn_times2_14 = lshr i64 %_region_bits14, 15
   br label %_last_large_label14
   _last_large_label14:
   %_rgn_times2_14 = phi i64 [%_spcl_rgn_times2_14, %_is_special_label14], [%_normal_rgn_times2_14, %_not_special_label14]
   %_large_null14 = or i64 -144115188075855871, %_rgn_times2_14
   br label %_join_small_and_large14
   _join_small_and_large14:
   %_null14 = phi i64 [%_small_null14, %_small_label14],[%_large_null14, %_last_large_label14]
   %_loc_5 = bitcast i64 %_null14 to i64

   ; #Store_Local_Null_Op at 8:21
   %_ptr_val0_15 = load i64, i64* %_Static_Link
   %_ptr0_15 = inttoptr i64 %_ptr_val0_15 to i64*
   %_cur_td15 = bitcast i64* %_ptr0_15 to %struct.TD*
   %_param_arr_ptr15 = getelementptr %struct.TD, %struct.TD* %_cur_td15, i32 0, i32 26
   %_param_arr15 = load %struct.ParamInfo*, %struct.ParamInfo** %_param_arr_ptr15
   %_formal_td_ptr_ptr15 = getelementptr %struct.ParamInfo, %struct.ParamInfo* %_param_arr15, i32 0, i32 1, i32 0
   %_formal_td15 = load %struct.TD*, %struct.TD** %_formal_td_ptr_ptr15
   %_desc15 = bitcast %struct.TD* %_formal_td15 to i64*
   %_td15 = bitcast i64* %_desc15 to %struct.TD*
   %_is_small_ptr15 = getelementptr %struct.TD, %struct.TD* %_td15, i32 0, i32 13
   %_is_small15 = load i8, i8* %_is_small_ptr15
   %_is_small_bool15 = trunc i8 %_is_small15 to i1
   %_small_null_ptr15 = getelementptr %struct.TD, %struct.TD* %_td15, i32 0, i32 17
   %_small_null15 = load i64, i64* %_small_null_ptr15
   %_ctx15 = bitcast i64* %_Context to %struct.ExecCtx*
   %_large_null_ptr15 = getelementptr %struct.ExecCtx, %struct.ExecCtx* %_ctx15, i32 0, i32 1
   %_large_null15 = load i64, i64* %_large_null_ptr15
   %_null15= select i1 %_is_small_bool15, i64 %_small_null15, i64 %_large_null15
   %_loc_8 = bitcast i64 %_null15 to i64

   ; #Copy_Word_Op at 8:28
   %_source16 = getelementptr i64, i64* %_Static_Link, i64 4
   %_source_val16 = load i64, i64* %_source16
   %_loc_9 = bitcast i64 %_source_val16 to i64

   ; #Call_Op at 8:21
   %_ptr_val0_17 = load i64, i64* %_Static_Link
   %_ptr0_17 = inttoptr i64 %_ptr_val0_17 to i64*
   %_call17_Static_Link = getelementptr i64, i64* %_ptr0_17, i64 0
   %_new_arg_addr17_0 = getelementptr i64, i64* %_call17_Param_Area, i64 0
   store i64 %_loc_8, i64* %_new_arg_addr17_0
   %_new_arg_addr17_1 = getelementptr i64, i64* %_call17_Param_Area, i64 1
   store i64 %_loc_9, i64* %_new_arg_addr17_1
   call void @_psc_execute_compiled_nth_op_of_type(i64* %_Context, i64* %_call17_Param_Area, i64* %_call17_Static_Link, i16 3, i16 4)
   %_new_result_addr17_0 = getelementptr i64, i64* %_call17_Param_Area, i64 0
   %_new_result17_0 = load i64, i64* %_new_result_addr17_0
   %_loc_6 = bitcast i64 %_new_result17_0 to i64

   ; #Wait_For_Parallel_Op at 8:37
   %_master18 = bitcast i64* %_Master to i64*
   %_level_skip18 = call i32 @_psc_execute_wait_for_parallel_op(i64* %_Context, i64* %_master18)
   %_level_diff32_18 = ashr i32 %_level_skip18, 16
   %_level_diff18 = trunc i32 %_level_diff32_18 to i16
   %_skip_count18 = trunc i32 %_level_skip18 to i16
   %_level_diff_nz18 = icmp ne i16 %_level_diff18, 0
   br i1 %_level_diff_nz18, label %_exit18, label %_switch18
   _exit18:
   call void @_psc_finalize_stg_rgn(i64* %_Context, i64* %_Local_Area)
   %_level_diff_minus_one18 = sub nsw i16 %_level_diff18, 1
   %_ld_zext18 = zext i16 %_level_diff_minus_one18 to i32
   %_ld_shifted18 = shl i32 %_ld_zext18, 16
   %_skip_zext18 = zext i16 %_skip_count18 to i32
   %_levelm1_skip18 = or i32 %_ld_shifted18, %_skip_zext18
   ret i32 %_levelm1_skip18
   _switch18:
   br label %_lbl19

_lbl19:
   ; #Copy_Word_Op at 8:37
   %_source19 = getelementptr i64, i64* %_loc_3, i64 11
   %_source_val19 = load i64, i64* %_source19
   %_loc_7 = bitcast i64 %_source_val19 to i64

   ; #Call_Op at 8:34
   %_ptr_val0_20 = load i64, i64* %_Static_Link
   %_ptr0_20 = inttoptr i64 %_ptr_val0_20 to i64*
   %_cur_td20 = bitcast i64* %_ptr0_20 to %struct.TD*
   %_param_arr_ptr20 = getelementptr %struct.TD, %struct.TD* %_cur_td20, i32 0, i32 26
   %_param_arr20 = load %struct.ParamInfo*, %struct.ParamInfo** %_param_arr_ptr20
   %_formal_td_ptr_ptr20 = getelementptr %struct.ParamInfo, %struct.ParamInfo* %_param_arr20, i32 0, i32 1, i32 0
   %_formal_td20 = load %struct.TD*, %struct.TD** %_formal_td_ptr_ptr20
   %_call20_Static_Link = bitcast %struct.TD* %_formal_td20 to i64*
   %_new_arg_addr20_0 = getelementptr i64, i64* %_call20_Param_Area, i64 0
   store i64 %_loc_5, i64* %_new_arg_addr20_0
   %_new_arg_addr20_1 = getelementptr i64, i64* %_call20_Param_Area, i64 1
   store i64 %_loc_6, i64* %_new_arg_addr20_1
   %_new_arg_addr20_2 = getelementptr i64, i64* %_call20_Param_Area, i64 2
   store i64 %_loc_7, i64* %_new_arg_addr20_2
   call void @_psc_execute_compiled_nth_op_of_type(i64* %_Context, i64* %_call20_Param_Area, i64* %_call20_Static_Link, i16 3, i16 23)
   %_new_result_addr20_0 = getelementptr i64, i64* %_call20_Param_Area, i64 0
   %_new_result20_0 = load i64, i64* %_new_result_addr20_0
   %_loc_1 = bitcast i64 %_new_result20_0 to i64

   ; #Copy_Word_Op at 8:34

   ; #Copy_Word_Op at 8:34
   %_source_val22 = bitcast i64 %_loc_1 to i64
   %_dest22 = getelementptr i64, i64* %_Param_Area, i64 0
   store i64 %_source_val22, i64* %_dest22

   ; #Exit_Op at 0:0
   call void @_psc_finalize_stg_rgn(i64* %_Context, i64* %_Local_Area)
   ret i32 0

   ; #Begin_Nested_Block_Op at 8:37
}

define internal i32 @"PSL.Core.Enum_Mask.$|$.23block"(i64* %_Context, i64* %_Param_Area, i64* %_Static_Link) {
   %_Local_Area = alloca i64, i64 4
   %_sl = ptrtoint i64* %_Static_Link to i64
   %_pa = ptrtoint i64* %_Param_Area to i64
   %_store_pa = getelementptr i64, i64* %_Local_Area, i64 1
   store i64 %_pa, i64* %_store_pa
   store i64 %_sl, i64* %_Local_Area

   %_call27_Param_Area = alloca i64, i64 2

   ; #Store_Null_Of_Same_Stg_Rgn_Op at 8:37
   %_ptr_val0_25 = load i64, i64* %_Static_Link
   %_ptr0_25 = inttoptr i64 %_ptr_val0_25 to i64*
   %_ptr_val1_25 = load i64, i64* %_ptr0_25
   %_ptr1_25 = inttoptr i64 %_ptr_val1_25 to i64*
   %_cur_td25 = bitcast i64* %_ptr1_25 to %struct.TD*
   %_param_arr_ptr25 = getelementptr %struct.TD, %struct.TD* %_cur_td25, i32 0, i32 26
   %_param_arr25 = load %struct.ParamInfo*, %struct.ParamInfo** %_param_arr_ptr25
   %_formal_td_ptr_ptr25 = getelementptr %struct.ParamInfo, %struct.ParamInfo* %_param_arr25, i32 0, i32 1, i32 0
   %_formal_td25 = load %struct.TD*, %struct.TD** %_formal_td_ptr_ptr25
   %_desc25 = bitcast %struct.TD* %_formal_td25 to i64*
   %_source_ptr25 = getelementptr i64, i64* %_Static_Link, i64 4
   %_source25 = load i64, i64* %_source_ptr25
   %_td25 = bitcast i64* %_desc25 to %struct.TD*
   %_is_small_ptr25 = getelementptr %struct.TD, %struct.TD* %_td25, i32 0, i32 13
   %_is_small25 = load i8, i8* %_is_small_ptr25
   %_is_small_bool25 = trunc i8 %_is_small25 to i1
   br i1 %_is_small_bool25, label %_small_label25, label %_large_label25
   _small_label25:
   %_small_null_ptr25 = getelementptr %struct.TD, %struct.TD* %_td25, i32 0, i32 17
   %_small_null25 = load i64, i64* %_small_null_ptr25
   br label %_join_small_and_large25
   _large_label25:
   %_high_and_low_bits25 = and i64 %_source25, or (i64 shl (i64 1, i64 63), i64 1)
   %_is_special_bit25 = icmp eq i64 %_high_and_low_bits25, or (i64 shl (i64 1, i64 63), i64 1)
   br i1 %_is_special_bit25, label %_is_special_label25, label %_not_special_label25
   _is_special_label25:
   %_spcl_rgn_times2_25 = and i64 %_source25, 4294967295
   br label %_last_large_label25
   _not_special_label25:
   %_header_ptr25 = inttoptr i64 %_source25 to i64*
   %_hdr_of_src25 = load i64, i64* %_header_ptr25
   %_region_bits25 = and i64 %_hdr_of_src25, 4294901760
   %_normal_rgn_times2_25 = lshr i64 %_region_bits25, 15
   br label %_last_large_label25
   _last_large_label25:
   %_rgn_times2_25 = phi i64 [%_spcl_rgn_times2_25, %_is_special_label25], [%_normal_rgn_times2_25, %_not_special_label25]
   %_large_null25 = or i64 -144115188075855871, %_rgn_times2_25
   br label %_join_small_and_large25
   _join_small_and_large25:
   %_null25 = phi i64 [%_small_null25, %_small_label25],[%_large_null25, %_last_large_label25]
   %_loc_2 = bitcast i64 %_null25 to i64

   ; #Copy_Word_Op at 8:44
   %_ptr_val0_26_1 = load i64, i64* %_Static_Link
   %_ptr0_26_1 = inttoptr i64 %_ptr_val0_26_1 to i64*
   %_source26 = getelementptr i64, i64* %_ptr0_26_1, i64 5
   %_source_val26 = load i64, i64* %_source26
   %_loc_3 = bitcast i64 %_source_val26 to i64

   ; #Call_Op at 8:37
   %_ptr_val0_27 = load i64, i64* %_Static_Link
   %_ptr0_27 = inttoptr i64 %_ptr_val0_27 to i64*
   %_ptr_val1_27 = load i64, i64* %_ptr0_27
   %_ptr1_27 = inttoptr i64 %_ptr_val1_27 to i64*
   %_call27_Static_Link = getelementptr i64, i64* %_ptr1_27, i64 0
   %_new_arg_addr27_0 = getelementptr i64, i64* %_call27_Param_Area, i64 0
   store i64 %_loc_2, i64* %_new_arg_addr27_0
   %_new_arg_addr27_1 = getelementptr i64, i64* %_call27_Param_Area, i64 1
   store i64 %_loc_3, i64* %_new_arg_addr27_1
   call void @_psc_execute_compiled_nth_op_of_type(i64* %_Context, i64* %_call27_Param_Area, i64* %_call27_Static_Link, i16 3, i16 4)
   %_new_result_addr27_0 = getelementptr i64, i64* %_call27_Param_Area, i64 0
   %_new_result27_0 = load i64, i64* %_new_result_addr27_0
   %_loc_1 = bitcast i64 %_new_result27_0 to i64

   ; #Copy_Word_Op at 8:37
   %_source_val28 = bitcast i64 %_loc_1 to i64
   %_dest28 = getelementptr i64, i64* %_Param_Area, i64 0
   store i64 %_source_val28, i64* %_dest28

   ; #Exit_Op at 0:0
   ret i32 0

}

