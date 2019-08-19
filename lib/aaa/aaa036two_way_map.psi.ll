declare void @"PSL.Containers.Basic_Map.$-=$"(i64*, i64, i64*, i64*)
declare void @"PSL.Containers.Basic_Map.$<|=$"(i64*, i64*, i64*, i64*)
declare i64 @"PSL.Containers.Basic_Map.$[]$"(i64*, i64*, i64)
declare i64 @"PSL.Containers.Basic_Map.$in$"(i64, i64, i64*, i64*)
declare i64* @"PSL.Containers.Basic_Map.$indexing$"(i64*, i64, i64*, i64*)
declare i64* @"PSL.Containers.Basic_Map.$var_indexing$"(i64*, i64, i64*, i64*)
declare void @"PSL.Containers.Basic_Map.$|=$"(i64*, i64, i64*, i64*)
declare i64 @"PSL.Containers.Basic_Map.Is_Empty"(i64, i64*, i64*)
declare i64 @"PSL.Containers.Basic_Map.Remove_Any"(i64*, i64*, i64*, i64)
declare void @_psc_assign_word(i64*, i64*, i64*, i64)
declare i64 @_psc_copy_object(i64*, i64*, i64, i64)
declare void @_psc_execute_compiled_nth_op_of_type(i64*, i64*, i64*, i16, i16)
declare void @_psc_execute_compiled_parallel_op(i64*, i64*, i64*, i32(i64*, i64*, i64*)*, i64* , i1, i1, i1)
declare i32 @_psc_execute_wait_for_parallel_op(i64*, i64*)
declare void @_psc_finalize_stg_rgn(i64*, i64*)
declare void @_psc_initialize_stg_rgn(i64*, i64*)
declare void @_psc_move_object(i64*, i64*, i64*, i64*)
declare i64 @_psc_new_object(i64*, i64*, i64)
declare void @_psc_reconstruct_strings(i16, i8**, i64*)
declare void @_psc_register_compiled_operations(i16, i16*, void(i64*, i64*, i64*)**, i32*, i64*, i32, i16*, i32(i64*, i64*, i64*)**)
declare void @"_psc_runtime_message"(i64*, i64*, i64*)

@$Module_Op_Indices = internal constant [20 x i16] [
i16 1, i16 2, i16 1, i16 10, i16 1, i16 14, i16 1, i16 16, i16 1, i16 17
, i16 1, i16 9, i16 1, i16 12, i16 1, i16 13, i16 1, i16 5, i16 1, i16 18]

@$Local_Funcs = internal constant [10 x void(i64*, i64*, i64*)*] [

void(i64*, i64*, i64*)* bitcast( void (i64*, i64*, i64*)* @"PSL.Containers.Two_Way_Map.Add_Unreversed" to void(i64*, i64*, i64*)*)
, void(i64*, i64*, i64*)* bitcast( i64 (i64, i64, i64*, i64*, i64)* @"PSL.Containers.Two_Way_Map.$|$" to void(i64*, i64*, i64*)*)
, void(i64*, i64*, i64*)* bitcast( void (i64*, i64, i64*, i64*)* @"PSL.Containers.Two_Way_Map.$-=$" to void(i64*, i64*, i64*)*)
, void(i64*, i64*, i64*)* bitcast( i64* (i64*, i64, i64*, i64*)* @"PSL.Containers.Two_Way_Map.$var_indexing$" to void(i64*, i64*, i64*)*)
, void(i64*, i64*, i64*)* bitcast( i64 (i64, i64, i64*, i64*, i64)* @"PSL.Containers.Two_Way_Map.Key_Of" to void(i64*, i64*, i64*)*)
, void(i64*, i64*, i64*)* bitcast( void (i64*, i64, i64*, i64*)* @"PSL.Containers.Two_Way_Map.$|=$" to void(i64*, i64*, i64*)*)
, void(i64*, i64*, i64*)* bitcast( void (i64*, i64*, i64*, i64*)* @"PSL.Containers.Two_Way_Map.$<|=$" to void(i64*, i64*, i64*)*)
, void(i64*, i64*, i64*)* bitcast( void (i64*, i64*, i64*, i64*)* @"PSL.Containers.Two_Way_Map.$<|=$.2" to void(i64*, i64*, i64*)*)
, void(i64*, i64*, i64*)* bitcast( i64 (i64*, i64*, i64)* @"PSL.Containers.Two_Way_Map.$[]$" to void(i64*, i64*, i64*)*)
, void(i64*, i64*, i64*)* bitcast( i64 (i64, i64*, i64*, i64)* @"PSL.Containers.Two_Way_Map.Rev_Map" to void(i64*, i64*, i64*)*)]

@$Local_Funcs_Conv_Descs = internal constant [10 x i32] [
i32 256, i32 33620480, i32 512, i32 66048, i32 33620480, i32 512, i32 512
, i32 512, i32 33619968, i32 33620224]

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
@$str_stream1 = internal constant [32 x i8] 

[i8 28, i8 0, i8 0, i8 0, i8 80, i8 83, i8 76, i8 58, i8 58, i8 67, i8 111
, i8 110, i8 116, i8 97, i8 105, i8 110, i8 101, i8 114, i8 115, i8 58, i8 58
, i8 84, i8 119, i8 111, i8 95, i8 87, i8 97, i8 121, i8 95, i8 77, i8 97
, i8 112]

@$str_stream2 = internal constant [18 x i8] 

[i8 14, i8 0, i8 0, i8 0, i8 65, i8 100, i8 100, i8 95, i8 85, i8 110, i8 114
, i8 101, i8 118, i8 101, i8 114, i8 115, i8 101, i8 100]

@$str_stream3 = internal constant [93 x i8] 

[i8 89, i8 0, i8 0, i8 0, i8 47, i8 85, i8 115, i8 101, i8 114, i8 115, i8 47
, i8 115, i8 116, i8 116, i8 47, i8 95, i8 112, i8 97, i8 114, i8 97, i8 115
, i8 97, i8 105, i8 108, i8 47, i8 108, i8 105, i8 98, i8 47, i8 97, i8 97
, i8 97, i8 47, i8 97, i8 97, i8 97, i8 48, i8 50, i8 53, i8 115, i8 101
, i8 116, i8 46, i8 112, i8 115, i8 108, i8 58, i8 50, i8 53, i8 51, i8 58
, i8 57, i8 58, i8 32, i8 69, i8 114, i8 114, i8 111, i8 114, i8 58, i8 32
, i8 78, i8 117, i8 108, i8 108, i8 32, i8 118, i8 97, i8 108, i8 117, i8 101
, i8 32, i8 110, i8 111, i8 116, i8 32, i8 112, i8 101, i8 114, i8 109, i8 105
, i8 116, i8 116, i8 101, i8 100, i8 32, i8 104, i8 101, i8 114, i8 101, i8 58
, i8 32, i8 10]

@$str_stream4 = internal constant [99 x i8] 

[i8 95, i8 0, i8 0, i8 0, i8 47, i8 85, i8 115, i8 101, i8 114, i8 115, i8 47
, i8 115, i8 116, i8 116, i8 47, i8 95, i8 112, i8 97, i8 114, i8 97, i8 115
, i8 97, i8 105, i8 108, i8 47, i8 108, i8 105, i8 98, i8 47, i8 97, i8 97
, i8 97, i8 47, i8 97, i8 97, i8 97, i8 48, i8 50, i8 52, i8 98, i8 97, i8 115
, i8 105, i8 99, i8 95, i8 109, i8 97, i8 112, i8 46, i8 112, i8 115, i8 105
, i8 58, i8 49, i8 54, i8 58, i8 51, i8 49, i8 58, i8 32, i8 69, i8 114, i8 114
, i8 111, i8 114, i8 58, i8 32, i8 78, i8 117, i8 108, i8 108, i8 32, i8 118
, i8 97, i8 108, i8 117, i8 101, i8 32, i8 110, i8 111, i8 116, i8 32, i8 112
, i8 101, i8 114, i8 109, i8 105, i8 116, i8 116, i8 101, i8 100, i8 32, i8 104
, i8 101, i8 114, i8 101, i8 58, i8 32, i8 10]

@$str_stream5 = internal constant [8 x i8] 

[i8 4, i8 0, i8 0, i8 0, i8 34, i8 91, i8 93, i8 34]

@$str_stream6 = internal constant [92 x i8] 

[i8 88, i8 0, i8 0, i8 0, i8 47, i8 85, i8 115, i8 101, i8 114, i8 115, i8 47
, i8 115, i8 116, i8 116, i8 47, i8 95, i8 112, i8 97, i8 114, i8 97, i8 115
, i8 97, i8 105, i8 108, i8 47, i8 108, i8 105, i8 98, i8 47, i8 97, i8 97
, i8 97, i8 47, i8 97, i8 97, i8 97, i8 48, i8 51, i8 53, i8 109, i8 97, i8 112
, i8 46, i8 112, i8 115, i8 105, i8 58, i8 54, i8 55, i8 58, i8 57, i8 58
, i8 32, i8 69, i8 114, i8 114, i8 111, i8 114, i8 58, i8 32, i8 78, i8 117
, i8 108, i8 108, i8 32, i8 118, i8 97, i8 108, i8 117, i8 101, i8 32, i8 110
, i8 111, i8 116, i8 32, i8 112, i8 101, i8 114, i8 109, i8 105, i8 116, i8 116
, i8 101, i8 100, i8 32, i8 104, i8 101, i8 114, i8 101, i8 58, i8 32, i8 10]

@$str_stream7 = internal constant [100 x i8] 

[i8 96, i8 0, i8 0, i8 0, i8 47, i8 85, i8 115, i8 101, i8 114, i8 115, i8 47
, i8 115, i8 116, i8 116, i8 47, i8 95, i8 112, i8 97, i8 114, i8 97, i8 115
, i8 97, i8 105, i8 108, i8 47, i8 108, i8 105, i8 98, i8 47, i8 97, i8 97
, i8 97, i8 47, i8 97, i8 97, i8 97, i8 48, i8 51, i8 54, i8 116, i8 119
, i8 111, i8 95, i8 119, i8 97, i8 121, i8 95, i8 109, i8 97, i8 112, i8 46
, i8 112, i8 115, i8 105, i8 58, i8 53, i8 51, i8 58, i8 57, i8 58, i8 32
, i8 69, i8 114, i8 114, i8 111, i8 114, i8 58, i8 32, i8 78, i8 117, i8 108
, i8 108, i8 32, i8 118, i8 97, i8 108, i8 117, i8 101, i8 32, i8 110, i8 111
, i8 116, i8 32, i8 112, i8 101, i8 114, i8 109, i8 105, i8 116, i8 116, i8 101
, i8 100, i8 32, i8 104, i8 101, i8 114, i8 101, i8 58, i8 32, i8 10]

@$str_stream8 = internal constant [92 x i8] 

[i8 88, i8 0, i8 0, i8 0, i8 47, i8 85, i8 115, i8 101, i8 114, i8 115, i8 47
, i8 115, i8 116, i8 116, i8 47, i8 95, i8 112, i8 97, i8 114, i8 97, i8 115
, i8 97, i8 105, i8 108, i8 47, i8 108, i8 105, i8 98, i8 47, i8 97, i8 97
, i8 97, i8 47, i8 97, i8 97, i8 97, i8 48, i8 50, i8 53, i8 115, i8 101
, i8 116, i8 46, i8 112, i8 115, i8 108, i8 58, i8 52, i8 54, i8 58, i8 57
, i8 58, i8 32, i8 69, i8 114, i8 114, i8 111, i8 114, i8 58, i8 32, i8 78
, i8 117, i8 108, i8 108, i8 32, i8 118, i8 97, i8 108, i8 117, i8 101, i8 32
, i8 110, i8 111, i8 116, i8 32, i8 112, i8 101, i8 114, i8 109, i8 105, i8 116
, i8 116, i8 101, i8 100, i8 32, i8 104, i8 101, i8 114, i8 101, i8 58, i8 32
, i8 10]

@$str_stream9 = internal constant [8 x i8] 

[i8 4, i8 0, i8 0, i8 0, i8 34, i8 124, i8 61, i8 34]

@$str_stream10 = internal constant [7 x i8] 

[i8 3, i8 0, i8 0, i8 0, i8 34, i8 124, i8 34]

@$str_stream11 = internal constant [100 x i8] 

[i8 96, i8 0, i8 0, i8 0, i8 47, i8 85, i8 115, i8 101, i8 114, i8 115, i8 47
, i8 115, i8 116, i8 116, i8 47, i8 95, i8 112, i8 97, i8 114, i8 97, i8 115
, i8 97, i8 105, i8 108, i8 47, i8 108, i8 105, i8 98, i8 47, i8 97, i8 97
, i8 97, i8 47, i8 97, i8 97, i8 97, i8 48, i8 51, i8 54, i8 116, i8 119
, i8 111, i8 95, i8 119, i8 97, i8 121, i8 95, i8 109, i8 97, i8 112, i8 46
, i8 112, i8 115, i8 105, i8 58, i8 55, i8 48, i8 58, i8 53, i8 58, i8 32
, i8 69, i8 114, i8 114, i8 111, i8 114, i8 58, i8 32, i8 78, i8 117, i8 108
, i8 108, i8 32, i8 118, i8 97, i8 108, i8 117, i8 101, i8 32, i8 110, i8 111
, i8 116, i8 32, i8 112, i8 101, i8 114, i8 109, i8 105, i8 116, i8 116, i8 101
, i8 100, i8 32, i8 104, i8 101, i8 114, i8 101, i8 58, i8 32, i8 10]

@$str_stream12 = internal constant [9 x i8] 

[i8 5, i8 0, i8 0, i8 0, i8 34, i8 60, i8 124, i8 61, i8 34]

@$str_stream13 = internal constant [11 x i8] 

[i8 7, i8 0, i8 0, i8 0, i8 34, i8 60, i8 124, i8 61, i8 34, i8 35, i8 50]

@$str_stream14 = internal constant [8 x i8] 

[i8 4, i8 0, i8 0, i8 0, i8 34, i8 45, i8 61, i8 34]

@$str_stream15 = internal constant [93 x i8] 

[i8 89, i8 0, i8 0, i8 0, i8 47, i8 85, i8 115, i8 101, i8 114, i8 115, i8 47
, i8 115, i8 116, i8 116, i8 47, i8 95, i8 112, i8 97, i8 114, i8 97, i8 115
, i8 97, i8 105, i8 108, i8 47, i8 108, i8 105, i8 98, i8 47, i8 97, i8 97
, i8 97, i8 47, i8 97, i8 97, i8 97, i8 48, i8 51, i8 53, i8 109, i8 97, i8 112
, i8 46, i8 112, i8 115, i8 105, i8 58, i8 49, i8 48, i8 50, i8 58, i8 57
, i8 58, i8 32, i8 69, i8 114, i8 114, i8 111, i8 114, i8 58, i8 32, i8 78
, i8 117, i8 108, i8 108, i8 32, i8 118, i8 97, i8 108, i8 117, i8 101, i8 32
, i8 110, i8 111, i8 116, i8 32, i8 112, i8 101, i8 114, i8 109, i8 105, i8 116
, i8 116, i8 101, i8 100, i8 32, i8 104, i8 101, i8 114, i8 101, i8 58, i8 32
, i8 10]

@$str_stream16 = internal constant [18 x i8] 

[i8 14, i8 0, i8 0, i8 0, i8 34, i8 118, i8 97, i8 114, i8 95, i8 105, i8 110
, i8 100, i8 101, i8 120, i8 105, i8 110, i8 103, i8 34]

@$str_stream17 = internal constant [10 x i8] 

[i8 6, i8 0, i8 0, i8 0, i8 75, i8 101, i8 121, i8 95, i8 79, i8 102]

@$str_stream18 = internal constant [11 x i8] 

[i8 7, i8 0, i8 0, i8 0, i8 82, i8 101, i8 118, i8 95, i8 77, i8 97, i8 112]

@$str_stream19 = internal constant [101 x i8] 

[i8 97, i8 0, i8 0, i8 0, i8 47, i8 85, i8 115, i8 101, i8 114, i8 115, i8 47
, i8 115, i8 116, i8 116, i8 47, i8 95, i8 112, i8 97, i8 114, i8 97, i8 115
, i8 97, i8 105, i8 108, i8 47, i8 108, i8 105, i8 98, i8 47, i8 97, i8 97
, i8 97, i8 47, i8 97, i8 97, i8 97, i8 48, i8 51, i8 54, i8 116, i8 119
, i8 111, i8 95, i8 119, i8 97, i8 121, i8 95, i8 109, i8 97, i8 112, i8 46
, i8 112, i8 115, i8 105, i8 58, i8 49, i8 51, i8 54, i8 58, i8 53, i8 58
, i8 32, i8 69, i8 114, i8 114, i8 111, i8 114, i8 58, i8 32, i8 78, i8 117
, i8 108, i8 108, i8 32, i8 118, i8 97, i8 108, i8 117, i8 101, i8 32, i8 110
, i8 111, i8 116, i8 32, i8 112, i8 101, i8 114, i8 109, i8 105, i8 116, i8 116
, i8 101, i8 100, i8 32, i8 104, i8 101, i8 114, i8 101, i8 58, i8 32, i8 10]

@$Str_Streams = internal constant [19 x i8*] [
i8* bitcast ([32 x i8]* @$str_stream1 to i8*), 
i8* bitcast ([18 x i8]* @$str_stream2 to i8*), 
i8* bitcast ([93 x i8]* @$str_stream3 to i8*), 
i8* bitcast ([99 x i8]* @$str_stream4 to i8*), 
i8* bitcast ([8 x i8]* @$str_stream5 to i8*), 
i8* bitcast ([92 x i8]* @$str_stream6 to i8*), 
i8* bitcast ([100 x i8]* @$str_stream7 to i8*), 
i8* bitcast ([92 x i8]* @$str_stream8 to i8*), 
i8* bitcast ([8 x i8]* @$str_stream9 to i8*), 
i8* bitcast ([7 x i8]* @$str_stream10 to i8*), 
i8* bitcast ([100 x i8]* @$str_stream11 to i8*), 
i8* bitcast ([9 x i8]* @$str_stream12 to i8*), 
i8* bitcast ([11 x i8]* @$str_stream13 to i8*), 
i8* bitcast ([8 x i8]* @$str_stream14 to i8*), 
i8* bitcast ([93 x i8]* @$str_stream15 to i8*), 
i8* bitcast ([18 x i8]* @$str_stream16 to i8*), 
i8* bitcast ([10 x i8]* @$str_stream17 to i8*), 
i8* bitcast ([11 x i8]* @$str_stream18 to i8*), 
i8* bitcast ([101 x i8]* @$str_stream19 to i8*)]
@$String_Table = internal global [19 x i64] 
[i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, 
 i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0]
@$Strings = internal constant i64* bitcast ([19 x i64]* @$String_Table to i64*)
@_psc_global_to_do = external global {i64*, void()*}*
define internal void @$initialize_streams() {
   %_Str_Tab = load i64*, i64** @$Strings
   call void @_psc_reconstruct_strings(i16 19, i8** bitcast ([19 x i8*]* @$Str_Streams to i8**), i64* %_Str_Tab)
   call void @_psc_register_compiled_operations(i16 10, i16* bitcast ([20 x i16]* @$Module_Op_Indices to i16*), void(i64*, i64*, i64*)** bitcast ([10 x void(i64*, i64*, i64*)*]* @$Local_Funcs to void(i64*, i64*, i64*)**), i32* bitcast ([10 x i32]* @$Local_Funcs_Conv_Descs to i32*), i64* %_Str_Tab, i32 0, i16* bitcast ([0 x i16]* @$Internal_Precond_Indices to i16*), i32(i64*, i64*, i64*)** bitcast ([0 x i32(i64*, i64*, i64*)*]* @$Internal_Precond_Blocks to i32(i64*, i64*, i64*)**))
   ret void
}
@"_node_/Users/stt/_parasail/lib/aaa/aaa036two_way_map.psi" = global {i64*, void()*} {i64* null, void()* @$initialize_streams}
define internal void @$add_to_todo() {
   %_next = load {i64*, void()*}*, {i64*, void()*}** @_psc_global_to_do
   %_nextc = bitcast {i64*, void()*}* %_next to i64*
   %_node.next_ptr = getelementptr {i64*, void()*}, {i64*, void()*}* @"_node_/Users/stt/_parasail/lib/aaa/aaa036two_way_map.psi", i32 0, i32 0
   store i64* %_nextc, i64** %_node.next_ptr
   store {i64*, void()*}* @"_node_/Users/stt/_parasail/lib/aaa/aaa036two_way_map.psi", {i64*, void()*}** @_psc_global_to_do
   ret void
}
@llvm.global_ctors = appending global [1 x {i32, void ()*}] [{i32, void()*} {i32 65535, void ()* @$add_to_todo}]

define void @"PSL.Containers.Two_Way_Map.Add_Unreversed"(i64* %_formal_param_0, i64* %_Context, i64* %_Static_Link) {
   %_Local_Area = alloca i64, i64 4
   %_sl = ptrtoint i64* %_Static_Link to i64
   store i64 %_sl, i64* %_Local_Area
   call void @_psc_initialize_stg_rgn(i64* %_Context, i64* %_Local_Area)
   %_Master = alloca i64, i64 3
   %_ms = ptrtoint i64* %_Master to i64
   %_store_ms = getelementptr i64, i64* %_Local_Area, i64 3
   store i64 %_ms, i64* %_store_ms

   %_output.I4 = alloca i64
   %_print_param.I4.4 = alloca i64
   %_loc_8 = alloca i64
   %_output.I13 = alloca i64
   %_loc_.I13_1 = alloca i64
   %_loc_17 = alloca i64
   %_output.I19 = alloca i64
   %_loc_.I19_2 = alloca i64
   %_print_param.I19.10 = alloca i64
   %_output.I25 = alloca i64
   %_output.I27 = alloca i64
   br label %_lbl1


_lbl1:
   
   ; #Copy_Address_Op at 44:29
   %_source_val1 = bitcast i64* %_formal_param_0 to i64*
   %_loc_7 = bitcast i64* %_source_val1 to i64*

   ; #Copy_Word_Op at 44:29
   %_reg2_1 = bitcast i64* %_loc_7 to i64*
   %_source2 = getelementptr i64, i64* %_reg2_1, i64 0
   %_source_val2 = load i64, i64* %_source2
   %_loc_6 = bitcast i64 %_source_val2 to i64

   ; #Copy_Word_Op at 44:31
   %_reg3_1 = inttoptr i64 %_loc_6 to i64*
   %_source3 = getelementptr i64, i64* %_reg3_1, i64 3
   %_source_val3 = load i64, i64* %_source3
   %_loc_5 = bitcast i64 %_source_val3 to i64

   ; #Call_Op at 44:19
   ; inlining call on Is_Empty
   %_cur_td4 = bitcast i64* %_Static_Link to %struct.TD*
   %_nested_types_arr_ptr4 = getelementptr %struct.TD, %struct.TD* %_cur_td4, i32 0, i32 35
   %_nested_types_arr4 = load %struct.TD**, %struct.TD*** %_nested_types_arr_ptr4
   %_nested_td_ptr_ptr4 = getelementptr %struct.TD*, %struct.TD** %_nested_types_arr4, i32 4
   %_nested_td4 = load %struct.TD*, %struct.TD** %_nested_td_ptr_ptr4
   %_call4_Static_Link = bitcast %struct.TD* %_nested_td4 to i64*

   ; #Copy_Word_Op at 253:25
   %_source_val.I4.1 = bitcast i64 %_loc_5 to i64
   %_loc_.I4_3 = bitcast i64 %_source_val.I4.1 to i64

   ; #Call_Op at 253:16
   %_cur_td.I4.2 = bitcast i64* %_call4_Static_Link to %struct.TD*
   %_nested_types_arr_ptr.I4.2 = getelementptr %struct.TD, %struct.TD* %_cur_td.I4.2, i32 0, i32 35
   %_nested_types_arr.I4.2 = load %struct.TD**, %struct.TD*** %_nested_types_arr_ptr.I4.2
   %_nested_td_ptr_ptr.I4.2 = getelementptr %struct.TD*, %struct.TD** %_nested_types_arr.I4.2, i32 1
   %_nested_td.I4.2 = load %struct.TD*, %struct.TD** %_nested_td_ptr_ptr.I4.2
   %_call.I4.2_Static_Link = bitcast %struct.TD* %_nested_td.I4.2 to i64*
   %_new_result.I4.2_0 = call i64 @"PSL.Containers.Basic_Map.Is_Empty"(i64 %_loc_.I4_3, i64* %_Context, i64* %_call.I4.2_Static_Link)
   %_loc_.I4_1 = bitcast i64 %_new_result.I4.2_0 to i64

   ; #Copy_Word_Op at 253:9
   %_source_val.I4.3 = bitcast i64 %_loc_.I4_1 to i64
   %_dest.I4.3 = bitcast i64* %_output.I4 to i64*
   store i64 %_source_val.I4.3, i64* %_dest.I4.3

   ; #Check_Not_Null_Op at 253:9
   %_arg_ptr.I4.4 = bitcast i64* %_output.I4 to i64*
   %_arg.I4.4 = load i64, i64* %_arg_ptr.I4.4
   %_is_null.I4.4 = icmp eq i64 %_arg.I4.4, shl (i64 1, i64 63)
   br i1 %_is_null.I4.4, label %_fail.I4.4, label %_lbl.I4_5
   _fail.I4.4:
   %_str_ptr_ptr.I4.4 = load i64*, i64** @$Strings
   %_str_ptr.I4.4 = getelementptr i64, i64* %_str_ptr_ptr.I4.4, i64 2
   %_assert_str.I4.4 = load i64, i64* %_str_ptr.I4.4
   store i64 %_assert_str.I4.4, i64* %_print_param.I4.4
   call void @_psc_runtime_message(i64* %_Context, i64* %_print_param.I4.4, i64* null)

   br label %_lbl.I4_5

_lbl.I4_5:
   ; #Return_Op at 253:9

   %_new_result4 = load i64, i64* %_output.I4
   %_loc_3 = bitcast i64 %_new_result4 to i64

   ; #Call_Op at 44:19
   %_n5 = bitcast i64 %_loc_3 to i64
   %_result5 = xor i64 1, %_n5
   %_loc_1 = bitcast i64 %_result5 to i64

   ; #If_Op at 44:19
   %_if_source_val6 = bitcast i64 %_loc_1 to i64
   %_if_source_trunc6 = icmp eq i64 %_if_source_val6, 1
   br i1 %_if_source_trunc6, label %_lbl7, label %_lbl33

_lbl7:
   ; #Declare_Obj_Op at 45:17

   ; #Store_Local_Null_Op at 45:17
   %_cur_td8 = bitcast i64* %_Static_Link to %struct.TD*
   %_param_arr_ptr8 = getelementptr %struct.TD, %struct.TD* %_cur_td8, i32 0, i32 26
   %_param_arr8 = load %struct.ParamInfo*, %struct.ParamInfo** %_param_arr_ptr8
   %_formal_td_ptr_ptr8 = getelementptr %struct.ParamInfo, %struct.ParamInfo* %_param_arr8, i32 0, i32 1, i32 0
   %_formal_td8 = load %struct.TD*, %struct.TD** %_formal_td_ptr_ptr8
   %_desc8 = bitcast %struct.TD* %_formal_td8 to i64*
   %_td8 = bitcast i64* %_desc8 to %struct.TD*
   %_is_small_ptr8 = getelementptr %struct.TD, %struct.TD* %_td8, i32 0, i32 13
   %_is_small8 = load i8, i8* %_is_small_ptr8
   %_is_small_bool8 = trunc i8 %_is_small8 to i1
   %_small_null_ptr8 = getelementptr %struct.TD, %struct.TD* %_td8, i32 0, i32 17
   %_small_null8 = load i64, i64* %_small_null_ptr8
   %_ctx8 = bitcast i64* %_Context to %struct.ExecCtx*
   %_large_null_ptr8 = getelementptr %struct.ExecCtx, %struct.ExecCtx* %_ctx8, i32 0, i32 1
   %_large_null8 = load i64, i64* %_large_null_ptr8
   %_null8= select i1 %_is_small_bool8, i64 %_small_null8, i64 %_large_null8
   %_dest_ptr8 = bitcast i64* %_loc_8 to i64* 
   store i64 %_null8, i64* %_dest_ptr8

   ; #Copy_Word_Op at 45:24
   %_source9 = bitcast i64* %_loc_8 to i64* 
   %_source_val9 = load i64, i64* %_source9
   %_loc_9 = bitcast i64 %_source_val9 to i64

   ; #Copy_Address_Op at 45:35
   %_source_val10 = bitcast i64* %_formal_param_0 to i64*
   %_loc_12 = bitcast i64* %_source_val10 to i64*

   ; #Copy_Word_Op at 45:35
   %_reg11_1 = bitcast i64* %_loc_12 to i64*
   %_source11 = getelementptr i64, i64* %_reg11_1, i64 0
   %_source_val11 = load i64, i64* %_source11
   %_loc_11 = bitcast i64 %_source_val11 to i64

   ; #Store_Address_Op at 45:24
   %_reg12_1 = inttoptr i64 %_loc_11 to i64*
   %_addr12 = getelementptr i64, i64* %_reg12_1, i64 3
   %_loc_10 = bitcast i64* %_addr12 to i64*

   ; #Call_Op at 45:24
   ; inlining call on Remove_Any
   store i64 %_loc_9, i64* %_output.I13
   %_cur_td13 = bitcast i64* %_Static_Link to %struct.TD*
   %_nested_types_arr_ptr13 = getelementptr %struct.TD, %struct.TD* %_cur_td13, i32 0, i32 35
   %_nested_types_arr13 = load %struct.TD**, %struct.TD*** %_nested_types_arr_ptr13
   %_nested_td_ptr_ptr13 = getelementptr %struct.TD*, %struct.TD** %_nested_types_arr13, i32 4
   %_nested_td13 = load %struct.TD*, %struct.TD** %_nested_td_ptr_ptr13
   %_call13_Static_Link = bitcast %struct.TD* %_nested_td13 to i64*

   ; #Declare_Obj_Op at 257:13

   ; #Store_Null_Of_Same_Stg_Rgn_Op at 257:32
   %_cur_td.I13.2 = bitcast i64* %_call13_Static_Link to %struct.TD*
   %_nested_types_arr_ptr.I13.2 = getelementptr %struct.TD, %struct.TD* %_cur_td.I13.2, i32 0, i32 35
   %_nested_types_arr.I13.2 = load %struct.TD**, %struct.TD*** %_nested_types_arr_ptr.I13.2
   %_nested_td_ptr_ptr.I13.2 = getelementptr %struct.TD*, %struct.TD** %_nested_types_arr.I13.2, i32 0
   %_nested_td.I13.2 = load %struct.TD*, %struct.TD** %_nested_td_ptr_ptr.I13.2
   %_desc.I13.2 = bitcast %struct.TD* %_nested_td.I13.2 to i64*
   %_source_ptr.I13.2 = bitcast i64* %_output.I13 to i64*
   %_source.I13.2 = load i64, i64* %_source_ptr.I13.2
   %_td.I13.2 = bitcast i64* %_desc.I13.2 to %struct.TD*
   %_is_small_ptr.I13.2 = getelementptr %struct.TD, %struct.TD* %_td.I13.2, i32 0, i32 13
   %_is_small.I13.2 = load i8, i8* %_is_small_ptr.I13.2
   %_is_small_bool.I13.2 = trunc i8 %_is_small.I13.2 to i1
   br i1 %_is_small_bool.I13.2, label %_small_label.I13.2, label %_large_label.I13.2
   _small_label.I13.2:
   %_small_null_ptr.I13.2 = getelementptr %struct.TD, %struct.TD* %_td.I13.2, i32 0, i32 17
   %_small_null.I13.2 = load i64, i64* %_small_null_ptr.I13.2
   br label %_join_small_and_large.I13.2
   _large_label.I13.2:
   %_high_and_low_bits.I13.2 = and i64 %_source.I13.2, or (i64 shl (i64 1, i64 63), i64 1)
   %_is_special_bit.I13.2 = icmp eq i64 %_high_and_low_bits.I13.2, or (i64 shl (i64 1, i64 63), i64 1)
   br i1 %_is_special_bit.I13.2, label %_is_special_label.I13.2, label %_not_special_label.I13.2
   _is_special_label.I13.2:
   %_spcl_rgn_times2_.I13.2 = and i64 %_source.I13.2, 4294967295
   br label %_last_large_label.I13.2
   _not_special_label.I13.2:
   %_header_ptr.I13.2 = inttoptr i64 %_source.I13.2 to i64*
   %_hdr_of_src.I13.2 = load i64, i64* %_header_ptr.I13.2
   %_region_bits.I13.2 = and i64 %_hdr_of_src.I13.2, 4294901760
   %_normal_rgn_times2_.I13.2 = lshr i64 %_region_bits.I13.2, 15
   br label %_last_large_label.I13.2
   _last_large_label.I13.2:
   %_rgn_times2_.I13.2 = phi i64 [%_spcl_rgn_times2_.I13.2, %_is_special_label.I13.2], [%_normal_rgn_times2_.I13.2, %_not_special_label.I13.2]
   %_large_null.I13.2 = or i64 -144115188075855871, %_rgn_times2_.I13.2
   br label %_join_small_and_large.I13.2
   _join_small_and_large.I13.2:
   %_null.I13.2 = phi i64 [%_small_null.I13.2, %_small_label.I13.2],[%_large_null.I13.2, %_last_large_label.I13.2]
   %_dest_ptr.I13.2 = bitcast i64* %_loc_.I13_1 to i64* 
   store i64 %_null.I13.2, i64* %_dest_ptr.I13.2

   ; #Copy_Word_Op at 257:42
   %_source.I13.3 = bitcast i64* %_loc_.I13_1 to i64* 
   %_source_val.I13.3 = load i64, i64* %_source.I13.3
   %_loc_.I13_2 = bitcast i64 %_source_val.I13.3 to i64

   ; #Copy_Address_Op at 257:53
   %_source_val.I13.4 = bitcast i64* %_loc_10 to i64*
   %_loc_.I13_4 = bitcast i64* %_source_val.I13.4 to i64*

   ; #Store_Address_Op at 257:42
   %_reg.I13.5_1 = bitcast i64* %_loc_.I13_4 to i64*
   %_addr.I13.5 = getelementptr i64, i64* %_reg.I13.5_1, i64 0
   %_loc_.I13_3 = bitcast i64* %_addr.I13.5 to i64*

   ; #Call_Op at 257:42
   %_cur_td.I13.6 = bitcast i64* %_call13_Static_Link to %struct.TD*
   %_nested_types_arr_ptr.I13.6 = getelementptr %struct.TD, %struct.TD* %_cur_td.I13.6, i32 0, i32 35
   %_nested_types_arr.I13.6 = load %struct.TD**, %struct.TD*** %_nested_types_arr_ptr.I13.6
   %_nested_td_ptr_ptr.I13.6 = getelementptr %struct.TD*, %struct.TD** %_nested_types_arr.I13.6, i32 1
   %_nested_td.I13.6 = load %struct.TD*, %struct.TD** %_nested_td_ptr_ptr.I13.6
   %_call.I13.6_Static_Link = bitcast %struct.TD* %_nested_td.I13.6 to i64*
   %_new_result.I13.6_0 = call i64 @"PSL.Containers.Basic_Map.Remove_Any"(i64* %_loc_.I13_3, i64* %_Context, i64* %_call.I13.6_Static_Link, i64 %_loc_.I13_2)
   %_result_addr.I13.6_0 = bitcast i64* %_loc_.I13_1 to i64* 
   store i64 %_new_result.I13.6_0, i64* %_result_addr.I13.6_0

   ; #Copy_Word_Op at 258:12
   %_source.I13.7 = bitcast i64* %_loc_.I13_1 to i64* 
   %_source_val.I13.7 = load i64, i64* %_source.I13.7
   %_loc_.I13_6 = bitcast i64 %_source_val.I13.7 to i64

   ; #Is_Null_Op at 258:12
   %_arg.I13.8 = bitcast i64 %_loc_.I13_6 to i64
   %_cur_td.I13.8 = bitcast i64* %_call13_Static_Link to %struct.TD*
   %_nested_types_arr_ptr.I13.8 = getelementptr %struct.TD, %struct.TD* %_cur_td.I13.8, i32 0, i32 35
   %_nested_types_arr.I13.8 = load %struct.TD**, %struct.TD*** %_nested_types_arr_ptr.I13.8
   %_nested_td_ptr_ptr.I13.8 = getelementptr %struct.TD*, %struct.TD** %_nested_types_arr.I13.8, i32 0
   %_nested_td.I13.8 = load %struct.TD*, %struct.TD** %_nested_td_ptr_ptr.I13.8
   %_desc.I13.8 = bitcast %struct.TD* %_nested_td.I13.8 to i64*
   %_td.I13.8 = bitcast i64* %_desc.I13.8 to %struct.TD*
   %_is_small_ptr.I13.8 = getelementptr %struct.TD, %struct.TD* %_td.I13.8, i32 0, i32 13
   %_is_small.I13.8 = load i8, i8* %_is_small_ptr.I13.8
   %_is_small_bool.I13.8 = trunc i8 %_is_small.I13.8 to i1
   br i1 %_is_small_bool.I13.8, label %_is_small_lbl.I13.8, label %_is_large_lbl.I13.8
   _is_small_lbl.I13.8:
   %_small_null_ptr.I13.8 = getelementptr %struct.TD, %struct.TD* %_td.I13.8, i32 0, i32 17
   %_small_null.I13.8 = load i64, i64* %_small_null_ptr.I13.8
   %_small_result.I13.8 = icmp eq i64 %_arg.I13.8, %_small_null.I13.8
   br label %_join.I13.8
   _is_large_lbl.I13.8:
   %_val_no_reg.I13.8 = and i64 %_arg.I13.8, -4294967295
   %_large_result.I13.8 = icmp eq i64 %_val_no_reg.I13.8, -144115188075855871
   br label %_join.I13.8
   _join.I13.8:
   %_result_bit.I13.8 = phi i1 [%_small_result.I13.8, %_is_small_lbl.I13.8], [%_large_result.I13.8, %_is_large_lbl.I13.8]
   %_result_ext.I13.8 = zext i1 %_result_bit.I13.8 to i64
   %_loc_.I13_5 = bitcast i64 %_result_ext.I13.8 to i64

   ; #If_Op at 258:12
   %_if_source_val.I13.9 = bitcast i64 %_loc_.I13_5 to i64
   %_if_source_trunc.I13.9 = icmp eq i64 %_if_source_val.I13.9, 1
   br i1 %_if_source_trunc.I13.9, label %_lbl.I13_10, label %_lbl.I13_13

_lbl.I13_10:
   ; #Store_Null_Of_Same_Stg_Rgn_Op at 259:20
   %_cur_td.I13.10 = bitcast i64* %_call13_Static_Link to %struct.TD*
   %_param_arr_ptr.I13.10 = getelementptr %struct.TD, %struct.TD* %_cur_td.I13.10, i32 0, i32 26
   %_param_arr.I13.10 = load %struct.ParamInfo*, %struct.ParamInfo** %_param_arr_ptr.I13.10
   %_formal_td_ptr_ptr.I13.10 = getelementptr %struct.ParamInfo, %struct.ParamInfo* %_param_arr.I13.10, i32 0, i32 1, i32 0
   %_formal_td.I13.10 = load %struct.TD*, %struct.TD** %_formal_td_ptr_ptr.I13.10
   %_desc.I13.10 = bitcast %struct.TD* %_formal_td.I13.10 to i64*
   %_source_ptr.I13.10 = bitcast i64* %_output.I13 to i64*
   %_source.I13.10 = load i64, i64* %_source_ptr.I13.10
   %_td.I13.10 = bitcast i64* %_desc.I13.10 to %struct.TD*
   %_is_small_ptr.I13.10 = getelementptr %struct.TD, %struct.TD* %_td.I13.10, i32 0, i32 13
   %_is_small.I13.10 = load i8, i8* %_is_small_ptr.I13.10
   %_is_small_bool.I13.10 = trunc i8 %_is_small.I13.10 to i1
   br i1 %_is_small_bool.I13.10, label %_small_label.I13.10, label %_large_label.I13.10
   _small_label.I13.10:
   %_small_null_ptr.I13.10 = getelementptr %struct.TD, %struct.TD* %_td.I13.10, i32 0, i32 17
   %_small_null.I13.10 = load i64, i64* %_small_null_ptr.I13.10
   br label %_join_small_and_large.I13.10
   _large_label.I13.10:
   %_high_and_low_bits.I13.10 = and i64 %_source.I13.10, or (i64 shl (i64 1, i64 63), i64 1)
   %_is_special_bit.I13.10 = icmp eq i64 %_high_and_low_bits.I13.10, or (i64 shl (i64 1, i64 63), i64 1)
   br i1 %_is_special_bit.I13.10, label %_is_special_label.I13.10, label %_not_special_label.I13.10
   _is_special_label.I13.10:
   %_spcl_rgn_times2_.I13.10 = and i64 %_source.I13.10, 4294967295
   br label %_last_large_label.I13.10
   _not_special_label.I13.10:
   %_header_ptr.I13.10 = inttoptr i64 %_source.I13.10 to i64*
   %_hdr_of_src.I13.10 = load i64, i64* %_header_ptr.I13.10
   %_region_bits.I13.10 = and i64 %_hdr_of_src.I13.10, 4294901760
   %_normal_rgn_times2_.I13.10 = lshr i64 %_region_bits.I13.10, 15
   br label %_last_large_label.I13.10
   _last_large_label.I13.10:
   %_rgn_times2_.I13.10 = phi i64 [%_spcl_rgn_times2_.I13.10, %_is_special_label.I13.10], [%_normal_rgn_times2_.I13.10, %_not_special_label.I13.10]
   %_large_null.I13.10 = or i64 -144115188075855871, %_rgn_times2_.I13.10
   br label %_join_small_and_large.I13.10
   _join_small_and_large.I13.10:
   %_null.I13.10 = phi i64 [%_small_null.I13.10, %_small_label.I13.10],[%_large_null.I13.10, %_last_large_label.I13.10]
   %_loc_.I13_7 = bitcast i64 %_null.I13.10 to i64

   ; #Copy_Word_Op at 259:13
   %_source_val.I13.11 = bitcast i64 %_loc_.I13_7 to i64
   %_dest.I13.11 = bitcast i64* %_output.I13 to i64*
   store i64 %_source_val.I13.11, i64* %_dest.I13.11

   ; #Return_Op at 259:13
   br label %_lbl.I13_14

_lbl.I13_13:
   ; #Move_Obj_Op at 261:13
   %_source_ptr.I13.13 = bitcast i64* %_loc_.I13_1 to i64* 
   %_dest_ptr.I13.13 = bitcast i64* %_output.I13 to i64*
   %_cur_td.I13.13 = bitcast i64* %_call13_Static_Link to %struct.TD*
   %_param_arr_ptr.I13.13 = getelementptr %struct.TD, %struct.TD* %_cur_td.I13.13, i32 0, i32 26
   %_param_arr.I13.13 = load %struct.ParamInfo*, %struct.ParamInfo** %_param_arr_ptr.I13.13
   %_formal_td_ptr_ptr.I13.13 = getelementptr %struct.ParamInfo, %struct.ParamInfo* %_param_arr.I13.13, i32 0, i32 1, i32 0
   %_formal_td.I13.13 = load %struct.TD*, %struct.TD** %_formal_td_ptr_ptr.I13.13
   %_desc.I13.13 = bitcast %struct.TD* %_formal_td.I13.13 to i64*
   call void @_psc_move_object(i64* %_Context, i64* %_desc.I13.13, i64* %_dest_ptr.I13.13, i64* %_source_ptr.I13.13)

   br label %_lbl.I13_14

_lbl.I13_14:
   ; #Return_Op at 263:5

   %_new_result13 = load i64, i64* %_output.I13
   %_result_addr13 = bitcast i64* %_loc_8 to i64* 
   store i64 %_new_result13, i64* %_result_addr13

   ; #Copy_Address_Op at 46:13
   %_source_val14 = bitcast i64* %_formal_param_0 to i64*
   %_loc_16 = bitcast i64* %_source_val14 to i64*

   ; #Copy_Word_Op at 46:13
   %_reg15_1 = bitcast i64* %_loc_16 to i64*
   %_source15 = getelementptr i64, i64* %_reg15_1, i64 0
   %_source_val15 = load i64, i64* %_source15
   %_loc_15 = bitcast i64 %_source_val15 to i64

   ; #Store_Address_Op at 46:15
   %_reg16_1 = inttoptr i64 %_loc_15 to i64*
   %_addr16 = getelementptr i64, i64* %_reg16_1, i64 2
   %_loc_13 = bitcast i64* %_addr16 to i64*

   ; #Store_Local_Null_Op at 46:26
   %_cur_td17 = bitcast i64* %_Static_Link to %struct.TD*
   %_nested_types_arr_ptr17 = getelementptr %struct.TD, %struct.TD* %_cur_td17, i32 0, i32 35
   %_nested_types_arr17 = load %struct.TD**, %struct.TD*** %_nested_types_arr_ptr17
   %_nested_td_ptr_ptr17 = getelementptr %struct.TD*, %struct.TD** %_nested_types_arr17, i32 6
   %_nested_td17 = load %struct.TD*, %struct.TD** %_nested_td_ptr_ptr17
   %_desc17 = bitcast %struct.TD* %_nested_td17 to i64*
   %_td17 = bitcast i64* %_desc17 to %struct.TD*
   %_is_small_ptr17 = getelementptr %struct.TD, %struct.TD* %_td17, i32 0, i32 13
   %_is_small17 = load i8, i8* %_is_small_ptr17
   %_is_small_bool17 = trunc i8 %_is_small17 to i1
   %_small_null_ptr17 = getelementptr %struct.TD, %struct.TD* %_td17, i32 0, i32 17
   %_small_null17 = load i64, i64* %_small_null_ptr17
   %_ctx17 = bitcast i64* %_Context to %struct.ExecCtx*
   %_large_null_ptr17 = getelementptr %struct.ExecCtx, %struct.ExecCtx* %_ctx17, i32 0, i32 1
   %_large_null17 = load i64, i64* %_large_null_ptr17
   %_null17= select i1 %_is_small_bool17, i64 %_small_null17, i64 %_large_null17
   %_loc_18 = bitcast i64 %_null17 to i64

   ; #Declare_Obj_Op at 46:26

   ; #Call_Op at 46:26
   ; inlining call on "[]"
   store i64 %_loc_18, i64* %_output.I19
   %_cur_td19 = bitcast i64* %_Static_Link to %struct.TD*
   %_nested_types_arr_ptr19 = getelementptr %struct.TD, %struct.TD* %_cur_td19, i32 0, i32 35
   %_nested_types_arr19 = load %struct.TD**, %struct.TD*** %_nested_types_arr_ptr19
   %_nested_td_ptr_ptr19 = getelementptr %struct.TD*, %struct.TD** %_nested_types_arr19, i32 6
   %_nested_td19 = load %struct.TD*, %struct.TD** %_nested_td_ptr_ptr19
   %_call19_Static_Link = bitcast %struct.TD* %_nested_td19 to i64*

   ; #Declare_Obj_Op at 16:32

   ; #Create_Obj_Op at 16:32
   %_desc.I19.2 = getelementptr i64, i64* %_call19_Static_Link, i64 0
   %_src_addr.I19.2 = bitcast i64* %_output.I19 to i64*
   %_src.I19.2 = load i64, i64* %_src_addr.I19.2
   %_dest.I19.2 = call i64@_psc_new_object(i64* %_Context, i64* %_desc.I19.2, i64 %_src.I19.2)
   %_dest_addr.I19.2 = bitcast i64* %_loc_.I19_2 to i64* 
   store i64 %_dest.I19.2, i64* %_dest_addr.I19.2

   ; #Copy_Word_Op at 16:32
   %_source.I19.3 = bitcast i64* %_loc_.I19_2 to i64* 
   %_source_val.I19.3 = load i64, i64* %_source.I19.3
   %_loc_.I19_3 = bitcast i64 %_source_val.I19.3 to i64

   ; #Store_Null_Of_Same_Stg_Rgn_Op at 16:40
   %_cur_td.I19.4 = bitcast i64* %_call19_Static_Link to %struct.TD*
   %_param_arr_ptr.I19.4 = getelementptr %struct.TD, %struct.TD* %_cur_td.I19.4, i32 0, i32 26
   %_param_arr.I19.4 = load %struct.ParamInfo*, %struct.ParamInfo** %_param_arr_ptr.I19.4
   %_formal_td_ptr_ptr.I19.4 = getelementptr %struct.ParamInfo, %struct.ParamInfo* %_param_arr.I19.4, i32 0, i32 1, i32 0
   %_formal_td.I19.4 = load %struct.TD*, %struct.TD** %_formal_td_ptr_ptr.I19.4
   %_desc.I19.4 = bitcast %struct.TD* %_formal_td.I19.4 to i64*
   %_source.I19.4 = bitcast i64 %_loc_.I19_3 to i64
   %_td.I19.4 = bitcast i64* %_desc.I19.4 to %struct.TD*
   %_is_small_ptr.I19.4 = getelementptr %struct.TD, %struct.TD* %_td.I19.4, i32 0, i32 13
   %_is_small.I19.4 = load i8, i8* %_is_small_ptr.I19.4
   %_is_small_bool.I19.4 = trunc i8 %_is_small.I19.4 to i1
   br i1 %_is_small_bool.I19.4, label %_small_label.I19.4, label %_large_label.I19.4
   _small_label.I19.4:
   %_small_null_ptr.I19.4 = getelementptr %struct.TD, %struct.TD* %_td.I19.4, i32 0, i32 17
   %_small_null.I19.4 = load i64, i64* %_small_null_ptr.I19.4
   br label %_join_small_and_large.I19.4
   _large_label.I19.4:
   %_high_and_low_bits.I19.4 = and i64 %_source.I19.4, or (i64 shl (i64 1, i64 63), i64 1)
   %_is_special_bit.I19.4 = icmp eq i64 %_high_and_low_bits.I19.4, or (i64 shl (i64 1, i64 63), i64 1)
   br i1 %_is_special_bit.I19.4, label %_is_special_label.I19.4, label %_not_special_label.I19.4
   _is_special_label.I19.4:
   %_spcl_rgn_times2_.I19.4 = and i64 %_source.I19.4, 4294967295
   br label %_last_large_label.I19.4
   _not_special_label.I19.4:
   %_header_ptr.I19.4 = inttoptr i64 %_source.I19.4 to i64*
   %_hdr_of_src.I19.4 = load i64, i64* %_header_ptr.I19.4
   %_region_bits.I19.4 = and i64 %_hdr_of_src.I19.4, 4294901760
   %_normal_rgn_times2_.I19.4 = lshr i64 %_region_bits.I19.4, 15
   br label %_last_large_label.I19.4
   _last_large_label.I19.4:
   %_rgn_times2_.I19.4 = phi i64 [%_spcl_rgn_times2_.I19.4, %_is_special_label.I19.4], [%_normal_rgn_times2_.I19.4, %_not_special_label.I19.4]
   %_large_null.I19.4 = or i64 -144115188075855871, %_rgn_times2_.I19.4
   br label %_join_small_and_large.I19.4
   _join_small_and_large.I19.4:
   %_null.I19.4 = phi i64 [%_small_null.I19.4, %_small_label.I19.4],[%_large_null.I19.4, %_last_large_label.I19.4]
   %_loc_.I19_4 = bitcast i64 %_null.I19.4 to i64

   ; #Copy_Word_Op at 16:40
   %_source_val.I19.5 = bitcast i64 %_loc_.I19_4 to i64
   %_reg.I19.5_2 = inttoptr i64 %_loc_.I19_3 to i64*
   %_dest.I19.5 = getelementptr i64, i64* %_reg.I19.5_2, i64 1
   store i64 %_source_val.I19.5, i64* %_dest.I19.5

   ; #Store_Null_Of_Same_Stg_Rgn_Op at 16:55
   %_cur_td.I19.6 = bitcast i64* %_call19_Static_Link to %struct.TD*
   %_param_arr_ptr.I19.6 = getelementptr %struct.TD, %struct.TD* %_cur_td.I19.6, i32 0, i32 26
   %_param_arr.I19.6 = load %struct.ParamInfo*, %struct.ParamInfo** %_param_arr_ptr.I19.6
   %_formal_td_ptr_ptr.I19.6 = getelementptr %struct.ParamInfo, %struct.ParamInfo* %_param_arr.I19.6, i32 1, i32 1, i32 0
   %_formal_td.I19.6 = load %struct.TD*, %struct.TD** %_formal_td_ptr_ptr.I19.6
   %_desc.I19.6 = bitcast %struct.TD* %_formal_td.I19.6 to i64*
   %_source.I19.6 = bitcast i64 %_loc_.I19_3 to i64
   %_td.I19.6 = bitcast i64* %_desc.I19.6 to %struct.TD*
   %_is_small_ptr.I19.6 = getelementptr %struct.TD, %struct.TD* %_td.I19.6, i32 0, i32 13
   %_is_small.I19.6 = load i8, i8* %_is_small_ptr.I19.6
   %_is_small_bool.I19.6 = trunc i8 %_is_small.I19.6 to i1
   br i1 %_is_small_bool.I19.6, label %_small_label.I19.6, label %_large_label.I19.6
   _small_label.I19.6:
   %_small_null_ptr.I19.6 = getelementptr %struct.TD, %struct.TD* %_td.I19.6, i32 0, i32 17
   %_small_null.I19.6 = load i64, i64* %_small_null_ptr.I19.6
   br label %_join_small_and_large.I19.6
   _large_label.I19.6:
   %_high_and_low_bits.I19.6 = and i64 %_source.I19.6, or (i64 shl (i64 1, i64 63), i64 1)
   %_is_special_bit.I19.6 = icmp eq i64 %_high_and_low_bits.I19.6, or (i64 shl (i64 1, i64 63), i64 1)
   br i1 %_is_special_bit.I19.6, label %_is_special_label.I19.6, label %_not_special_label.I19.6
   _is_special_label.I19.6:
   %_spcl_rgn_times2_.I19.6 = and i64 %_source.I19.6, 4294967295
   br label %_last_large_label.I19.6
   _not_special_label.I19.6:
   %_header_ptr.I19.6 = inttoptr i64 %_source.I19.6 to i64*
   %_hdr_of_src.I19.6 = load i64, i64* %_header_ptr.I19.6
   %_region_bits.I19.6 = and i64 %_hdr_of_src.I19.6, 4294901760
   %_normal_rgn_times2_.I19.6 = lshr i64 %_region_bits.I19.6, 15
   br label %_last_large_label.I19.6
   _last_large_label.I19.6:
   %_rgn_times2_.I19.6 = phi i64 [%_spcl_rgn_times2_.I19.6, %_is_special_label.I19.6], [%_normal_rgn_times2_.I19.6, %_not_special_label.I19.6]
   %_large_null.I19.6 = or i64 -144115188075855871, %_rgn_times2_.I19.6
   br label %_join_small_and_large.I19.6
   _join_small_and_large.I19.6:
   %_null.I19.6 = phi i64 [%_small_null.I19.6, %_small_label.I19.6],[%_large_null.I19.6, %_last_large_label.I19.6]
   %_loc_.I19_5 = bitcast i64 %_null.I19.6 to i64

   ; #Copy_Word_Op at 16:55
   %_source_val.I19.7 = bitcast i64 %_loc_.I19_5 to i64
   %_reg.I19.7_2 = inttoptr i64 %_loc_.I19_3 to i64*
   %_dest.I19.7 = getelementptr i64, i64* %_reg.I19.7_2, i64 2
   store i64 %_source_val.I19.7, i64* %_dest.I19.7

   ; #Copy_Word_Op at 16:32
   %_source.I19.8 = bitcast i64* %_loc_.I19_2 to i64* 
   %_source_val.I19.8 = load i64, i64* %_source.I19.8
   %_loc_.I19_1 = bitcast i64 %_source_val.I19.8 to i64

   ; #Copy_Word_Op at 16:31
   %_source_val.I19.9 = bitcast i64 %_loc_.I19_1 to i64
   %_dest.I19.9 = bitcast i64* %_output.I19 to i64*
   store i64 %_source_val.I19.9, i64* %_dest.I19.9

   ; #Check_Not_Null_Op at 16:31
   %_arg_ptr.I19.10 = bitcast i64* %_output.I19 to i64*
   %_arg.I19.10 = load i64, i64* %_arg_ptr.I19.10
   %_val_no_reg.I19.10 = and i64 %_arg.I19.10, -4294967295
   %_is_null.I19.10 = icmp eq i64 %_val_no_reg.I19.10, -144115188075855871
   br i1 %_is_null.I19.10, label %_fail.I19.10, label %_lbl.I19_11
   _fail.I19.10:
   %_str_ptr_ptr.I19.10 = load i64*, i64** @$Strings
   %_str_ptr.I19.10 = getelementptr i64, i64* %_str_ptr_ptr.I19.10, i64 3
   %_assert_str.I19.10 = load i64, i64* %_str_ptr.I19.10
   store i64 %_assert_str.I19.10, i64* %_print_param.I19.10
   call void @_psc_runtime_message(i64* %_Context, i64* %_print_param.I19.10, i64* null)

   br label %_lbl.I19_11

_lbl.I19_11:
   ; #Return_Op at 16:31

   %_new_result19 = load i64, i64* %_output.I19
   %_result_addr19 = bitcast i64* %_loc_17 to i64* 
   store i64 %_new_result19, i64* %_result_addr19

   ; #Store_Address_Op at 46:29
   %_addr20 = bitcast i64* %_loc_17 to i64* 
   %_loc_22 = bitcast i64* %_addr20 to i64*

   ; #Copy_Address_Op at 46:27
   %_source_val21 = bitcast i64* %_formal_param_0 to i64*
   %_loc_29 = bitcast i64* %_source_val21 to i64*

   ; #Copy_Word_Op at 46:27
   %_reg22_1 = bitcast i64* %_loc_29 to i64*
   %_source22 = getelementptr i64, i64* %_reg22_1, i64 0
   %_source_val22 = load i64, i64* %_source22
   %_loc_28 = bitcast i64 %_source_val22 to i64

   ; #Store_Address_Op at 46:29
   %_reg23_1 = inttoptr i64 %_loc_28 to i64*
   %_addr23 = getelementptr i64, i64* %_reg23_1, i64 1
   %_loc_26 = bitcast i64* %_addr23 to i64*

   ; #Copy_Word_Op at 46:37
   %_source24 = bitcast i64* %_loc_8 to i64* 
   %_source_val24 = load i64, i64* %_source24
   %_loc_27 = bitcast i64 %_source_val24 to i64

   ; #Call_Op at 46:29
   ; inlining call on "indexing"
   %_cur_td25 = bitcast i64* %_Static_Link to %struct.TD*
   %_nested_types_arr_ptr25 = getelementptr %struct.TD, %struct.TD* %_cur_td25, i32 0, i32 35
   %_nested_types_arr25 = load %struct.TD**, %struct.TD*** %_nested_types_arr_ptr25
   %_nested_td_ptr_ptr25 = getelementptr %struct.TD*, %struct.TD** %_nested_types_arr25, i32 2
   %_nested_td25 = load %struct.TD*, %struct.TD** %_nested_td_ptr_ptr25
   %_call25_Static_Link = bitcast %struct.TD* %_nested_td25 to i64*

   ; #Copy_Address_Op at 121:16
   %_source_val.I25.1 = bitcast i64* %_loc_26 to i64*
   %_loc_.I25_7 = bitcast i64* %_source_val.I25.1 to i64*

   ; #Store_Address_Op at 121:18
   %_reg.I25.2_1 = bitcast i64* %_loc_.I25_7 to i64*
   %_addr.I25.2 = getelementptr i64, i64* %_reg.I25.2_1, i64 0
   %_loc_.I25_5 = bitcast i64* %_addr.I25.2 to i64*

   ; #Copy_Word_Op at 121:23
   %_source_val.I25.3 = bitcast i64 %_loc_27 to i64
   %_loc_.I25_6 = bitcast i64 %_source_val.I25.3 to i64

   ; #Call_Op at 121:18
   %_cur_td.I25.4 = bitcast i64* %_call25_Static_Link to %struct.TD*
   %_nested_types_arr_ptr.I25.4 = getelementptr %struct.TD, %struct.TD* %_cur_td.I25.4, i32 0, i32 35
   %_nested_types_arr.I25.4 = load %struct.TD**, %struct.TD*** %_nested_types_arr_ptr.I25.4
   %_nested_td_ptr_ptr.I25.4 = getelementptr %struct.TD*, %struct.TD** %_nested_types_arr.I25.4, i32 2
   %_nested_td.I25.4 = load %struct.TD*, %struct.TD** %_nested_td_ptr_ptr.I25.4
   %_call.I25.4_Static_Link = bitcast %struct.TD* %_nested_td.I25.4 to i64*
   %_new_result.I25.4_0 = call i64* @"PSL.Containers.Basic_Map.$indexing$"(i64* %_loc_.I25_5, i64 %_loc_.I25_6, i64* %_Context, i64* %_call.I25.4_Static_Link)
   %_loc_.I25_3 = bitcast i64* %_new_result.I25.4_0 to i64*

   ; #Copy_Word_Op at 121:18
   %_reg.I25.5_1 = bitcast i64* %_loc_.I25_3 to i64*
   %_source.I25.5 = getelementptr i64, i64* %_reg.I25.5_1, i64 0
   %_source_val.I25.5 = load i64, i64* %_source.I25.5
   %_loc_.I25_2 = bitcast i64 %_source_val.I25.5 to i64

   ; #Store_Address_Op at 121:9
   %_reg.I25.6_1 = inttoptr i64 %_loc_.I25_2 to i64*
   %_addr.I25.6 = getelementptr i64, i64* %_reg.I25.6_1, i64 2
   %_dest_ptr.I25.6_Orig = bitcast i64* %_output.I25 to i64*
   %_dest_ptr.I25.6 = bitcast i64* %_dest_ptr.I25.6_Orig to i64**
   store i64* %_addr.I25.6, i64** %_dest_ptr.I25.6

   ; #Return_Op at 121:9

   %_new_result_addr_ind25 = bitcast i64* %_output.I25 to i64**
   %_new_result25 = load i64*, i64** %_new_result_addr_ind25
   %_loc_24 = bitcast i64* %_new_result25 to i64*

   ; #Copy_Word_Op at 46:29
   %_reg26_1 = bitcast i64* %_loc_24 to i64*
   %_source26 = getelementptr i64, i64* %_reg26_1, i64 0
   %_source_val26 = load i64, i64* %_source26
   %_loc_23 = bitcast i64 %_source_val26 to i64

   ; #Call_Op at 46:29
   ; inlining call on "var_indexing"
   %_cur_td27 = bitcast i64* %_Static_Link to %struct.TD*
   %_nested_types_arr_ptr27 = getelementptr %struct.TD, %struct.TD* %_cur_td27, i32 0, i32 35
   %_nested_types_arr27 = load %struct.TD**, %struct.TD*** %_nested_types_arr_ptr27
   %_nested_td_ptr_ptr27 = getelementptr %struct.TD*, %struct.TD** %_nested_types_arr27, i32 6
   %_nested_td27 = load %struct.TD*, %struct.TD** %_nested_td_ptr_ptr27
   %_call27_Static_Link = bitcast %struct.TD* %_nested_td27 to i64*

   ; #Copy_Address_Op at 30:9
   %_source_val.I27.1 = bitcast i64* %_loc_22 to i64*
   %_loc_.I27_3 = bitcast i64* %_source_val.I27.1 to i64*

   ; #Copy_Word_Op at 30:9
   %_reg.I27.2_1 = bitcast i64* %_loc_.I27_3 to i64*
   %_source.I27.2 = getelementptr i64, i64* %_reg.I27.2_1, i64 0
   %_source_val.I27.2 = load i64, i64* %_source.I27.2
   %_loc_.I27_2 = bitcast i64 %_source_val.I27.2 to i64

   ; #Make_Copy_In_Stg_Rgn_Op at 30:19
   %_cur_td.I27.3 = bitcast i64* %_call27_Static_Link to %struct.TD*
   %_param_arr_ptr.I27.3 = getelementptr %struct.TD, %struct.TD* %_cur_td.I27.3, i32 0, i32 26
   %_param_arr.I27.3 = load %struct.ParamInfo*, %struct.ParamInfo** %_param_arr_ptr.I27.3
   %_formal_td_ptr_ptr.I27.3 = getelementptr %struct.ParamInfo, %struct.ParamInfo* %_param_arr.I27.3, i32 0, i32 1, i32 0
   %_formal_td.I27.3 = load %struct.TD*, %struct.TD** %_formal_td_ptr_ptr.I27.3
   %_desc.I27.3 = bitcast %struct.TD* %_formal_td.I27.3 to i64*
   %_source.I27.3 = bitcast i64 %_loc_23 to i64
   %_reg.I27.3_3 = inttoptr i64 %_loc_.I27_2 to i64*
   %_existing_ptr.I27.3 = getelementptr i64, i64* %_reg.I27.3_3, i64 1
   %_existing_obj.I27.3 = load i64, i64* %_existing_ptr.I27.3
   %_result.I27.3 = call i64 @_psc_copy_object(i64* %_Context, i64* %_desc.I27.3, i64 %_source.I27.3, i64 %_existing_obj.I27.3)
   %_loc_.I27_1 = bitcast i64 %_result.I27.3 to i64

   ; #Assign_Word_Op at 30:12
   %_cur_td.I27.4 = bitcast i64* %_call27_Static_Link to %struct.TD*
   %_param_arr_ptr.I27.4 = getelementptr %struct.TD, %struct.TD* %_cur_td.I27.4, i32 0, i32 26
   %_param_arr.I27.4 = load %struct.ParamInfo*, %struct.ParamInfo** %_param_arr_ptr.I27.4
   %_formal_td_ptr_ptr.I27.4 = getelementptr %struct.ParamInfo, %struct.ParamInfo* %_param_arr.I27.4, i32 0, i32 1, i32 0
   %_formal_td.I27.4 = load %struct.TD*, %struct.TD** %_formal_td_ptr_ptr.I27.4
   %_desc.I27.4 = bitcast %struct.TD* %_formal_td.I27.4 to i64*
   %_source.I27.4 = bitcast i64 %_loc_.I27_1 to i64
   %_reg.I27.4_2 = inttoptr i64 %_loc_.I27_2 to i64*
   %_dest_ptr.I27.4 = getelementptr i64, i64* %_reg.I27.4_2, i64 1
   call void @_psc_assign_word(i64* %_Context, i64* %_desc.I27.4, i64* %_dest_ptr.I27.4, i64 %_source.I27.4)

   ; #Copy_Address_Op at 31:16
   %_source_val.I27.5 = bitcast i64* %_loc_22 to i64*
   %_loc_.I27_6 = bitcast i64* %_source_val.I27.5 to i64*

   ; #Copy_Word_Op at 31:16
   %_reg.I27.6_1 = bitcast i64* %_loc_.I27_6 to i64*
   %_source.I27.6 = getelementptr i64, i64* %_reg.I27.6_1, i64 0
   %_source_val.I27.6 = load i64, i64* %_source.I27.6
   %_loc_.I27_5 = bitcast i64 %_source_val.I27.6 to i64

   ; #Store_Address_Op at 31:9
   %_reg.I27.7_1 = inttoptr i64 %_loc_.I27_5 to i64*
   %_addr.I27.7 = getelementptr i64, i64* %_reg.I27.7_1, i64 2
   %_dest_ptr.I27.7_Orig = bitcast i64* %_output.I27 to i64*
   %_dest_ptr.I27.7 = bitcast i64* %_dest_ptr.I27.7_Orig to i64**
   store i64* %_addr.I27.7, i64** %_dest_ptr.I27.7

   ; #Return_Op at 31:9

   %_new_result_addr_ind27 = bitcast i64* %_output.I27 to i64**
   %_new_result27 = load i64*, i64** %_new_result_addr_ind27
   %_loc_20 = bitcast i64* %_new_result27 to i64*

   ; #Make_Copy_In_Stg_Rgn_Op at 46:45
   %_cur_td28 = bitcast i64* %_Static_Link to %struct.TD*
   %_param_arr_ptr28 = getelementptr %struct.TD, %struct.TD* %_cur_td28, i32 0, i32 26
   %_param_arr28 = load %struct.ParamInfo*, %struct.ParamInfo** %_param_arr_ptr28
   %_formal_td_ptr_ptr28 = getelementptr %struct.ParamInfo, %struct.ParamInfo* %_param_arr28, i32 0, i32 1, i32 0
   %_formal_td28 = load %struct.TD*, %struct.TD** %_formal_td_ptr_ptr28
   %_desc28 = bitcast %struct.TD* %_formal_td28 to i64*
   %_source_ptr28 = bitcast i64* %_loc_8 to i64* 
   %_source28 = load i64, i64* %_source_ptr28
   %_existing_ptr28 = bitcast i64* %_loc_17 to i64* 
   %_existing_obj28 = load i64, i64* %_existing_ptr28
   %_result28 = call i64 @_psc_copy_object(i64* %_Context, i64* %_desc28, i64 %_source28, i64 %_existing_obj28)
   %_loc_19 = bitcast i64 %_result28 to i64

   ; #Assign_Word_Op at 46:29
   %_cur_td29 = bitcast i64* %_Static_Link to %struct.TD*
   %_param_arr_ptr29 = getelementptr %struct.TD, %struct.TD* %_cur_td29, i32 0, i32 26
   %_param_arr29 = load %struct.ParamInfo*, %struct.ParamInfo** %_param_arr_ptr29
   %_formal_td_ptr_ptr29 = getelementptr %struct.ParamInfo, %struct.ParamInfo* %_param_arr29, i32 0, i32 1, i32 0
   %_formal_td29 = load %struct.TD*, %struct.TD** %_formal_td_ptr_ptr29
   %_desc29 = bitcast %struct.TD* %_formal_td29 to i64*
   %_source29 = bitcast i64 %_loc_19 to i64
   %_reg29_2 = bitcast i64* %_loc_20 to i64*
   %_dest_ptr29 = getelementptr i64, i64* %_reg29_2, i64 0
   call void @_psc_assign_word(i64* %_Context, i64* %_desc29, i64* %_dest_ptr29, i64 %_source29)

   ; #Copy_Word_Op at 46:26
   %_source30 = bitcast i64* %_loc_17 to i64* 
   %_source_val30 = load i64, i64* %_source30
   %_loc_14 = bitcast i64 %_source_val30 to i64

   ; #Call_Op at 46:15
   ; inlining call on "|="
   %_cur_td31 = bitcast i64* %_Static_Link to %struct.TD*
   %_nested_types_arr_ptr31 = getelementptr %struct.TD, %struct.TD* %_cur_td31, i32 0, i32 35
   %_nested_types_arr31 = load %struct.TD**, %struct.TD*** %_nested_types_arr_ptr31
   %_nested_td_ptr_ptr31 = getelementptr %struct.TD*, %struct.TD** %_nested_types_arr31, i32 5
   %_nested_td31 = load %struct.TD*, %struct.TD** %_nested_td_ptr_ptr31
   %_call31_Static_Link = bitcast %struct.TD* %_nested_td31 to i64*

   ; #Copy_Address_Op at 80:9
   %_source_val.I31.1 = bitcast i64* %_loc_13 to i64*
   %_loc_.I31_3 = bitcast i64* %_source_val.I31.1 to i64*

   ; #Store_Address_Op at 80:14
   %_reg.I31.2_1 = bitcast i64* %_loc_.I31_3 to i64*
   %_addr.I31.2 = getelementptr i64, i64* %_reg.I31.2_1, i64 0
   %_loc_.I31_1 = bitcast i64* %_addr.I31.2 to i64*

   ; #Copy_Word_Op at 80:22
   %_source_val.I31.3 = bitcast i64 %_loc_14 to i64
   %_loc_.I31_2 = bitcast i64 %_source_val.I31.3 to i64

   ; #Call_Op at 80:14
   %_cur_td.I31.4 = bitcast i64* %_call31_Static_Link to %struct.TD*
   %_nested_types_arr_ptr.I31.4 = getelementptr %struct.TD, %struct.TD* %_cur_td.I31.4, i32 0, i32 35
   %_nested_types_arr.I31.4 = load %struct.TD**, %struct.TD*** %_nested_types_arr_ptr.I31.4
   %_nested_td_ptr_ptr.I31.4 = getelementptr %struct.TD*, %struct.TD** %_nested_types_arr.I31.4, i32 2
   %_nested_td.I31.4 = load %struct.TD*, %struct.TD** %_nested_td_ptr_ptr.I31.4
   %_call.I31.4_Static_Link = bitcast %struct.TD* %_nested_td.I31.4 to i64*
   call void @"PSL.Containers.Basic_Map.$|=$"(i64* %_loc_.I31_1, i64 %_loc_.I31_2, i64* %_Context, i64* %_call.I31.4_Static_Link)

   ; #Return_Op at 81:5


   ; #Skip_Op at 44:9
   br label %_lbl1

_lbl33:
   ; #Return_Op at 48:5
   call void @_psc_finalize_stg_rgn(i64* %_Context, i64* %_Local_Area)
   ret void

}

define i64 @"PSL.Containers.Two_Way_Map.$[]$"(i64* %_Context, i64* %_Static_Link, i64 %_inited_output) {
   %_Local_Area = alloca i64, i64 4
   %_sl = ptrtoint i64* %_Static_Link to i64
   store i64 %_sl, i64* %_Local_Area
   call void @_psc_initialize_stg_rgn(i64* %_Context, i64* %_Local_Area)
   %_Master = alloca i64, i64 3
   %_ms = ptrtoint i64* %_Master to i64
   %_store_ms = getelementptr i64, i64* %_Local_Area, i64 3
   store i64 %_ms, i64* %_store_ms

   %_Param_Area = alloca i64
   %_loc_2 = alloca i64, i64 12
   %_loc_4 = alloca i64, i64 12
   %_loc_6 = alloca i64
   %_output.I7 = alloca i64
   %_loc_.I7_2 = alloca i64
   %_print_param.I7.6 = alloca i64
   %_print_param16 = alloca i64

   store i64 %_inited_output, i64* %_Param_Area
   %_pa = ptrtoint i64* %_Param_Area to i64
   %_store_pa = getelementptr i64, i64* %_Local_Area, i64 1
   store i64 %_pa, i64* %_store_pa
   
   ; #Start_Parallel_Op at 53:43
   %_master1 = bitcast i64* %_Master to i64*
   %_static_Link1 = getelementptr i64, i64* %_Local_Area, i64 0
   call void @_psc_execute_compiled_parallel_op(i64* %_Context, i64* %_master1, i64* %_loc_2, i32(i64*, i64*, i64*)* @"PSL.Containers.Two_Way_Map.$[]$.17block", i64* %_static_Link1, i1 0, i1 1, i1 1)
   %_new_result_addr1_11 = getelementptr i64, i64* %_loc_2, i64 11

   ; #Add_Parallel_Op at 53:61
   %_master2 = bitcast i64* %_Master to i64*
   %_static_Link2 = getelementptr i64, i64* %_Local_Area, i64 0
   call void @_psc_execute_compiled_parallel_op(i64* %_Context, i64* %_master2, i64* %_loc_4, i32(i64*, i64*, i64*)* @"PSL.Containers.Two_Way_Map.$[]$.22block", i64* %_static_Link2, i1 0, i1 1, i1 0)
   %_new_result_addr2_11 = getelementptr i64, i64* %_loc_4, i64 11

   ; #Declare_Obj_Op at 53:16

   ; #Create_Obj_Op at 53:16
   %_desc4 = getelementptr i64, i64* %_Static_Link, i64 0
   %_src_addr4 = getelementptr i64, i64* %_Param_Area, i64 0
   %_src4 = load i64, i64* %_src_addr4
   %_dest4 = call i64@_psc_new_object(i64* %_Context, i64* %_desc4, i64 %_src4)
   %_dest_addr4 = bitcast i64* %_loc_6 to i64* 
   store i64 %_dest4, i64* %_dest_addr4

   ; #Copy_Word_Op at 53:16
   %_source5 = bitcast i64* %_loc_6 to i64* 
   %_source_val5 = load i64, i64* %_source5
   %_loc_7 = bitcast i64 %_source_val5 to i64

   ; #Store_Null_Of_Same_Stg_Rgn_Op at 53:28
   %_cur_td6 = bitcast i64* %_Static_Link to %struct.TD*
   %_nested_types_arr_ptr6 = getelementptr %struct.TD, %struct.TD* %_cur_td6, i32 0, i32 35
   %_nested_types_arr6 = load %struct.TD**, %struct.TD*** %_nested_types_arr_ptr6
   %_nested_td_ptr_ptr6 = getelementptr %struct.TD*, %struct.TD** %_nested_types_arr6, i32 2
   %_nested_td6 = load %struct.TD*, %struct.TD** %_nested_td_ptr_ptr6
   %_desc6 = bitcast %struct.TD* %_nested_td6 to i64*
   %_source6 = bitcast i64 %_loc_7 to i64
   %_td6 = bitcast i64* %_desc6 to %struct.TD*
   %_is_small_ptr6 = getelementptr %struct.TD, %struct.TD* %_td6, i32 0, i32 13
   %_is_small6 = load i8, i8* %_is_small_ptr6
   %_is_small_bool6 = trunc i8 %_is_small6 to i1
   br i1 %_is_small_bool6, label %_small_label6, label %_large_label6
   _small_label6:
   %_small_null_ptr6 = getelementptr %struct.TD, %struct.TD* %_td6, i32 0, i32 17
   %_small_null6 = load i64, i64* %_small_null_ptr6
   br label %_join_small_and_large6
   _large_label6:
   %_high_and_low_bits6 = and i64 %_source6, or (i64 shl (i64 1, i64 63), i64 1)
   %_is_special_bit6 = icmp eq i64 %_high_and_low_bits6, or (i64 shl (i64 1, i64 63), i64 1)
   br i1 %_is_special_bit6, label %_is_special_label6, label %_not_special_label6
   _is_special_label6:
   %_spcl_rgn_times2_6 = and i64 %_source6, 4294967295
   br label %_last_large_label6
   _not_special_label6:
   %_header_ptr6 = inttoptr i64 %_source6 to i64*
   %_hdr_of_src6 = load i64, i64* %_header_ptr6
   %_region_bits6 = and i64 %_hdr_of_src6, 4294901760
   %_normal_rgn_times2_6 = lshr i64 %_region_bits6, 15
   br label %_last_large_label6
   _last_large_label6:
   %_rgn_times2_6 = phi i64 [%_spcl_rgn_times2_6, %_is_special_label6], [%_normal_rgn_times2_6, %_not_special_label6]
   %_large_null6 = or i64 -144115188075855871, %_rgn_times2_6
   br label %_join_small_and_large6
   _join_small_and_large6:
   %_null6 = phi i64 [%_small_null6, %_small_label6],[%_large_null6, %_last_large_label6]
   %_loc_9 = bitcast i64 %_null6 to i64

   ; #Call_Op at 53:28
   ; inlining call on "[]"
   store i64 %_loc_9, i64* %_output.I7
   %_cur_td7 = bitcast i64* %_Static_Link to %struct.TD*
   %_nested_types_arr_ptr7 = getelementptr %struct.TD, %struct.TD* %_cur_td7, i32 0, i32 35
   %_nested_types_arr7 = load %struct.TD**, %struct.TD*** %_nested_types_arr_ptr7
   %_nested_td_ptr_ptr7 = getelementptr %struct.TD*, %struct.TD** %_nested_types_arr7, i32 2
   %_nested_td7 = load %struct.TD*, %struct.TD** %_nested_td_ptr_ptr7
   %_call7_Static_Link = bitcast %struct.TD* %_nested_td7 to i64*

   ; #Declare_Obj_Op at 67:16

   ; #Store_Null_Of_Same_Stg_Rgn_Op at 67:25
   %_cur_td.I7.2 = bitcast i64* %_call7_Static_Link to %struct.TD*
   %_nested_types_arr_ptr.I7.2 = getelementptr %struct.TD, %struct.TD* %_cur_td.I7.2, i32 0, i32 35
   %_nested_types_arr.I7.2 = load %struct.TD**, %struct.TD*** %_nested_types_arr_ptr.I7.2
   %_nested_td_ptr_ptr.I7.2 = getelementptr %struct.TD*, %struct.TD** %_nested_types_arr.I7.2, i32 2
   %_nested_td.I7.2 = load %struct.TD*, %struct.TD** %_nested_td_ptr_ptr.I7.2
   %_desc.I7.2 = bitcast %struct.TD* %_nested_td.I7.2 to i64*
   %_source_ptr.I7.2 = bitcast i64* %_output.I7 to i64*
   %_source.I7.2 = load i64, i64* %_source_ptr.I7.2
   %_td.I7.2 = bitcast i64* %_desc.I7.2 to %struct.TD*
   %_is_small_ptr.I7.2 = getelementptr %struct.TD, %struct.TD* %_td.I7.2, i32 0, i32 13
   %_is_small.I7.2 = load i8, i8* %_is_small_ptr.I7.2
   %_is_small_bool.I7.2 = trunc i8 %_is_small.I7.2 to i1
   br i1 %_is_small_bool.I7.2, label %_small_label.I7.2, label %_large_label.I7.2
   _small_label.I7.2:
   %_small_null_ptr.I7.2 = getelementptr %struct.TD, %struct.TD* %_td.I7.2, i32 0, i32 17
   %_small_null.I7.2 = load i64, i64* %_small_null_ptr.I7.2
   br label %_join_small_and_large.I7.2
   _large_label.I7.2:
   %_high_and_low_bits.I7.2 = and i64 %_source.I7.2, or (i64 shl (i64 1, i64 63), i64 1)
   %_is_special_bit.I7.2 = icmp eq i64 %_high_and_low_bits.I7.2, or (i64 shl (i64 1, i64 63), i64 1)
   br i1 %_is_special_bit.I7.2, label %_is_special_label.I7.2, label %_not_special_label.I7.2
   _is_special_label.I7.2:
   %_spcl_rgn_times2_.I7.2 = and i64 %_source.I7.2, 4294967295
   br label %_last_large_label.I7.2
   _not_special_label.I7.2:
   %_header_ptr.I7.2 = inttoptr i64 %_source.I7.2 to i64*
   %_hdr_of_src.I7.2 = load i64, i64* %_header_ptr.I7.2
   %_region_bits.I7.2 = and i64 %_hdr_of_src.I7.2, 4294901760
   %_normal_rgn_times2_.I7.2 = lshr i64 %_region_bits.I7.2, 15
   br label %_last_large_label.I7.2
   _last_large_label.I7.2:
   %_rgn_times2_.I7.2 = phi i64 [%_spcl_rgn_times2_.I7.2, %_is_special_label.I7.2], [%_normal_rgn_times2_.I7.2, %_not_special_label.I7.2]
   %_large_null.I7.2 = or i64 -144115188075855871, %_rgn_times2_.I7.2
   br label %_join_small_and_large.I7.2
   _join_small_and_large.I7.2:
   %_null.I7.2 = phi i64 [%_small_null.I7.2, %_small_label.I7.2],[%_large_null.I7.2, %_last_large_label.I7.2]
   %_loc_.I7_3 = bitcast i64 %_null.I7.2 to i64

   ; #Call_Op at 67:25
   %_cur_td.I7.3 = bitcast i64* %_call7_Static_Link to %struct.TD*
   %_nested_types_arr_ptr.I7.3 = getelementptr %struct.TD, %struct.TD* %_cur_td.I7.3, i32 0, i32 35
   %_nested_types_arr.I7.3 = load %struct.TD**, %struct.TD*** %_nested_types_arr_ptr.I7.3
   %_nested_td_ptr_ptr.I7.3 = getelementptr %struct.TD*, %struct.TD** %_nested_types_arr.I7.3, i32 2
   %_nested_td.I7.3 = load %struct.TD*, %struct.TD** %_nested_td_ptr_ptr.I7.3
   %_call.I7.3_Static_Link = bitcast %struct.TD* %_nested_td.I7.3 to i64*
   %_new_result.I7.3_0 = call i64 @"PSL.Containers.Basic_Map.$[]$"(i64* %_Context, i64* %_call.I7.3_Static_Link, i64 %_loc_.I7_3)
   %_result_addr.I7.3_0 = bitcast i64* %_loc_.I7_2 to i64* 
   store i64 %_new_result.I7.3_0, i64* %_result_addr.I7.3_0

   ; #Copy_Word_Op at 67:16
   %_source.I7.4 = bitcast i64* %_loc_.I7_2 to i64* 
   %_source_val.I7.4 = load i64, i64* %_source.I7.4
   %_loc_.I7_1 = bitcast i64 %_source_val.I7.4 to i64

   ; #Copy_Word_Op at 67:9
   %_source_val.I7.5 = bitcast i64 %_loc_.I7_1 to i64
   %_dest.I7.5 = bitcast i64* %_output.I7 to i64*
   store i64 %_source_val.I7.5, i64* %_dest.I7.5

   ; #Check_Not_Null_Op at 67:9
   %_arg_ptr.I7.6 = bitcast i64* %_output.I7 to i64*
   %_arg.I7.6 = load i64, i64* %_arg_ptr.I7.6
   %_val_no_reg.I7.6 = and i64 %_arg.I7.6, -4294967295
   %_is_null.I7.6 = icmp eq i64 %_val_no_reg.I7.6, -144115188075855871
   br i1 %_is_null.I7.6, label %_fail.I7.6, label %_lbl.I7_7
   _fail.I7.6:
   %_str_ptr_ptr.I7.6 = load i64*, i64** @$Strings
   %_str_ptr.I7.6 = getelementptr i64, i64* %_str_ptr_ptr.I7.6, i64 5
   %_assert_str.I7.6 = load i64, i64* %_str_ptr.I7.6
   store i64 %_assert_str.I7.6, i64* %_print_param.I7.6
   call void @_psc_runtime_message(i64* %_Context, i64* %_print_param.I7.6, i64* null)

   br label %_lbl.I7_7

_lbl.I7_7:
   ; #Return_Op at 67:9

   %_new_result7 = load i64, i64* %_output.I7
   %_loc_8 = bitcast i64 %_new_result7 to i64

   ; #Copy_Word_Op at 53:28
   %_source_val8 = bitcast i64 %_loc_8 to i64
   %_reg8_2 = inttoptr i64 %_loc_7 to i64*
   %_dest8 = getelementptr i64, i64* %_reg8_2, i64 1
   store i64 %_source_val8, i64* %_dest8

   ; #Wait_For_Parallel_Op at 53:43
   %_master9 = bitcast i64* %_Master to i64*
   %_level_skip9 = call i32 @_psc_execute_wait_for_parallel_op(i64* %_Context, i64* %_master9)
   %_level_diff32_9 = ashr i32 %_level_skip9, 16
   %_level_diff9 = trunc i32 %_level_diff32_9 to i16
   %_skip_count9 = trunc i32 %_level_skip9 to i16
   %_level_diff_nz9 = icmp ne i16 %_level_diff9, 0
   br i1 %_level_diff_nz9, label %_exit9, label %_switch9
   _exit9:
   call void @_psc_finalize_stg_rgn(i64* %_Context, i64* %_Local_Area)
   %_result_reg9 = load i64, i64* %_Param_Area
   ret i64 %_result_reg9
   _switch9:
   br label %_lbl10

_lbl10:
   ; #Copy_Word_Op at 53:43
   %_source10 = getelementptr i64, i64* %_loc_2, i64 11
   %_source_val10 = load i64, i64* %_source10
   %_loc_10 = bitcast i64 %_source_val10 to i64

   ; #Copy_Word_Op at 53:43
   %_source_val11 = bitcast i64 %_loc_10 to i64
   %_reg11_2 = inttoptr i64 %_loc_7 to i64*
   %_dest11 = getelementptr i64, i64* %_reg11_2, i64 2
   store i64 %_source_val11, i64* %_dest11

   ; #Copy_Word_Op at 53:61
   %_source12 = getelementptr i64, i64* %_loc_4, i64 11
   %_source_val12 = load i64, i64* %_source12
   %_loc_11 = bitcast i64 %_source_val12 to i64

   ; #Copy_Word_Op at 53:61
   %_source_val13 = bitcast i64 %_loc_11 to i64
   %_reg13_2 = inttoptr i64 %_loc_7 to i64*
   %_dest13 = getelementptr i64, i64* %_reg13_2, i64 3
   store i64 %_source_val13, i64* %_dest13

   ; #Copy_Word_Op at 53:16
   %_source14 = bitcast i64* %_loc_6 to i64* 
   %_source_val14 = load i64, i64* %_source14
   %_loc_1 = bitcast i64 %_source_val14 to i64

   ; #Copy_Word_Op at 53:9
   %_source_val15 = bitcast i64 %_loc_1 to i64
   %_dest15 = getelementptr i64, i64* %_Param_Area, i64 0
   store i64 %_source_val15, i64* %_dest15

   ; #Check_Not_Null_Op at 53:9
   %_arg_ptr16 = getelementptr i64, i64* %_Param_Area, i64 0
   %_arg16 = load i64, i64* %_arg_ptr16
   %_val_no_reg16 = and i64 %_arg16, -4294967295
   %_is_null16 = icmp eq i64 %_val_no_reg16, -144115188075855871
   br i1 %_is_null16, label %_fail16, label %_lbl17
   _fail16:
   %_str_ptr_ptr16 = load i64*, i64** @$Strings
   %_str_ptr16 = getelementptr i64, i64* %_str_ptr_ptr16, i64 6
   %_assert_str16 = load i64, i64* %_str_ptr16
   store i64 %_assert_str16, i64* %_print_param16
   call void @_psc_runtime_message(i64* %_Context, i64* %_print_param16, i64* null)

   br label %_lbl17

_lbl17:
   ; #Return_Op at 53:9
   call void @_psc_finalize_stg_rgn(i64* %_Context, i64* %_Local_Area)
   %_result_reg17 = load i64, i64* %_Param_Area
   ret i64 %_result_reg17

   ; #Begin_Nested_Block_Op at 53:43
}

define internal i32 @"PSL.Containers.Two_Way_Map.$[]$.17block"(i64* %_Context, i64* %_Param_Area, i64* %_Static_Link) {
   %_Local_Area = alloca i64, i64 4
   %_sl = ptrtoint i64* %_Static_Link to i64
   %_pa = ptrtoint i64* %_Param_Area to i64
   %_store_pa = getelementptr i64, i64* %_Local_Area, i64 1
   store i64 %_pa, i64* %_store_pa
   store i64 %_sl, i64* %_Local_Area

   %_output.I20 = alloca i64
   %_loc_.I20_2 = alloca i64
   %_print_param.I20.6 = alloca i64

   ; #Store_Null_Of_Same_Stg_Rgn_Op at 53:43
   %_ptr_val0_19 = load i64, i64* %_Static_Link
   %_ptr0_19 = inttoptr i64 %_ptr_val0_19 to i64*
   %_cur_td19 = bitcast i64* %_ptr0_19 to %struct.TD*
   %_nested_types_arr_ptr19 = getelementptr %struct.TD, %struct.TD* %_cur_td19, i32 0, i32 35
   %_nested_types_arr19 = load %struct.TD**, %struct.TD*** %_nested_types_arr_ptr19
   %_nested_td_ptr_ptr19 = getelementptr %struct.TD*, %struct.TD** %_nested_types_arr19, i32 5
   %_nested_td19 = load %struct.TD*, %struct.TD** %_nested_td_ptr_ptr19
   %_desc19 = bitcast %struct.TD* %_nested_td19 to i64*
   %_encl_param_ptr19_1 = getelementptr i64, i64* %_Static_Link, i64 1
   %_encl_param19_1 = load i64, i64* %_encl_param_ptr19_1
   %_encl_param_as_ptr19_1 = inttoptr i64 %_encl_param19_1 to i64*
   %_source_ptr19 = getelementptr i64, i64* %_encl_param_as_ptr19_1, i64 0
   %_source19 = load i64, i64* %_source_ptr19
   %_td19 = bitcast i64* %_desc19 to %struct.TD*
   %_is_small_ptr19 = getelementptr %struct.TD, %struct.TD* %_td19, i32 0, i32 13
   %_is_small19 = load i8, i8* %_is_small_ptr19
   %_is_small_bool19 = trunc i8 %_is_small19 to i1
   br i1 %_is_small_bool19, label %_small_label19, label %_large_label19
   _small_label19:
   %_small_null_ptr19 = getelementptr %struct.TD, %struct.TD* %_td19, i32 0, i32 17
   %_small_null19 = load i64, i64* %_small_null_ptr19
   br label %_join_small_and_large19
   _large_label19:
   %_high_and_low_bits19 = and i64 %_source19, or (i64 shl (i64 1, i64 63), i64 1)
   %_is_special_bit19 = icmp eq i64 %_high_and_low_bits19, or (i64 shl (i64 1, i64 63), i64 1)
   br i1 %_is_special_bit19, label %_is_special_label19, label %_not_special_label19
   _is_special_label19:
   %_spcl_rgn_times2_19 = and i64 %_source19, 4294967295
   br label %_last_large_label19
   _not_special_label19:
   %_header_ptr19 = inttoptr i64 %_source19 to i64*
   %_hdr_of_src19 = load i64, i64* %_header_ptr19
   %_region_bits19 = and i64 %_hdr_of_src19, 4294901760
   %_normal_rgn_times2_19 = lshr i64 %_region_bits19, 15
   br label %_last_large_label19
   _last_large_label19:
   %_rgn_times2_19 = phi i64 [%_spcl_rgn_times2_19, %_is_special_label19], [%_normal_rgn_times2_19, %_not_special_label19]
   %_large_null19 = or i64 -144115188075855871, %_rgn_times2_19
   br label %_join_small_and_large19
   _join_small_and_large19:
   %_null19 = phi i64 [%_small_null19, %_small_label19],[%_large_null19, %_last_large_label19]
   %_loc_2 = bitcast i64 %_null19 to i64

   ; #Call_Op at 53:43
   ; inlining call on "[]"
   store i64 %_loc_2, i64* %_output.I20
   %_ptr_val0_20 = load i64, i64* %_Static_Link
   %_ptr0_20 = inttoptr i64 %_ptr_val0_20 to i64*
   %_cur_td20 = bitcast i64* %_ptr0_20 to %struct.TD*
   %_nested_types_arr_ptr20 = getelementptr %struct.TD, %struct.TD* %_cur_td20, i32 0, i32 35
   %_nested_types_arr20 = load %struct.TD**, %struct.TD*** %_nested_types_arr_ptr20
   %_nested_td_ptr_ptr20 = getelementptr %struct.TD*, %struct.TD** %_nested_types_arr20, i32 5
   %_nested_td20 = load %struct.TD*, %struct.TD** %_nested_td_ptr_ptr20
   %_call20_Static_Link = bitcast %struct.TD* %_nested_td20 to i64*

   ; #Declare_Obj_Op at 67:16

   ; #Store_Null_Of_Same_Stg_Rgn_Op at 67:25
   %_cur_td.I20.2 = bitcast i64* %_call20_Static_Link to %struct.TD*
   %_nested_types_arr_ptr.I20.2 = getelementptr %struct.TD, %struct.TD* %_cur_td.I20.2, i32 0, i32 35
   %_nested_types_arr.I20.2 = load %struct.TD**, %struct.TD*** %_nested_types_arr_ptr.I20.2
   %_nested_td_ptr_ptr.I20.2 = getelementptr %struct.TD*, %struct.TD** %_nested_types_arr.I20.2, i32 2
   %_nested_td.I20.2 = load %struct.TD*, %struct.TD** %_nested_td_ptr_ptr.I20.2
   %_desc.I20.2 = bitcast %struct.TD* %_nested_td.I20.2 to i64*
   %_source_ptr.I20.2 = bitcast i64* %_output.I20 to i64*
   %_source.I20.2 = load i64, i64* %_source_ptr.I20.2
   %_td.I20.2 = bitcast i64* %_desc.I20.2 to %struct.TD*
   %_is_small_ptr.I20.2 = getelementptr %struct.TD, %struct.TD* %_td.I20.2, i32 0, i32 13
   %_is_small.I20.2 = load i8, i8* %_is_small_ptr.I20.2
   %_is_small_bool.I20.2 = trunc i8 %_is_small.I20.2 to i1
   br i1 %_is_small_bool.I20.2, label %_small_label.I20.2, label %_large_label.I20.2
   _small_label.I20.2:
   %_small_null_ptr.I20.2 = getelementptr %struct.TD, %struct.TD* %_td.I20.2, i32 0, i32 17
   %_small_null.I20.2 = load i64, i64* %_small_null_ptr.I20.2
   br label %_join_small_and_large.I20.2
   _large_label.I20.2:
   %_high_and_low_bits.I20.2 = and i64 %_source.I20.2, or (i64 shl (i64 1, i64 63), i64 1)
   %_is_special_bit.I20.2 = icmp eq i64 %_high_and_low_bits.I20.2, or (i64 shl (i64 1, i64 63), i64 1)
   br i1 %_is_special_bit.I20.2, label %_is_special_label.I20.2, label %_not_special_label.I20.2
   _is_special_label.I20.2:
   %_spcl_rgn_times2_.I20.2 = and i64 %_source.I20.2, 4294967295
   br label %_last_large_label.I20.2
   _not_special_label.I20.2:
   %_header_ptr.I20.2 = inttoptr i64 %_source.I20.2 to i64*
   %_hdr_of_src.I20.2 = load i64, i64* %_header_ptr.I20.2
   %_region_bits.I20.2 = and i64 %_hdr_of_src.I20.2, 4294901760
   %_normal_rgn_times2_.I20.2 = lshr i64 %_region_bits.I20.2, 15
   br label %_last_large_label.I20.2
   _last_large_label.I20.2:
   %_rgn_times2_.I20.2 = phi i64 [%_spcl_rgn_times2_.I20.2, %_is_special_label.I20.2], [%_normal_rgn_times2_.I20.2, %_not_special_label.I20.2]
   %_large_null.I20.2 = or i64 -144115188075855871, %_rgn_times2_.I20.2
   br label %_join_small_and_large.I20.2
   _join_small_and_large.I20.2:
   %_null.I20.2 = phi i64 [%_small_null.I20.2, %_small_label.I20.2],[%_large_null.I20.2, %_last_large_label.I20.2]
   %_loc_.I20_3 = bitcast i64 %_null.I20.2 to i64

   ; #Call_Op at 67:25
   %_cur_td.I20.3 = bitcast i64* %_call20_Static_Link to %struct.TD*
   %_nested_types_arr_ptr.I20.3 = getelementptr %struct.TD, %struct.TD* %_cur_td.I20.3, i32 0, i32 35
   %_nested_types_arr.I20.3 = load %struct.TD**, %struct.TD*** %_nested_types_arr_ptr.I20.3
   %_nested_td_ptr_ptr.I20.3 = getelementptr %struct.TD*, %struct.TD** %_nested_types_arr.I20.3, i32 2
   %_nested_td.I20.3 = load %struct.TD*, %struct.TD** %_nested_td_ptr_ptr.I20.3
   %_call.I20.3_Static_Link = bitcast %struct.TD* %_nested_td.I20.3 to i64*
   %_new_result.I20.3_0 = call i64 @"PSL.Containers.Basic_Map.$[]$"(i64* %_Context, i64* %_call.I20.3_Static_Link, i64 %_loc_.I20_3)
   %_result_addr.I20.3_0 = bitcast i64* %_loc_.I20_2 to i64* 
   store i64 %_new_result.I20.3_0, i64* %_result_addr.I20.3_0

   ; #Copy_Word_Op at 67:16
   %_source.I20.4 = bitcast i64* %_loc_.I20_2 to i64* 
   %_source_val.I20.4 = load i64, i64* %_source.I20.4
   %_loc_.I20_1 = bitcast i64 %_source_val.I20.4 to i64

   ; #Copy_Word_Op at 67:9
   %_source_val.I20.5 = bitcast i64 %_loc_.I20_1 to i64
   %_dest.I20.5 = bitcast i64* %_output.I20 to i64*
   store i64 %_source_val.I20.5, i64* %_dest.I20.5

   ; #Check_Not_Null_Op at 67:9
   %_arg_ptr.I20.6 = bitcast i64* %_output.I20 to i64*
   %_arg.I20.6 = load i64, i64* %_arg_ptr.I20.6
   %_val_no_reg.I20.6 = and i64 %_arg.I20.6, -4294967295
   %_is_null.I20.6 = icmp eq i64 %_val_no_reg.I20.6, -144115188075855871
   br i1 %_is_null.I20.6, label %_fail.I20.6, label %_lbl.I20_7
   _fail.I20.6:
   %_str_ptr_ptr.I20.6 = load i64*, i64** @$Strings
   %_str_ptr.I20.6 = getelementptr i64, i64* %_str_ptr_ptr.I20.6, i64 5
   %_assert_str.I20.6 = load i64, i64* %_str_ptr.I20.6
   store i64 %_assert_str.I20.6, i64* %_print_param.I20.6
   call void @_psc_runtime_message(i64* %_Context, i64* %_print_param.I20.6, i64* null)

   br label %_lbl.I20_7

_lbl.I20_7:
   ; #Return_Op at 67:9

   %_new_result20 = load i64, i64* %_output.I20
   %_loc_1 = bitcast i64 %_new_result20 to i64

   ; #Copy_Word_Op at 53:43
   %_source_val21 = bitcast i64 %_loc_1 to i64
   %_dest21 = getelementptr i64, i64* %_Param_Area, i64 0
   store i64 %_source_val21, i64* %_dest21

   ; #Exit_Op at 0:0
   ret i32 0

   ; #Begin_Nested_Block_Op at 53:61
}

define internal i32 @"PSL.Containers.Two_Way_Map.$[]$.22block"(i64* %_Context, i64* %_Param_Area, i64* %_Static_Link) {
   %_Local_Area = alloca i64, i64 4
   %_sl = ptrtoint i64* %_Static_Link to i64
   %_pa = ptrtoint i64* %_Param_Area to i64
   %_store_pa = getelementptr i64, i64* %_Local_Area, i64 1
   store i64 %_pa, i64* %_store_pa
   store i64 %_sl, i64* %_Local_Area

   %_output.I25 = alloca i64
   %_loc_.I25_2 = alloca i64
   %_print_param.I25.6 = alloca i64

   ; #Store_Null_Of_Same_Stg_Rgn_Op at 53:61
   %_ptr_val0_24 = load i64, i64* %_Static_Link
   %_ptr0_24 = inttoptr i64 %_ptr_val0_24 to i64*
   %_cur_td24 = bitcast i64* %_ptr0_24 to %struct.TD*
   %_nested_types_arr_ptr24 = getelementptr %struct.TD, %struct.TD* %_cur_td24, i32 0, i32 35
   %_nested_types_arr24 = load %struct.TD**, %struct.TD*** %_nested_types_arr_ptr24
   %_nested_td_ptr_ptr24 = getelementptr %struct.TD*, %struct.TD** %_nested_types_arr24, i32 4
   %_nested_td24 = load %struct.TD*, %struct.TD** %_nested_td_ptr_ptr24
   %_desc24 = bitcast %struct.TD* %_nested_td24 to i64*
   %_encl_param_ptr24_1 = getelementptr i64, i64* %_Static_Link, i64 1
   %_encl_param24_1 = load i64, i64* %_encl_param_ptr24_1
   %_encl_param_as_ptr24_1 = inttoptr i64 %_encl_param24_1 to i64*
   %_source_ptr24 = getelementptr i64, i64* %_encl_param_as_ptr24_1, i64 0
   %_source24 = load i64, i64* %_source_ptr24
   %_td24 = bitcast i64* %_desc24 to %struct.TD*
   %_is_small_ptr24 = getelementptr %struct.TD, %struct.TD* %_td24, i32 0, i32 13
   %_is_small24 = load i8, i8* %_is_small_ptr24
   %_is_small_bool24 = trunc i8 %_is_small24 to i1
   br i1 %_is_small_bool24, label %_small_label24, label %_large_label24
   _small_label24:
   %_small_null_ptr24 = getelementptr %struct.TD, %struct.TD* %_td24, i32 0, i32 17
   %_small_null24 = load i64, i64* %_small_null_ptr24
   br label %_join_small_and_large24
   _large_label24:
   %_high_and_low_bits24 = and i64 %_source24, or (i64 shl (i64 1, i64 63), i64 1)
   %_is_special_bit24 = icmp eq i64 %_high_and_low_bits24, or (i64 shl (i64 1, i64 63), i64 1)
   br i1 %_is_special_bit24, label %_is_special_label24, label %_not_special_label24
   _is_special_label24:
   %_spcl_rgn_times2_24 = and i64 %_source24, 4294967295
   br label %_last_large_label24
   _not_special_label24:
   %_header_ptr24 = inttoptr i64 %_source24 to i64*
   %_hdr_of_src24 = load i64, i64* %_header_ptr24
   %_region_bits24 = and i64 %_hdr_of_src24, 4294901760
   %_normal_rgn_times2_24 = lshr i64 %_region_bits24, 15
   br label %_last_large_label24
   _last_large_label24:
   %_rgn_times2_24 = phi i64 [%_spcl_rgn_times2_24, %_is_special_label24], [%_normal_rgn_times2_24, %_not_special_label24]
   %_large_null24 = or i64 -144115188075855871, %_rgn_times2_24
   br label %_join_small_and_large24
   _join_small_and_large24:
   %_null24 = phi i64 [%_small_null24, %_small_label24],[%_large_null24, %_last_large_label24]
   %_loc_2 = bitcast i64 %_null24 to i64

   ; #Call_Op at 53:61
   ; inlining call on "[]"
   store i64 %_loc_2, i64* %_output.I25
   %_ptr_val0_25 = load i64, i64* %_Static_Link
   %_ptr0_25 = inttoptr i64 %_ptr_val0_25 to i64*
   %_cur_td25 = bitcast i64* %_ptr0_25 to %struct.TD*
   %_nested_types_arr_ptr25 = getelementptr %struct.TD, %struct.TD* %_cur_td25, i32 0, i32 35
   %_nested_types_arr25 = load %struct.TD**, %struct.TD*** %_nested_types_arr_ptr25
   %_nested_td_ptr_ptr25 = getelementptr %struct.TD*, %struct.TD** %_nested_types_arr25, i32 4
   %_nested_td25 = load %struct.TD*, %struct.TD** %_nested_td_ptr_ptr25
   %_call25_Static_Link = bitcast %struct.TD* %_nested_td25 to i64*

   ; #Declare_Obj_Op at 46:16

   ; #Store_Null_Of_Same_Stg_Rgn_Op at 46:25
   %_cur_td.I25.2 = bitcast i64* %_call25_Static_Link to %struct.TD*
   %_nested_types_arr_ptr.I25.2 = getelementptr %struct.TD, %struct.TD* %_cur_td.I25.2, i32 0, i32 35
   %_nested_types_arr.I25.2 = load %struct.TD**, %struct.TD*** %_nested_types_arr_ptr.I25.2
   %_nested_td_ptr_ptr.I25.2 = getelementptr %struct.TD*, %struct.TD** %_nested_types_arr.I25.2, i32 1
   %_nested_td.I25.2 = load %struct.TD*, %struct.TD** %_nested_td_ptr_ptr.I25.2
   %_desc.I25.2 = bitcast %struct.TD* %_nested_td.I25.2 to i64*
   %_source_ptr.I25.2 = bitcast i64* %_output.I25 to i64*
   %_source.I25.2 = load i64, i64* %_source_ptr.I25.2
   %_td.I25.2 = bitcast i64* %_desc.I25.2 to %struct.TD*
   %_is_small_ptr.I25.2 = getelementptr %struct.TD, %struct.TD* %_td.I25.2, i32 0, i32 13
   %_is_small.I25.2 = load i8, i8* %_is_small_ptr.I25.2
   %_is_small_bool.I25.2 = trunc i8 %_is_small.I25.2 to i1
   br i1 %_is_small_bool.I25.2, label %_small_label.I25.2, label %_large_label.I25.2
   _small_label.I25.2:
   %_small_null_ptr.I25.2 = getelementptr %struct.TD, %struct.TD* %_td.I25.2, i32 0, i32 17
   %_small_null.I25.2 = load i64, i64* %_small_null_ptr.I25.2
   br label %_join_small_and_large.I25.2
   _large_label.I25.2:
   %_high_and_low_bits.I25.2 = and i64 %_source.I25.2, or (i64 shl (i64 1, i64 63), i64 1)
   %_is_special_bit.I25.2 = icmp eq i64 %_high_and_low_bits.I25.2, or (i64 shl (i64 1, i64 63), i64 1)
   br i1 %_is_special_bit.I25.2, label %_is_special_label.I25.2, label %_not_special_label.I25.2
   _is_special_label.I25.2:
   %_spcl_rgn_times2_.I25.2 = and i64 %_source.I25.2, 4294967295
   br label %_last_large_label.I25.2
   _not_special_label.I25.2:
   %_header_ptr.I25.2 = inttoptr i64 %_source.I25.2 to i64*
   %_hdr_of_src.I25.2 = load i64, i64* %_header_ptr.I25.2
   %_region_bits.I25.2 = and i64 %_hdr_of_src.I25.2, 4294901760
   %_normal_rgn_times2_.I25.2 = lshr i64 %_region_bits.I25.2, 15
   br label %_last_large_label.I25.2
   _last_large_label.I25.2:
   %_rgn_times2_.I25.2 = phi i64 [%_spcl_rgn_times2_.I25.2, %_is_special_label.I25.2], [%_normal_rgn_times2_.I25.2, %_not_special_label.I25.2]
   %_large_null.I25.2 = or i64 -144115188075855871, %_rgn_times2_.I25.2
   br label %_join_small_and_large.I25.2
   _join_small_and_large.I25.2:
   %_null.I25.2 = phi i64 [%_small_null.I25.2, %_small_label.I25.2],[%_large_null.I25.2, %_last_large_label.I25.2]
   %_loc_.I25_3 = bitcast i64 %_null.I25.2 to i64

   ; #Call_Op at 46:25
   %_cur_td.I25.3 = bitcast i64* %_call25_Static_Link to %struct.TD*
   %_nested_types_arr_ptr.I25.3 = getelementptr %struct.TD, %struct.TD* %_cur_td.I25.3, i32 0, i32 35
   %_nested_types_arr.I25.3 = load %struct.TD**, %struct.TD*** %_nested_types_arr_ptr.I25.3
   %_nested_td_ptr_ptr.I25.3 = getelementptr %struct.TD*, %struct.TD** %_nested_types_arr.I25.3, i32 1
   %_nested_td.I25.3 = load %struct.TD*, %struct.TD** %_nested_td_ptr_ptr.I25.3
   %_call.I25.3_Static_Link = bitcast %struct.TD* %_nested_td.I25.3 to i64*
   %_new_result.I25.3_0 = call i64 @"PSL.Containers.Basic_Map.$[]$"(i64* %_Context, i64* %_call.I25.3_Static_Link, i64 %_loc_.I25_3)
   %_result_addr.I25.3_0 = bitcast i64* %_loc_.I25_2 to i64* 
   store i64 %_new_result.I25.3_0, i64* %_result_addr.I25.3_0

   ; #Copy_Word_Op at 46:16
   %_source.I25.4 = bitcast i64* %_loc_.I25_2 to i64* 
   %_source_val.I25.4 = load i64, i64* %_source.I25.4
   %_loc_.I25_1 = bitcast i64 %_source_val.I25.4 to i64

   ; #Copy_Word_Op at 46:9
   %_source_val.I25.5 = bitcast i64 %_loc_.I25_1 to i64
   %_dest.I25.5 = bitcast i64* %_output.I25 to i64*
   store i64 %_source_val.I25.5, i64* %_dest.I25.5

   ; #Check_Not_Null_Op at 46:9
   %_arg_ptr.I25.6 = bitcast i64* %_output.I25 to i64*
   %_arg.I25.6 = load i64, i64* %_arg_ptr.I25.6
   %_val_no_reg.I25.6 = and i64 %_arg.I25.6, -4294967295
   %_is_null.I25.6 = icmp eq i64 %_val_no_reg.I25.6, -144115188075855871
   br i1 %_is_null.I25.6, label %_fail.I25.6, label %_lbl.I25_7
   _fail.I25.6:
   %_str_ptr_ptr.I25.6 = load i64*, i64** @$Strings
   %_str_ptr.I25.6 = getelementptr i64, i64* %_str_ptr_ptr.I25.6, i64 7
   %_assert_str.I25.6 = load i64, i64* %_str_ptr.I25.6
   store i64 %_assert_str.I25.6, i64* %_print_param.I25.6
   call void @_psc_runtime_message(i64* %_Context, i64* %_print_param.I25.6, i64* null)

   br label %_lbl.I25_7

_lbl.I25_7:
   ; #Return_Op at 46:9

   %_new_result25 = load i64, i64* %_output.I25
   %_loc_1 = bitcast i64 %_new_result25 to i64

   ; #Copy_Word_Op at 53:61
   %_source_val26 = bitcast i64 %_loc_1 to i64
   %_dest26 = getelementptr i64, i64* %_Param_Area, i64 0
   store i64 %_source_val26, i64* %_dest26

   ; #Exit_Op at 0:0
   ret i32 0

}

define void @"PSL.Containers.Two_Way_Map.$|=$"(i64* %_formal_param_0, i64 %_formal_param_1, i64* %_Context, i64* %_Static_Link) {
   %_Local_Area = alloca i64, i64 4
   %_sl = ptrtoint i64* %_Static_Link to i64
   store i64 %_sl, i64* %_Local_Area
   call void @_psc_initialize_stg_rgn(i64* %_Context, i64* %_Local_Area)
   %_Master = alloca i64, i64 3
   %_ms = ptrtoint i64* %_Master to i64
   %_store_ms = getelementptr i64, i64* %_Local_Area, i64 3
   store i64 %_ms, i64* %_store_ms

   %_loc_11 = alloca i64
   %_output.I14 = alloca i64
   %_loc_.I14_2 = alloca i64
   %_print_param.I14.10 = alloca i64
   %_output.I18 = alloca i64

   
   ; #Copy_Address_Op at 59:25
   %_source_val1 = bitcast i64* %_formal_param_0 to i64*
   %_loc_2 = bitcast i64* %_source_val1 to i64*

   ; #Store_Address_Op at 59:9
   %_reg2_1 = bitcast i64* %_loc_2 to i64*
   %_addr2 = getelementptr i64, i64* %_reg2_1, i64 0
   %_loc_1 = bitcast i64* %_addr2 to i64*

   ; #Call_Op at 59:9
   %_call3_Static_Link = getelementptr i64, i64* %_Static_Link, i64 0
   call void @"PSL.Containers.Two_Way_Map.Add_Unreversed"(i64* %_loc_1, i64* %_Context, i64* %_call3_Static_Link)

   ; #Copy_Address_Op at 60:9
   %_source_val4 = bitcast i64* %_formal_param_0 to i64*
   %_loc_6 = bitcast i64* %_source_val4 to i64*

   ; #Copy_Word_Op at 60:9
   %_reg5_1 = bitcast i64* %_loc_6 to i64*
   %_source5 = getelementptr i64, i64* %_reg5_1, i64 0
   %_source_val5 = load i64, i64* %_source5
   %_loc_5 = bitcast i64 %_source_val5 to i64

   ; #Store_Address_Op at 60:14
   %_reg6_1 = inttoptr i64 %_loc_5 to i64*
   %_addr6 = getelementptr i64, i64* %_reg6_1, i64 1
   %_loc_3 = bitcast i64* %_addr6 to i64*

   ; #Copy_Word_Op at 60:25
   %_source_val7 = bitcast i64 %_formal_param_1 to i64
   %_loc_4 = bitcast i64 %_source_val7 to i64

   ; #Call_Op at 60:14
   ; inlining call on "|="
   %_cur_td8 = bitcast i64* %_Static_Link to %struct.TD*
   %_nested_types_arr_ptr8 = getelementptr %struct.TD, %struct.TD* %_cur_td8, i32 0, i32 35
   %_nested_types_arr8 = load %struct.TD**, %struct.TD*** %_nested_types_arr_ptr8
   %_nested_td_ptr_ptr8 = getelementptr %struct.TD*, %struct.TD** %_nested_types_arr8, i32 2
   %_nested_td8 = load %struct.TD*, %struct.TD** %_nested_td_ptr_ptr8
   %_call8_Static_Link = bitcast %struct.TD* %_nested_td8 to i64*

   ; #Copy_Address_Op at 80:9
   %_source_val.I8.1 = bitcast i64* %_loc_3 to i64*
   %_loc_.I8_3 = bitcast i64* %_source_val.I8.1 to i64*

   ; #Store_Address_Op at 80:14
   %_reg.I8.2_1 = bitcast i64* %_loc_.I8_3 to i64*
   %_addr.I8.2 = getelementptr i64, i64* %_reg.I8.2_1, i64 0
   %_loc_.I8_1 = bitcast i64* %_addr.I8.2 to i64*

   ; #Copy_Word_Op at 80:22
   %_source_val.I8.3 = bitcast i64 %_loc_4 to i64
   %_loc_.I8_2 = bitcast i64 %_source_val.I8.3 to i64

   ; #Call_Op at 80:14
   %_cur_td.I8.4 = bitcast i64* %_call8_Static_Link to %struct.TD*
   %_nested_types_arr_ptr.I8.4 = getelementptr %struct.TD, %struct.TD* %_cur_td.I8.4, i32 0, i32 35
   %_nested_types_arr.I8.4 = load %struct.TD**, %struct.TD*** %_nested_types_arr_ptr.I8.4
   %_nested_td_ptr_ptr.I8.4 = getelementptr %struct.TD*, %struct.TD** %_nested_types_arr.I8.4, i32 2
   %_nested_td.I8.4 = load %struct.TD*, %struct.TD** %_nested_td_ptr_ptr.I8.4
   %_call.I8.4_Static_Link = bitcast %struct.TD* %_nested_td.I8.4 to i64*
   call void @"PSL.Containers.Basic_Map.$|=$"(i64* %_loc_.I8_1, i64 %_loc_.I8_2, i64* %_Context, i64* %_call.I8.4_Static_Link)

   ; #Return_Op at 81:5


   ; #Copy_Address_Op at 61:9
   %_source_val9 = bitcast i64* %_formal_param_0 to i64*
   %_loc_10 = bitcast i64* %_source_val9 to i64*

   ; #Copy_Word_Op at 61:9
   %_reg10_1 = bitcast i64* %_loc_10 to i64*
   %_source10 = getelementptr i64, i64* %_reg10_1, i64 0
   %_source_val10 = load i64, i64* %_source10
   %_loc_9 = bitcast i64 %_source_val10 to i64

   ; #Store_Address_Op at 61:14
   %_reg11_1 = inttoptr i64 %_loc_9 to i64*
   %_addr11 = getelementptr i64, i64* %_reg11_1, i64 2
   %_loc_7 = bitcast i64* %_addr11 to i64*

   ; #Store_Local_Null_Op at 61:25
   %_cur_td12 = bitcast i64* %_Static_Link to %struct.TD*
   %_nested_types_arr_ptr12 = getelementptr %struct.TD, %struct.TD* %_cur_td12, i32 0, i32 35
   %_nested_types_arr12 = load %struct.TD**, %struct.TD*** %_nested_types_arr_ptr12
   %_nested_td_ptr_ptr12 = getelementptr %struct.TD*, %struct.TD** %_nested_types_arr12, i32 6
   %_nested_td12 = load %struct.TD*, %struct.TD** %_nested_td_ptr_ptr12
   %_desc12 = bitcast %struct.TD* %_nested_td12 to i64*
   %_td12 = bitcast i64* %_desc12 to %struct.TD*
   %_is_small_ptr12 = getelementptr %struct.TD, %struct.TD* %_td12, i32 0, i32 13
   %_is_small12 = load i8, i8* %_is_small_ptr12
   %_is_small_bool12 = trunc i8 %_is_small12 to i1
   %_small_null_ptr12 = getelementptr %struct.TD, %struct.TD* %_td12, i32 0, i32 17
   %_small_null12 = load i64, i64* %_small_null_ptr12
   %_ctx12 = bitcast i64* %_Context to %struct.ExecCtx*
   %_large_null_ptr12 = getelementptr %struct.ExecCtx, %struct.ExecCtx* %_ctx12, i32 0, i32 1
   %_large_null12 = load i64, i64* %_large_null_ptr12
   %_null12= select i1 %_is_small_bool12, i64 %_small_null12, i64 %_large_null12
   %_loc_12 = bitcast i64 %_null12 to i64

   ; #Declare_Obj_Op at 61:25

   ; #Call_Op at 61:25
   ; inlining call on "[]"
   store i64 %_loc_12, i64* %_output.I14
   %_cur_td14 = bitcast i64* %_Static_Link to %struct.TD*
   %_nested_types_arr_ptr14 = getelementptr %struct.TD, %struct.TD* %_cur_td14, i32 0, i32 35
   %_nested_types_arr14 = load %struct.TD**, %struct.TD*** %_nested_types_arr_ptr14
   %_nested_td_ptr_ptr14 = getelementptr %struct.TD*, %struct.TD** %_nested_types_arr14, i32 6
   %_nested_td14 = load %struct.TD*, %struct.TD** %_nested_td_ptr_ptr14
   %_call14_Static_Link = bitcast %struct.TD* %_nested_td14 to i64*

   ; #Declare_Obj_Op at 16:32

   ; #Create_Obj_Op at 16:32
   %_desc.I14.2 = getelementptr i64, i64* %_call14_Static_Link, i64 0
   %_src_addr.I14.2 = bitcast i64* %_output.I14 to i64*
   %_src.I14.2 = load i64, i64* %_src_addr.I14.2
   %_dest.I14.2 = call i64@_psc_new_object(i64* %_Context, i64* %_desc.I14.2, i64 %_src.I14.2)
   %_dest_addr.I14.2 = bitcast i64* %_loc_.I14_2 to i64* 
   store i64 %_dest.I14.2, i64* %_dest_addr.I14.2

   ; #Copy_Word_Op at 16:32
   %_source.I14.3 = bitcast i64* %_loc_.I14_2 to i64* 
   %_source_val.I14.3 = load i64, i64* %_source.I14.3
   %_loc_.I14_3 = bitcast i64 %_source_val.I14.3 to i64

   ; #Store_Null_Of_Same_Stg_Rgn_Op at 16:40
   %_cur_td.I14.4 = bitcast i64* %_call14_Static_Link to %struct.TD*
   %_param_arr_ptr.I14.4 = getelementptr %struct.TD, %struct.TD* %_cur_td.I14.4, i32 0, i32 26
   %_param_arr.I14.4 = load %struct.ParamInfo*, %struct.ParamInfo** %_param_arr_ptr.I14.4
   %_formal_td_ptr_ptr.I14.4 = getelementptr %struct.ParamInfo, %struct.ParamInfo* %_param_arr.I14.4, i32 0, i32 1, i32 0
   %_formal_td.I14.4 = load %struct.TD*, %struct.TD** %_formal_td_ptr_ptr.I14.4
   %_desc.I14.4 = bitcast %struct.TD* %_formal_td.I14.4 to i64*
   %_source.I14.4 = bitcast i64 %_loc_.I14_3 to i64
   %_td.I14.4 = bitcast i64* %_desc.I14.4 to %struct.TD*
   %_is_small_ptr.I14.4 = getelementptr %struct.TD, %struct.TD* %_td.I14.4, i32 0, i32 13
   %_is_small.I14.4 = load i8, i8* %_is_small_ptr.I14.4
   %_is_small_bool.I14.4 = trunc i8 %_is_small.I14.4 to i1
   br i1 %_is_small_bool.I14.4, label %_small_label.I14.4, label %_large_label.I14.4
   _small_label.I14.4:
   %_small_null_ptr.I14.4 = getelementptr %struct.TD, %struct.TD* %_td.I14.4, i32 0, i32 17
   %_small_null.I14.4 = load i64, i64* %_small_null_ptr.I14.4
   br label %_join_small_and_large.I14.4
   _large_label.I14.4:
   %_high_and_low_bits.I14.4 = and i64 %_source.I14.4, or (i64 shl (i64 1, i64 63), i64 1)
   %_is_special_bit.I14.4 = icmp eq i64 %_high_and_low_bits.I14.4, or (i64 shl (i64 1, i64 63), i64 1)
   br i1 %_is_special_bit.I14.4, label %_is_special_label.I14.4, label %_not_special_label.I14.4
   _is_special_label.I14.4:
   %_spcl_rgn_times2_.I14.4 = and i64 %_source.I14.4, 4294967295
   br label %_last_large_label.I14.4
   _not_special_label.I14.4:
   %_header_ptr.I14.4 = inttoptr i64 %_source.I14.4 to i64*
   %_hdr_of_src.I14.4 = load i64, i64* %_header_ptr.I14.4
   %_region_bits.I14.4 = and i64 %_hdr_of_src.I14.4, 4294901760
   %_normal_rgn_times2_.I14.4 = lshr i64 %_region_bits.I14.4, 15
   br label %_last_large_label.I14.4
   _last_large_label.I14.4:
   %_rgn_times2_.I14.4 = phi i64 [%_spcl_rgn_times2_.I14.4, %_is_special_label.I14.4], [%_normal_rgn_times2_.I14.4, %_not_special_label.I14.4]
   %_large_null.I14.4 = or i64 -144115188075855871, %_rgn_times2_.I14.4
   br label %_join_small_and_large.I14.4
   _join_small_and_large.I14.4:
   %_null.I14.4 = phi i64 [%_small_null.I14.4, %_small_label.I14.4],[%_large_null.I14.4, %_last_large_label.I14.4]
   %_loc_.I14_4 = bitcast i64 %_null.I14.4 to i64

   ; #Copy_Word_Op at 16:40
   %_source_val.I14.5 = bitcast i64 %_loc_.I14_4 to i64
   %_reg.I14.5_2 = inttoptr i64 %_loc_.I14_3 to i64*
   %_dest.I14.5 = getelementptr i64, i64* %_reg.I14.5_2, i64 1
   store i64 %_source_val.I14.5, i64* %_dest.I14.5

   ; #Store_Null_Of_Same_Stg_Rgn_Op at 16:55
   %_cur_td.I14.6 = bitcast i64* %_call14_Static_Link to %struct.TD*
   %_param_arr_ptr.I14.6 = getelementptr %struct.TD, %struct.TD* %_cur_td.I14.6, i32 0, i32 26
   %_param_arr.I14.6 = load %struct.ParamInfo*, %struct.ParamInfo** %_param_arr_ptr.I14.6
   %_formal_td_ptr_ptr.I14.6 = getelementptr %struct.ParamInfo, %struct.ParamInfo* %_param_arr.I14.6, i32 1, i32 1, i32 0
   %_formal_td.I14.6 = load %struct.TD*, %struct.TD** %_formal_td_ptr_ptr.I14.6
   %_desc.I14.6 = bitcast %struct.TD* %_formal_td.I14.6 to i64*
   %_source.I14.6 = bitcast i64 %_loc_.I14_3 to i64
   %_td.I14.6 = bitcast i64* %_desc.I14.6 to %struct.TD*
   %_is_small_ptr.I14.6 = getelementptr %struct.TD, %struct.TD* %_td.I14.6, i32 0, i32 13
   %_is_small.I14.6 = load i8, i8* %_is_small_ptr.I14.6
   %_is_small_bool.I14.6 = trunc i8 %_is_small.I14.6 to i1
   br i1 %_is_small_bool.I14.6, label %_small_label.I14.6, label %_large_label.I14.6
   _small_label.I14.6:
   %_small_null_ptr.I14.6 = getelementptr %struct.TD, %struct.TD* %_td.I14.6, i32 0, i32 17
   %_small_null.I14.6 = load i64, i64* %_small_null_ptr.I14.6
   br label %_join_small_and_large.I14.6
   _large_label.I14.6:
   %_high_and_low_bits.I14.6 = and i64 %_source.I14.6, or (i64 shl (i64 1, i64 63), i64 1)
   %_is_special_bit.I14.6 = icmp eq i64 %_high_and_low_bits.I14.6, or (i64 shl (i64 1, i64 63), i64 1)
   br i1 %_is_special_bit.I14.6, label %_is_special_label.I14.6, label %_not_special_label.I14.6
   _is_special_label.I14.6:
   %_spcl_rgn_times2_.I14.6 = and i64 %_source.I14.6, 4294967295
   br label %_last_large_label.I14.6
   _not_special_label.I14.6:
   %_header_ptr.I14.6 = inttoptr i64 %_source.I14.6 to i64*
   %_hdr_of_src.I14.6 = load i64, i64* %_header_ptr.I14.6
   %_region_bits.I14.6 = and i64 %_hdr_of_src.I14.6, 4294901760
   %_normal_rgn_times2_.I14.6 = lshr i64 %_region_bits.I14.6, 15
   br label %_last_large_label.I14.6
   _last_large_label.I14.6:
   %_rgn_times2_.I14.6 = phi i64 [%_spcl_rgn_times2_.I14.6, %_is_special_label.I14.6], [%_normal_rgn_times2_.I14.6, %_not_special_label.I14.6]
   %_large_null.I14.6 = or i64 -144115188075855871, %_rgn_times2_.I14.6
   br label %_join_small_and_large.I14.6
   _join_small_and_large.I14.6:
   %_null.I14.6 = phi i64 [%_small_null.I14.6, %_small_label.I14.6],[%_large_null.I14.6, %_last_large_label.I14.6]
   %_loc_.I14_5 = bitcast i64 %_null.I14.6 to i64

   ; #Copy_Word_Op at 16:55
   %_source_val.I14.7 = bitcast i64 %_loc_.I14_5 to i64
   %_reg.I14.7_2 = inttoptr i64 %_loc_.I14_3 to i64*
   %_dest.I14.7 = getelementptr i64, i64* %_reg.I14.7_2, i64 2
   store i64 %_source_val.I14.7, i64* %_dest.I14.7

   ; #Copy_Word_Op at 16:32
   %_source.I14.8 = bitcast i64* %_loc_.I14_2 to i64* 
   %_source_val.I14.8 = load i64, i64* %_source.I14.8
   %_loc_.I14_1 = bitcast i64 %_source_val.I14.8 to i64

   ; #Copy_Word_Op at 16:31
   %_source_val.I14.9 = bitcast i64 %_loc_.I14_1 to i64
   %_dest.I14.9 = bitcast i64* %_output.I14 to i64*
   store i64 %_source_val.I14.9, i64* %_dest.I14.9

   ; #Check_Not_Null_Op at 16:31
   %_arg_ptr.I14.10 = bitcast i64* %_output.I14 to i64*
   %_arg.I14.10 = load i64, i64* %_arg_ptr.I14.10
   %_val_no_reg.I14.10 = and i64 %_arg.I14.10, -4294967295
   %_is_null.I14.10 = icmp eq i64 %_val_no_reg.I14.10, -144115188075855871
   br i1 %_is_null.I14.10, label %_fail.I14.10, label %_lbl.I14_11
   _fail.I14.10:
   %_str_ptr_ptr.I14.10 = load i64*, i64** @$Strings
   %_str_ptr.I14.10 = getelementptr i64, i64* %_str_ptr_ptr.I14.10, i64 3
   %_assert_str.I14.10 = load i64, i64* %_str_ptr.I14.10
   store i64 %_assert_str.I14.10, i64* %_print_param.I14.10
   call void @_psc_runtime_message(i64* %_Context, i64* %_print_param.I14.10, i64* null)

   br label %_lbl.I14_11

_lbl.I14_11:
   ; #Return_Op at 16:31

   %_new_result14 = load i64, i64* %_output.I14
   %_result_addr14 = bitcast i64* %_loc_11 to i64* 
   store i64 %_new_result14, i64* %_result_addr14

   ; #Store_Address_Op at 61:32
   %_addr15 = bitcast i64* %_loc_11 to i64* 
   %_loc_16 = bitcast i64* %_addr15 to i64*

   ; #Copy_Word_Op at 61:26
   %_source_val16 = bitcast i64 %_formal_param_1 to i64
   %_loc_18 = bitcast i64 %_source_val16 to i64

   ; #Copy_Word_Op at 61:32
   %_reg17_1 = inttoptr i64 %_loc_18 to i64*
   %_source17 = getelementptr i64, i64* %_reg17_1, i64 2
   %_source_val17 = load i64, i64* %_source17
   %_loc_17 = bitcast i64 %_source_val17 to i64

   ; #Call_Op at 61:32
   ; inlining call on "var_indexing"
   %_cur_td18 = bitcast i64* %_Static_Link to %struct.TD*
   %_nested_types_arr_ptr18 = getelementptr %struct.TD, %struct.TD* %_cur_td18, i32 0, i32 35
   %_nested_types_arr18 = load %struct.TD**, %struct.TD*** %_nested_types_arr_ptr18
   %_nested_td_ptr_ptr18 = getelementptr %struct.TD*, %struct.TD** %_nested_types_arr18, i32 6
   %_nested_td18 = load %struct.TD*, %struct.TD** %_nested_td_ptr_ptr18
   %_call18_Static_Link = bitcast %struct.TD* %_nested_td18 to i64*

   ; #Copy_Address_Op at 30:9
   %_source_val.I18.1 = bitcast i64* %_loc_16 to i64*
   %_loc_.I18_3 = bitcast i64* %_source_val.I18.1 to i64*

   ; #Copy_Word_Op at 30:9
   %_reg.I18.2_1 = bitcast i64* %_loc_.I18_3 to i64*
   %_source.I18.2 = getelementptr i64, i64* %_reg.I18.2_1, i64 0
   %_source_val.I18.2 = load i64, i64* %_source.I18.2
   %_loc_.I18_2 = bitcast i64 %_source_val.I18.2 to i64

   ; #Make_Copy_In_Stg_Rgn_Op at 30:19
   %_cur_td.I18.3 = bitcast i64* %_call18_Static_Link to %struct.TD*
   %_param_arr_ptr.I18.3 = getelementptr %struct.TD, %struct.TD* %_cur_td.I18.3, i32 0, i32 26
   %_param_arr.I18.3 = load %struct.ParamInfo*, %struct.ParamInfo** %_param_arr_ptr.I18.3
   %_formal_td_ptr_ptr.I18.3 = getelementptr %struct.ParamInfo, %struct.ParamInfo* %_param_arr.I18.3, i32 0, i32 1, i32 0
   %_formal_td.I18.3 = load %struct.TD*, %struct.TD** %_formal_td_ptr_ptr.I18.3
   %_desc.I18.3 = bitcast %struct.TD* %_formal_td.I18.3 to i64*
   %_source.I18.3 = bitcast i64 %_loc_17 to i64
   %_reg.I18.3_3 = inttoptr i64 %_loc_.I18_2 to i64*
   %_existing_ptr.I18.3 = getelementptr i64, i64* %_reg.I18.3_3, i64 1
   %_existing_obj.I18.3 = load i64, i64* %_existing_ptr.I18.3
   %_result.I18.3 = call i64 @_psc_copy_object(i64* %_Context, i64* %_desc.I18.3, i64 %_source.I18.3, i64 %_existing_obj.I18.3)
   %_loc_.I18_1 = bitcast i64 %_result.I18.3 to i64

   ; #Assign_Word_Op at 30:12
   %_cur_td.I18.4 = bitcast i64* %_call18_Static_Link to %struct.TD*
   %_param_arr_ptr.I18.4 = getelementptr %struct.TD, %struct.TD* %_cur_td.I18.4, i32 0, i32 26
   %_param_arr.I18.4 = load %struct.ParamInfo*, %struct.ParamInfo** %_param_arr_ptr.I18.4
   %_formal_td_ptr_ptr.I18.4 = getelementptr %struct.ParamInfo, %struct.ParamInfo* %_param_arr.I18.4, i32 0, i32 1, i32 0
   %_formal_td.I18.4 = load %struct.TD*, %struct.TD** %_formal_td_ptr_ptr.I18.4
   %_desc.I18.4 = bitcast %struct.TD* %_formal_td.I18.4 to i64*
   %_source.I18.4 = bitcast i64 %_loc_.I18_1 to i64
   %_reg.I18.4_2 = inttoptr i64 %_loc_.I18_2 to i64*
   %_dest_ptr.I18.4 = getelementptr i64, i64* %_reg.I18.4_2, i64 1
   call void @_psc_assign_word(i64* %_Context, i64* %_desc.I18.4, i64* %_dest_ptr.I18.4, i64 %_source.I18.4)

   ; #Copy_Address_Op at 31:16
   %_source_val.I18.5 = bitcast i64* %_loc_16 to i64*
   %_loc_.I18_6 = bitcast i64* %_source_val.I18.5 to i64*

   ; #Copy_Word_Op at 31:16
   %_reg.I18.6_1 = bitcast i64* %_loc_.I18_6 to i64*
   %_source.I18.6 = getelementptr i64, i64* %_reg.I18.6_1, i64 0
   %_source_val.I18.6 = load i64, i64* %_source.I18.6
   %_loc_.I18_5 = bitcast i64 %_source_val.I18.6 to i64

   ; #Store_Address_Op at 31:9
   %_reg.I18.7_1 = inttoptr i64 %_loc_.I18_5 to i64*
   %_addr.I18.7 = getelementptr i64, i64* %_reg.I18.7_1, i64 2
   %_dest_ptr.I18.7_Orig = bitcast i64* %_output.I18 to i64*
   %_dest_ptr.I18.7 = bitcast i64* %_dest_ptr.I18.7_Orig to i64**
   store i64* %_addr.I18.7, i64** %_dest_ptr.I18.7

   ; #Return_Op at 31:9

   %_new_result_addr_ind18 = bitcast i64* %_output.I18 to i64**
   %_new_result18 = load i64*, i64** %_new_result_addr_ind18
   %_loc_14 = bitcast i64* %_new_result18 to i64*

   ; #Copy_Word_Op at 61:41
   %_source_val19 = bitcast i64 %_formal_param_1 to i64
   %_loc_19 = bitcast i64 %_source_val19 to i64

   ; #Make_Copy_In_Stg_Rgn_Op at 61:47
   %_cur_td20 = bitcast i64* %_Static_Link to %struct.TD*
   %_param_arr_ptr20 = getelementptr %struct.TD, %struct.TD* %_cur_td20, i32 0, i32 26
   %_param_arr20 = load %struct.ParamInfo*, %struct.ParamInfo** %_param_arr_ptr20
   %_formal_td_ptr_ptr20 = getelementptr %struct.ParamInfo, %struct.ParamInfo* %_param_arr20, i32 0, i32 1, i32 0
   %_formal_td20 = load %struct.TD*, %struct.TD** %_formal_td_ptr_ptr20
   %_desc20 = bitcast %struct.TD* %_formal_td20 to i64*
   %_reg20_2 = inttoptr i64 %_loc_19 to i64*
   %_source_ptr20 = getelementptr i64, i64* %_reg20_2, i64 1
   %_source20 = load i64, i64* %_source_ptr20
   %_existing_ptr20 = bitcast i64* %_loc_11 to i64* 
   %_existing_obj20 = load i64, i64* %_existing_ptr20
   %_result20 = call i64 @_psc_copy_object(i64* %_Context, i64* %_desc20, i64 %_source20, i64 %_existing_obj20)
   %_loc_13 = bitcast i64 %_result20 to i64

   ; #Assign_Word_Op at 61:32
   %_cur_td21 = bitcast i64* %_Static_Link to %struct.TD*
   %_param_arr_ptr21 = getelementptr %struct.TD, %struct.TD* %_cur_td21, i32 0, i32 26
   %_param_arr21 = load %struct.ParamInfo*, %struct.ParamInfo** %_param_arr_ptr21
   %_formal_td_ptr_ptr21 = getelementptr %struct.ParamInfo, %struct.ParamInfo* %_param_arr21, i32 0, i32 1, i32 0
   %_formal_td21 = load %struct.TD*, %struct.TD** %_formal_td_ptr_ptr21
   %_desc21 = bitcast %struct.TD* %_formal_td21 to i64*
   %_source21 = bitcast i64 %_loc_13 to i64
   %_reg21_2 = bitcast i64* %_loc_14 to i64*
   %_dest_ptr21 = getelementptr i64, i64* %_reg21_2, i64 0
   call void @_psc_assign_word(i64* %_Context, i64* %_desc21, i64* %_dest_ptr21, i64 %_source21)

   ; #Copy_Word_Op at 61:25
   %_source22 = bitcast i64* %_loc_11 to i64* 
   %_source_val22 = load i64, i64* %_source22
   %_loc_8 = bitcast i64 %_source_val22 to i64

   ; #Call_Op at 61:14
   ; inlining call on "|="
   %_cur_td23 = bitcast i64* %_Static_Link to %struct.TD*
   %_nested_types_arr_ptr23 = getelementptr %struct.TD, %struct.TD* %_cur_td23, i32 0, i32 35
   %_nested_types_arr23 = load %struct.TD**, %struct.TD*** %_nested_types_arr_ptr23
   %_nested_td_ptr_ptr23 = getelementptr %struct.TD*, %struct.TD** %_nested_types_arr23, i32 5
   %_nested_td23 = load %struct.TD*, %struct.TD** %_nested_td_ptr_ptr23
   %_call23_Static_Link = bitcast %struct.TD* %_nested_td23 to i64*

   ; #Copy_Address_Op at 80:9
   %_source_val.I23.1 = bitcast i64* %_loc_7 to i64*
   %_loc_.I23_3 = bitcast i64* %_source_val.I23.1 to i64*

   ; #Store_Address_Op at 80:14
   %_reg.I23.2_1 = bitcast i64* %_loc_.I23_3 to i64*
   %_addr.I23.2 = getelementptr i64, i64* %_reg.I23.2_1, i64 0
   %_loc_.I23_1 = bitcast i64* %_addr.I23.2 to i64*

   ; #Copy_Word_Op at 80:22
   %_source_val.I23.3 = bitcast i64 %_loc_8 to i64
   %_loc_.I23_2 = bitcast i64 %_source_val.I23.3 to i64

   ; #Call_Op at 80:14
   %_cur_td.I23.4 = bitcast i64* %_call23_Static_Link to %struct.TD*
   %_nested_types_arr_ptr.I23.4 = getelementptr %struct.TD, %struct.TD* %_cur_td.I23.4, i32 0, i32 35
   %_nested_types_arr.I23.4 = load %struct.TD**, %struct.TD*** %_nested_types_arr_ptr.I23.4
   %_nested_td_ptr_ptr.I23.4 = getelementptr %struct.TD*, %struct.TD** %_nested_types_arr.I23.4, i32 2
   %_nested_td.I23.4 = load %struct.TD*, %struct.TD** %_nested_td_ptr_ptr.I23.4
   %_call.I23.4_Static_Link = bitcast %struct.TD* %_nested_td.I23.4 to i64*
   call void @"PSL.Containers.Basic_Map.$|=$"(i64* %_loc_.I23_1, i64 %_loc_.I23_2, i64* %_Context, i64* %_call.I23.4_Static_Link)

   ; #Return_Op at 81:5


   ; #Return_Op at 62:5
   call void @_psc_finalize_stg_rgn(i64* %_Context, i64* %_Local_Area)
   ret void

}

define i64 @"PSL.Containers.Two_Way_Map.$|$"(i64 %_formal_param_1, i64 %_formal_param_2, i64* %_Context, i64* %_Static_Link, i64 %_inited_output) {
   %_Local_Area = alloca i64, i64 4
   %_sl = ptrtoint i64* %_Static_Link to i64
   store i64 %_sl, i64* %_Local_Area

   %_Param_Area = alloca i64
   %_print_param8 = alloca i64

   store i64 %_inited_output, i64* %_Param_Area
   %_pa = ptrtoint i64* %_Param_Area to i64
   %_store_pa = getelementptr i64, i64* %_Local_Area, i64 1
   store i64 %_pa, i64* %_store_pa
   
   ; #Make_Copy_In_Stg_Rgn_Op at 67:19
   %_desc1 = getelementptr i64, i64* %_Static_Link, i64 0
   %_source1 = bitcast i64 %_formal_param_1 to i64
   %_existing_ptr1 = getelementptr i64, i64* %_Param_Area, i64 0
   %_existing_obj1 = load i64, i64* %_existing_ptr1
   %_result1 = call i64 @_psc_copy_object(i64* %_Context, i64* %_desc1, i64 %_source1, i64 %_existing_obj1)
   %_loc_1 = bitcast i64 %_result1 to i64

   ; #Assign_Word_Op at 67:9
   %_desc2 = getelementptr i64, i64* %_Static_Link, i64 0
   %_source2 = bitcast i64 %_loc_1 to i64
   %_dest_ptr2 = getelementptr i64, i64* %_Param_Area, i64 0
   call void @_psc_assign_word(i64* %_Context, i64* %_desc2, i64* %_dest_ptr2, i64 %_source2)

   ; #Store_Address_Op at 68:9
   %_addr3 = getelementptr i64, i64* %_Param_Area, i64 0
   %_loc_2 = bitcast i64* %_addr3 to i64*

   ; #Call_Op at 68:9
   %_call4_Static_Link = getelementptr i64, i64* %_Static_Link, i64 0
   call void @"PSL.Containers.Two_Way_Map.Add_Unreversed"(i64* %_loc_2, i64* %_Context, i64* %_call4_Static_Link)

   ; #Store_Address_Op at 69:9
   %_addr5 = getelementptr i64, i64* %_Param_Area, i64 0
   %_loc_3 = bitcast i64* %_addr5 to i64*

   ; #Copy_Word_Op at 69:19
   %_source_val6 = bitcast i64 %_formal_param_2 to i64
   %_loc_4 = bitcast i64 %_source_val6 to i64

   ; #Call_Op at 69:9
   %_call7_Static_Link = getelementptr i64, i64* %_Static_Link, i64 0
   call void @"PSL.Containers.Two_Way_Map.$|=$"(i64* %_loc_3, i64 %_loc_4, i64* %_Context, i64* %_call7_Static_Link)

   ; #Check_Not_Null_Op at 70:5
   %_arg_ptr8 = getelementptr i64, i64* %_Param_Area, i64 0
   %_arg8 = load i64, i64* %_arg_ptr8
   %_val_no_reg8 = and i64 %_arg8, -4294967295
   %_is_null8 = icmp eq i64 %_val_no_reg8, -144115188075855871
   br i1 %_is_null8, label %_fail8, label %_lbl9
   _fail8:
   %_str_ptr_ptr8 = load i64*, i64** @$Strings
   %_str_ptr8 = getelementptr i64, i64* %_str_ptr_ptr8, i64 10
   %_assert_str8 = load i64, i64* %_str_ptr8
   store i64 %_assert_str8, i64* %_print_param8
   call void @_psc_runtime_message(i64* %_Context, i64* %_print_param8, i64* null)

   br label %_lbl9

_lbl9:
   ; #Return_Op at 70:5
   %_result_reg9 = load i64, i64* %_Param_Area
   ret i64 %_result_reg9

}

define void @"PSL.Containers.Two_Way_Map.$<|=$"(i64* %_formal_param_0, i64* %_formal_param_1, i64* %_Context, i64* %_Static_Link) {
   %_Local_Area = alloca i64, i64 4
   %_sl = ptrtoint i64* %_Static_Link to i64
   store i64 %_sl, i64* %_Local_Area
   call void @_psc_initialize_stg_rgn(i64* %_Context, i64* %_Local_Area)
   %_Master = alloca i64, i64 3
   %_ms = ptrtoint i64* %_Master to i64
   %_store_ms = getelementptr i64, i64* %_Local_Area, i64 3
   store i64 %_ms, i64* %_store_ms

   %_loc_7 = alloca i64
   %_output.I9 = alloca i64
   %_loc_.I9_2 = alloca i64
   %_print_param.I9.10 = alloca i64
   %_output.I14 = alloca i64

   
   ; #Copy_Address_Op at 74:25
   %_source_val1 = bitcast i64* %_formal_param_0 to i64*
   %_loc_2 = bitcast i64* %_source_val1 to i64*

   ; #Store_Address_Op at 74:9
   %_reg2_1 = bitcast i64* %_loc_2 to i64*
   %_addr2 = getelementptr i64, i64* %_reg2_1, i64 0
   %_loc_1 = bitcast i64* %_addr2 to i64*

   ; #Call_Op at 74:9
   %_call3_Static_Link = getelementptr i64, i64* %_Static_Link, i64 0
   call void @"PSL.Containers.Two_Way_Map.Add_Unreversed"(i64* %_loc_1, i64* %_Context, i64* %_call3_Static_Link)

   ; #Copy_Address_Op at 75:9
   %_source_val4 = bitcast i64* %_formal_param_0 to i64*
   %_loc_6 = bitcast i64* %_source_val4 to i64*

   ; #Copy_Word_Op at 75:9
   %_reg5_1 = bitcast i64* %_loc_6 to i64*
   %_source5 = getelementptr i64, i64* %_reg5_1, i64 0
   %_source_val5 = load i64, i64* %_source5
   %_loc_5 = bitcast i64 %_source_val5 to i64

   ; #Store_Address_Op at 75:14
   %_reg6_1 = inttoptr i64 %_loc_5 to i64*
   %_addr6 = getelementptr i64, i64* %_reg6_1, i64 2
   %_loc_3 = bitcast i64* %_addr6 to i64*

   ; #Store_Local_Null_Op at 75:25
   %_cur_td7 = bitcast i64* %_Static_Link to %struct.TD*
   %_nested_types_arr_ptr7 = getelementptr %struct.TD, %struct.TD* %_cur_td7, i32 0, i32 35
   %_nested_types_arr7 = load %struct.TD**, %struct.TD*** %_nested_types_arr_ptr7
   %_nested_td_ptr_ptr7 = getelementptr %struct.TD*, %struct.TD** %_nested_types_arr7, i32 6
   %_nested_td7 = load %struct.TD*, %struct.TD** %_nested_td_ptr_ptr7
   %_desc7 = bitcast %struct.TD* %_nested_td7 to i64*
   %_td7 = bitcast i64* %_desc7 to %struct.TD*
   %_is_small_ptr7 = getelementptr %struct.TD, %struct.TD* %_td7, i32 0, i32 13
   %_is_small7 = load i8, i8* %_is_small_ptr7
   %_is_small_bool7 = trunc i8 %_is_small7 to i1
   %_small_null_ptr7 = getelementptr %struct.TD, %struct.TD* %_td7, i32 0, i32 17
   %_small_null7 = load i64, i64* %_small_null_ptr7
   %_ctx7 = bitcast i64* %_Context to %struct.ExecCtx*
   %_large_null_ptr7 = getelementptr %struct.ExecCtx, %struct.ExecCtx* %_ctx7, i32 0, i32 1
   %_large_null7 = load i64, i64* %_large_null_ptr7
   %_null7= select i1 %_is_small_bool7, i64 %_small_null7, i64 %_large_null7
   %_loc_8 = bitcast i64 %_null7 to i64

   ; #Declare_Obj_Op at 75:25

   ; #Call_Op at 75:25
   ; inlining call on "[]"
   store i64 %_loc_8, i64* %_output.I9
   %_cur_td9 = bitcast i64* %_Static_Link to %struct.TD*
   %_nested_types_arr_ptr9 = getelementptr %struct.TD, %struct.TD* %_cur_td9, i32 0, i32 35
   %_nested_types_arr9 = load %struct.TD**, %struct.TD*** %_nested_types_arr_ptr9
   %_nested_td_ptr_ptr9 = getelementptr %struct.TD*, %struct.TD** %_nested_types_arr9, i32 6
   %_nested_td9 = load %struct.TD*, %struct.TD** %_nested_td_ptr_ptr9
   %_call9_Static_Link = bitcast %struct.TD* %_nested_td9 to i64*

   ; #Declare_Obj_Op at 16:32

   ; #Create_Obj_Op at 16:32
   %_desc.I9.2 = getelementptr i64, i64* %_call9_Static_Link, i64 0
   %_src_addr.I9.2 = bitcast i64* %_output.I9 to i64*
   %_src.I9.2 = load i64, i64* %_src_addr.I9.2
   %_dest.I9.2 = call i64@_psc_new_object(i64* %_Context, i64* %_desc.I9.2, i64 %_src.I9.2)
   %_dest_addr.I9.2 = bitcast i64* %_loc_.I9_2 to i64* 
   store i64 %_dest.I9.2, i64* %_dest_addr.I9.2

   ; #Copy_Word_Op at 16:32
   %_source.I9.3 = bitcast i64* %_loc_.I9_2 to i64* 
   %_source_val.I9.3 = load i64, i64* %_source.I9.3
   %_loc_.I9_3 = bitcast i64 %_source_val.I9.3 to i64

   ; #Store_Null_Of_Same_Stg_Rgn_Op at 16:40
   %_cur_td.I9.4 = bitcast i64* %_call9_Static_Link to %struct.TD*
   %_param_arr_ptr.I9.4 = getelementptr %struct.TD, %struct.TD* %_cur_td.I9.4, i32 0, i32 26
   %_param_arr.I9.4 = load %struct.ParamInfo*, %struct.ParamInfo** %_param_arr_ptr.I9.4
   %_formal_td_ptr_ptr.I9.4 = getelementptr %struct.ParamInfo, %struct.ParamInfo* %_param_arr.I9.4, i32 0, i32 1, i32 0
   %_formal_td.I9.4 = load %struct.TD*, %struct.TD** %_formal_td_ptr_ptr.I9.4
   %_desc.I9.4 = bitcast %struct.TD* %_formal_td.I9.4 to i64*
   %_source.I9.4 = bitcast i64 %_loc_.I9_3 to i64
   %_td.I9.4 = bitcast i64* %_desc.I9.4 to %struct.TD*
   %_is_small_ptr.I9.4 = getelementptr %struct.TD, %struct.TD* %_td.I9.4, i32 0, i32 13
   %_is_small.I9.4 = load i8, i8* %_is_small_ptr.I9.4
   %_is_small_bool.I9.4 = trunc i8 %_is_small.I9.4 to i1
   br i1 %_is_small_bool.I9.4, label %_small_label.I9.4, label %_large_label.I9.4
   _small_label.I9.4:
   %_small_null_ptr.I9.4 = getelementptr %struct.TD, %struct.TD* %_td.I9.4, i32 0, i32 17
   %_small_null.I9.4 = load i64, i64* %_small_null_ptr.I9.4
   br label %_join_small_and_large.I9.4
   _large_label.I9.4:
   %_high_and_low_bits.I9.4 = and i64 %_source.I9.4, or (i64 shl (i64 1, i64 63), i64 1)
   %_is_special_bit.I9.4 = icmp eq i64 %_high_and_low_bits.I9.4, or (i64 shl (i64 1, i64 63), i64 1)
   br i1 %_is_special_bit.I9.4, label %_is_special_label.I9.4, label %_not_special_label.I9.4
   _is_special_label.I9.4:
   %_spcl_rgn_times2_.I9.4 = and i64 %_source.I9.4, 4294967295
   br label %_last_large_label.I9.4
   _not_special_label.I9.4:
   %_header_ptr.I9.4 = inttoptr i64 %_source.I9.4 to i64*
   %_hdr_of_src.I9.4 = load i64, i64* %_header_ptr.I9.4
   %_region_bits.I9.4 = and i64 %_hdr_of_src.I9.4, 4294901760
   %_normal_rgn_times2_.I9.4 = lshr i64 %_region_bits.I9.4, 15
   br label %_last_large_label.I9.4
   _last_large_label.I9.4:
   %_rgn_times2_.I9.4 = phi i64 [%_spcl_rgn_times2_.I9.4, %_is_special_label.I9.4], [%_normal_rgn_times2_.I9.4, %_not_special_label.I9.4]
   %_large_null.I9.4 = or i64 -144115188075855871, %_rgn_times2_.I9.4
   br label %_join_small_and_large.I9.4
   _join_small_and_large.I9.4:
   %_null.I9.4 = phi i64 [%_small_null.I9.4, %_small_label.I9.4],[%_large_null.I9.4, %_last_large_label.I9.4]
   %_loc_.I9_4 = bitcast i64 %_null.I9.4 to i64

   ; #Copy_Word_Op at 16:40
   %_source_val.I9.5 = bitcast i64 %_loc_.I9_4 to i64
   %_reg.I9.5_2 = inttoptr i64 %_loc_.I9_3 to i64*
   %_dest.I9.5 = getelementptr i64, i64* %_reg.I9.5_2, i64 1
   store i64 %_source_val.I9.5, i64* %_dest.I9.5

   ; #Store_Null_Of_Same_Stg_Rgn_Op at 16:55
   %_cur_td.I9.6 = bitcast i64* %_call9_Static_Link to %struct.TD*
   %_param_arr_ptr.I9.6 = getelementptr %struct.TD, %struct.TD* %_cur_td.I9.6, i32 0, i32 26
   %_param_arr.I9.6 = load %struct.ParamInfo*, %struct.ParamInfo** %_param_arr_ptr.I9.6
   %_formal_td_ptr_ptr.I9.6 = getelementptr %struct.ParamInfo, %struct.ParamInfo* %_param_arr.I9.6, i32 1, i32 1, i32 0
   %_formal_td.I9.6 = load %struct.TD*, %struct.TD** %_formal_td_ptr_ptr.I9.6
   %_desc.I9.6 = bitcast %struct.TD* %_formal_td.I9.6 to i64*
   %_source.I9.6 = bitcast i64 %_loc_.I9_3 to i64
   %_td.I9.6 = bitcast i64* %_desc.I9.6 to %struct.TD*
   %_is_small_ptr.I9.6 = getelementptr %struct.TD, %struct.TD* %_td.I9.6, i32 0, i32 13
   %_is_small.I9.6 = load i8, i8* %_is_small_ptr.I9.6
   %_is_small_bool.I9.6 = trunc i8 %_is_small.I9.6 to i1
   br i1 %_is_small_bool.I9.6, label %_small_label.I9.6, label %_large_label.I9.6
   _small_label.I9.6:
   %_small_null_ptr.I9.6 = getelementptr %struct.TD, %struct.TD* %_td.I9.6, i32 0, i32 17
   %_small_null.I9.6 = load i64, i64* %_small_null_ptr.I9.6
   br label %_join_small_and_large.I9.6
   _large_label.I9.6:
   %_high_and_low_bits.I9.6 = and i64 %_source.I9.6, or (i64 shl (i64 1, i64 63), i64 1)
   %_is_special_bit.I9.6 = icmp eq i64 %_high_and_low_bits.I9.6, or (i64 shl (i64 1, i64 63), i64 1)
   br i1 %_is_special_bit.I9.6, label %_is_special_label.I9.6, label %_not_special_label.I9.6
   _is_special_label.I9.6:
   %_spcl_rgn_times2_.I9.6 = and i64 %_source.I9.6, 4294967295
   br label %_last_large_label.I9.6
   _not_special_label.I9.6:
   %_header_ptr.I9.6 = inttoptr i64 %_source.I9.6 to i64*
   %_hdr_of_src.I9.6 = load i64, i64* %_header_ptr.I9.6
   %_region_bits.I9.6 = and i64 %_hdr_of_src.I9.6, 4294901760
   %_normal_rgn_times2_.I9.6 = lshr i64 %_region_bits.I9.6, 15
   br label %_last_large_label.I9.6
   _last_large_label.I9.6:
   %_rgn_times2_.I9.6 = phi i64 [%_spcl_rgn_times2_.I9.6, %_is_special_label.I9.6], [%_normal_rgn_times2_.I9.6, %_not_special_label.I9.6]
   %_large_null.I9.6 = or i64 -144115188075855871, %_rgn_times2_.I9.6
   br label %_join_small_and_large.I9.6
   _join_small_and_large.I9.6:
   %_null.I9.6 = phi i64 [%_small_null.I9.6, %_small_label.I9.6],[%_large_null.I9.6, %_last_large_label.I9.6]
   %_loc_.I9_5 = bitcast i64 %_null.I9.6 to i64

   ; #Copy_Word_Op at 16:55
   %_source_val.I9.7 = bitcast i64 %_loc_.I9_5 to i64
   %_reg.I9.7_2 = inttoptr i64 %_loc_.I9_3 to i64*
   %_dest.I9.7 = getelementptr i64, i64* %_reg.I9.7_2, i64 2
   store i64 %_source_val.I9.7, i64* %_dest.I9.7

   ; #Copy_Word_Op at 16:32
   %_source.I9.8 = bitcast i64* %_loc_.I9_2 to i64* 
   %_source_val.I9.8 = load i64, i64* %_source.I9.8
   %_loc_.I9_1 = bitcast i64 %_source_val.I9.8 to i64

   ; #Copy_Word_Op at 16:31
   %_source_val.I9.9 = bitcast i64 %_loc_.I9_1 to i64
   %_dest.I9.9 = bitcast i64* %_output.I9 to i64*
   store i64 %_source_val.I9.9, i64* %_dest.I9.9

   ; #Check_Not_Null_Op at 16:31
   %_arg_ptr.I9.10 = bitcast i64* %_output.I9 to i64*
   %_arg.I9.10 = load i64, i64* %_arg_ptr.I9.10
   %_val_no_reg.I9.10 = and i64 %_arg.I9.10, -4294967295
   %_is_null.I9.10 = icmp eq i64 %_val_no_reg.I9.10, -144115188075855871
   br i1 %_is_null.I9.10, label %_fail.I9.10, label %_lbl.I9_11
   _fail.I9.10:
   %_str_ptr_ptr.I9.10 = load i64*, i64** @$Strings
   %_str_ptr.I9.10 = getelementptr i64, i64* %_str_ptr_ptr.I9.10, i64 3
   %_assert_str.I9.10 = load i64, i64* %_str_ptr.I9.10
   store i64 %_assert_str.I9.10, i64* %_print_param.I9.10
   call void @_psc_runtime_message(i64* %_Context, i64* %_print_param.I9.10, i64* null)

   br label %_lbl.I9_11

_lbl.I9_11:
   ; #Return_Op at 16:31

   %_new_result9 = load i64, i64* %_output.I9
   %_result_addr9 = bitcast i64* %_loc_7 to i64* 
   store i64 %_new_result9, i64* %_result_addr9

   ; #Store_Address_Op at 75:32
   %_addr10 = bitcast i64* %_loc_7 to i64* 
   %_loc_12 = bitcast i64* %_addr10 to i64*

   ; #Copy_Address_Op at 75:26
   %_source_val11 = bitcast i64* %_formal_param_1 to i64*
   %_loc_15 = bitcast i64* %_source_val11 to i64*

   ; #Copy_Word_Op at 75:26
   %_reg12_1 = bitcast i64* %_loc_15 to i64*
   %_source12 = getelementptr i64, i64* %_reg12_1, i64 0
   %_source_val12 = load i64, i64* %_source12
   %_loc_14 = bitcast i64 %_source_val12 to i64

   ; #Copy_Word_Op at 75:32
   %_reg13_1 = inttoptr i64 %_loc_14 to i64*
   %_source13 = getelementptr i64, i64* %_reg13_1, i64 2
   %_source_val13 = load i64, i64* %_source13
   %_loc_13 = bitcast i64 %_source_val13 to i64

   ; #Call_Op at 75:32
   ; inlining call on "var_indexing"
   %_cur_td14 = bitcast i64* %_Static_Link to %struct.TD*
   %_nested_types_arr_ptr14 = getelementptr %struct.TD, %struct.TD* %_cur_td14, i32 0, i32 35
   %_nested_types_arr14 = load %struct.TD**, %struct.TD*** %_nested_types_arr_ptr14
   %_nested_td_ptr_ptr14 = getelementptr %struct.TD*, %struct.TD** %_nested_types_arr14, i32 6
   %_nested_td14 = load %struct.TD*, %struct.TD** %_nested_td_ptr_ptr14
   %_call14_Static_Link = bitcast %struct.TD* %_nested_td14 to i64*

   ; #Copy_Address_Op at 30:9
   %_source_val.I14.1 = bitcast i64* %_loc_12 to i64*
   %_loc_.I14_3 = bitcast i64* %_source_val.I14.1 to i64*

   ; #Copy_Word_Op at 30:9
   %_reg.I14.2_1 = bitcast i64* %_loc_.I14_3 to i64*
   %_source.I14.2 = getelementptr i64, i64* %_reg.I14.2_1, i64 0
   %_source_val.I14.2 = load i64, i64* %_source.I14.2
   %_loc_.I14_2 = bitcast i64 %_source_val.I14.2 to i64

   ; #Make_Copy_In_Stg_Rgn_Op at 30:19
   %_cur_td.I14.3 = bitcast i64* %_call14_Static_Link to %struct.TD*
   %_param_arr_ptr.I14.3 = getelementptr %struct.TD, %struct.TD* %_cur_td.I14.3, i32 0, i32 26
   %_param_arr.I14.3 = load %struct.ParamInfo*, %struct.ParamInfo** %_param_arr_ptr.I14.3
   %_formal_td_ptr_ptr.I14.3 = getelementptr %struct.ParamInfo, %struct.ParamInfo* %_param_arr.I14.3, i32 0, i32 1, i32 0
   %_formal_td.I14.3 = load %struct.TD*, %struct.TD** %_formal_td_ptr_ptr.I14.3
   %_desc.I14.3 = bitcast %struct.TD* %_formal_td.I14.3 to i64*
   %_source.I14.3 = bitcast i64 %_loc_13 to i64
   %_reg.I14.3_3 = inttoptr i64 %_loc_.I14_2 to i64*
   %_existing_ptr.I14.3 = getelementptr i64, i64* %_reg.I14.3_3, i64 1
   %_existing_obj.I14.3 = load i64, i64* %_existing_ptr.I14.3
   %_result.I14.3 = call i64 @_psc_copy_object(i64* %_Context, i64* %_desc.I14.3, i64 %_source.I14.3, i64 %_existing_obj.I14.3)
   %_loc_.I14_1 = bitcast i64 %_result.I14.3 to i64

   ; #Assign_Word_Op at 30:12
   %_cur_td.I14.4 = bitcast i64* %_call14_Static_Link to %struct.TD*
   %_param_arr_ptr.I14.4 = getelementptr %struct.TD, %struct.TD* %_cur_td.I14.4, i32 0, i32 26
   %_param_arr.I14.4 = load %struct.ParamInfo*, %struct.ParamInfo** %_param_arr_ptr.I14.4
   %_formal_td_ptr_ptr.I14.4 = getelementptr %struct.ParamInfo, %struct.ParamInfo* %_param_arr.I14.4, i32 0, i32 1, i32 0
   %_formal_td.I14.4 = load %struct.TD*, %struct.TD** %_formal_td_ptr_ptr.I14.4
   %_desc.I14.4 = bitcast %struct.TD* %_formal_td.I14.4 to i64*
   %_source.I14.4 = bitcast i64 %_loc_.I14_1 to i64
   %_reg.I14.4_2 = inttoptr i64 %_loc_.I14_2 to i64*
   %_dest_ptr.I14.4 = getelementptr i64, i64* %_reg.I14.4_2, i64 1
   call void @_psc_assign_word(i64* %_Context, i64* %_desc.I14.4, i64* %_dest_ptr.I14.4, i64 %_source.I14.4)

   ; #Copy_Address_Op at 31:16
   %_source_val.I14.5 = bitcast i64* %_loc_12 to i64*
   %_loc_.I14_6 = bitcast i64* %_source_val.I14.5 to i64*

   ; #Copy_Word_Op at 31:16
   %_reg.I14.6_1 = bitcast i64* %_loc_.I14_6 to i64*
   %_source.I14.6 = getelementptr i64, i64* %_reg.I14.6_1, i64 0
   %_source_val.I14.6 = load i64, i64* %_source.I14.6
   %_loc_.I14_5 = bitcast i64 %_source_val.I14.6 to i64

   ; #Store_Address_Op at 31:9
   %_reg.I14.7_1 = inttoptr i64 %_loc_.I14_5 to i64*
   %_addr.I14.7 = getelementptr i64, i64* %_reg.I14.7_1, i64 2
   %_dest_ptr.I14.7_Orig = bitcast i64* %_output.I14 to i64*
   %_dest_ptr.I14.7 = bitcast i64* %_dest_ptr.I14.7_Orig to i64**
   store i64* %_addr.I14.7, i64** %_dest_ptr.I14.7

   ; #Return_Op at 31:9

   %_new_result_addr_ind14 = bitcast i64* %_output.I14 to i64**
   %_new_result14 = load i64*, i64** %_new_result_addr_ind14
   %_loc_10 = bitcast i64* %_new_result14 to i64*

   ; #Copy_Address_Op at 75:41
   %_source_val15 = bitcast i64* %_formal_param_1 to i64*
   %_loc_17 = bitcast i64* %_source_val15 to i64*

   ; #Copy_Word_Op at 75:41
   %_reg16_1 = bitcast i64* %_loc_17 to i64*
   %_source16 = getelementptr i64, i64* %_reg16_1, i64 0
   %_source_val16 = load i64, i64* %_source16
   %_loc_16 = bitcast i64 %_source_val16 to i64

   ; #Make_Copy_In_Stg_Rgn_Op at 75:47
   %_cur_td17 = bitcast i64* %_Static_Link to %struct.TD*
   %_param_arr_ptr17 = getelementptr %struct.TD, %struct.TD* %_cur_td17, i32 0, i32 26
   %_param_arr17 = load %struct.ParamInfo*, %struct.ParamInfo** %_param_arr_ptr17
   %_formal_td_ptr_ptr17 = getelementptr %struct.ParamInfo, %struct.ParamInfo* %_param_arr17, i32 0, i32 1, i32 0
   %_formal_td17 = load %struct.TD*, %struct.TD** %_formal_td_ptr_ptr17
   %_desc17 = bitcast %struct.TD* %_formal_td17 to i64*
   %_reg17_2 = inttoptr i64 %_loc_16 to i64*
   %_source_ptr17 = getelementptr i64, i64* %_reg17_2, i64 1
   %_source17 = load i64, i64* %_source_ptr17
   %_existing_ptr17 = bitcast i64* %_loc_7 to i64* 
   %_existing_obj17 = load i64, i64* %_existing_ptr17
   %_result17 = call i64 @_psc_copy_object(i64* %_Context, i64* %_desc17, i64 %_source17, i64 %_existing_obj17)
   %_loc_9 = bitcast i64 %_result17 to i64

   ; #Assign_Word_Op at 75:32
   %_cur_td18 = bitcast i64* %_Static_Link to %struct.TD*
   %_param_arr_ptr18 = getelementptr %struct.TD, %struct.TD* %_cur_td18, i32 0, i32 26
   %_param_arr18 = load %struct.ParamInfo*, %struct.ParamInfo** %_param_arr_ptr18
   %_formal_td_ptr_ptr18 = getelementptr %struct.ParamInfo, %struct.ParamInfo* %_param_arr18, i32 0, i32 1, i32 0
   %_formal_td18 = load %struct.TD*, %struct.TD** %_formal_td_ptr_ptr18
   %_desc18 = bitcast %struct.TD* %_formal_td18 to i64*
   %_source18 = bitcast i64 %_loc_9 to i64
   %_reg18_2 = bitcast i64* %_loc_10 to i64*
   %_dest_ptr18 = getelementptr i64, i64* %_reg18_2, i64 0
   call void @_psc_assign_word(i64* %_Context, i64* %_desc18, i64* %_dest_ptr18, i64 %_source18)

   ; #Copy_Word_Op at 75:25
   %_source19 = bitcast i64* %_loc_7 to i64* 
   %_source_val19 = load i64, i64* %_source19
   %_loc_4 = bitcast i64 %_source_val19 to i64

   ; #Call_Op at 75:14
   ; inlining call on "|="
   %_cur_td20 = bitcast i64* %_Static_Link to %struct.TD*
   %_nested_types_arr_ptr20 = getelementptr %struct.TD, %struct.TD* %_cur_td20, i32 0, i32 35
   %_nested_types_arr20 = load %struct.TD**, %struct.TD*** %_nested_types_arr_ptr20
   %_nested_td_ptr_ptr20 = getelementptr %struct.TD*, %struct.TD** %_nested_types_arr20, i32 5
   %_nested_td20 = load %struct.TD*, %struct.TD** %_nested_td_ptr_ptr20
   %_call20_Static_Link = bitcast %struct.TD* %_nested_td20 to i64*

   ; #Copy_Address_Op at 80:9
   %_source_val.I20.1 = bitcast i64* %_loc_3 to i64*
   %_loc_.I20_3 = bitcast i64* %_source_val.I20.1 to i64*

   ; #Store_Address_Op at 80:14
   %_reg.I20.2_1 = bitcast i64* %_loc_.I20_3 to i64*
   %_addr.I20.2 = getelementptr i64, i64* %_reg.I20.2_1, i64 0
   %_loc_.I20_1 = bitcast i64* %_addr.I20.2 to i64*

   ; #Copy_Word_Op at 80:22
   %_source_val.I20.3 = bitcast i64 %_loc_4 to i64
   %_loc_.I20_2 = bitcast i64 %_source_val.I20.3 to i64

   ; #Call_Op at 80:14
   %_cur_td.I20.4 = bitcast i64* %_call20_Static_Link to %struct.TD*
   %_nested_types_arr_ptr.I20.4 = getelementptr %struct.TD, %struct.TD* %_cur_td.I20.4, i32 0, i32 35
   %_nested_types_arr.I20.4 = load %struct.TD**, %struct.TD*** %_nested_types_arr_ptr.I20.4
   %_nested_td_ptr_ptr.I20.4 = getelementptr %struct.TD*, %struct.TD** %_nested_types_arr.I20.4, i32 2
   %_nested_td.I20.4 = load %struct.TD*, %struct.TD** %_nested_td_ptr_ptr.I20.4
   %_call.I20.4_Static_Link = bitcast %struct.TD* %_nested_td.I20.4 to i64*
   call void @"PSL.Containers.Basic_Map.$|=$"(i64* %_loc_.I20_1, i64 %_loc_.I20_2, i64* %_Context, i64* %_call.I20.4_Static_Link)

   ; #Return_Op at 81:5


   ; #Copy_Address_Op at 76:9
   %_source_val21 = bitcast i64* %_formal_param_0 to i64*
   %_loc_21 = bitcast i64* %_source_val21 to i64*

   ; #Copy_Word_Op at 76:9
   %_reg22_1 = bitcast i64* %_loc_21 to i64*
   %_source22 = getelementptr i64, i64* %_reg22_1, i64 0
   %_source_val22 = load i64, i64* %_source22
   %_loc_20 = bitcast i64 %_source_val22 to i64

   ; #Store_Address_Op at 76:14
   %_reg23_1 = inttoptr i64 %_loc_20 to i64*
   %_addr23 = getelementptr i64, i64* %_reg23_1, i64 1
   %_loc_18 = bitcast i64* %_addr23 to i64*

   ; #Copy_Address_Op at 76:26
   %_source_val24 = bitcast i64* %_formal_param_1 to i64*
   %_loc_22 = bitcast i64* %_source_val24 to i64*

   ; #Store_Address_Op at 76:14
   %_reg25_1 = bitcast i64* %_loc_22 to i64*
   %_addr25 = getelementptr i64, i64* %_reg25_1, i64 0
   %_loc_19 = bitcast i64* %_addr25 to i64*

   ; #Call_Op at 76:14
   ; inlining call on "<|="
   %_cur_td26 = bitcast i64* %_Static_Link to %struct.TD*
   %_nested_types_arr_ptr26 = getelementptr %struct.TD, %struct.TD* %_cur_td26, i32 0, i32 35
   %_nested_types_arr26 = load %struct.TD**, %struct.TD*** %_nested_types_arr_ptr26
   %_nested_td_ptr_ptr26 = getelementptr %struct.TD*, %struct.TD** %_nested_types_arr26, i32 2
   %_nested_td26 = load %struct.TD*, %struct.TD** %_nested_td_ptr_ptr26
   %_call26_Static_Link = bitcast %struct.TD* %_nested_td26 to i64*

   ; #Copy_Address_Op at 85:9
   %_source_val.I26.1 = bitcast i64* %_loc_18 to i64*
   %_loc_.I26_3 = bitcast i64* %_source_val.I26.1 to i64*

   ; #Store_Address_Op at 85:14
   %_reg.I26.2_1 = bitcast i64* %_loc_.I26_3 to i64*
   %_addr.I26.2 = getelementptr i64, i64* %_reg.I26.2_1, i64 0
   %_loc_.I26_1 = bitcast i64* %_addr.I26.2 to i64*

   ; #Copy_Address_Op at 85:23
   %_source_val.I26.3 = bitcast i64* %_loc_19 to i64*
   %_loc_.I26_4 = bitcast i64* %_source_val.I26.3 to i64*

   ; #Store_Address_Op at 85:14
   %_reg.I26.4_1 = bitcast i64* %_loc_.I26_4 to i64*
   %_addr.I26.4 = getelementptr i64, i64* %_reg.I26.4_1, i64 0
   %_loc_.I26_2 = bitcast i64* %_addr.I26.4 to i64*

   ; #Call_Op at 85:14
   %_cur_td.I26.5 = bitcast i64* %_call26_Static_Link to %struct.TD*
   %_nested_types_arr_ptr.I26.5 = getelementptr %struct.TD, %struct.TD* %_cur_td.I26.5, i32 0, i32 35
   %_nested_types_arr.I26.5 = load %struct.TD**, %struct.TD*** %_nested_types_arr_ptr.I26.5
   %_nested_td_ptr_ptr.I26.5 = getelementptr %struct.TD*, %struct.TD** %_nested_types_arr.I26.5, i32 2
   %_nested_td.I26.5 = load %struct.TD*, %struct.TD** %_nested_td_ptr_ptr.I26.5
   %_call.I26.5_Static_Link = bitcast %struct.TD* %_nested_td.I26.5 to i64*
   call void @"PSL.Containers.Basic_Map.$<|=$"(i64* %_loc_.I26_1, i64* %_loc_.I26_2, i64* %_Context, i64* %_call.I26.5_Static_Link)

   ; #Return_Op at 86:5


   ; #Return_Op at 77:5
   call void @_psc_finalize_stg_rgn(i64* %_Context, i64* %_Local_Area)
   ret void

}

define void @"PSL.Containers.Two_Way_Map.$<|=$.2"(i64* %_formal_param_0, i64* %_formal_param_1, i64* %_Context, i64* %_Static_Link) {
   %_Local_Area = alloca i64, i64 4
   %_sl = ptrtoint i64* %_Static_Link to i64
   store i64 %_sl, i64* %_Local_Area
   call void @_psc_initialize_stg_rgn(i64* %_Context, i64* %_Local_Area)
   %_Master = alloca i64, i64 3
   %_ms = ptrtoint i64* %_Master to i64
   %_store_ms = getelementptr i64, i64* %_Local_Area, i64 3
   store i64 %_ms, i64* %_store_ms

   %_loc_4 = alloca i64
   %_call9_Param_Area = alloca i64, i64 2

   
   ; #Copy_Address_Op at 82:25
   %_source_val1 = bitcast i64* %_formal_param_0 to i64*
   %_loc_2 = bitcast i64* %_source_val1 to i64*

   ; #Store_Address_Op at 82:9
   %_reg2_1 = bitcast i64* %_loc_2 to i64*
   %_addr2 = getelementptr i64, i64* %_reg2_1, i64 0
   %_loc_1 = bitcast i64* %_addr2 to i64*

   ; #Call_Op at 82:9
   %_call3_Static_Link = getelementptr i64, i64* %_Static_Link, i64 0
   call void @"PSL.Containers.Two_Way_Map.Add_Unreversed"(i64* %_loc_1, i64* %_Context, i64* %_call3_Static_Link)

   br label %_lbl4

_lbl4:
   ; #Declare_Obj_Op at 84:17

   ; #Store_Local_Null_Op at 84:17
   %_cur_td5 = bitcast i64* %_Static_Link to %struct.TD*
   %_nested_types_arr_ptr5 = getelementptr %struct.TD, %struct.TD* %_cur_td5, i32 0, i32 35
   %_nested_types_arr5 = load %struct.TD**, %struct.TD*** %_nested_types_arr_ptr5
   %_nested_td_ptr_ptr5 = getelementptr %struct.TD*, %struct.TD** %_nested_types_arr5, i32 3
   %_nested_td5 = load %struct.TD*, %struct.TD** %_nested_td_ptr_ptr5
   %_desc5 = bitcast %struct.TD* %_nested_td5 to i64*
   %_td5 = bitcast i64* %_desc5 to %struct.TD*
   %_is_small_ptr5 = getelementptr %struct.TD, %struct.TD* %_td5, i32 0, i32 13
   %_is_small5 = load i8, i8* %_is_small_ptr5
   %_is_small_bool5 = trunc i8 %_is_small5 to i1
   %_small_null_ptr5 = getelementptr %struct.TD, %struct.TD* %_td5, i32 0, i32 17
   %_small_null5 = load i64, i64* %_small_null_ptr5
   %_ctx5 = bitcast i64* %_Context to %struct.ExecCtx*
   %_large_null_ptr5 = getelementptr %struct.ExecCtx, %struct.ExecCtx* %_ctx5, i32 0, i32 1
   %_large_null5 = load i64, i64* %_large_null_ptr5
   %_null5= select i1 %_is_small_bool5, i64 %_small_null5, i64 %_large_null5
   %_dest_ptr5 = bitcast i64* %_loc_4 to i64* 
   store i64 %_null5, i64* %_dest_ptr5

   ; #Copy_Word_Op at 84:23
   %_source6 = bitcast i64* %_loc_4 to i64* 
   %_source_val6 = load i64, i64* %_source6
   %_loc_5 = bitcast i64 %_source_val6 to i64

   ; #Copy_Address_Op at 84:34
   %_source_val7 = bitcast i64* %_formal_param_1 to i64*
   %_loc_7 = bitcast i64* %_source_val7 to i64*

   ; #Store_Address_Op at 84:23
   %_reg8_1 = bitcast i64* %_loc_7 to i64*
   %_addr8 = getelementptr i64, i64* %_reg8_1, i64 0
   %_loc_6 = bitcast i64* %_addr8 to i64*

   ; #Call_Op at 84:23
   %_call9_Static_Link = getelementptr i64, i64* %_Static_Link, i64 0
   %_new_arg_addr9_0 = getelementptr i64, i64* %_call9_Param_Area, i64 0
   store i64 %_loc_5, i64* %_new_arg_addr9_0
   %_new_arg_addr9_1 = getelementptr i64, i64* %_call9_Param_Area, i64 1
   %_new_arg_addr9_1_ptr = bitcast i64* %_new_arg_addr9_1 to i64**
   store i64* %_loc_6, i64** %_new_arg_addr9_1_ptr
   call void @_psc_execute_compiled_nth_op_of_type(i64* %_Context, i64* %_call9_Param_Area, i64* %_call9_Static_Link, i16 3, i16 13)
   %_new_result_addr9_0 = getelementptr i64, i64* %_call9_Param_Area, i64 0
   %_new_result9_0 = load i64, i64* %_new_result_addr9_0
   %_result_addr9_0 = bitcast i64* %_loc_4 to i64* 
   store i64 %_new_result9_0, i64* %_result_addr9_0

   ; #Copy_Word_Op at 85:16
   %_source10 = bitcast i64* %_loc_4 to i64* 
   %_source_val10 = load i64, i64* %_source10
   %_loc_9 = bitcast i64 %_source_val10 to i64

   ; #Is_Null_Op at 85:16
   %_arg11 = bitcast i64 %_loc_9 to i64
   %_cur_td11 = bitcast i64* %_Static_Link to %struct.TD*
   %_nested_types_arr_ptr11 = getelementptr %struct.TD, %struct.TD* %_cur_td11, i32 0, i32 35
   %_nested_types_arr11 = load %struct.TD**, %struct.TD*** %_nested_types_arr_ptr11
   %_nested_td_ptr_ptr11 = getelementptr %struct.TD*, %struct.TD** %_nested_types_arr11, i32 3
   %_nested_td11 = load %struct.TD*, %struct.TD** %_nested_td_ptr_ptr11
   %_desc11 = bitcast %struct.TD* %_nested_td11 to i64*
   %_td11 = bitcast i64* %_desc11 to %struct.TD*
   %_is_small_ptr11 = getelementptr %struct.TD, %struct.TD* %_td11, i32 0, i32 13
   %_is_small11 = load i8, i8* %_is_small_ptr11
   %_is_small_bool11 = trunc i8 %_is_small11 to i1
   br i1 %_is_small_bool11, label %_is_small_lbl11, label %_is_large_lbl11
   _is_small_lbl11:
   %_small_null_ptr11 = getelementptr %struct.TD, %struct.TD* %_td11, i32 0, i32 17
   %_small_null11 = load i64, i64* %_small_null_ptr11
   %_small_result11 = icmp eq i64 %_arg11, %_small_null11
   br label %_join11
   _is_large_lbl11:
   %_val_no_reg11 = and i64 %_arg11, -4294967295
   %_large_result11 = icmp eq i64 %_val_no_reg11, -144115188075855871
   br label %_join11
   _join11:
   %_result_bit11 = phi i1 [%_small_result11, %_is_small_lbl11], [%_large_result11, %_is_large_lbl11]
   %_result_ext11 = zext i1 %_result_bit11 to i64
   %_loc_8 = bitcast i64 %_result_ext11 to i64

   ; #If_Op at 85:16
   %_if_source_val12 = bitcast i64 %_loc_8 to i64
   %_if_source_trunc12 = icmp eq i64 %_if_source_val12, 1
   br i1 %_if_source_trunc12, label %_lbl13, label %_lbl14

_lbl13:
   ; #Skip_Op at 86:17
   br label %_lbl19

_lbl14:
   ; #Copy_Address_Op at 88:13
   %_source_val14 = bitcast i64* %_formal_param_0 to i64*
   %_loc_12 = bitcast i64* %_source_val14 to i64*

   ; #Store_Address_Op at 88:13
   %_reg15_1 = bitcast i64* %_loc_12 to i64*
   %_addr15 = getelementptr i64, i64* %_reg15_1, i64 0
   %_loc_10 = bitcast i64* %_addr15 to i64*

   ; #Store_Address_Op at 88:13
   %_addr16 = bitcast i64* %_loc_4 to i64* 
   %_loc_11 = bitcast i64* %_addr16 to i64*

   ; #Call_Op at 88:13
   %_call17_Static_Link = getelementptr i64, i64* %_Static_Link, i64 0
   call void @"PSL.Containers.Two_Way_Map.$<|=$"(i64* %_loc_10, i64* %_loc_11, i64* %_Context, i64* %_call17_Static_Link)

   ; #Skip_Op at 83:9
   br label %_lbl4

_lbl19:
   ; #Return_Op at 90:5
   call void @_psc_finalize_stg_rgn(i64* %_Context, i64* %_Local_Area)
   ret void

}

define void @"PSL.Containers.Two_Way_Map.$-=$"(i64* %_formal_param_0, i64 %_formal_param_1, i64* %_Context, i64* %_Static_Link) {
   %_Local_Area = alloca i64, i64 4
   %_sl = ptrtoint i64* %_Static_Link to i64
   store i64 %_sl, i64* %_Local_Area

   %_output.I8 = alloca i64
   %_print_param.I8.5 = alloca i64
   %_output.I17 = alloca i64

   
   ; #Copy_Address_Op at 94:25
   %_source_val1 = bitcast i64* %_formal_param_0 to i64*
   %_loc_2 = bitcast i64* %_source_val1 to i64*

   ; #Store_Address_Op at 94:9
   %_reg2_1 = bitcast i64* %_loc_2 to i64*
   %_addr2 = getelementptr i64, i64* %_reg2_1, i64 0
   %_loc_1 = bitcast i64* %_addr2 to i64*

   ; #Call_Op at 94:9
   %_call3_Static_Link = getelementptr i64, i64* %_Static_Link, i64 0
   call void @"PSL.Containers.Two_Way_Map.Add_Unreversed"(i64* %_loc_1, i64* %_Context, i64* %_call3_Static_Link)

   ; #Copy_Word_Op at 95:12
   %_source_val4 = bitcast i64 %_formal_param_1 to i64
   %_loc_5 = bitcast i64 %_source_val4 to i64

   ; #Copy_Address_Op at 95:19
   %_source_val5 = bitcast i64* %_formal_param_0 to i64*
   %_loc_8 = bitcast i64* %_source_val5 to i64*

   ; #Copy_Word_Op at 95:19
   %_reg6_1 = bitcast i64* %_loc_8 to i64*
   %_source6 = getelementptr i64, i64* %_reg6_1, i64 0
   %_source_val6 = load i64, i64* %_source6
   %_loc_7 = bitcast i64 %_source_val6 to i64

   ; #Copy_Word_Op at 95:21
   %_reg7_1 = inttoptr i64 %_loc_7 to i64*
   %_source7 = getelementptr i64, i64* %_reg7_1, i64 1
   %_source_val7 = load i64, i64* %_source7
   %_loc_6 = bitcast i64 %_source_val7 to i64

   ; #Call_Op at 95:16
   ; inlining call on "in"
   %_cur_td8 = bitcast i64* %_Static_Link to %struct.TD*
   %_nested_types_arr_ptr8 = getelementptr %struct.TD, %struct.TD* %_cur_td8, i32 0, i32 35
   %_nested_types_arr8 = load %struct.TD**, %struct.TD*** %_nested_types_arr_ptr8
   %_nested_td_ptr_ptr8 = getelementptr %struct.TD*, %struct.TD** %_nested_types_arr8, i32 2
   %_nested_td8 = load %struct.TD*, %struct.TD** %_nested_td_ptr_ptr8
   %_call8_Static_Link = bitcast %struct.TD* %_nested_td8 to i64*

   ; #Copy_Word_Op at 102:16
   %_source_val.I8.1 = bitcast i64 %_loc_5 to i64
   %_loc_.I8_3 = bitcast i64 %_source_val.I8.1 to i64

   ; #Copy_Word_Op at 102:24
   %_source_val.I8.2 = bitcast i64 %_loc_6 to i64
   %_loc_.I8_4 = bitcast i64 %_source_val.I8.2 to i64

   ; #Call_Op at 102:21
   %_cur_td.I8.3 = bitcast i64* %_call8_Static_Link to %struct.TD*
   %_nested_types_arr_ptr.I8.3 = getelementptr %struct.TD, %struct.TD* %_cur_td.I8.3, i32 0, i32 35
   %_nested_types_arr.I8.3 = load %struct.TD**, %struct.TD*** %_nested_types_arr_ptr.I8.3
   %_nested_td_ptr_ptr.I8.3 = getelementptr %struct.TD*, %struct.TD** %_nested_types_arr.I8.3, i32 2
   %_nested_td.I8.3 = load %struct.TD*, %struct.TD** %_nested_td_ptr_ptr.I8.3
   %_call.I8.3_Static_Link = bitcast %struct.TD* %_nested_td.I8.3 to i64*
   %_new_result.I8.3_0 = call i64 @"PSL.Containers.Basic_Map.$in$"(i64 %_loc_.I8_3, i64 %_loc_.I8_4, i64* %_Context, i64* %_call.I8.3_Static_Link)
   %_loc_.I8_1 = bitcast i64 %_new_result.I8.3_0 to i64

   ; #Copy_Word_Op at 102:9
   %_source_val.I8.4 = bitcast i64 %_loc_.I8_1 to i64
   %_dest.I8.4 = bitcast i64* %_output.I8 to i64*
   store i64 %_source_val.I8.4, i64* %_dest.I8.4

   ; #Check_Not_Null_Op at 102:9
   %_arg_ptr.I8.5 = bitcast i64* %_output.I8 to i64*
   %_arg.I8.5 = load i64, i64* %_arg_ptr.I8.5
   %_is_null.I8.5 = icmp eq i64 %_arg.I8.5, shl (i64 1, i64 63)
   br i1 %_is_null.I8.5, label %_fail.I8.5, label %_lbl.I8_6
   _fail.I8.5:
   %_str_ptr_ptr.I8.5 = load i64*, i64** @$Strings
   %_str_ptr.I8.5 = getelementptr i64, i64* %_str_ptr_ptr.I8.5, i64 14
   %_assert_str.I8.5 = load i64, i64* %_str_ptr.I8.5
   store i64 %_assert_str.I8.5, i64* %_print_param.I8.5
   call void @_psc_runtime_message(i64* %_Context, i64* %_print_param.I8.5, i64* null)

   br label %_lbl.I8_6

_lbl.I8_6:
   ; #Return_Op at 102:9

   %_new_result8 = load i64, i64* %_output.I8
   %_loc_3 = bitcast i64 %_new_result8 to i64

   ; #If_Op at 95:16
   %_if_source_val9 = bitcast i64 %_loc_3 to i64
   %_if_source_trunc9 = icmp eq i64 %_if_source_val9, 1
   br i1 %_if_source_trunc9, label %_lbl10, label %_lbl25

_lbl10:
   ; #Copy_Address_Op at 96:12
   %_source_val10 = bitcast i64* %_formal_param_0 to i64*
   %_loc_12 = bitcast i64* %_source_val10 to i64*

   ; #Copy_Word_Op at 96:12
   %_reg11_1 = bitcast i64* %_loc_12 to i64*
   %_source11 = getelementptr i64, i64* %_reg11_1, i64 0
   %_source_val11 = load i64, i64* %_source11
   %_loc_11 = bitcast i64 %_source_val11 to i64

   ; #Store_Address_Op at 96:14
   %_reg12_1 = inttoptr i64 %_loc_11 to i64*
   %_addr12 = getelementptr i64, i64* %_reg12_1, i64 2
   %_loc_9 = bitcast i64* %_addr12 to i64*

   ; #Copy_Address_Op at 96:25
   %_source_val13 = bitcast i64* %_formal_param_0 to i64*
   %_loc_18 = bitcast i64* %_source_val13 to i64*

   ; #Copy_Word_Op at 96:25
   %_reg14_1 = bitcast i64* %_loc_18 to i64*
   %_source14 = getelementptr i64, i64* %_reg14_1, i64 0
   %_source_val14 = load i64, i64* %_source14
   %_loc_17 = bitcast i64 %_source_val14 to i64

   ; #Store_Address_Op at 96:27
   %_reg15_1 = inttoptr i64 %_loc_17 to i64*
   %_addr15 = getelementptr i64, i64* %_reg15_1, i64 1
   %_loc_15 = bitcast i64* %_addr15 to i64*

   ; #Copy_Word_Op at 96:35
   %_source_val16 = bitcast i64 %_formal_param_1 to i64
   %_loc_16 = bitcast i64 %_source_val16 to i64

   ; #Call_Op at 96:27
   ; inlining call on "indexing"
   %_cur_td17 = bitcast i64* %_Static_Link to %struct.TD*
   %_nested_types_arr_ptr17 = getelementptr %struct.TD, %struct.TD* %_cur_td17, i32 0, i32 35
   %_nested_types_arr17 = load %struct.TD**, %struct.TD*** %_nested_types_arr_ptr17
   %_nested_td_ptr_ptr17 = getelementptr %struct.TD*, %struct.TD** %_nested_types_arr17, i32 2
   %_nested_td17 = load %struct.TD*, %struct.TD** %_nested_td_ptr_ptr17
   %_call17_Static_Link = bitcast %struct.TD* %_nested_td17 to i64*

   ; #Copy_Address_Op at 121:16
   %_source_val.I17.1 = bitcast i64* %_loc_15 to i64*
   %_loc_.I17_7 = bitcast i64* %_source_val.I17.1 to i64*

   ; #Store_Address_Op at 121:18
   %_reg.I17.2_1 = bitcast i64* %_loc_.I17_7 to i64*
   %_addr.I17.2 = getelementptr i64, i64* %_reg.I17.2_1, i64 0
   %_loc_.I17_5 = bitcast i64* %_addr.I17.2 to i64*

   ; #Copy_Word_Op at 121:23
   %_source_val.I17.3 = bitcast i64 %_loc_16 to i64
   %_loc_.I17_6 = bitcast i64 %_source_val.I17.3 to i64

   ; #Call_Op at 121:18
   %_cur_td.I17.4 = bitcast i64* %_call17_Static_Link to %struct.TD*
   %_nested_types_arr_ptr.I17.4 = getelementptr %struct.TD, %struct.TD* %_cur_td.I17.4, i32 0, i32 35
   %_nested_types_arr.I17.4 = load %struct.TD**, %struct.TD*** %_nested_types_arr_ptr.I17.4
   %_nested_td_ptr_ptr.I17.4 = getelementptr %struct.TD*, %struct.TD** %_nested_types_arr.I17.4, i32 2
   %_nested_td.I17.4 = load %struct.TD*, %struct.TD** %_nested_td_ptr_ptr.I17.4
   %_call.I17.4_Static_Link = bitcast %struct.TD* %_nested_td.I17.4 to i64*
   %_new_result.I17.4_0 = call i64* @"PSL.Containers.Basic_Map.$indexing$"(i64* %_loc_.I17_5, i64 %_loc_.I17_6, i64* %_Context, i64* %_call.I17.4_Static_Link)
   %_loc_.I17_3 = bitcast i64* %_new_result.I17.4_0 to i64*

   ; #Copy_Word_Op at 121:18
   %_reg.I17.5_1 = bitcast i64* %_loc_.I17_3 to i64*
   %_source.I17.5 = getelementptr i64, i64* %_reg.I17.5_1, i64 0
   %_source_val.I17.5 = load i64, i64* %_source.I17.5
   %_loc_.I17_2 = bitcast i64 %_source_val.I17.5 to i64

   ; #Store_Address_Op at 121:9
   %_reg.I17.6_1 = inttoptr i64 %_loc_.I17_2 to i64*
   %_addr.I17.6 = getelementptr i64, i64* %_reg.I17.6_1, i64 2
   %_dest_ptr.I17.6_Orig = bitcast i64* %_output.I17 to i64*
   %_dest_ptr.I17.6 = bitcast i64* %_dest_ptr.I17.6_Orig to i64**
   store i64* %_addr.I17.6, i64** %_dest_ptr.I17.6

   ; #Return_Op at 121:9

   %_new_result_addr_ind17 = bitcast i64* %_output.I17 to i64**
   %_new_result17 = load i64*, i64** %_new_result_addr_ind17
   %_loc_13 = bitcast i64* %_new_result17 to i64*

   ; #Copy_Word_Op at 96:27
   %_reg18_1 = bitcast i64* %_loc_13 to i64*
   %_source18 = getelementptr i64, i64* %_reg18_1, i64 0
   %_source_val18 = load i64, i64* %_source18
   %_loc_10 = bitcast i64 %_source_val18 to i64

   ; #Call_Op at 96:14
   ; inlining call on "-="
   %_cur_td19 = bitcast i64* %_Static_Link to %struct.TD*
   %_nested_types_arr_ptr19 = getelementptr %struct.TD, %struct.TD* %_cur_td19, i32 0, i32 35
   %_nested_types_arr19 = load %struct.TD**, %struct.TD*** %_nested_types_arr_ptr19
   %_nested_td_ptr_ptr19 = getelementptr %struct.TD*, %struct.TD** %_nested_types_arr19, i32 5
   %_nested_td19 = load %struct.TD*, %struct.TD** %_nested_td_ptr_ptr19
   %_call19_Static_Link = bitcast %struct.TD* %_nested_td19 to i64*

   ; #Copy_Address_Op at 107:9
   %_source_val.I19.1 = bitcast i64* %_loc_9 to i64*
   %_loc_.I19_3 = bitcast i64* %_source_val.I19.1 to i64*

   ; #Store_Address_Op at 107:11
   %_reg.I19.2_1 = bitcast i64* %_loc_.I19_3 to i64*
   %_addr.I19.2 = getelementptr i64, i64* %_reg.I19.2_1, i64 0
   %_loc_.I19_1 = bitcast i64* %_addr.I19.2 to i64*

   ; #Copy_Word_Op at 107:19
   %_source_val.I19.3 = bitcast i64 %_loc_10 to i64
   %_loc_.I19_2 = bitcast i64 %_source_val.I19.3 to i64

   ; #Call_Op at 107:11
   %_cur_td.I19.4 = bitcast i64* %_call19_Static_Link to %struct.TD*
   %_nested_types_arr_ptr.I19.4 = getelementptr %struct.TD, %struct.TD* %_cur_td.I19.4, i32 0, i32 35
   %_nested_types_arr.I19.4 = load %struct.TD**, %struct.TD*** %_nested_types_arr_ptr.I19.4
   %_nested_td_ptr_ptr.I19.4 = getelementptr %struct.TD*, %struct.TD** %_nested_types_arr.I19.4, i32 2
   %_nested_td.I19.4 = load %struct.TD*, %struct.TD** %_nested_td_ptr_ptr.I19.4
   %_call.I19.4_Static_Link = bitcast %struct.TD* %_nested_td.I19.4 to i64*
   call void @"PSL.Containers.Basic_Map.$-=$"(i64* %_loc_.I19_1, i64 %_loc_.I19_2, i64* %_Context, i64* %_call.I19.4_Static_Link)

   ; #Return_Op at 108:5


   ; #Copy_Address_Op at 97:12
   %_source_val20 = bitcast i64* %_formal_param_0 to i64*
   %_loc_22 = bitcast i64* %_source_val20 to i64*

   ; #Copy_Word_Op at 97:12
   %_reg21_1 = bitcast i64* %_loc_22 to i64*
   %_source21 = getelementptr i64, i64* %_reg21_1, i64 0
   %_source_val21 = load i64, i64* %_source21
   %_loc_21 = bitcast i64 %_source_val21 to i64

   ; #Store_Address_Op at 97:14
   %_reg22_1 = inttoptr i64 %_loc_21 to i64*
   %_addr22 = getelementptr i64, i64* %_reg22_1, i64 1
   %_loc_19 = bitcast i64* %_addr22 to i64*

   ; #Copy_Word_Op at 97:25
   %_source_val23 = bitcast i64 %_formal_param_1 to i64
   %_loc_20 = bitcast i64 %_source_val23 to i64

   ; #Call_Op at 97:14
   ; inlining call on "-="
   %_cur_td24 = bitcast i64* %_Static_Link to %struct.TD*
   %_nested_types_arr_ptr24 = getelementptr %struct.TD, %struct.TD* %_cur_td24, i32 0, i32 35
   %_nested_types_arr24 = load %struct.TD**, %struct.TD*** %_nested_types_arr_ptr24
   %_nested_td_ptr_ptr24 = getelementptr %struct.TD*, %struct.TD** %_nested_types_arr24, i32 2
   %_nested_td24 = load %struct.TD*, %struct.TD** %_nested_td_ptr_ptr24
   %_call24_Static_Link = bitcast %struct.TD* %_nested_td24 to i64*

   ; #Copy_Address_Op at 107:9
   %_source_val.I24.1 = bitcast i64* %_loc_19 to i64*
   %_loc_.I24_3 = bitcast i64* %_source_val.I24.1 to i64*

   ; #Store_Address_Op at 107:11
   %_reg.I24.2_1 = bitcast i64* %_loc_.I24_3 to i64*
   %_addr.I24.2 = getelementptr i64, i64* %_reg.I24.2_1, i64 0
   %_loc_.I24_1 = bitcast i64* %_addr.I24.2 to i64*

   ; #Copy_Word_Op at 107:19
   %_source_val.I24.3 = bitcast i64 %_loc_20 to i64
   %_loc_.I24_2 = bitcast i64 %_source_val.I24.3 to i64

   ; #Call_Op at 107:11
   %_cur_td.I24.4 = bitcast i64* %_call24_Static_Link to %struct.TD*
   %_nested_types_arr_ptr.I24.4 = getelementptr %struct.TD, %struct.TD* %_cur_td.I24.4, i32 0, i32 35
   %_nested_types_arr.I24.4 = load %struct.TD**, %struct.TD*** %_nested_types_arr_ptr.I24.4
   %_nested_td_ptr_ptr.I24.4 = getelementptr %struct.TD*, %struct.TD** %_nested_types_arr.I24.4, i32 2
   %_nested_td.I24.4 = load %struct.TD*, %struct.TD** %_nested_td_ptr_ptr.I24.4
   %_call.I24.4_Static_Link = bitcast %struct.TD* %_nested_td.I24.4 to i64*
   call void @"PSL.Containers.Basic_Map.$-=$"(i64* %_loc_.I24_1, i64 %_loc_.I24_2, i64* %_Context, i64* %_call.I24.4_Static_Link)

   ; #Return_Op at 108:5


   br label %_lbl25

_lbl25:
   ; #Return_Op at 99:5
   ret void

}

define i64* @"PSL.Containers.Two_Way_Map.$var_indexing$"(i64* %_formal_param_1, i64 %_formal_param_2, i64* %_Context, i64* %_Static_Link) {
   %_Local_Area = alloca i64, i64 4
   %_sl = ptrtoint i64* %_Static_Link to i64
   store i64 %_sl, i64* %_Local_Area

   %_Param_Area = alloca i64
   %_call7_Param_Area = alloca i64, i64 3
   %_loc_.I14_4 = alloca i64
   %_output.I19 = alloca i64

   
   ; #Copy_Address_Op at 104:25
   %_source_val1 = bitcast i64* %_formal_param_1 to i64*
   %_loc_2 = bitcast i64* %_source_val1 to i64*

   ; #Store_Address_Op at 104:9
   %_reg2_1 = bitcast i64* %_loc_2 to i64*
   %_addr2 = getelementptr i64, i64* %_reg2_1, i64 0
   %_loc_1 = bitcast i64* %_addr2 to i64*

   ; #Call_Op at 104:9
   %_call3_Static_Link = getelementptr i64, i64* %_Static_Link, i64 0
   call void @"PSL.Containers.Two_Way_Map.Add_Unreversed"(i64* %_loc_1, i64* %_Context, i64* %_call3_Static_Link)

   ; #Copy_Word_Op at 105:12
   %_source_val4 = bitcast i64 %_formal_param_2 to i64
   %_loc_7 = bitcast i64 %_source_val4 to i64

   ; #Copy_Address_Op at 105:23
   %_source_val5 = bitcast i64* %_formal_param_1 to i64*
   %_loc_9 = bitcast i64* %_source_val5 to i64*

   ; #Copy_Word_Op at 105:23
   %_reg6_1 = bitcast i64* %_loc_9 to i64*
   %_source6 = getelementptr i64, i64* %_reg6_1, i64 0
   %_source_val6 = load i64, i64* %_source6
   %_loc_8 = bitcast i64 %_source_val6 to i64

   ; #Call_Op at 105:16
   %_call7_Static_Link = getelementptr i64, i64* %_Static_Link, i64 0
   %_new_arg_addr7_1 = getelementptr i64, i64* %_call7_Param_Area, i64 1
   store i64 %_loc_7, i64* %_new_arg_addr7_1
   %_new_arg_addr7_2 = getelementptr i64, i64* %_call7_Param_Area, i64 2
   store i64 %_loc_8, i64* %_new_arg_addr7_2
   call void @_psc_execute_compiled_nth_op_of_type(i64* %_Context, i64* %_call7_Param_Area, i64* %_call7_Static_Link, i16 3, i16 7)
   %_new_result_addr7_0 = getelementptr i64, i64* %_call7_Param_Area, i64 0
   %_new_result7_0 = load i64, i64* %_new_result_addr7_0
   %_loc_5 = bitcast i64 %_new_result7_0 to i64

   ; #Call_Op at 105:16
   %_n8 = bitcast i64 %_loc_5 to i64
   %_result8 = xor i64 1, %_n8
   %_loc_3 = bitcast i64 %_result8 to i64

   ; #If_Op at 105:16
   %_if_source_val9 = bitcast i64 %_loc_3 to i64
   %_if_source_trunc9 = icmp eq i64 %_if_source_val9, 1
   br i1 %_if_source_trunc9, label %_lbl10, label %_lbl15

_lbl10:
   ; #Copy_Address_Op at 107:13
   %_source_val10 = bitcast i64* %_formal_param_1 to i64*
   %_loc_13 = bitcast i64* %_source_val10 to i64*

   ; #Copy_Word_Op at 107:13
   %_reg11_1 = bitcast i64* %_loc_13 to i64*
   %_source11 = getelementptr i64, i64* %_reg11_1, i64 0
   %_source_val11 = load i64, i64* %_source11
   %_loc_12 = bitcast i64 %_source_val11 to i64

   ; #Store_Address_Op at 107:15
   %_reg12_1 = inttoptr i64 %_loc_12 to i64*
   %_addr12 = getelementptr i64, i64* %_reg12_1, i64 3
   %_loc_10 = bitcast i64* %_addr12 to i64*

   ; #Copy_Word_Op at 107:29
   %_source_val13 = bitcast i64 %_formal_param_2 to i64
   %_loc_11 = bitcast i64 %_source_val13 to i64

   ; #Call_Op at 107:15
   ; inlining call on "|="
   %_cur_td14 = bitcast i64* %_Static_Link to %struct.TD*
   %_nested_types_arr_ptr14 = getelementptr %struct.TD, %struct.TD* %_cur_td14, i32 0, i32 35
   %_nested_types_arr14 = load %struct.TD**, %struct.TD*** %_nested_types_arr_ptr14
   %_nested_td_ptr_ptr14 = getelementptr %struct.TD*, %struct.TD** %_nested_types_arr14, i32 4
   %_nested_td14 = load %struct.TD*, %struct.TD** %_nested_td_ptr_ptr14
   %_call14_Static_Link = bitcast %struct.TD* %_nested_td14 to i64*

   ; #Copy_Address_Op at 92:9
   %_source_val.I14.1 = bitcast i64* %_loc_10 to i64*
   %_loc_.I14_3 = bitcast i64* %_source_val.I14.1 to i64*

   ; #Store_Address_Op at 92:14
   %_reg.I14.2_1 = bitcast i64* %_loc_.I14_3 to i64*
   %_addr.I14.2 = getelementptr i64, i64* %_reg.I14.2_1, i64 0
   %_loc_.I14_1 = bitcast i64* %_addr.I14.2 to i64*

   ; #Declare_Obj_Op at 92:22

   ; #Copy_Word_Op at 92:30
   %_source_val.I14.4 = bitcast i64 %_loc_11 to i64
   %_dest.I14.4 = bitcast i64* %_loc_.I14_4 to i64* 
   store i64 %_source_val.I14.4, i64* %_dest.I14.4

   ; #Copy_Word_Op at 92:22
   %_source.I14.5 = bitcast i64* %_loc_.I14_4 to i64* 
   %_source_val.I14.5 = load i64, i64* %_source.I14.5
   %_loc_.I14_2 = bitcast i64 %_source_val.I14.5 to i64

   ; #Call_Op at 92:14
   %_cur_td.I14.6 = bitcast i64* %_call14_Static_Link to %struct.TD*
   %_nested_types_arr_ptr.I14.6 = getelementptr %struct.TD, %struct.TD* %_cur_td.I14.6, i32 0, i32 35
   %_nested_types_arr.I14.6 = load %struct.TD**, %struct.TD*** %_nested_types_arr_ptr.I14.6
   %_nested_td_ptr_ptr.I14.6 = getelementptr %struct.TD*, %struct.TD** %_nested_types_arr.I14.6, i32 1
   %_nested_td.I14.6 = load %struct.TD*, %struct.TD** %_nested_td_ptr_ptr.I14.6
   %_call.I14.6_Static_Link = bitcast %struct.TD* %_nested_td.I14.6 to i64*
   call void @"PSL.Containers.Basic_Map.$|=$"(i64* %_loc_.I14_1, i64 %_loc_.I14_2, i64* %_Context, i64* %_call.I14.6_Static_Link)

   ; #Return_Op at 93:5


   br label %_lbl15

_lbl15:
   ; #Copy_Address_Op at 109:31
   %_source_val15 = bitcast i64* %_formal_param_1 to i64*
   %_loc_20 = bitcast i64* %_source_val15 to i64*

   ; #Copy_Word_Op at 109:31
   %_reg16_1 = bitcast i64* %_loc_20 to i64*
   %_source16 = getelementptr i64, i64* %_reg16_1, i64 0
   %_source_val16 = load i64, i64* %_source16
   %_loc_19 = bitcast i64 %_source_val16 to i64

   ; #Store_Address_Op at 109:16
   %_reg17_1 = inttoptr i64 %_loc_19 to i64*
   %_addr17 = getelementptr i64, i64* %_reg17_1, i64 1
   %_loc_17 = bitcast i64* %_addr17 to i64*

   ; #Copy_Word_Op at 109:42
   %_source_val18 = bitcast i64 %_formal_param_2 to i64
   %_loc_18 = bitcast i64 %_source_val18 to i64

   ; #Call_Op at 109:16
   ; inlining call on "var_indexing"
   %_cur_td19 = bitcast i64* %_Static_Link to %struct.TD*
   %_nested_types_arr_ptr19 = getelementptr %struct.TD, %struct.TD* %_cur_td19, i32 0, i32 35
   %_nested_types_arr19 = load %struct.TD**, %struct.TD*** %_nested_types_arr_ptr19
   %_nested_td_ptr_ptr19 = getelementptr %struct.TD*, %struct.TD** %_nested_types_arr19, i32 2
   %_nested_td19 = load %struct.TD*, %struct.TD** %_nested_td_ptr_ptr19
   %_call19_Static_Link = bitcast %struct.TD* %_nested_td19 to i64*

   ; #Copy_Address_Op at 127:31
   %_source_val.I19.1 = bitcast i64* %_loc_17 to i64*
   %_loc_.I19_7 = bitcast i64* %_source_val.I19.1 to i64*

   ; #Store_Address_Op at 127:16
   %_reg.I19.2_1 = bitcast i64* %_loc_.I19_7 to i64*
   %_addr.I19.2 = getelementptr i64, i64* %_reg.I19.2_1, i64 0
   %_loc_.I19_5 = bitcast i64* %_addr.I19.2 to i64*

   ; #Copy_Word_Op at 127:39
   %_source_val.I19.3 = bitcast i64 %_loc_18 to i64
   %_loc_.I19_6 = bitcast i64 %_source_val.I19.3 to i64

   ; #Call_Op at 127:16
   %_cur_td.I19.4 = bitcast i64* %_call19_Static_Link to %struct.TD*
   %_nested_types_arr_ptr.I19.4 = getelementptr %struct.TD, %struct.TD* %_cur_td.I19.4, i32 0, i32 35
   %_nested_types_arr.I19.4 = load %struct.TD**, %struct.TD*** %_nested_types_arr_ptr.I19.4
   %_nested_td_ptr_ptr.I19.4 = getelementptr %struct.TD*, %struct.TD** %_nested_types_arr.I19.4, i32 2
   %_nested_td.I19.4 = load %struct.TD*, %struct.TD** %_nested_td_ptr_ptr.I19.4
   %_call.I19.4_Static_Link = bitcast %struct.TD* %_nested_td.I19.4 to i64*
   %_new_result.I19.4_0 = call i64* @"PSL.Containers.Basic_Map.$var_indexing$"(i64* %_loc_.I19_5, i64 %_loc_.I19_6, i64* %_Context, i64* %_call.I19.4_Static_Link)
   %_loc_.I19_3 = bitcast i64* %_new_result.I19.4_0 to i64*

   ; #Copy_Word_Op at 127:16
   %_reg.I19.5_1 = bitcast i64* %_loc_.I19_3 to i64*
   %_source.I19.5 = getelementptr i64, i64* %_reg.I19.5_1, i64 0
   %_source_val.I19.5 = load i64, i64* %_source.I19.5
   %_loc_.I19_2 = bitcast i64 %_source_val.I19.5 to i64

   ; #Store_Address_Op at 127:9
   %_reg.I19.6_1 = inttoptr i64 %_loc_.I19_2 to i64*
   %_addr.I19.6 = getelementptr i64, i64* %_reg.I19.6_1, i64 2
   %_dest_ptr.I19.6_Orig = bitcast i64* %_output.I19 to i64*
   %_dest_ptr.I19.6 = bitcast i64* %_dest_ptr.I19.6_Orig to i64**
   store i64* %_addr.I19.6, i64** %_dest_ptr.I19.6

   ; #Return_Op at 127:9

   %_new_result_addr_ind19 = bitcast i64* %_output.I19 to i64**
   %_new_result19 = load i64*, i64** %_new_result_addr_ind19
   %_loc_15 = bitcast i64* %_new_result19 to i64*

   ; #Store_Address_Op at 109:9
   %_reg20_1 = bitcast i64* %_loc_15 to i64*
   %_addr20 = getelementptr i64, i64* %_reg20_1, i64 0
   %_dest_ptr20_Orig = getelementptr i64, i64* %_Param_Area, i64 0
   %_dest_ptr20 = bitcast i64* %_dest_ptr20_Orig to i64**
   store i64* %_addr20, i64** %_dest_ptr20

   ; #Return_Op at 109:9
   %_result_reg_ptr21 = bitcast i64* %_Param_Area to i64**
   %_result_reg21 = load i64*, i64** %_result_reg_ptr21
   ret i64* %_result_reg21

}

define i64 @"PSL.Containers.Two_Way_Map.Key_Of"(i64 %_formal_param_1, i64 %_formal_param_2, i64* %_Context, i64* %_Static_Link, i64 %_inited_output) {
   %_Local_Area = alloca i64, i64 4
   %_sl = ptrtoint i64* %_Static_Link to i64
   store i64 %_sl, i64* %_Local_Area
   call void @_psc_initialize_stg_rgn(i64* %_Context, i64* %_Local_Area)
   %_Master = alloca i64, i64 3
   %_ms = ptrtoint i64* %_Master to i64
   %_store_ms = getelementptr i64, i64* %_Local_Area, i64 3
   store i64 %_ms, i64* %_store_ms

   %_Param_Area = alloca i64
   %_output.I4 = alloca i64
   %_print_param.I4.5 = alloca i64
   %_output.I9 = alloca i64
   %_loc_12 = alloca i64
   %_loc_15 = alloca i64
   %_output.I20 = alloca i64
   %_loc_.I20_1 = alloca i64
   %_loc_18 = alloca i64
   %_output.I28 = alloca i64
   %_call31_Param_Area = alloca i64, i64 3
   %_loc_33 = alloca i64
   %_output.I41 = alloca i64
   %_loc_.I41_1 = alloca i64

   store i64 %_inited_output, i64* %_Param_Area
   
   ; #Copy_Word_Op at 114:12
   %_source_val1 = bitcast i64 %_formal_param_2 to i64
   %_loc_3 = bitcast i64 %_source_val1 to i64

   ; #Copy_Word_Op at 114:21
   %_source_val2 = bitcast i64 %_formal_param_1 to i64
   %_loc_5 = bitcast i64 %_source_val2 to i64

   ; #Copy_Word_Op at 114:23
   %_reg3_1 = inttoptr i64 %_loc_5 to i64*
   %_source3 = getelementptr i64, i64* %_reg3_1, i64 2
   %_source_val3 = load i64, i64* %_source3
   %_loc_4 = bitcast i64 %_source_val3 to i64

   ; #Call_Op at 114:18
   ; inlining call on "in"
   %_cur_td4 = bitcast i64* %_Static_Link to %struct.TD*
   %_nested_types_arr_ptr4 = getelementptr %struct.TD, %struct.TD* %_cur_td4, i32 0, i32 35
   %_nested_types_arr4 = load %struct.TD**, %struct.TD*** %_nested_types_arr_ptr4
   %_nested_td_ptr_ptr4 = getelementptr %struct.TD*, %struct.TD** %_nested_types_arr4, i32 5
   %_nested_td4 = load %struct.TD*, %struct.TD** %_nested_td_ptr_ptr4
   %_call4_Static_Link = bitcast %struct.TD* %_nested_td4 to i64*

   ; #Copy_Word_Op at 102:16
   %_source_val.I4.1 = bitcast i64 %_loc_3 to i64
   %_loc_.I4_3 = bitcast i64 %_source_val.I4.1 to i64

   ; #Copy_Word_Op at 102:24
   %_source_val.I4.2 = bitcast i64 %_loc_4 to i64
   %_loc_.I4_4 = bitcast i64 %_source_val.I4.2 to i64

   ; #Call_Op at 102:21
   %_cur_td.I4.3 = bitcast i64* %_call4_Static_Link to %struct.TD*
   %_nested_types_arr_ptr.I4.3 = getelementptr %struct.TD, %struct.TD* %_cur_td.I4.3, i32 0, i32 35
   %_nested_types_arr.I4.3 = load %struct.TD**, %struct.TD*** %_nested_types_arr_ptr.I4.3
   %_nested_td_ptr_ptr.I4.3 = getelementptr %struct.TD*, %struct.TD** %_nested_types_arr.I4.3, i32 2
   %_nested_td.I4.3 = load %struct.TD*, %struct.TD** %_nested_td_ptr_ptr.I4.3
   %_call.I4.3_Static_Link = bitcast %struct.TD* %_nested_td.I4.3 to i64*
   %_new_result.I4.3_0 = call i64 @"PSL.Containers.Basic_Map.$in$"(i64 %_loc_.I4_3, i64 %_loc_.I4_4, i64* %_Context, i64* %_call.I4.3_Static_Link)
   %_loc_.I4_1 = bitcast i64 %_new_result.I4.3_0 to i64

   ; #Copy_Word_Op at 102:9
   %_source_val.I4.4 = bitcast i64 %_loc_.I4_1 to i64
   %_dest.I4.4 = bitcast i64* %_output.I4 to i64*
   store i64 %_source_val.I4.4, i64* %_dest.I4.4

   ; #Check_Not_Null_Op at 102:9
   %_arg_ptr.I4.5 = bitcast i64* %_output.I4 to i64*
   %_arg.I4.5 = load i64, i64* %_arg_ptr.I4.5
   %_is_null.I4.5 = icmp eq i64 %_arg.I4.5, shl (i64 1, i64 63)
   br i1 %_is_null.I4.5, label %_fail.I4.5, label %_lbl.I4_6
   _fail.I4.5:
   %_str_ptr_ptr.I4.5 = load i64*, i64** @$Strings
   %_str_ptr.I4.5 = getelementptr i64, i64* %_str_ptr_ptr.I4.5, i64 14
   %_assert_str.I4.5 = load i64, i64* %_str_ptr.I4.5
   store i64 %_assert_str.I4.5, i64* %_print_param.I4.5
   call void @_psc_runtime_message(i64* %_Context, i64* %_print_param.I4.5, i64* null)

   br label %_lbl.I4_6

_lbl.I4_6:
   ; #Return_Op at 102:9

   %_new_result4 = load i64, i64* %_output.I4
   %_loc_1 = bitcast i64 %_new_result4 to i64

   ; #If_Op at 114:18
   %_if_source_val5 = bitcast i64 %_loc_1 to i64
   %_if_source_trunc5 = icmp eq i64 %_if_source_val5, 1
   br i1 %_if_source_trunc5, label %_lbl6, label %_lbl13

_lbl6:
   ; #Copy_Word_Op at 116:19
   %_source_val6 = bitcast i64 %_formal_param_1 to i64
   %_loc_11 = bitcast i64 %_source_val6 to i64

   ; #Store_Address_Op at 116:21
   %_reg7_1 = inttoptr i64 %_loc_11 to i64*
   %_addr7 = getelementptr i64, i64* %_reg7_1, i64 2
   %_loc_9 = bitcast i64* %_addr7 to i64*

   ; #Copy_Word_Op at 116:29
   %_source_val8 = bitcast i64 %_formal_param_2 to i64
   %_loc_10 = bitcast i64 %_source_val8 to i64

   ; #Call_Op at 116:21
   ; inlining call on "indexing"
   %_cur_td9 = bitcast i64* %_Static_Link to %struct.TD*
   %_nested_types_arr_ptr9 = getelementptr %struct.TD, %struct.TD* %_cur_td9, i32 0, i32 35
   %_nested_types_arr9 = load %struct.TD**, %struct.TD*** %_nested_types_arr_ptr9
   %_nested_td_ptr_ptr9 = getelementptr %struct.TD*, %struct.TD** %_nested_types_arr9, i32 5
   %_nested_td9 = load %struct.TD*, %struct.TD** %_nested_td_ptr_ptr9
   %_call9_Static_Link = bitcast %struct.TD* %_nested_td9 to i64*

   ; #Copy_Address_Op at 121:16
   %_source_val.I9.1 = bitcast i64* %_loc_9 to i64*
   %_loc_.I9_7 = bitcast i64* %_source_val.I9.1 to i64*

   ; #Store_Address_Op at 121:18
   %_reg.I9.2_1 = bitcast i64* %_loc_.I9_7 to i64*
   %_addr.I9.2 = getelementptr i64, i64* %_reg.I9.2_1, i64 0
   %_loc_.I9_5 = bitcast i64* %_addr.I9.2 to i64*

   ; #Copy_Word_Op at 121:23
   %_source_val.I9.3 = bitcast i64 %_loc_10 to i64
   %_loc_.I9_6 = bitcast i64 %_source_val.I9.3 to i64

   ; #Call_Op at 121:18
   %_cur_td.I9.4 = bitcast i64* %_call9_Static_Link to %struct.TD*
   %_nested_types_arr_ptr.I9.4 = getelementptr %struct.TD, %struct.TD* %_cur_td.I9.4, i32 0, i32 35
   %_nested_types_arr.I9.4 = load %struct.TD**, %struct.TD*** %_nested_types_arr_ptr.I9.4
   %_nested_td_ptr_ptr.I9.4 = getelementptr %struct.TD*, %struct.TD** %_nested_types_arr.I9.4, i32 2
   %_nested_td.I9.4 = load %struct.TD*, %struct.TD** %_nested_td_ptr_ptr.I9.4
   %_call.I9.4_Static_Link = bitcast %struct.TD* %_nested_td.I9.4 to i64*
   %_new_result.I9.4_0 = call i64* @"PSL.Containers.Basic_Map.$indexing$"(i64* %_loc_.I9_5, i64 %_loc_.I9_6, i64* %_Context, i64* %_call.I9.4_Static_Link)
   %_loc_.I9_3 = bitcast i64* %_new_result.I9.4_0 to i64*

   ; #Copy_Word_Op at 121:18
   %_reg.I9.5_1 = bitcast i64* %_loc_.I9_3 to i64*
   %_source.I9.5 = getelementptr i64, i64* %_reg.I9.5_1, i64 0
   %_source_val.I9.5 = load i64, i64* %_source.I9.5
   %_loc_.I9_2 = bitcast i64 %_source_val.I9.5 to i64

   ; #Store_Address_Op at 121:9
   %_reg.I9.6_1 = inttoptr i64 %_loc_.I9_2 to i64*
   %_addr.I9.6 = getelementptr i64, i64* %_reg.I9.6_1, i64 2
   %_dest_ptr.I9.6_Orig = bitcast i64* %_output.I9 to i64*
   %_dest_ptr.I9.6 = bitcast i64* %_dest_ptr.I9.6_Orig to i64**
   store i64* %_addr.I9.6, i64** %_dest_ptr.I9.6

   ; #Return_Op at 121:9

   %_new_result_addr_ind9 = bitcast i64* %_output.I9 to i64**
   %_new_result9 = load i64*, i64** %_new_result_addr_ind9
   %_loc_7 = bitcast i64* %_new_result9 to i64*

   ; #Make_Copy_In_Stg_Rgn_Op at 116:21
   %_cur_td10 = bitcast i64* %_Static_Link to %struct.TD*
   %_param_arr_ptr10 = getelementptr %struct.TD, %struct.TD* %_cur_td10, i32 0, i32 26
   %_param_arr10 = load %struct.ParamInfo*, %struct.ParamInfo** %_param_arr_ptr10
   %_formal_td_ptr_ptr10 = getelementptr %struct.ParamInfo, %struct.ParamInfo* %_param_arr10, i32 0, i32 1, i32 0
   %_formal_td10 = load %struct.TD*, %struct.TD** %_formal_td_ptr_ptr10
   %_desc10 = bitcast %struct.TD* %_formal_td10 to i64*
   %_reg10_2 = bitcast i64* %_loc_7 to i64*
   %_source_ptr10 = getelementptr i64, i64* %_reg10_2, i64 0
   %_source10 = load i64, i64* %_source_ptr10
   %_existing_ptr10 = getelementptr i64, i64* %_Param_Area, i64 0
   %_existing_obj10 = load i64, i64* %_existing_ptr10
   %_result10 = call i64 @_psc_copy_object(i64* %_Context, i64* %_desc10, i64 %_source10, i64 %_existing_obj10)
   %_loc_6 = bitcast i64 %_result10 to i64

   ; #Copy_Word_Op at 116:12
   %_source_val11 = bitcast i64 %_loc_6 to i64
   %_dest11 = getelementptr i64, i64* %_Param_Area, i64 0
   store i64 %_source_val11, i64* %_dest11

   ; #Return_Op at 116:12
   call void @_psc_finalize_stg_rgn(i64* %_Context, i64* %_Local_Area)
   %_result_reg12 = load i64, i64* %_Param_Area
   ret i64 %_result_reg12

_lbl13:
   ; #Declare_Obj_Op at 119:16

   ; #Store_Local_Null_Op at 119:16
   %_cur_td14 = bitcast i64* %_Static_Link to %struct.TD*
   %_nested_types_arr_ptr14 = getelementptr %struct.TD, %struct.TD* %_cur_td14, i32 0, i32 35
   %_nested_types_arr14 = load %struct.TD**, %struct.TD*** %_nested_types_arr_ptr14
   %_nested_td_ptr_ptr14 = getelementptr %struct.TD*, %struct.TD** %_nested_types_arr14, i32 4
   %_nested_td14 = load %struct.TD*, %struct.TD** %_nested_td_ptr_ptr14
   %_desc14 = bitcast %struct.TD* %_nested_td14 to i64*
   %_td14 = bitcast i64* %_desc14 to %struct.TD*
   %_is_small_ptr14 = getelementptr %struct.TD, %struct.TD* %_td14, i32 0, i32 13
   %_is_small14 = load i8, i8* %_is_small_ptr14
   %_is_small_bool14 = trunc i8 %_is_small14 to i1
   %_small_null_ptr14 = getelementptr %struct.TD, %struct.TD* %_td14, i32 0, i32 17
   %_small_null14 = load i64, i64* %_small_null_ptr14
   %_ctx14 = bitcast i64* %_Context to %struct.ExecCtx*
   %_large_null_ptr14 = getelementptr %struct.ExecCtx, %struct.ExecCtx* %_ctx14, i32 0, i32 1
   %_large_null14 = load i64, i64* %_large_null_ptr14
   %_null14= select i1 %_is_small_bool14, i64 %_small_null14, i64 %_large_null14
   %_dest_ptr14 = bitcast i64* %_loc_12 to i64* 
   store i64 %_null14, i64* %_dest_ptr14

   ; #Copy_Word_Op at 119:21
   %_source_val15 = bitcast i64 %_formal_param_1 to i64
   %_loc_13 = bitcast i64 %_source_val15 to i64

   ; #Make_Copy_In_Stg_Rgn_Op at 119:23
   %_cur_td16 = bitcast i64* %_Static_Link to %struct.TD*
   %_nested_types_arr_ptr16 = getelementptr %struct.TD, %struct.TD* %_cur_td16, i32 0, i32 35
   %_nested_types_arr16 = load %struct.TD**, %struct.TD*** %_nested_types_arr_ptr16
   %_nested_td_ptr_ptr16 = getelementptr %struct.TD*, %struct.TD** %_nested_types_arr16, i32 4
   %_nested_td16 = load %struct.TD*, %struct.TD** %_nested_td_ptr_ptr16
   %_desc16 = bitcast %struct.TD* %_nested_td16 to i64*
   %_reg16_2 = inttoptr i64 %_loc_13 to i64*
   %_source_ptr16 = getelementptr i64, i64* %_reg16_2, i64 3
   %_source16 = load i64, i64* %_source_ptr16
   %_existing_ptr16 = bitcast i64* %_loc_12 to i64* 
   %_existing_obj16 = load i64, i64* %_existing_ptr16
   %_result16 = call i64 @_psc_copy_object(i64* %_Context, i64* %_desc16, i64 %_source16, i64 %_existing_obj16)
   %_dest_ptr16 = bitcast i64* %_loc_12 to i64* 
   store i64 %_result16, i64* %_dest_ptr16

   ; #Declare_Obj_Op at 119:16

   ; #Store_Null_Of_Same_Stg_Rgn_Op at 119:16
   %_cur_td18 = bitcast i64* %_Static_Link to %struct.TD*
   %_param_arr_ptr18 = getelementptr %struct.TD, %struct.TD* %_cur_td18, i32 0, i32 26
   %_param_arr18 = load %struct.ParamInfo*, %struct.ParamInfo** %_param_arr_ptr18
   %_formal_td_ptr_ptr18 = getelementptr %struct.ParamInfo, %struct.ParamInfo* %_param_arr18, i32 0, i32 1, i32 0
   %_formal_td18 = load %struct.TD*, %struct.TD** %_formal_td_ptr_ptr18
   %_desc18 = bitcast %struct.TD* %_formal_td18 to i64*
   %_source_ptr18 = bitcast i64* %_loc_12 to i64* 
   %_source18 = load i64, i64* %_source_ptr18
   %_td18 = bitcast i64* %_desc18 to %struct.TD*
   %_is_small_ptr18 = getelementptr %struct.TD, %struct.TD* %_td18, i32 0, i32 13
   %_is_small18 = load i8, i8* %_is_small_ptr18
   %_is_small_bool18 = trunc i8 %_is_small18 to i1
   br i1 %_is_small_bool18, label %_small_label18, label %_large_label18
   _small_label18:
   %_small_null_ptr18 = getelementptr %struct.TD, %struct.TD* %_td18, i32 0, i32 17
   %_small_null18 = load i64, i64* %_small_null_ptr18
   br label %_join_small_and_large18
   _large_label18:
   %_high_and_low_bits18 = and i64 %_source18, or (i64 shl (i64 1, i64 63), i64 1)
   %_is_special_bit18 = icmp eq i64 %_high_and_low_bits18, or (i64 shl (i64 1, i64 63), i64 1)
   br i1 %_is_special_bit18, label %_is_special_label18, label %_not_special_label18
   _is_special_label18:
   %_spcl_rgn_times2_18 = and i64 %_source18, 4294967295
   br label %_last_large_label18
   _not_special_label18:
   %_header_ptr18 = inttoptr i64 %_source18 to i64*
   %_hdr_of_src18 = load i64, i64* %_header_ptr18
   %_region_bits18 = and i64 %_hdr_of_src18, 4294901760
   %_normal_rgn_times2_18 = lshr i64 %_region_bits18, 15
   br label %_last_large_label18
   _last_large_label18:
   %_rgn_times2_18 = phi i64 [%_spcl_rgn_times2_18, %_is_special_label18], [%_normal_rgn_times2_18, %_not_special_label18]
   %_large_null18 = or i64 -144115188075855871, %_rgn_times2_18
   br label %_join_small_and_large18
   _join_small_and_large18:
   %_null18 = phi i64 [%_small_null18, %_small_label18],[%_large_null18, %_last_large_label18]
   %_loc_16 = bitcast i64 %_null18 to i64

   ; #Store_Address_Op at 119:23
   %_addr19 = bitcast i64* %_loc_12 to i64* 
   %_loc_17 = bitcast i64* %_addr19 to i64*

   ; #Call_Op at 119:23
   ; inlining call on Remove_Any
   store i64 %_loc_16, i64* %_output.I20
   %_cur_td20 = bitcast i64* %_Static_Link to %struct.TD*
   %_nested_types_arr_ptr20 = getelementptr %struct.TD, %struct.TD* %_cur_td20, i32 0, i32 35
   %_nested_types_arr20 = load %struct.TD**, %struct.TD*** %_nested_types_arr_ptr20
   %_nested_td_ptr_ptr20 = getelementptr %struct.TD*, %struct.TD** %_nested_types_arr20, i32 4
   %_nested_td20 = load %struct.TD*, %struct.TD** %_nested_td_ptr_ptr20
   %_call20_Static_Link = bitcast %struct.TD* %_nested_td20 to i64*

   ; #Declare_Obj_Op at 257:13

   ; #Store_Null_Of_Same_Stg_Rgn_Op at 257:32
   %_cur_td.I20.2 = bitcast i64* %_call20_Static_Link to %struct.TD*
   %_nested_types_arr_ptr.I20.2 = getelementptr %struct.TD, %struct.TD* %_cur_td.I20.2, i32 0, i32 35
   %_nested_types_arr.I20.2 = load %struct.TD**, %struct.TD*** %_nested_types_arr_ptr.I20.2
   %_nested_td_ptr_ptr.I20.2 = getelementptr %struct.TD*, %struct.TD** %_nested_types_arr.I20.2, i32 0
   %_nested_td.I20.2 = load %struct.TD*, %struct.TD** %_nested_td_ptr_ptr.I20.2
   %_desc.I20.2 = bitcast %struct.TD* %_nested_td.I20.2 to i64*
   %_source_ptr.I20.2 = bitcast i64* %_output.I20 to i64*
   %_source.I20.2 = load i64, i64* %_source_ptr.I20.2
   %_td.I20.2 = bitcast i64* %_desc.I20.2 to %struct.TD*
   %_is_small_ptr.I20.2 = getelementptr %struct.TD, %struct.TD* %_td.I20.2, i32 0, i32 13
   %_is_small.I20.2 = load i8, i8* %_is_small_ptr.I20.2
   %_is_small_bool.I20.2 = trunc i8 %_is_small.I20.2 to i1
   br i1 %_is_small_bool.I20.2, label %_small_label.I20.2, label %_large_label.I20.2
   _small_label.I20.2:
   %_small_null_ptr.I20.2 = getelementptr %struct.TD, %struct.TD* %_td.I20.2, i32 0, i32 17
   %_small_null.I20.2 = load i64, i64* %_small_null_ptr.I20.2
   br label %_join_small_and_large.I20.2
   _large_label.I20.2:
   %_high_and_low_bits.I20.2 = and i64 %_source.I20.2, or (i64 shl (i64 1, i64 63), i64 1)
   %_is_special_bit.I20.2 = icmp eq i64 %_high_and_low_bits.I20.2, or (i64 shl (i64 1, i64 63), i64 1)
   br i1 %_is_special_bit.I20.2, label %_is_special_label.I20.2, label %_not_special_label.I20.2
   _is_special_label.I20.2:
   %_spcl_rgn_times2_.I20.2 = and i64 %_source.I20.2, 4294967295
   br label %_last_large_label.I20.2
   _not_special_label.I20.2:
   %_header_ptr.I20.2 = inttoptr i64 %_source.I20.2 to i64*
   %_hdr_of_src.I20.2 = load i64, i64* %_header_ptr.I20.2
   %_region_bits.I20.2 = and i64 %_hdr_of_src.I20.2, 4294901760
   %_normal_rgn_times2_.I20.2 = lshr i64 %_region_bits.I20.2, 15
   br label %_last_large_label.I20.2
   _last_large_label.I20.2:
   %_rgn_times2_.I20.2 = phi i64 [%_spcl_rgn_times2_.I20.2, %_is_special_label.I20.2], [%_normal_rgn_times2_.I20.2, %_not_special_label.I20.2]
   %_large_null.I20.2 = or i64 -144115188075855871, %_rgn_times2_.I20.2
   br label %_join_small_and_large.I20.2
   _join_small_and_large.I20.2:
   %_null.I20.2 = phi i64 [%_small_null.I20.2, %_small_label.I20.2],[%_large_null.I20.2, %_last_large_label.I20.2]
   %_dest_ptr.I20.2 = bitcast i64* %_loc_.I20_1 to i64* 
   store i64 %_null.I20.2, i64* %_dest_ptr.I20.2

   ; #Copy_Word_Op at 257:42
   %_source.I20.3 = bitcast i64* %_loc_.I20_1 to i64* 
   %_source_val.I20.3 = load i64, i64* %_source.I20.3
   %_loc_.I20_2 = bitcast i64 %_source_val.I20.3 to i64

   ; #Copy_Address_Op at 257:53
   %_source_val.I20.4 = bitcast i64* %_loc_17 to i64*
   %_loc_.I20_4 = bitcast i64* %_source_val.I20.4 to i64*

   ; #Store_Address_Op at 257:42
   %_reg.I20.5_1 = bitcast i64* %_loc_.I20_4 to i64*
   %_addr.I20.5 = getelementptr i64, i64* %_reg.I20.5_1, i64 0
   %_loc_.I20_3 = bitcast i64* %_addr.I20.5 to i64*

   ; #Call_Op at 257:42
   %_cur_td.I20.6 = bitcast i64* %_call20_Static_Link to %struct.TD*
   %_nested_types_arr_ptr.I20.6 = getelementptr %struct.TD, %struct.TD* %_cur_td.I20.6, i32 0, i32 35
   %_nested_types_arr.I20.6 = load %struct.TD**, %struct.TD*** %_nested_types_arr_ptr.I20.6
   %_nested_td_ptr_ptr.I20.6 = getelementptr %struct.TD*, %struct.TD** %_nested_types_arr.I20.6, i32 1
   %_nested_td.I20.6 = load %struct.TD*, %struct.TD** %_nested_td_ptr_ptr.I20.6
   %_call.I20.6_Static_Link = bitcast %struct.TD* %_nested_td.I20.6 to i64*
   %_new_result.I20.6_0 = call i64 @"PSL.Containers.Basic_Map.Remove_Any"(i64* %_loc_.I20_3, i64* %_Context, i64* %_call.I20.6_Static_Link, i64 %_loc_.I20_2)
   %_result_addr.I20.6_0 = bitcast i64* %_loc_.I20_1 to i64* 
   store i64 %_new_result.I20.6_0, i64* %_result_addr.I20.6_0

   ; #Copy_Word_Op at 258:12
   %_source.I20.7 = bitcast i64* %_loc_.I20_1 to i64* 
   %_source_val.I20.7 = load i64, i64* %_source.I20.7
   %_loc_.I20_6 = bitcast i64 %_source_val.I20.7 to i64

   ; #Is_Null_Op at 258:12
   %_arg.I20.8 = bitcast i64 %_loc_.I20_6 to i64
   %_cur_td.I20.8 = bitcast i64* %_call20_Static_Link to %struct.TD*
   %_nested_types_arr_ptr.I20.8 = getelementptr %struct.TD, %struct.TD* %_cur_td.I20.8, i32 0, i32 35
   %_nested_types_arr.I20.8 = load %struct.TD**, %struct.TD*** %_nested_types_arr_ptr.I20.8
   %_nested_td_ptr_ptr.I20.8 = getelementptr %struct.TD*, %struct.TD** %_nested_types_arr.I20.8, i32 0
   %_nested_td.I20.8 = load %struct.TD*, %struct.TD** %_nested_td_ptr_ptr.I20.8
   %_desc.I20.8 = bitcast %struct.TD* %_nested_td.I20.8 to i64*
   %_td.I20.8 = bitcast i64* %_desc.I20.8 to %struct.TD*
   %_is_small_ptr.I20.8 = getelementptr %struct.TD, %struct.TD* %_td.I20.8, i32 0, i32 13
   %_is_small.I20.8 = load i8, i8* %_is_small_ptr.I20.8
   %_is_small_bool.I20.8 = trunc i8 %_is_small.I20.8 to i1
   br i1 %_is_small_bool.I20.8, label %_is_small_lbl.I20.8, label %_is_large_lbl.I20.8
   _is_small_lbl.I20.8:
   %_small_null_ptr.I20.8 = getelementptr %struct.TD, %struct.TD* %_td.I20.8, i32 0, i32 17
   %_small_null.I20.8 = load i64, i64* %_small_null_ptr.I20.8
   %_small_result.I20.8 = icmp eq i64 %_arg.I20.8, %_small_null.I20.8
   br label %_join.I20.8
   _is_large_lbl.I20.8:
   %_val_no_reg.I20.8 = and i64 %_arg.I20.8, -4294967295
   %_large_result.I20.8 = icmp eq i64 %_val_no_reg.I20.8, -144115188075855871
   br label %_join.I20.8
   _join.I20.8:
   %_result_bit.I20.8 = phi i1 [%_small_result.I20.8, %_is_small_lbl.I20.8], [%_large_result.I20.8, %_is_large_lbl.I20.8]
   %_result_ext.I20.8 = zext i1 %_result_bit.I20.8 to i64
   %_loc_.I20_5 = bitcast i64 %_result_ext.I20.8 to i64

   ; #If_Op at 258:12
   %_if_source_val.I20.9 = bitcast i64 %_loc_.I20_5 to i64
   %_if_source_trunc.I20.9 = icmp eq i64 %_if_source_val.I20.9, 1
   br i1 %_if_source_trunc.I20.9, label %_lbl.I20_10, label %_lbl.I20_13

_lbl.I20_10:
   ; #Store_Null_Of_Same_Stg_Rgn_Op at 259:20
   %_cur_td.I20.10 = bitcast i64* %_call20_Static_Link to %struct.TD*
   %_param_arr_ptr.I20.10 = getelementptr %struct.TD, %struct.TD* %_cur_td.I20.10, i32 0, i32 26
   %_param_arr.I20.10 = load %struct.ParamInfo*, %struct.ParamInfo** %_param_arr_ptr.I20.10
   %_formal_td_ptr_ptr.I20.10 = getelementptr %struct.ParamInfo, %struct.ParamInfo* %_param_arr.I20.10, i32 0, i32 1, i32 0
   %_formal_td.I20.10 = load %struct.TD*, %struct.TD** %_formal_td_ptr_ptr.I20.10
   %_desc.I20.10 = bitcast %struct.TD* %_formal_td.I20.10 to i64*
   %_source_ptr.I20.10 = bitcast i64* %_output.I20 to i64*
   %_source.I20.10 = load i64, i64* %_source_ptr.I20.10
   %_td.I20.10 = bitcast i64* %_desc.I20.10 to %struct.TD*
   %_is_small_ptr.I20.10 = getelementptr %struct.TD, %struct.TD* %_td.I20.10, i32 0, i32 13
   %_is_small.I20.10 = load i8, i8* %_is_small_ptr.I20.10
   %_is_small_bool.I20.10 = trunc i8 %_is_small.I20.10 to i1
   br i1 %_is_small_bool.I20.10, label %_small_label.I20.10, label %_large_label.I20.10
   _small_label.I20.10:
   %_small_null_ptr.I20.10 = getelementptr %struct.TD, %struct.TD* %_td.I20.10, i32 0, i32 17
   %_small_null.I20.10 = load i64, i64* %_small_null_ptr.I20.10
   br label %_join_small_and_large.I20.10
   _large_label.I20.10:
   %_high_and_low_bits.I20.10 = and i64 %_source.I20.10, or (i64 shl (i64 1, i64 63), i64 1)
   %_is_special_bit.I20.10 = icmp eq i64 %_high_and_low_bits.I20.10, or (i64 shl (i64 1, i64 63), i64 1)
   br i1 %_is_special_bit.I20.10, label %_is_special_label.I20.10, label %_not_special_label.I20.10
   _is_special_label.I20.10:
   %_spcl_rgn_times2_.I20.10 = and i64 %_source.I20.10, 4294967295
   br label %_last_large_label.I20.10
   _not_special_label.I20.10:
   %_header_ptr.I20.10 = inttoptr i64 %_source.I20.10 to i64*
   %_hdr_of_src.I20.10 = load i64, i64* %_header_ptr.I20.10
   %_region_bits.I20.10 = and i64 %_hdr_of_src.I20.10, 4294901760
   %_normal_rgn_times2_.I20.10 = lshr i64 %_region_bits.I20.10, 15
   br label %_last_large_label.I20.10
   _last_large_label.I20.10:
   %_rgn_times2_.I20.10 = phi i64 [%_spcl_rgn_times2_.I20.10, %_is_special_label.I20.10], [%_normal_rgn_times2_.I20.10, %_not_special_label.I20.10]
   %_large_null.I20.10 = or i64 -144115188075855871, %_rgn_times2_.I20.10
   br label %_join_small_and_large.I20.10
   _join_small_and_large.I20.10:
   %_null.I20.10 = phi i64 [%_small_null.I20.10, %_small_label.I20.10],[%_large_null.I20.10, %_last_large_label.I20.10]
   %_loc_.I20_7 = bitcast i64 %_null.I20.10 to i64

   ; #Copy_Word_Op at 259:13
   %_source_val.I20.11 = bitcast i64 %_loc_.I20_7 to i64
   %_dest.I20.11 = bitcast i64* %_output.I20 to i64*
   store i64 %_source_val.I20.11, i64* %_dest.I20.11

   ; #Return_Op at 259:13
   br label %_lbl.I20_14

_lbl.I20_13:
   ; #Move_Obj_Op at 261:13
   %_source_ptr.I20.13 = bitcast i64* %_loc_.I20_1 to i64* 
   %_dest_ptr.I20.13 = bitcast i64* %_output.I20 to i64*
   %_cur_td.I20.13 = bitcast i64* %_call20_Static_Link to %struct.TD*
   %_param_arr_ptr.I20.13 = getelementptr %struct.TD, %struct.TD* %_cur_td.I20.13, i32 0, i32 26
   %_param_arr.I20.13 = load %struct.ParamInfo*, %struct.ParamInfo** %_param_arr_ptr.I20.13
   %_formal_td_ptr_ptr.I20.13 = getelementptr %struct.ParamInfo, %struct.ParamInfo* %_param_arr.I20.13, i32 0, i32 1, i32 0
   %_formal_td.I20.13 = load %struct.TD*, %struct.TD** %_formal_td_ptr_ptr.I20.13
   %_desc.I20.13 = bitcast %struct.TD* %_formal_td.I20.13 to i64*
   call void @_psc_move_object(i64* %_Context, i64* %_desc.I20.13, i64* %_dest_ptr.I20.13, i64* %_source_ptr.I20.13)

   br label %_lbl.I20_14

_lbl.I20_14:
   ; #Return_Op at 263:5

   %_new_result20 = load i64, i64* %_output.I20
   %_result_addr20 = bitcast i64* %_loc_15 to i64* 
   store i64 %_new_result20, i64* %_result_addr20

   ; #Not_Null_Op at 119:23
   %_arg_ptr21 = bitcast i64* %_loc_15 to i64* 
   %_arg21 = load i64, i64* %_arg_ptr21
   %_cur_td21 = bitcast i64* %_Static_Link to %struct.TD*
   %_param_arr_ptr21 = getelementptr %struct.TD, %struct.TD* %_cur_td21, i32 0, i32 26
   %_param_arr21 = load %struct.ParamInfo*, %struct.ParamInfo** %_param_arr_ptr21
   %_formal_td_ptr_ptr21 = getelementptr %struct.ParamInfo, %struct.ParamInfo* %_param_arr21, i32 0, i32 1, i32 0
   %_formal_td21 = load %struct.TD*, %struct.TD** %_formal_td_ptr_ptr21
   %_desc21 = bitcast %struct.TD* %_formal_td21 to i64*
   %_td21 = bitcast i64* %_desc21 to %struct.TD*
   %_is_small_ptr21 = getelementptr %struct.TD, %struct.TD* %_td21, i32 0, i32 13
   %_is_small21 = load i8, i8* %_is_small_ptr21
   %_is_small_bool21 = trunc i8 %_is_small21 to i1
   br i1 %_is_small_bool21, label %_is_small_lbl21, label %_is_large_lbl21
   _is_small_lbl21:
   %_small_null_ptr21 = getelementptr %struct.TD, %struct.TD* %_td21, i32 0, i32 17
   %_small_null21 = load i64, i64* %_small_null_ptr21
   %_small_result21 = icmp ne i64 %_arg21, %_small_null21
   br label %_join21
   _is_large_lbl21:
   %_val_no_reg21 = and i64 %_arg21, -4294967295
   %_large_result21 = icmp ne i64 %_val_no_reg21, -144115188075855871
   br label %_join21
   _join21:
   %_result_bit21 = phi i1 [%_small_result21, %_is_small_lbl21], [%_large_result21, %_is_large_lbl21]
   %_result_ext21 = zext i1 %_result_bit21 to i64
   %_loc_14 = bitcast i64 %_result_ext21 to i64

   ; #If_Op at 119:16
   %_if_source_val22 = bitcast i64 %_loc_14 to i64
   %_if_source_trunc22 = icmp eq i64 %_if_source_val22, 1
   br i1 %_if_source_trunc22, label %_lbl23, label %_lbl46

_lbl23:
   ; #Declare_Obj_Op at 119:12

   ; #Copy_Word_Op at 119:12
   %_source24 = bitcast i64* %_loc_15 to i64* 
   %_source_val24 = load i64, i64* %_source24
   %_dest24 = bitcast i64* %_loc_18 to i64* 
   store i64 %_source_val24, i64* %_dest24

   br label %_lbl25

_lbl25:
   ; #Copy_Word_Op at 120:19
   %_source_val25 = bitcast i64 %_formal_param_1 to i64
   %_loc_30 = bitcast i64 %_source_val25 to i64

   ; #Store_Address_Op at 120:21
   %_reg26_1 = inttoptr i64 %_loc_30 to i64*
   %_addr26 = getelementptr i64, i64* %_reg26_1, i64 1
   %_loc_28 = bitcast i64* %_addr26 to i64*

   ; #Copy_Word_Op at 120:29
   %_source27 = bitcast i64* %_loc_18 to i64* 
   %_source_val27 = load i64, i64* %_source27
   %_loc_29 = bitcast i64 %_source_val27 to i64

   ; #Call_Op at 120:21
   ; inlining call on "indexing"
   %_cur_td28 = bitcast i64* %_Static_Link to %struct.TD*
   %_nested_types_arr_ptr28 = getelementptr %struct.TD, %struct.TD* %_cur_td28, i32 0, i32 35
   %_nested_types_arr28 = load %struct.TD**, %struct.TD*** %_nested_types_arr_ptr28
   %_nested_td_ptr_ptr28 = getelementptr %struct.TD*, %struct.TD** %_nested_types_arr28, i32 2
   %_nested_td28 = load %struct.TD*, %struct.TD** %_nested_td_ptr_ptr28
   %_call28_Static_Link = bitcast %struct.TD* %_nested_td28 to i64*

   ; #Copy_Address_Op at 121:16
   %_source_val.I28.1 = bitcast i64* %_loc_28 to i64*
   %_loc_.I28_7 = bitcast i64* %_source_val.I28.1 to i64*

   ; #Store_Address_Op at 121:18
   %_reg.I28.2_1 = bitcast i64* %_loc_.I28_7 to i64*
   %_addr.I28.2 = getelementptr i64, i64* %_reg.I28.2_1, i64 0
   %_loc_.I28_5 = bitcast i64* %_addr.I28.2 to i64*

   ; #Copy_Word_Op at 121:23
   %_source_val.I28.3 = bitcast i64 %_loc_29 to i64
   %_loc_.I28_6 = bitcast i64 %_source_val.I28.3 to i64

   ; #Call_Op at 121:18
   %_cur_td.I28.4 = bitcast i64* %_call28_Static_Link to %struct.TD*
   %_nested_types_arr_ptr.I28.4 = getelementptr %struct.TD, %struct.TD* %_cur_td.I28.4, i32 0, i32 35
   %_nested_types_arr.I28.4 = load %struct.TD**, %struct.TD*** %_nested_types_arr_ptr.I28.4
   %_nested_td_ptr_ptr.I28.4 = getelementptr %struct.TD*, %struct.TD** %_nested_types_arr.I28.4, i32 2
   %_nested_td.I28.4 = load %struct.TD*, %struct.TD** %_nested_td_ptr_ptr.I28.4
   %_call.I28.4_Static_Link = bitcast %struct.TD* %_nested_td.I28.4 to i64*
   %_new_result.I28.4_0 = call i64* @"PSL.Containers.Basic_Map.$indexing$"(i64* %_loc_.I28_5, i64 %_loc_.I28_6, i64* %_Context, i64* %_call.I28.4_Static_Link)
   %_loc_.I28_3 = bitcast i64* %_new_result.I28.4_0 to i64*

   ; #Copy_Word_Op at 121:18
   %_reg.I28.5_1 = bitcast i64* %_loc_.I28_3 to i64*
   %_source.I28.5 = getelementptr i64, i64* %_reg.I28.5_1, i64 0
   %_source_val.I28.5 = load i64, i64* %_source.I28.5
   %_loc_.I28_2 = bitcast i64 %_source_val.I28.5 to i64

   ; #Store_Address_Op at 121:9
   %_reg.I28.6_1 = inttoptr i64 %_loc_.I28_2 to i64*
   %_addr.I28.6 = getelementptr i64, i64* %_reg.I28.6_1, i64 2
   %_dest_ptr.I28.6_Orig = bitcast i64* %_output.I28 to i64*
   %_dest_ptr.I28.6 = bitcast i64* %_dest_ptr.I28.6_Orig to i64**
   store i64* %_addr.I28.6, i64** %_dest_ptr.I28.6

   ; #Return_Op at 121:9

   %_new_result_addr_ind28 = bitcast i64* %_output.I28 to i64**
   %_new_result28 = load i64*, i64** %_new_result_addr_ind28
   %_loc_26 = bitcast i64* %_new_result28 to i64*

   ; #Copy_Word_Op at 120:21
   %_reg29_1 = bitcast i64* %_loc_26 to i64*
   %_source29 = getelementptr i64, i64* %_reg29_1, i64 0
   %_source_val29 = load i64, i64* %_source29
   %_loc_24 = bitcast i64 %_source_val29 to i64

   ; #Copy_Word_Op at 120:35
   %_source_val30 = bitcast i64 %_formal_param_2 to i64
   %_loc_25 = bitcast i64 %_source_val30 to i64

   ; #Call_Op at 120:32
   %_cur_td31 = bitcast i64* %_Static_Link to %struct.TD*
   %_param_arr_ptr31 = getelementptr %struct.TD, %struct.TD* %_cur_td31, i32 0, i32 26
   %_param_arr31 = load %struct.ParamInfo*, %struct.ParamInfo** %_param_arr_ptr31
   %_formal_td_ptr_ptr31 = getelementptr %struct.ParamInfo, %struct.ParamInfo* %_param_arr31, i32 1, i32 1, i32 0
   %_formal_td31 = load %struct.TD*, %struct.TD** %_formal_td_ptr_ptr31
   %_call31_Static_Link = bitcast %struct.TD* %_formal_td31 to i64*
   %_new_arg_addr31_1 = getelementptr i64, i64* %_call31_Param_Area, i64 1
   store i64 %_loc_24, i64* %_new_arg_addr31_1
   %_new_arg_addr31_2 = getelementptr i64, i64* %_call31_Param_Area, i64 2
   store i64 %_loc_25, i64* %_new_arg_addr31_2
   call void @_psc_execute_compiled_nth_op_of_type(i64* %_Context, i64* %_call31_Param_Area, i64* %_call31_Static_Link, i16 3, i16 3)
   %_new_result_addr31_0 = getelementptr i64, i64* %_call31_Param_Area, i64 0
   %_new_result31_0 = load i64, i64* %_new_result_addr31_0
   %_loc_21 = bitcast i64 %_new_result31_0 to i64

   ; #Store_Int_Lit_Op at 120:32
   %_loc_22 = bitcast i64 2 to i64

   ; #Call_Op at 120:32
   %_first_arg33 = bitcast i64 %_loc_21 to i64
   %_secon_arg33 = bitcast i64 %_loc_22 to i64
   %_mask_shifted33 = lshr i64 %_secon_arg33, %_first_arg33
   %_resul33 = and i64 1, %_mask_shifted33
   %_loc_19 = bitcast i64 %_resul33 to i64

   ; #If_Op at 120:32
   %_if_source_val34 = bitcast i64 %_loc_19 to i64
   %_if_source_trunc34 = icmp eq i64 %_if_source_val34, 1
   br i1 %_if_source_trunc34, label %_lbl35, label %_lbl38

_lbl35:
   ; #Make_Copy_In_Stg_Rgn_Op at 121:27
   %_cur_td35 = bitcast i64* %_Static_Link to %struct.TD*
   %_param_arr_ptr35 = getelementptr %struct.TD, %struct.TD* %_cur_td35, i32 0, i32 26
   %_param_arr35 = load %struct.ParamInfo*, %struct.ParamInfo** %_param_arr_ptr35
   %_formal_td_ptr_ptr35 = getelementptr %struct.ParamInfo, %struct.ParamInfo* %_param_arr35, i32 0, i32 1, i32 0
   %_formal_td35 = load %struct.TD*, %struct.TD** %_formal_td_ptr_ptr35
   %_desc35 = bitcast %struct.TD* %_formal_td35 to i64*
   %_source_ptr35 = bitcast i64* %_loc_18 to i64* 
   %_source35 = load i64, i64* %_source_ptr35
   %_existing_ptr35 = getelementptr i64, i64* %_Param_Area, i64 0
   %_existing_obj35 = load i64, i64* %_existing_ptr35
   %_result35 = call i64 @_psc_copy_object(i64* %_Context, i64* %_desc35, i64 %_source35, i64 %_existing_obj35)
   %_loc_31 = bitcast i64 %_result35 to i64

   ; #Copy_Word_Op at 121:20
   %_source_val36 = bitcast i64 %_loc_31 to i64
   %_dest36 = getelementptr i64, i64* %_Param_Area, i64 0
   store i64 %_source_val36, i64* %_dest36

   ; #Return_Op at 121:20
   call void @_psc_finalize_stg_rgn(i64* %_Context, i64* %_Local_Area)
   %_result_reg37 = load i64, i64* %_Param_Area
   ret i64 %_result_reg37

_lbl38:
   ; #Declare_Obj_Op at 119:16

   ; #Store_Null_Of_Same_Stg_Rgn_Op at 119:16
   %_cur_td39 = bitcast i64* %_Static_Link to %struct.TD*
   %_param_arr_ptr39 = getelementptr %struct.TD, %struct.TD* %_cur_td39, i32 0, i32 26
   %_param_arr39 = load %struct.ParamInfo*, %struct.ParamInfo** %_param_arr_ptr39
   %_formal_td_ptr_ptr39 = getelementptr %struct.ParamInfo, %struct.ParamInfo* %_param_arr39, i32 0, i32 1, i32 0
   %_formal_td39 = load %struct.TD*, %struct.TD** %_formal_td_ptr_ptr39
   %_desc39 = bitcast %struct.TD* %_formal_td39 to i64*
   %_source_ptr39 = bitcast i64* %_loc_12 to i64* 
   %_source39 = load i64, i64* %_source_ptr39
   %_td39 = bitcast i64* %_desc39 to %struct.TD*
   %_is_small_ptr39 = getelementptr %struct.TD, %struct.TD* %_td39, i32 0, i32 13
   %_is_small39 = load i8, i8* %_is_small_ptr39
   %_is_small_bool39 = trunc i8 %_is_small39 to i1
   br i1 %_is_small_bool39, label %_small_label39, label %_large_label39
   _small_label39:
   %_small_null_ptr39 = getelementptr %struct.TD, %struct.TD* %_td39, i32 0, i32 17
   %_small_null39 = load i64, i64* %_small_null_ptr39
   br label %_join_small_and_large39
   _large_label39:
   %_high_and_low_bits39 = and i64 %_source39, or (i64 shl (i64 1, i64 63), i64 1)
   %_is_special_bit39 = icmp eq i64 %_high_and_low_bits39, or (i64 shl (i64 1, i64 63), i64 1)
   br i1 %_is_special_bit39, label %_is_special_label39, label %_not_special_label39
   _is_special_label39:
   %_spcl_rgn_times2_39 = and i64 %_source39, 4294967295
   br label %_last_large_label39
   _not_special_label39:
   %_header_ptr39 = inttoptr i64 %_source39 to i64*
   %_hdr_of_src39 = load i64, i64* %_header_ptr39
   %_region_bits39 = and i64 %_hdr_of_src39, 4294901760
   %_normal_rgn_times2_39 = lshr i64 %_region_bits39, 15
   br label %_last_large_label39
   _last_large_label39:
   %_rgn_times2_39 = phi i64 [%_spcl_rgn_times2_39, %_is_special_label39], [%_normal_rgn_times2_39, %_not_special_label39]
   %_large_null39 = or i64 -144115188075855871, %_rgn_times2_39
   br label %_join_small_and_large39
   _join_small_and_large39:
   %_null39 = phi i64 [%_small_null39, %_small_label39],[%_large_null39, %_last_large_label39]
   %_loc_34 = bitcast i64 %_null39 to i64

   ; #Store_Address_Op at 119:23
   %_addr40 = bitcast i64* %_loc_12 to i64* 
   %_loc_35 = bitcast i64* %_addr40 to i64*

   ; #Call_Op at 119:23
   ; inlining call on Remove_Any
   store i64 %_loc_34, i64* %_output.I41
   %_cur_td41 = bitcast i64* %_Static_Link to %struct.TD*
   %_nested_types_arr_ptr41 = getelementptr %struct.TD, %struct.TD* %_cur_td41, i32 0, i32 35
   %_nested_types_arr41 = load %struct.TD**, %struct.TD*** %_nested_types_arr_ptr41
   %_nested_td_ptr_ptr41 = getelementptr %struct.TD*, %struct.TD** %_nested_types_arr41, i32 4
   %_nested_td41 = load %struct.TD*, %struct.TD** %_nested_td_ptr_ptr41
   %_call41_Static_Link = bitcast %struct.TD* %_nested_td41 to i64*

   ; #Declare_Obj_Op at 257:13

   ; #Store_Null_Of_Same_Stg_Rgn_Op at 257:32
   %_cur_td.I41.2 = bitcast i64* %_call41_Static_Link to %struct.TD*
   %_nested_types_arr_ptr.I41.2 = getelementptr %struct.TD, %struct.TD* %_cur_td.I41.2, i32 0, i32 35
   %_nested_types_arr.I41.2 = load %struct.TD**, %struct.TD*** %_nested_types_arr_ptr.I41.2
   %_nested_td_ptr_ptr.I41.2 = getelementptr %struct.TD*, %struct.TD** %_nested_types_arr.I41.2, i32 0
   %_nested_td.I41.2 = load %struct.TD*, %struct.TD** %_nested_td_ptr_ptr.I41.2
   %_desc.I41.2 = bitcast %struct.TD* %_nested_td.I41.2 to i64*
   %_source_ptr.I41.2 = bitcast i64* %_output.I41 to i64*
   %_source.I41.2 = load i64, i64* %_source_ptr.I41.2
   %_td.I41.2 = bitcast i64* %_desc.I41.2 to %struct.TD*
   %_is_small_ptr.I41.2 = getelementptr %struct.TD, %struct.TD* %_td.I41.2, i32 0, i32 13
   %_is_small.I41.2 = load i8, i8* %_is_small_ptr.I41.2
   %_is_small_bool.I41.2 = trunc i8 %_is_small.I41.2 to i1
   br i1 %_is_small_bool.I41.2, label %_small_label.I41.2, label %_large_label.I41.2
   _small_label.I41.2:
   %_small_null_ptr.I41.2 = getelementptr %struct.TD, %struct.TD* %_td.I41.2, i32 0, i32 17
   %_small_null.I41.2 = load i64, i64* %_small_null_ptr.I41.2
   br label %_join_small_and_large.I41.2
   _large_label.I41.2:
   %_high_and_low_bits.I41.2 = and i64 %_source.I41.2, or (i64 shl (i64 1, i64 63), i64 1)
   %_is_special_bit.I41.2 = icmp eq i64 %_high_and_low_bits.I41.2, or (i64 shl (i64 1, i64 63), i64 1)
   br i1 %_is_special_bit.I41.2, label %_is_special_label.I41.2, label %_not_special_label.I41.2
   _is_special_label.I41.2:
   %_spcl_rgn_times2_.I41.2 = and i64 %_source.I41.2, 4294967295
   br label %_last_large_label.I41.2
   _not_special_label.I41.2:
   %_header_ptr.I41.2 = inttoptr i64 %_source.I41.2 to i64*
   %_hdr_of_src.I41.2 = load i64, i64* %_header_ptr.I41.2
   %_region_bits.I41.2 = and i64 %_hdr_of_src.I41.2, 4294901760
   %_normal_rgn_times2_.I41.2 = lshr i64 %_region_bits.I41.2, 15
   br label %_last_large_label.I41.2
   _last_large_label.I41.2:
   %_rgn_times2_.I41.2 = phi i64 [%_spcl_rgn_times2_.I41.2, %_is_special_label.I41.2], [%_normal_rgn_times2_.I41.2, %_not_special_label.I41.2]
   %_large_null.I41.2 = or i64 -144115188075855871, %_rgn_times2_.I41.2
   br label %_join_small_and_large.I41.2
   _join_small_and_large.I41.2:
   %_null.I41.2 = phi i64 [%_small_null.I41.2, %_small_label.I41.2],[%_large_null.I41.2, %_last_large_label.I41.2]
   %_dest_ptr.I41.2 = bitcast i64* %_loc_.I41_1 to i64* 
   store i64 %_null.I41.2, i64* %_dest_ptr.I41.2

   ; #Copy_Word_Op at 257:42
   %_source.I41.3 = bitcast i64* %_loc_.I41_1 to i64* 
   %_source_val.I41.3 = load i64, i64* %_source.I41.3
   %_loc_.I41_2 = bitcast i64 %_source_val.I41.3 to i64

   ; #Copy_Address_Op at 257:53
   %_source_val.I41.4 = bitcast i64* %_loc_35 to i64*
   %_loc_.I41_4 = bitcast i64* %_source_val.I41.4 to i64*

   ; #Store_Address_Op at 257:42
   %_reg.I41.5_1 = bitcast i64* %_loc_.I41_4 to i64*
   %_addr.I41.5 = getelementptr i64, i64* %_reg.I41.5_1, i64 0
   %_loc_.I41_3 = bitcast i64* %_addr.I41.5 to i64*

   ; #Call_Op at 257:42
   %_cur_td.I41.6 = bitcast i64* %_call41_Static_Link to %struct.TD*
   %_nested_types_arr_ptr.I41.6 = getelementptr %struct.TD, %struct.TD* %_cur_td.I41.6, i32 0, i32 35
   %_nested_types_arr.I41.6 = load %struct.TD**, %struct.TD*** %_nested_types_arr_ptr.I41.6
   %_nested_td_ptr_ptr.I41.6 = getelementptr %struct.TD*, %struct.TD** %_nested_types_arr.I41.6, i32 1
   %_nested_td.I41.6 = load %struct.TD*, %struct.TD** %_nested_td_ptr_ptr.I41.6
   %_call.I41.6_Static_Link = bitcast %struct.TD* %_nested_td.I41.6 to i64*
   %_new_result.I41.6_0 = call i64 @"PSL.Containers.Basic_Map.Remove_Any"(i64* %_loc_.I41_3, i64* %_Context, i64* %_call.I41.6_Static_Link, i64 %_loc_.I41_2)
   %_result_addr.I41.6_0 = bitcast i64* %_loc_.I41_1 to i64* 
   store i64 %_new_result.I41.6_0, i64* %_result_addr.I41.6_0

   ; #Copy_Word_Op at 258:12
   %_source.I41.7 = bitcast i64* %_loc_.I41_1 to i64* 
   %_source_val.I41.7 = load i64, i64* %_source.I41.7
   %_loc_.I41_6 = bitcast i64 %_source_val.I41.7 to i64

   ; #Is_Null_Op at 258:12
   %_arg.I41.8 = bitcast i64 %_loc_.I41_6 to i64
   %_cur_td.I41.8 = bitcast i64* %_call41_Static_Link to %struct.TD*
   %_nested_types_arr_ptr.I41.8 = getelementptr %struct.TD, %struct.TD* %_cur_td.I41.8, i32 0, i32 35
   %_nested_types_arr.I41.8 = load %struct.TD**, %struct.TD*** %_nested_types_arr_ptr.I41.8
   %_nested_td_ptr_ptr.I41.8 = getelementptr %struct.TD*, %struct.TD** %_nested_types_arr.I41.8, i32 0
   %_nested_td.I41.8 = load %struct.TD*, %struct.TD** %_nested_td_ptr_ptr.I41.8
   %_desc.I41.8 = bitcast %struct.TD* %_nested_td.I41.8 to i64*
   %_td.I41.8 = bitcast i64* %_desc.I41.8 to %struct.TD*
   %_is_small_ptr.I41.8 = getelementptr %struct.TD, %struct.TD* %_td.I41.8, i32 0, i32 13
   %_is_small.I41.8 = load i8, i8* %_is_small_ptr.I41.8
   %_is_small_bool.I41.8 = trunc i8 %_is_small.I41.8 to i1
   br i1 %_is_small_bool.I41.8, label %_is_small_lbl.I41.8, label %_is_large_lbl.I41.8
   _is_small_lbl.I41.8:
   %_small_null_ptr.I41.8 = getelementptr %struct.TD, %struct.TD* %_td.I41.8, i32 0, i32 17
   %_small_null.I41.8 = load i64, i64* %_small_null_ptr.I41.8
   %_small_result.I41.8 = icmp eq i64 %_arg.I41.8, %_small_null.I41.8
   br label %_join.I41.8
   _is_large_lbl.I41.8:
   %_val_no_reg.I41.8 = and i64 %_arg.I41.8, -4294967295
   %_large_result.I41.8 = icmp eq i64 %_val_no_reg.I41.8, -144115188075855871
   br label %_join.I41.8
   _join.I41.8:
   %_result_bit.I41.8 = phi i1 [%_small_result.I41.8, %_is_small_lbl.I41.8], [%_large_result.I41.8, %_is_large_lbl.I41.8]
   %_result_ext.I41.8 = zext i1 %_result_bit.I41.8 to i64
   %_loc_.I41_5 = bitcast i64 %_result_ext.I41.8 to i64

   ; #If_Op at 258:12
   %_if_source_val.I41.9 = bitcast i64 %_loc_.I41_5 to i64
   %_if_source_trunc.I41.9 = icmp eq i64 %_if_source_val.I41.9, 1
   br i1 %_if_source_trunc.I41.9, label %_lbl.I41_10, label %_lbl.I41_13

_lbl.I41_10:
   ; #Store_Null_Of_Same_Stg_Rgn_Op at 259:20
   %_cur_td.I41.10 = bitcast i64* %_call41_Static_Link to %struct.TD*
   %_param_arr_ptr.I41.10 = getelementptr %struct.TD, %struct.TD* %_cur_td.I41.10, i32 0, i32 26
   %_param_arr.I41.10 = load %struct.ParamInfo*, %struct.ParamInfo** %_param_arr_ptr.I41.10
   %_formal_td_ptr_ptr.I41.10 = getelementptr %struct.ParamInfo, %struct.ParamInfo* %_param_arr.I41.10, i32 0, i32 1, i32 0
   %_formal_td.I41.10 = load %struct.TD*, %struct.TD** %_formal_td_ptr_ptr.I41.10
   %_desc.I41.10 = bitcast %struct.TD* %_formal_td.I41.10 to i64*
   %_source_ptr.I41.10 = bitcast i64* %_output.I41 to i64*
   %_source.I41.10 = load i64, i64* %_source_ptr.I41.10
   %_td.I41.10 = bitcast i64* %_desc.I41.10 to %struct.TD*
   %_is_small_ptr.I41.10 = getelementptr %struct.TD, %struct.TD* %_td.I41.10, i32 0, i32 13
   %_is_small.I41.10 = load i8, i8* %_is_small_ptr.I41.10
   %_is_small_bool.I41.10 = trunc i8 %_is_small.I41.10 to i1
   br i1 %_is_small_bool.I41.10, label %_small_label.I41.10, label %_large_label.I41.10
   _small_label.I41.10:
   %_small_null_ptr.I41.10 = getelementptr %struct.TD, %struct.TD* %_td.I41.10, i32 0, i32 17
   %_small_null.I41.10 = load i64, i64* %_small_null_ptr.I41.10
   br label %_join_small_and_large.I41.10
   _large_label.I41.10:
   %_high_and_low_bits.I41.10 = and i64 %_source.I41.10, or (i64 shl (i64 1, i64 63), i64 1)
   %_is_special_bit.I41.10 = icmp eq i64 %_high_and_low_bits.I41.10, or (i64 shl (i64 1, i64 63), i64 1)
   br i1 %_is_special_bit.I41.10, label %_is_special_label.I41.10, label %_not_special_label.I41.10
   _is_special_label.I41.10:
   %_spcl_rgn_times2_.I41.10 = and i64 %_source.I41.10, 4294967295
   br label %_last_large_label.I41.10
   _not_special_label.I41.10:
   %_header_ptr.I41.10 = inttoptr i64 %_source.I41.10 to i64*
   %_hdr_of_src.I41.10 = load i64, i64* %_header_ptr.I41.10
   %_region_bits.I41.10 = and i64 %_hdr_of_src.I41.10, 4294901760
   %_normal_rgn_times2_.I41.10 = lshr i64 %_region_bits.I41.10, 15
   br label %_last_large_label.I41.10
   _last_large_label.I41.10:
   %_rgn_times2_.I41.10 = phi i64 [%_spcl_rgn_times2_.I41.10, %_is_special_label.I41.10], [%_normal_rgn_times2_.I41.10, %_not_special_label.I41.10]
   %_large_null.I41.10 = or i64 -144115188075855871, %_rgn_times2_.I41.10
   br label %_join_small_and_large.I41.10
   _join_small_and_large.I41.10:
   %_null.I41.10 = phi i64 [%_small_null.I41.10, %_small_label.I41.10],[%_large_null.I41.10, %_last_large_label.I41.10]
   %_loc_.I41_7 = bitcast i64 %_null.I41.10 to i64

   ; #Copy_Word_Op at 259:13
   %_source_val.I41.11 = bitcast i64 %_loc_.I41_7 to i64
   %_dest.I41.11 = bitcast i64* %_output.I41 to i64*
   store i64 %_source_val.I41.11, i64* %_dest.I41.11

   ; #Return_Op at 259:13
   br label %_lbl.I41_14

_lbl.I41_13:
   ; #Move_Obj_Op at 261:13
   %_source_ptr.I41.13 = bitcast i64* %_loc_.I41_1 to i64* 
   %_dest_ptr.I41.13 = bitcast i64* %_output.I41 to i64*
   %_cur_td.I41.13 = bitcast i64* %_call41_Static_Link to %struct.TD*
   %_param_arr_ptr.I41.13 = getelementptr %struct.TD, %struct.TD* %_cur_td.I41.13, i32 0, i32 26
   %_param_arr.I41.13 = load %struct.ParamInfo*, %struct.ParamInfo** %_param_arr_ptr.I41.13
   %_formal_td_ptr_ptr.I41.13 = getelementptr %struct.ParamInfo, %struct.ParamInfo* %_param_arr.I41.13, i32 0, i32 1, i32 0
   %_formal_td.I41.13 = load %struct.TD*, %struct.TD** %_formal_td_ptr_ptr.I41.13
   %_desc.I41.13 = bitcast %struct.TD* %_formal_td.I41.13 to i64*
   call void @_psc_move_object(i64* %_Context, i64* %_desc.I41.13, i64* %_dest_ptr.I41.13, i64* %_source_ptr.I41.13)

   br label %_lbl.I41_14

_lbl.I41_14:
   ; #Return_Op at 263:5

   %_new_result41 = load i64, i64* %_output.I41
   %_result_addr41 = bitcast i64* %_loc_33 to i64* 
   store i64 %_new_result41, i64* %_result_addr41

   ; #Not_Null_Op at 119:23
   %_arg_ptr42 = bitcast i64* %_loc_33 to i64* 
   %_arg42 = load i64, i64* %_arg_ptr42
   %_cur_td42 = bitcast i64* %_Static_Link to %struct.TD*
   %_param_arr_ptr42 = getelementptr %struct.TD, %struct.TD* %_cur_td42, i32 0, i32 26
   %_param_arr42 = load %struct.ParamInfo*, %struct.ParamInfo** %_param_arr_ptr42
   %_formal_td_ptr_ptr42 = getelementptr %struct.ParamInfo, %struct.ParamInfo* %_param_arr42, i32 0, i32 1, i32 0
   %_formal_td42 = load %struct.TD*, %struct.TD** %_formal_td_ptr_ptr42
   %_desc42 = bitcast %struct.TD* %_formal_td42 to i64*
   %_td42 = bitcast i64* %_desc42 to %struct.TD*
   %_is_small_ptr42 = getelementptr %struct.TD, %struct.TD* %_td42, i32 0, i32 13
   %_is_small42 = load i8, i8* %_is_small_ptr42
   %_is_small_bool42 = trunc i8 %_is_small42 to i1
   br i1 %_is_small_bool42, label %_is_small_lbl42, label %_is_large_lbl42
   _is_small_lbl42:
   %_small_null_ptr42 = getelementptr %struct.TD, %struct.TD* %_td42, i32 0, i32 17
   %_small_null42 = load i64, i64* %_small_null_ptr42
   %_small_result42 = icmp ne i64 %_arg42, %_small_null42
   br label %_join42
   _is_large_lbl42:
   %_val_no_reg42 = and i64 %_arg42, -4294967295
   %_large_result42 = icmp ne i64 %_val_no_reg42, -144115188075855871
   br label %_join42
   _join42:
   %_result_bit42 = phi i1 [%_small_result42, %_is_small_lbl42], [%_large_result42, %_is_large_lbl42]
   %_result_ext42 = zext i1 %_result_bit42 to i64
   %_loc_32 = bitcast i64 %_result_ext42 to i64

   ; #If_Op at 119:16
   %_if_source_val43 = bitcast i64 %_loc_32 to i64
   %_if_source_trunc43 = icmp eq i64 %_if_source_val43, 1
   br i1 %_if_source_trunc43, label %_lbl44, label %_lbl46

_lbl44:
   ; #Copy_Word_Op at 119:16
   %_source44 = bitcast i64* %_loc_33 to i64* 
   %_source_val44 = load i64, i64* %_source44
   %_dest44 = bitcast i64* %_loc_18 to i64* 
   store i64 %_source_val44, i64* %_dest44

   ; #Skip_Op at 119:12
   br label %_lbl25

_lbl46:
   ; #Store_Null_Of_Same_Stg_Rgn_Op at 125:19
   %_cur_td46 = bitcast i64* %_Static_Link to %struct.TD*
   %_param_arr_ptr46 = getelementptr %struct.TD, %struct.TD* %_cur_td46, i32 0, i32 26
   %_param_arr46 = load %struct.ParamInfo*, %struct.ParamInfo** %_param_arr_ptr46
   %_formal_td_ptr_ptr46 = getelementptr %struct.ParamInfo, %struct.ParamInfo* %_param_arr46, i32 0, i32 1, i32 0
   %_formal_td46 = load %struct.TD*, %struct.TD** %_formal_td_ptr_ptr46
   %_desc46 = bitcast %struct.TD* %_formal_td46 to i64*
   %_source_ptr46 = getelementptr i64, i64* %_Param_Area, i64 0
   %_source46 = load i64, i64* %_source_ptr46
   %_td46 = bitcast i64* %_desc46 to %struct.TD*
   %_is_small_ptr46 = getelementptr %struct.TD, %struct.TD* %_td46, i32 0, i32 13
   %_is_small46 = load i8, i8* %_is_small_ptr46
   %_is_small_bool46 = trunc i8 %_is_small46 to i1
   br i1 %_is_small_bool46, label %_small_label46, label %_large_label46
   _small_label46:
   %_small_null_ptr46 = getelementptr %struct.TD, %struct.TD* %_td46, i32 0, i32 17
   %_small_null46 = load i64, i64* %_small_null_ptr46
   br label %_join_small_and_large46
   _large_label46:
   %_high_and_low_bits46 = and i64 %_source46, or (i64 shl (i64 1, i64 63), i64 1)
   %_is_special_bit46 = icmp eq i64 %_high_and_low_bits46, or (i64 shl (i64 1, i64 63), i64 1)
   br i1 %_is_special_bit46, label %_is_special_label46, label %_not_special_label46
   _is_special_label46:
   %_spcl_rgn_times2_46 = and i64 %_source46, 4294967295
   br label %_last_large_label46
   _not_special_label46:
   %_header_ptr46 = inttoptr i64 %_source46 to i64*
   %_hdr_of_src46 = load i64, i64* %_header_ptr46
   %_region_bits46 = and i64 %_hdr_of_src46, 4294901760
   %_normal_rgn_times2_46 = lshr i64 %_region_bits46, 15
   br label %_last_large_label46
   _last_large_label46:
   %_rgn_times2_46 = phi i64 [%_spcl_rgn_times2_46, %_is_special_label46], [%_normal_rgn_times2_46, %_not_special_label46]
   %_large_null46 = or i64 -144115188075855871, %_rgn_times2_46
   br label %_join_small_and_large46
   _join_small_and_large46:
   %_null46 = phi i64 [%_small_null46, %_small_label46],[%_large_null46, %_last_large_label46]
   %_loc_36 = bitcast i64 %_null46 to i64

   ; #Copy_Word_Op at 125:12
   %_source_val47 = bitcast i64 %_loc_36 to i64
   %_dest47 = getelementptr i64, i64* %_Param_Area, i64 0
   store i64 %_source_val47, i64* %_dest47

   ; #Return_Op at 125:12
   call void @_psc_finalize_stg_rgn(i64* %_Context, i64* %_Local_Area)
   %_result_reg48 = load i64, i64* %_Param_Area
   ret i64 %_result_reg48

}

define i64 @"PSL.Containers.Two_Way_Map.Rev_Map"(i64 %_formal_param_1, i64* %_Context, i64* %_Static_Link, i64 %_inited_output) {
   %_Local_Area = alloca i64, i64 4
   %_sl = ptrtoint i64* %_Static_Link to i64
   store i64 %_sl, i64* %_Local_Area

   %_Param_Area = alloca i64
   %_loc_1 = alloca i64
   %_print_param10 = alloca i64

   store i64 %_inited_output, i64* %_Param_Area
   
   ; #Declare_Obj_Op at 131:13

   ; #Store_Null_Of_Same_Stg_Rgn_Op at 131:22
   %_source_ptr2 = getelementptr i64, i64* %_Param_Area, i64 0
   %_source2 = load i64, i64* %_source_ptr2
   %_high_and_low_bits2 = and i64 %_source2, or (i64 shl (i64 1, i64 63), i64 1)
   %_is_special_bit2 = icmp eq i64 %_high_and_low_bits2, or (i64 shl (i64 1, i64 63), i64 1)
   br i1 %_is_special_bit2, label %_is_special_label2, label %_not_special_label2
   _is_special_label2:
   %_spcl_rgn_times2_2 = and i64 %_source2, 4294967295
   br label %_join_label2
   _not_special_label2:
   %_header_ptr2 = inttoptr i64 %_source2 to i64*
   %_hdr_of_src2 = load i64, i64* %_header_ptr2
   %_region_bits2 = and i64 %_hdr_of_src2, 4294901760
   %_normal_rgn_times2_2 = lshr i64 %_region_bits2, 15
   br label %_join_label2
   _join_label2:
   %_rgn_times2_2 = phi i64 [%_spcl_rgn_times2_2, %_is_special_label2], [%_normal_rgn_times2_2, %_not_special_label2]
   %_null2 = or i64 -144115188075855871, %_rgn_times2_2
   %_dest_ptr2 = bitcast i64* %_loc_1 to i64* 
   store i64 %_null2, i64* %_dest_ptr2

   ; #Make_Copy_In_Stg_Rgn_Op at 131:32
   %_desc3 = getelementptr i64, i64* %_Static_Link, i64 0
   %_source3 = bitcast i64 %_formal_param_1 to i64
   %_existing_ptr3 = bitcast i64* %_loc_1 to i64* 
   %_existing_obj3 = load i64, i64* %_existing_ptr3
   %_result3 = call i64 @_psc_copy_object(i64* %_Context, i64* %_desc3, i64 %_source3, i64 %_existing_obj3)
   %_dest_ptr3 = bitcast i64* %_loc_1 to i64* 
   store i64 %_result3, i64* %_dest_ptr3

   ; #Store_Address_Op at 132:9
   %_addr4 = bitcast i64* %_loc_1 to i64* 
   %_loc_2 = bitcast i64* %_addr4 to i64*

   ; #Call_Op at 132:9
   %_call5_Static_Link = getelementptr i64, i64* %_Static_Link, i64 0
   call void @"PSL.Containers.Two_Way_Map.Add_Unreversed"(i64* %_loc_2, i64* %_Context, i64* %_call5_Static_Link)

   ; #Copy_Word_Op at 134:20
   %_source6 = bitcast i64* %_loc_1 to i64* 
   %_source_val6 = load i64, i64* %_source6
   %_loc_4 = bitcast i64 %_source_val6 to i64

   ; #Move_Obj_Op at 134:9
   %_reg7_1 = inttoptr i64 %_loc_4 to i64*
   %_source_ptr7 = getelementptr i64, i64* %_reg7_1, i64 2
   %_dest_ptr7 = getelementptr i64, i64* %_Param_Area, i64 0
   %_cur_td7 = bitcast i64* %_Static_Link to %struct.TD*
   %_nested_types_arr_ptr7 = getelementptr %struct.TD, %struct.TD* %_cur_td7, i32 0, i32 35
   %_nested_types_arr7 = load %struct.TD**, %struct.TD*** %_nested_types_arr_ptr7
   %_nested_td_ptr_ptr7 = getelementptr %struct.TD*, %struct.TD** %_nested_types_arr7, i32 5
   %_nested_td7 = load %struct.TD*, %struct.TD** %_nested_td_ptr_ptr7
   %_desc7 = bitcast %struct.TD* %_nested_td7 to i64*
   call void @_psc_move_object(i64* %_Context, i64* %_desc7, i64* %_dest_ptr7, i64* %_source_ptr7)

   ; #Store_Null_Of_Same_Stg_Rgn_Op at 135:17
   %_source_ptr8 = bitcast i64* %_loc_1 to i64* 
   %_source8 = load i64, i64* %_source_ptr8
   %_high_and_low_bits8 = and i64 %_source8, or (i64 shl (i64 1, i64 63), i64 1)
   %_is_special_bit8 = icmp eq i64 %_high_and_low_bits8, or (i64 shl (i64 1, i64 63), i64 1)
   br i1 %_is_special_bit8, label %_is_special_label8, label %_not_special_label8
   _is_special_label8:
   %_spcl_rgn_times2_8 = and i64 %_source8, 4294967295
   br label %_join_label8
   _not_special_label8:
   %_header_ptr8 = inttoptr i64 %_source8 to i64*
   %_hdr_of_src8 = load i64, i64* %_header_ptr8
   %_region_bits8 = and i64 %_hdr_of_src8, 4294901760
   %_normal_rgn_times2_8 = lshr i64 %_region_bits8, 15
   br label %_join_label8
   _join_label8:
   %_rgn_times2_8 = phi i64 [%_spcl_rgn_times2_8, %_is_special_label8], [%_normal_rgn_times2_8, %_not_special_label8]
   %_null8 = or i64 -144115188075855871, %_rgn_times2_8
   %_loc_5 = bitcast i64 %_null8 to i64

   ; #Assign_Word_Op at 135:9
   %_desc9 = getelementptr i64, i64* %_Static_Link, i64 0
   %_source9 = bitcast i64 %_loc_5 to i64
   %_dest_ptr9 = bitcast i64* %_loc_1 to i64* 
   call void @_psc_assign_word(i64* %_Context, i64* %_desc9, i64* %_dest_ptr9, i64 %_source9)

   ; #Check_Not_Null_Op at 136:5
   %_arg_ptr10 = getelementptr i64, i64* %_Param_Area, i64 0
   %_arg10 = load i64, i64* %_arg_ptr10
   %_cur_td10 = bitcast i64* %_Static_Link to %struct.TD*
   %_nested_types_arr_ptr10 = getelementptr %struct.TD, %struct.TD* %_cur_td10, i32 0, i32 35
   %_nested_types_arr10 = load %struct.TD**, %struct.TD*** %_nested_types_arr_ptr10
   %_nested_td_ptr_ptr10 = getelementptr %struct.TD*, %struct.TD** %_nested_types_arr10, i32 5
   %_nested_td10 = load %struct.TD*, %struct.TD** %_nested_td_ptr_ptr10
   %_desc10 = bitcast %struct.TD* %_nested_td10 to i64*
   %_td10 = bitcast i64* %_desc10 to %struct.TD*
   %_is_small_ptr10 = getelementptr %struct.TD, %struct.TD* %_td10, i32 0, i32 13
   %_is_small10 = load i8, i8* %_is_small_ptr10
   %_is_small_bool10 = trunc i8 %_is_small10 to i1
   br i1 %_is_small_bool10, label %_is_small_lbl10, label %_is_large_lbl10
   _is_small_lbl10:
   %_small_null_ptr10 = getelementptr %struct.TD, %struct.TD* %_td10, i32 0, i32 17
   %_small_null10 = load i64, i64* %_small_null_ptr10
   %_small_result10 = icmp eq i64 %_arg10, %_small_null10
   br label %_join10
   _is_large_lbl10:
   %_val_no_reg10 = and i64 %_arg10, -4294967295
   %_large_result10 = icmp eq i64 %_val_no_reg10, -144115188075855871
   br label %_join10
   _join10:
   %_is_null10 = phi i1 [%_small_result10, %_is_small_lbl10], [%_large_result10, %_is_large_lbl10]
   br i1 %_is_null10, label %_fail10, label %_lbl11
   _fail10:
   %_str_ptr_ptr10 = load i64*, i64** @$Strings
   %_str_ptr10 = getelementptr i64, i64* %_str_ptr_ptr10, i64 18
   %_assert_str10 = load i64, i64* %_str_ptr10
   store i64 %_assert_str10, i64* %_print_param10
   call void @_psc_runtime_message(i64* %_Context, i64* %_print_param10, i64* null)

   br label %_lbl11

_lbl11:
   ; #Return_Op at 136:5
   %_result_reg11 = load i64, i64* %_Param_Area
   ret i64 %_result_reg11

}

