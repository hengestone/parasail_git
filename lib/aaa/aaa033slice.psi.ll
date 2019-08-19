declare i64 @_psc_copy_object(i64*, i64*, i64, i64)
declare void @_psc_execute_compiled_nth_op_of_type(i64*, i64*, i64*, i16, i16)
declare void @_psc_finalize_stg_rgn(i64*, i64*)
declare i64* @_psc_get_type_desc_or_op_map(i64*, i16, i16)
declare void @_psc_initialize_stg_rgn(i64*, i64*)
declare i64 @_psc_new_object(i64*, i64*, i64)
declare void @_psc_reconstruct_strings(i16, i8**, i64*)
declare void @_psc_register_compiled_operations(i16, i16*, void(i64*, i64*, i64*)**, i32*, i64*, i32, i16*, i32(i64*, i64*, i64*)**)
declare void @"_psc_runtime_message"(i64*, i64*, i64*)

@$Module_Op_Indices = internal constant [12 x i16] [
i16 1, i16 2, i16 1, i16 14, i16 1, i16 4, i16 1, i16 6, i16 1, i16 9
, i16 1, i16 12]

@$Local_Funcs = internal constant [6 x void(i64*, i64*, i64*)*] [

void(i64*, i64*, i64*)* bitcast( i64 (i64, i64*, i64*)* @"PSL.Containers.Slice.Length" to void(i64*, i64*, i64*)*)
, void(i64*, i64*, i64*)* bitcast( i64 (i64, i64*, i64*, i64)* @"PSL.Containers.Slice.$index_set$" to void(i64*, i64*, i64*)*)
, void(i64*, i64*, i64*)* bitcast( i64 (i64*, i64*, i64*, i64)* @"PSL.Containers.Slice.$slicing$" to void(i64*, i64*, i64*)*)
, void(i64*, i64*, i64*)* bitcast( i64 (i64*, i64, i64*, i64*, i64)* @"PSL.Containers.Slice.$slicing$.2" to void(i64*, i64*, i64*)*)
, void(i64*, i64*, i64*)* bitcast( i64 (i64, i64, i64*, i64*, i64)* @"PSL.Containers.Slice.$slicing$.3" to void(i64*, i64*, i64*)*)
, void(i64*, i64*, i64*)* bitcast( i64* (i64, i64, i64*, i64*)* @"PSL.Containers.Slice.$indexing$" to void(i64*, i64*, i64*)*)]

@$Local_Funcs_Conv_Descs = internal constant [6 x i32] [
i32 65792, i32 33620224, i32 33620224, i32 33620480, i32 33620480, i32 66048]

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
@$str_stream1 = internal constant [26 x i8] 

[i8 22, i8 0, i8 0, i8 0, i8 80, i8 83, i8 76, i8 58, i8 58, i8 67, i8 111
, i8 110, i8 116, i8 97, i8 105, i8 110, i8 101, i8 114, i8 115, i8 58, i8 58
, i8 83, i8 108, i8 105, i8 99, i8 101]

@$str_stream2 = internal constant [10 x i8] 

[i8 6, i8 0, i8 0, i8 0, i8 76, i8 101, i8 110, i8 103, i8 116, i8 104]

@$str_stream3 = internal constant [94 x i8] 

[i8 90, i8 0, i8 0, i8 0, i8 47, i8 85, i8 115, i8 101, i8 114, i8 115, i8 47
, i8 115, i8 116, i8 116, i8 47, i8 95, i8 112, i8 97, i8 114, i8 97, i8 115
, i8 97, i8 105, i8 108, i8 47, i8 108, i8 105, i8 98, i8 47, i8 97, i8 97
, i8 97, i8 47, i8 97, i8 97, i8 97, i8 48, i8 51, i8 51, i8 115, i8 108
, i8 105, i8 99, i8 101, i8 46, i8 112, i8 115, i8 105, i8 58, i8 51, i8 55
, i8 58, i8 57, i8 58, i8 32, i8 69, i8 114, i8 114, i8 111, i8 114, i8 58
, i8 32, i8 78, i8 117, i8 108, i8 108, i8 32, i8 118, i8 97, i8 108, i8 117
, i8 101, i8 32, i8 110, i8 111, i8 116, i8 32, i8 112, i8 101, i8 114, i8 109
, i8 105, i8 116, i8 116, i8 101, i8 100, i8 32, i8 104, i8 101, i8 114, i8 101
, i8 58, i8 32, i8 10]

@$str_stream4 = internal constant [13 x i8] 

[i8 9, i8 0, i8 0, i8 0, i8 34, i8 115, i8 108, i8 105, i8 99, i8 105, i8 110
, i8 103, i8 34]

@$str_stream5 = internal constant [94 x i8] 

[i8 90, i8 0, i8 0, i8 0, i8 47, i8 85, i8 115, i8 101, i8 114, i8 115, i8 47
, i8 115, i8 116, i8 116, i8 47, i8 95, i8 112, i8 97, i8 114, i8 97, i8 115
, i8 97, i8 105, i8 108, i8 47, i8 108, i8 105, i8 98, i8 47, i8 97, i8 97
, i8 97, i8 47, i8 97, i8 97, i8 97, i8 48, i8 51, i8 51, i8 115, i8 108
, i8 105, i8 99, i8 101, i8 46, i8 112, i8 115, i8 105, i8 58, i8 52, i8 51
, i8 58, i8 57, i8 58, i8 32, i8 69, i8 114, i8 114, i8 111, i8 114, i8 58
, i8 32, i8 78, i8 117, i8 108, i8 108, i8 32, i8 118, i8 97, i8 108, i8 117
, i8 101, i8 32, i8 110, i8 111, i8 116, i8 32, i8 112, i8 101, i8 114, i8 109
, i8 105, i8 116, i8 116, i8 101, i8 100, i8 32, i8 104, i8 101, i8 114, i8 101
, i8 58, i8 32, i8 10]

@$str_stream6 = internal constant [15 x i8] 

[i8 11, i8 0, i8 0, i8 0, i8 34, i8 115, i8 108, i8 105, i8 99, i8 105, i8 110
, i8 103, i8 34, i8 35, i8 50]

@$str_stream7 = internal constant [194 x i8] 

[i8 190, i8 0, i8 0, i8 0, i8 47, i8 85, i8 115, i8 101, i8 114, i8 115, i8 47
, i8 115, i8 116, i8 116, i8 47, i8 95, i8 112, i8 97, i8 114, i8 97, i8 115
, i8 97, i8 105, i8 108, i8 47, i8 108, i8 105, i8 98, i8 47, i8 97, i8 97
, i8 97, i8 47, i8 97, i8 97, i8 97, i8 48, i8 51, i8 51, i8 115, i8 108
, i8 105, i8 99, i8 101, i8 46, i8 112, i8 115, i8 105, i8 58, i8 53, i8 49
, i8 58, i8 51, i8 55, i8 58, i8 32, i8 69, i8 114, i8 114, i8 111, i8 114
, i8 58, i8 32, i8 65, i8 115, i8 115, i8 101, i8 114, i8 116, i8 105, i8 111
, i8 110, i8 32, i8 102, i8 97, i8 105, i8 108, i8 101, i8 100, i8 58, i8 32
, i8 32, i8 123, i8 62, i8 32, i8 66, i8 111, i8 117, i8 110, i8 100, i8 115
, i8 46, i8 70, i8 105, i8 114, i8 115, i8 116, i8 32, i8 62, i8 32, i8 66
, i8 111, i8 117, i8 110, i8 100, i8 115, i8 46, i8 76, i8 97, i8 115, i8 116
, i8 32, i8 111, i8 114, i8 32, i8 101, i8 108, i8 115, i8 101, i8 32, i8 40
, i8 66, i8 111, i8 117, i8 110, i8 100, i8 115, i8 46, i8 70, i8 105, i8 114
, i8 115, i8 116, i8 32, i8 62, i8 61, i8 32, i8 65, i8 95, i8 66, i8 111
, i8 117, i8 110, i8 100, i8 115, i8 46, i8 70, i8 105, i8 114, i8 115, i8 116
, i8 32, i8 97, i8 110, i8 100, i8 32, i8 116, i8 104, i8 101, i8 110, i8 32
, i8 66, i8 111, i8 117, i8 110, i8 100, i8 115, i8 46, i8 76, i8 97, i8 115
, i8 116, i8 32, i8 60, i8 61, i8 32, i8 65, i8 95, i8 66, i8 111, i8 117
, i8 110, i8 100, i8 115, i8 46, i8 76, i8 97, i8 115, i8 116, i8 41, i8 32
, i8 60, i8 125, i8 10]

@$str_stream8 = internal constant [94 x i8] 

[i8 90, i8 0, i8 0, i8 0, i8 47, i8 85, i8 115, i8 101, i8 114, i8 115, i8 47
, i8 115, i8 116, i8 116, i8 47, i8 95, i8 112, i8 97, i8 114, i8 97, i8 115
, i8 97, i8 105, i8 108, i8 47, i8 108, i8 105, i8 98, i8 47, i8 97, i8 97
, i8 97, i8 47, i8 97, i8 97, i8 97, i8 48, i8 51, i8 51, i8 115, i8 108
, i8 105, i8 99, i8 101, i8 46, i8 112, i8 115, i8 105, i8 58, i8 53, i8 52
, i8 58, i8 57, i8 58, i8 32, i8 69, i8 114, i8 114, i8 111, i8 114, i8 58
, i8 32, i8 78, i8 117, i8 108, i8 108, i8 32, i8 118, i8 97, i8 108, i8 117
, i8 101, i8 32, i8 110, i8 111, i8 116, i8 32, i8 112, i8 101, i8 114, i8 109
, i8 105, i8 116, i8 116, i8 101, i8 100, i8 32, i8 104, i8 101, i8 114, i8 101
, i8 58, i8 32, i8 10]

@$str_stream9 = internal constant [15 x i8] 

[i8 11, i8 0, i8 0, i8 0, i8 34, i8 115, i8 108, i8 105, i8 99, i8 105, i8 110
, i8 103, i8 34, i8 35, i8 51]

@$str_stream10 = internal constant [180 x i8] 

[i8 176, i8 0, i8 0, i8 0, i8 47, i8 85, i8 115, i8 101, i8 114, i8 115, i8 47
, i8 115, i8 116, i8 116, i8 47, i8 95, i8 112, i8 97, i8 114, i8 97, i8 115
, i8 97, i8 105, i8 108, i8 47, i8 108, i8 105, i8 98, i8 47, i8 97, i8 97
, i8 97, i8 47, i8 97, i8 97, i8 97, i8 48, i8 51, i8 51, i8 115, i8 108
, i8 105, i8 99, i8 101, i8 46, i8 112, i8 115, i8 105, i8 58, i8 54, i8 49
, i8 58, i8 51, i8 55, i8 58, i8 32, i8 69, i8 114, i8 114, i8 111, i8 114
, i8 58, i8 32, i8 65, i8 115, i8 115, i8 101, i8 114, i8 116, i8 105, i8 111
, i8 110, i8 32, i8 102, i8 97, i8 105, i8 108, i8 101, i8 100, i8 58, i8 32
, i8 32, i8 123, i8 62, i8 32, i8 66, i8 111, i8 117, i8 110, i8 100, i8 115
, i8 46, i8 70, i8 105, i8 114, i8 115, i8 116, i8 32, i8 62, i8 32, i8 66
, i8 111, i8 117, i8 110, i8 100, i8 115, i8 46, i8 76, i8 97, i8 115, i8 116
, i8 32, i8 111, i8 114, i8 32, i8 101, i8 108, i8 115, i8 101, i8 32, i8 40
, i8 66, i8 111, i8 117, i8 110, i8 100, i8 115, i8 46, i8 70, i8 105, i8 114
, i8 115, i8 116, i8 32, i8 62, i8 61, i8 32, i8 83, i8 46, i8 70, i8 105
, i8 114, i8 115, i8 116, i8 32, i8 97, i8 110, i8 100, i8 32, i8 116, i8 104
, i8 101, i8 110, i8 32, i8 66, i8 111, i8 117, i8 110, i8 100, i8 115, i8 46
, i8 76, i8 97, i8 115, i8 116, i8 32, i8 60, i8 61, i8 32, i8 83, i8 46, i8 76
, i8 97, i8 115, i8 116, i8 41, i8 32, i8 60, i8 125, i8 10]

@$str_stream11 = internal constant [94 x i8] 

[i8 90, i8 0, i8 0, i8 0, i8 47, i8 85, i8 115, i8 101, i8 114, i8 115, i8 47
, i8 115, i8 116, i8 116, i8 47, i8 95, i8 112, i8 97, i8 114, i8 97, i8 115
, i8 97, i8 105, i8 108, i8 47, i8 108, i8 105, i8 98, i8 47, i8 97, i8 97
, i8 97, i8 47, i8 97, i8 97, i8 97, i8 48, i8 51, i8 51, i8 115, i8 108
, i8 105, i8 99, i8 101, i8 46, i8 112, i8 115, i8 105, i8 58, i8 54, i8 52
, i8 58, i8 57, i8 58, i8 32, i8 69, i8 114, i8 114, i8 111, i8 114, i8 58
, i8 32, i8 78, i8 117, i8 108, i8 108, i8 32, i8 118, i8 97, i8 108, i8 117
, i8 101, i8 32, i8 110, i8 111, i8 116, i8 32, i8 112, i8 101, i8 114, i8 109
, i8 105, i8 116, i8 116, i8 101, i8 100, i8 32, i8 104, i8 101, i8 114, i8 101
, i8 58, i8 32, i8 10]

@$str_stream12 = internal constant [14 x i8] 

[i8 10, i8 0, i8 0, i8 0, i8 34, i8 105, i8 110, i8 100, i8 101, i8 120, i8 105
, i8 110, i8 103, i8 34]

@$str_stream13 = internal constant [130 x i8] 

[i8 126, i8 0, i8 0, i8 0, i8 47, i8 85, i8 115, i8 101, i8 114, i8 115, i8 47
, i8 115, i8 116, i8 116, i8 47, i8 95, i8 112, i8 97, i8 114, i8 97, i8 115
, i8 97, i8 105, i8 108, i8 47, i8 108, i8 105, i8 98, i8 47, i8 97, i8 97
, i8 97, i8 47, i8 97, i8 97, i8 97, i8 48, i8 51, i8 51, i8 115, i8 108
, i8 105, i8 99, i8 101, i8 46, i8 112, i8 115, i8 105, i8 58, i8 55, i8 48
, i8 58, i8 50, i8 55, i8 58, i8 32, i8 69, i8 114, i8 114, i8 111, i8 114
, i8 58, i8 32, i8 65, i8 115, i8 115, i8 101, i8 114, i8 116, i8 105, i8 111
, i8 110, i8 32, i8 102, i8 97, i8 105, i8 108, i8 101, i8 100, i8 58, i8 32
, i8 32, i8 123, i8 62, i8 32, i8 73, i8 110, i8 100, i8 101, i8 120, i8 32
, i8 62, i8 61, i8 32, i8 83, i8 46, i8 70, i8 105, i8 114, i8 115, i8 116
, i8 32, i8 97, i8 110, i8 100, i8 32, i8 116, i8 104, i8 101, i8 110, i8 32
, i8 73, i8 110, i8 100, i8 101, i8 120, i8 32, i8 60, i8 61, i8 32, i8 83
, i8 46, i8 76, i8 97, i8 115, i8 116, i8 32, i8 60, i8 125, i8 10]

@$str_stream14 = internal constant [15 x i8] 

[i8 11, i8 0, i8 0, i8 0, i8 34, i8 105, i8 110, i8 100, i8 101, i8 120, i8 95
, i8 115, i8 101, i8 116, i8 34]

@$str_stream15 = internal constant [104 x i8] 

[i8 100, i8 0, i8 0, i8 0, i8 47, i8 85, i8 115, i8 101, i8 114, i8 115, i8 47
, i8 115, i8 116, i8 116, i8 47, i8 95, i8 112, i8 97, i8 114, i8 97, i8 115
, i8 97, i8 105, i8 108, i8 47, i8 108, i8 105, i8 98, i8 47, i8 97, i8 97
, i8 97, i8 47, i8 97, i8 97, i8 97, i8 48, i8 49, i8 49, i8 99, i8 111, i8 117
, i8 110, i8 116, i8 97, i8 98, i8 108, i8 101, i8 95, i8 114, i8 97, i8 110
, i8 103, i8 101, i8 46, i8 112, i8 115, i8 105, i8 58, i8 51, i8 52, i8 58
, i8 57, i8 58, i8 32, i8 69, i8 114, i8 114, i8 111, i8 114, i8 58, i8 32
, i8 78, i8 117, i8 108, i8 108, i8 32, i8 118, i8 97, i8 108, i8 117, i8 101
, i8 32, i8 110, i8 111, i8 116, i8 32, i8 112, i8 101, i8 114, i8 109, i8 105
, i8 116, i8 116, i8 101, i8 100, i8 32, i8 104, i8 101, i8 114, i8 101, i8 58
, i8 32, i8 10]

@$str_stream16 = internal constant [94 x i8] 

[i8 90, i8 0, i8 0, i8 0, i8 47, i8 85, i8 115, i8 101, i8 114, i8 115, i8 47
, i8 115, i8 116, i8 116, i8 47, i8 95, i8 112, i8 97, i8 114, i8 97, i8 115
, i8 97, i8 105, i8 108, i8 47, i8 108, i8 105, i8 98, i8 47, i8 97, i8 97
, i8 97, i8 47, i8 97, i8 97, i8 97, i8 48, i8 51, i8 51, i8 115, i8 108
, i8 105, i8 99, i8 101, i8 46, i8 112, i8 115, i8 105, i8 58, i8 55, i8 54
, i8 58, i8 57, i8 58, i8 32, i8 69, i8 114, i8 114, i8 111, i8 114, i8 58
, i8 32, i8 78, i8 117, i8 108, i8 108, i8 32, i8 118, i8 97, i8 108, i8 117
, i8 101, i8 32, i8 110, i8 111, i8 116, i8 32, i8 112, i8 101, i8 114, i8 109
, i8 105, i8 116, i8 116, i8 101, i8 100, i8 32, i8 104, i8 101, i8 114, i8 101
, i8 58, i8 32, i8 10]

@$Str_Streams = internal constant [16 x i8*] [
i8* bitcast ([26 x i8]* @$str_stream1 to i8*), 
i8* bitcast ([10 x i8]* @$str_stream2 to i8*), 
i8* bitcast ([94 x i8]* @$str_stream3 to i8*), 
i8* bitcast ([13 x i8]* @$str_stream4 to i8*), 
i8* bitcast ([94 x i8]* @$str_stream5 to i8*), 
i8* bitcast ([15 x i8]* @$str_stream6 to i8*), 
i8* bitcast ([194 x i8]* @$str_stream7 to i8*), 
i8* bitcast ([94 x i8]* @$str_stream8 to i8*), 
i8* bitcast ([15 x i8]* @$str_stream9 to i8*), 
i8* bitcast ([180 x i8]* @$str_stream10 to i8*), 
i8* bitcast ([94 x i8]* @$str_stream11 to i8*), 
i8* bitcast ([14 x i8]* @$str_stream12 to i8*), 
i8* bitcast ([130 x i8]* @$str_stream13 to i8*), 
i8* bitcast ([15 x i8]* @$str_stream14 to i8*), 
i8* bitcast ([104 x i8]* @$str_stream15 to i8*), 
i8* bitcast ([94 x i8]* @$str_stream16 to i8*)]
@$String_Table = internal global [16 x i64] 
[i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, 
 i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0]
@$Strings = internal constant i64* bitcast ([16 x i64]* @$String_Table to i64*)
@_psc_global_to_do = external global {i64*, void()*}*
define internal void @$initialize_streams() {
   %_Str_Tab = load i64*, i64** @$Strings
   call void @_psc_reconstruct_strings(i16 16, i8** bitcast ([16 x i8*]* @$Str_Streams to i8**), i64* %_Str_Tab)
   call void @_psc_register_compiled_operations(i16 6, i16* bitcast ([12 x i16]* @$Module_Op_Indices to i16*), void(i64*, i64*, i64*)** bitcast ([6 x void(i64*, i64*, i64*)*]* @$Local_Funcs to void(i64*, i64*, i64*)**), i32* bitcast ([6 x i32]* @$Local_Funcs_Conv_Descs to i32*), i64* %_Str_Tab, i32 0, i16* bitcast ([0 x i16]* @$Internal_Precond_Indices to i16*), i32(i64*, i64*, i64*)** bitcast ([0 x i32(i64*, i64*, i64*)*]* @$Internal_Precond_Blocks to i32(i64*, i64*, i64*)**))
   ret void
}
@"_node_/Users/stt/_parasail/lib/aaa/aaa033slice.psi" = global {i64*, void()*} {i64* null, void()* @$initialize_streams}
define internal void @$add_to_todo() {
   %_next = load {i64*, void()*}*, {i64*, void()*}** @_psc_global_to_do
   %_nextc = bitcast {i64*, void()*}* %_next to i64*
   %_node.next_ptr = getelementptr {i64*, void()*}, {i64*, void()*}* @"_node_/Users/stt/_parasail/lib/aaa/aaa033slice.psi", i32 0, i32 0
   store i64* %_nextc, i64** %_node.next_ptr
   store {i64*, void()*}* @"_node_/Users/stt/_parasail/lib/aaa/aaa033slice.psi", {i64*, void()*}** @_psc_global_to_do
   ret void
}
@llvm.global_ctors = appending global [1 x {i32, void ()*}] [{i32, void()*} {i32 65535, void ()* @$add_to_todo}]

define i64 @"PSL.Containers.Slice.Length"(i64 %_formal_param_1, i64* %_Context, i64* %_Static_Link) {
   %_Local_Area = alloca i64, i64 4
   %_sl = ptrtoint i64* %_Static_Link to i64
   store i64 %_sl, i64* %_Local_Area

   %_Param_Area = alloca i64
   %_call5_Param_Area = alloca i64, i64 3
   %_print_param9 = alloca i64

   
   ; #Copy_Word_Op at 37:16
   %_source_val1 = bitcast i64 %_formal_param_1 to i64
   %_loc_8 = bitcast i64 %_source_val1 to i64

   ; #Copy_Word_Op at 37:18
   %_reg2_1 = inttoptr i64 %_loc_8 to i64*
   %_source2 = getelementptr i64, i64* %_reg2_1, i64 2
   %_source_val2 = load i64, i64* %_source2
   %_loc_6 = bitcast i64 %_source_val2 to i64

   ; #Copy_Word_Op at 37:25
   %_source_val3 = bitcast i64 %_formal_param_1 to i64
   %_loc_9 = bitcast i64 %_source_val3 to i64

   ; #Copy_Word_Op at 37:27
   %_reg4_1 = inttoptr i64 %_loc_9 to i64*
   %_source4 = getelementptr i64, i64* %_reg4_1, i64 1
   %_source_val4 = load i64, i64* %_source4
   %_loc_7 = bitcast i64 %_source_val4 to i64

   ; #Call_Op at 37:23
   %_call5_Static_Link = call i64* @_psc_get_type_desc_or_op_map(i64* %_Static_Link, i16 3, i16 1001)
   %_new_arg_addr5_1 = getelementptr i64, i64* %_call5_Param_Area, i64 1
   store i64 %_loc_6, i64* %_new_arg_addr5_1
   %_new_arg_addr5_2 = getelementptr i64, i64* %_call5_Param_Area, i64 2
   store i64 %_loc_7, i64* %_new_arg_addr5_2
   call void @_psc_execute_compiled_nth_op_of_type(i64* %_Context, i64* %_call5_Param_Area, i64* %_call5_Static_Link, i16 3, i16 4)
   %_new_result_addr5_0 = getelementptr i64, i64* %_call5_Param_Area, i64 0
   %_new_result5_0 = load i64, i64* %_new_result_addr5_0
   %_loc_3 = bitcast i64 %_new_result5_0 to i64

   ; #Store_Int_Lit_Op at 37:35
   %_loc_4 = bitcast i64 1 to i64

   ; #Call_Op at 37:33
   %_first_arg7 = bitcast i64 %_loc_3 to i64
   %_secon_arg7 = bitcast i64 %_loc_4 to i64
   %_resul7 = add nsw i64 %_first_arg7, %_secon_arg7
   %_loc_1 = bitcast i64 %_resul7 to i64

   ; #Copy_Word_Op at 37:9
   %_source_val8 = bitcast i64 %_loc_1 to i64
   %_dest8 = getelementptr i64, i64* %_Param_Area, i64 0
   store i64 %_source_val8, i64* %_dest8

   ; #Check_Not_Null_Op at 37:9
   %_arg_ptr9 = getelementptr i64, i64* %_Param_Area, i64 0
   %_arg9 = load i64, i64* %_arg_ptr9
   %_is_null9 = icmp eq i64 %_arg9, shl (i64 1, i64 63)
   br i1 %_is_null9, label %_fail9, label %_lbl10
   _fail9:
   %_str_ptr_ptr9 = load i64*, i64** @$Strings
   %_str_ptr9 = getelementptr i64, i64* %_str_ptr_ptr9, i64 2
   %_assert_str9 = load i64, i64* %_str_ptr9
   store i64 %_assert_str9, i64* %_print_param9
   call void @_psc_runtime_message(i64* %_Context, i64* %_print_param9, i64* null)

   br label %_lbl10

_lbl10:
   ; #Return_Op at 37:9
   %_result_reg10 = load i64, i64* %_Param_Area
   ret i64 %_result_reg10

}

define i64 @"PSL.Containers.Slice.$slicing$"(i64* %_formal_param_1, i64* %_Context, i64* %_Static_Link, i64 %_inited_output) {
   %_Local_Area = alloca i64, i64 4
   %_sl = ptrtoint i64* %_Static_Link to i64
   store i64 %_sl, i64* %_Local_Area
   call void @_psc_initialize_stg_rgn(i64* %_Context, i64* %_Local_Area)
   %_Master = alloca i64, i64 3
   %_ms = ptrtoint i64* %_Master to i64
   %_store_ms = getelementptr i64, i64* %_Local_Area, i64 3
   store i64 %_ms, i64* %_store_ms

   %_Param_Area = alloca i64
   %_loc_1 = alloca i64
   %_call6_Param_Area = alloca i64, i64 2
   %_loc_6 = alloca i64
   %_print_param20 = alloca i64

   store i64 %_inited_output, i64* %_Param_Area
   
   ; #Declare_Obj_Op at 42:15

   ; #Store_Local_Null_Op at 42:15
   %_cur_td2 = bitcast i64* %_Static_Link to %struct.TD*
   %_nested_types_arr_ptr2 = getelementptr %struct.TD, %struct.TD* %_cur_td2, i32 0, i32 35
   %_nested_types_arr2 = load %struct.TD**, %struct.TD*** %_nested_types_arr_ptr2
   %_nested_td_ptr_ptr2 = getelementptr %struct.TD*, %struct.TD** %_nested_types_arr2, i32 0
   %_nested_td2 = load %struct.TD*, %struct.TD** %_nested_td_ptr_ptr2
   %_desc2 = bitcast %struct.TD* %_nested_td2 to i64*
   %_td2 = bitcast i64* %_desc2 to %struct.TD*
   %_is_small_ptr2 = getelementptr %struct.TD, %struct.TD* %_td2, i32 0, i32 13
   %_is_small2 = load i8, i8* %_is_small_ptr2
   %_is_small_bool2 = trunc i8 %_is_small2 to i1
   %_small_null_ptr2 = getelementptr %struct.TD, %struct.TD* %_td2, i32 0, i32 17
   %_small_null2 = load i64, i64* %_small_null_ptr2
   %_ctx2 = bitcast i64* %_Context to %struct.ExecCtx*
   %_large_null_ptr2 = getelementptr %struct.ExecCtx, %struct.ExecCtx* %_ctx2, i32 0, i32 1
   %_large_null2 = load i64, i64* %_large_null_ptr2
   %_null2= select i1 %_is_small_bool2, i64 %_small_null2, i64 %_large_null2
   %_dest_ptr2 = bitcast i64* %_loc_1 to i64* 
   store i64 %_null2, i64* %_dest_ptr2

   ; #Copy_Word_Op at 42:27
   %_source3 = bitcast i64* %_loc_1 to i64* 
   %_source_val3 = load i64, i64* %_source3
   %_loc_2 = bitcast i64 %_source_val3 to i64

   ; #Copy_Address_Op at 42:39
   %_source_val4 = bitcast i64* %_formal_param_1 to i64*
   %_loc_4 = bitcast i64* %_source_val4 to i64*

   ; #Copy_Word_Op at 42:39
   %_reg5_1 = bitcast i64* %_loc_4 to i64*
   %_source5 = getelementptr i64, i64* %_reg5_1, i64 0
   %_source_val5 = load i64, i64* %_source5
   %_loc_3 = bitcast i64 %_source_val5 to i64

   ; #Call_Op at 42:27
   %_cur_td6 = bitcast i64* %_Static_Link to %struct.TD*
   %_param_arr_ptr6 = getelementptr %struct.TD, %struct.TD* %_cur_td6, i32 0, i32 26
   %_param_arr6 = load %struct.ParamInfo*, %struct.ParamInfo** %_param_arr_ptr6
   %_formal_td_ptr_ptr6 = getelementptr %struct.ParamInfo, %struct.ParamInfo* %_param_arr6, i32 0, i32 1, i32 0
   %_formal_td6 = load %struct.TD*, %struct.TD** %_formal_td_ptr_ptr6
   %_call6_Static_Link = bitcast %struct.TD* %_formal_td6 to i64*
   %_new_arg_addr6_0 = getelementptr i64, i64* %_call6_Param_Area, i64 0
   store i64 %_loc_2, i64* %_new_arg_addr6_0
   %_new_arg_addr6_1 = getelementptr i64, i64* %_call6_Param_Area, i64 1
   store i64 %_loc_3, i64* %_new_arg_addr6_1
   call void @_psc_execute_compiled_nth_op_of_type(i64* %_Context, i64* %_call6_Param_Area, i64* %_call6_Static_Link, i16 3, i16 4)
   %_new_result_addr6_0 = getelementptr i64, i64* %_call6_Param_Area, i64 0
   %_new_result6_0 = load i64, i64* %_new_result_addr6_0
   %_result_addr6_0 = bitcast i64* %_loc_1 to i64* 
   store i64 %_new_result6_0, i64* %_result_addr6_0

   ; #Declare_Obj_Op at 43:16

   ; #Create_Obj_Op at 43:16
   %_desc8 = getelementptr i64, i64* %_Static_Link, i64 0
   %_src_addr8 = getelementptr i64, i64* %_Param_Area, i64 0
   %_src8 = load i64, i64* %_src_addr8
   %_dest8 = call i64@_psc_new_object(i64* %_Context, i64* %_desc8, i64 %_src8)
   %_dest_addr8 = bitcast i64* %_loc_6 to i64* 
   store i64 %_dest8, i64* %_dest_addr8

   ; #Copy_Word_Op at 43:16
   %_source9 = bitcast i64* %_loc_6 to i64* 
   %_source_val9 = load i64, i64* %_source9
   %_loc_7 = bitcast i64 %_source_val9 to i64

   ; #Copy_Word_Op at 43:26
   %_source10 = bitcast i64* %_loc_1 to i64* 
   %_source_val10 = load i64, i64* %_source10
   %_loc_9 = bitcast i64 %_source_val10 to i64

   ; #Make_Copy_In_Stg_Rgn_Op at 43:35
   %_desc11 = call i64* @_psc_get_type_desc_or_op_map(i64* %_Static_Link, i16 3, i16 1001)
   %_reg11_2 = inttoptr i64 %_loc_9 to i64*
   %_source_ptr11 = getelementptr i64, i64* %_reg11_2, i64 1
   %_source11 = load i64, i64* %_source_ptr11
   %_existing_obj11 = bitcast i64 %_loc_7 to i64
   %_result11 = call i64 @_psc_copy_object(i64* %_Context, i64* %_desc11, i64 %_source11, i64 %_existing_obj11)
   %_loc_8 = bitcast i64 %_result11 to i64

   ; #Copy_Word_Op at 43:35
   %_source_val12 = bitcast i64 %_loc_8 to i64
   %_reg12_2 = inttoptr i64 %_loc_7 to i64*
   %_dest12 = getelementptr i64, i64* %_reg12_2, i64 1
   store i64 %_source_val12, i64* %_dest12

   ; #Copy_Word_Op at 43:50
   %_source13 = bitcast i64* %_loc_1 to i64* 
   %_source_val13 = load i64, i64* %_source13
   %_loc_11 = bitcast i64 %_source_val13 to i64

   ; #Make_Copy_In_Stg_Rgn_Op at 43:59
   %_desc14 = call i64* @_psc_get_type_desc_or_op_map(i64* %_Static_Link, i16 3, i16 1001)
   %_reg14_2 = inttoptr i64 %_loc_11 to i64*
   %_source_ptr14 = getelementptr i64, i64* %_reg14_2, i64 2
   %_source14 = load i64, i64* %_source_ptr14
   %_existing_obj14 = bitcast i64 %_loc_7 to i64
   %_result14 = call i64 @_psc_copy_object(i64* %_Context, i64* %_desc14, i64 %_source14, i64 %_existing_obj14)
   %_loc_10 = bitcast i64 %_result14 to i64

   ; #Copy_Word_Op at 43:59
   %_source_val15 = bitcast i64 %_loc_10 to i64
   %_reg15_2 = inttoptr i64 %_loc_7 to i64*
   %_dest15 = getelementptr i64, i64* %_reg15_2, i64 2
   store i64 %_source_val15, i64* %_dest15

   ; #Copy_Address_Op at 43:72
   %_source_val16 = bitcast i64* %_formal_param_1 to i64*
   %_loc_13 = bitcast i64* %_source_val16 to i64*

   ; #Store_Address_Op at 43:72
   %_reg17_1 = bitcast i64* %_loc_13 to i64*
   %_addr17 = getelementptr i64, i64* %_reg17_1, i64 0
   %_reg17_2 = inttoptr i64 %_loc_7 to i64*
   %_dest_ptr17_Orig = getelementptr i64, i64* %_reg17_2, i64 3
   %_dest_ptr17 = bitcast i64* %_dest_ptr17_Orig to i64**
   store i64* %_addr17, i64** %_dest_ptr17

   ; #Copy_Word_Op at 43:16
   %_source18 = bitcast i64* %_loc_6 to i64* 
   %_source_val18 = load i64, i64* %_source18
   %_loc_5 = bitcast i64 %_source_val18 to i64

   ; #Copy_Word_Op at 43:9
   %_source_val19 = bitcast i64 %_loc_5 to i64
   %_dest19 = getelementptr i64, i64* %_Param_Area, i64 0
   store i64 %_source_val19, i64* %_dest19

   ; #Check_Not_Null_Op at 43:9
   %_arg_ptr20 = getelementptr i64, i64* %_Param_Area, i64 0
   %_arg20 = load i64, i64* %_arg_ptr20
   %_val_no_reg20 = and i64 %_arg20, -4294967295
   %_is_null20 = icmp eq i64 %_val_no_reg20, -144115188075855871
   br i1 %_is_null20, label %_fail20, label %_lbl21
   _fail20:
   %_str_ptr_ptr20 = load i64*, i64** @$Strings
   %_str_ptr20 = getelementptr i64, i64* %_str_ptr_ptr20, i64 4
   %_assert_str20 = load i64, i64* %_str_ptr20
   store i64 %_assert_str20, i64* %_print_param20
   call void @_psc_runtime_message(i64* %_Context, i64* %_print_param20, i64* null)

   br label %_lbl21

_lbl21:
   ; #Return_Op at 43:9
   call void @_psc_finalize_stg_rgn(i64* %_Context, i64* %_Local_Area)
   %_result_reg21 = load i64, i64* %_Param_Area
   ret i64 %_result_reg21

}

define i64 @"PSL.Containers.Slice.$slicing$.2"(i64* %_formal_param_1, i64 %_formal_param_2, i64* %_Context, i64* %_Static_Link, i64 %_inited_output) {
   %_Local_Area = alloca i64, i64 6
   %_sl = ptrtoint i64* %_Static_Link to i64
   store i64 %_sl, i64* %_Local_Area
   call void @_psc_initialize_stg_rgn(i64* %_Context, i64* %_Local_Area)
   %_Master = alloca i64, i64 3
   %_ms = ptrtoint i64* %_Master to i64
   %_store_ms = getelementptr i64, i64* %_Local_Area, i64 3
   store i64 %_ms, i64* %_store_ms

   %_Param_Area = alloca i64
   %_loc_1 = alloca i64
   %_call6_Param_Area = alloca i64, i64 2
   %_loc_5 = alloca i64
   %_print_param7 = alloca i64
   %_loc_8 = alloca i64
   %_print_param21 = alloca i64

   store i64 %_inited_output, i64* %_Param_Area
   %_param_addr_2 = getelementptr i64, i64* %_Local_Area, i64 4
   store i64 %_formal_param_2, i64* %_param_addr_2
   
   ; #Declare_Obj_Op at 50:15
   %_val1 = ptrtoint i64* %_loc_1 to i64;
   %_addr1 = getelementptr i64, i64* %_Local_Area, i64 5
   store i64 %_val1, i64* %_addr1

   ; #Store_Local_Null_Op at 50:15
   %_cur_td2 = bitcast i64* %_Static_Link to %struct.TD*
   %_nested_types_arr_ptr2 = getelementptr %struct.TD, %struct.TD* %_cur_td2, i32 0, i32 35
   %_nested_types_arr2 = load %struct.TD**, %struct.TD*** %_nested_types_arr_ptr2
   %_nested_td_ptr_ptr2 = getelementptr %struct.TD*, %struct.TD** %_nested_types_arr2, i32 0
   %_nested_td2 = load %struct.TD*, %struct.TD** %_nested_td_ptr_ptr2
   %_desc2 = bitcast %struct.TD* %_nested_td2 to i64*
   %_td2 = bitcast i64* %_desc2 to %struct.TD*
   %_is_small_ptr2 = getelementptr %struct.TD, %struct.TD* %_td2, i32 0, i32 13
   %_is_small2 = load i8, i8* %_is_small_ptr2
   %_is_small_bool2 = trunc i8 %_is_small2 to i1
   %_small_null_ptr2 = getelementptr %struct.TD, %struct.TD* %_td2, i32 0, i32 17
   %_small_null2 = load i64, i64* %_small_null_ptr2
   %_ctx2 = bitcast i64* %_Context to %struct.ExecCtx*
   %_large_null_ptr2 = getelementptr %struct.ExecCtx, %struct.ExecCtx* %_ctx2, i32 0, i32 1
   %_large_null2 = load i64, i64* %_large_null_ptr2
   %_null2= select i1 %_is_small_bool2, i64 %_small_null2, i64 %_large_null2
   %_dest_ptr2 = bitcast i64* %_loc_1 to i64* 
   store i64 %_null2, i64* %_dest_ptr2

   ; #Copy_Word_Op at 50:27
   %_source3 = bitcast i64* %_loc_1 to i64* 
   %_source_val3 = load i64, i64* %_source3
   %_loc_2 = bitcast i64 %_source_val3 to i64

   ; #Copy_Address_Op at 50:39
   %_source_val4 = bitcast i64* %_formal_param_1 to i64*
   %_loc_4 = bitcast i64* %_source_val4 to i64*

   ; #Copy_Word_Op at 50:39
   %_reg5_1 = bitcast i64* %_loc_4 to i64*
   %_source5 = getelementptr i64, i64* %_reg5_1, i64 0
   %_source_val5 = load i64, i64* %_source5
   %_loc_3 = bitcast i64 %_source_val5 to i64

   ; #Call_Op at 50:27
   %_cur_td6 = bitcast i64* %_Static_Link to %struct.TD*
   %_param_arr_ptr6 = getelementptr %struct.TD, %struct.TD* %_cur_td6, i32 0, i32 26
   %_param_arr6 = load %struct.ParamInfo*, %struct.ParamInfo** %_param_arr_ptr6
   %_formal_td_ptr_ptr6 = getelementptr %struct.ParamInfo, %struct.ParamInfo* %_param_arr6, i32 0, i32 1, i32 0
   %_formal_td6 = load %struct.TD*, %struct.TD** %_formal_td_ptr_ptr6
   %_call6_Static_Link = bitcast %struct.TD* %_formal_td6 to i64*
   %_new_arg_addr6_0 = getelementptr i64, i64* %_call6_Param_Area, i64 0
   store i64 %_loc_2, i64* %_new_arg_addr6_0
   %_new_arg_addr6_1 = getelementptr i64, i64* %_call6_Param_Area, i64 1
   store i64 %_loc_3, i64* %_new_arg_addr6_1
   call void @_psc_execute_compiled_nth_op_of_type(i64* %_Context, i64* %_call6_Param_Area, i64* %_call6_Static_Link, i16 3, i16 4)
   %_new_result_addr6_0 = getelementptr i64, i64* %_call6_Param_Area, i64 0
   %_new_result6_0 = load i64, i64* %_new_result_addr6_0
   %_result_addr6_0 = bitcast i64* %_loc_1 to i64* 
   store i64 %_new_result6_0, i64* %_result_addr6_0

   ; #Check_Nested_Block_Op at 51:37
   %_call7_Static_Link = getelementptr i64, i64* %_Local_Area, i64 0
   %_Skip_Level7 = call i32 @"PSL.Containers.Slice.$slicing$.2.22block"(i64* %_Context, i64* %_loc_5, i64* %_call7_Static_Link)
   %_assert7 = load i64, i64* %_loc_5
   %_assert_trunc7 = icmp eq i64 %_assert7, 1
   br i1 %_assert_trunc7, label %_lbl8, label %_fail7
   _fail7:
   %_str_ptr_ptr7 = load i64*, i64** @$Strings
   %_str_ptr7 = getelementptr i64, i64* %_str_ptr_ptr7, i64 6
   %_assert_str7 = load i64, i64* %_str_ptr7
   store i64 %_assert_str7, i64* %_print_param7
   call void @_psc_runtime_message(i64* %_Context, i64* %_print_param7, i64* null)
   br label %_lbl8

_lbl8:
   ; #Declare_Obj_Op at 54:16

   ; #Create_Obj_Op at 54:16
   %_desc9 = getelementptr i64, i64* %_Static_Link, i64 0
   %_src_addr9 = getelementptr i64, i64* %_Param_Area, i64 0
   %_src9 = load i64, i64* %_src_addr9
   %_dest9 = call i64@_psc_new_object(i64* %_Context, i64* %_desc9, i64 %_src9)
   %_dest_addr9 = bitcast i64* %_loc_8 to i64* 
   store i64 %_dest9, i64* %_dest_addr9

   ; #Copy_Word_Op at 54:16
   %_source10 = bitcast i64* %_loc_8 to i64* 
   %_source_val10 = load i64, i64* %_source10
   %_loc_9 = bitcast i64 %_source_val10 to i64

   ; #Copy_Word_Op at 54:26
   %_source_val11 = bitcast i64 %_formal_param_2 to i64
   %_loc_11 = bitcast i64 %_source_val11 to i64

   ; #Make_Copy_In_Stg_Rgn_Op at 54:33
   %_desc12 = call i64* @_psc_get_type_desc_or_op_map(i64* %_Static_Link, i16 3, i16 1001)
   %_reg12_2 = inttoptr i64 %_loc_11 to i64*
   %_source_ptr12 = getelementptr i64, i64* %_reg12_2, i64 1
   %_source12 = load i64, i64* %_source_ptr12
   %_existing_obj12 = bitcast i64 %_loc_9 to i64
   %_result12 = call i64 @_psc_copy_object(i64* %_Context, i64* %_desc12, i64 %_source12, i64 %_existing_obj12)
   %_loc_10 = bitcast i64 %_result12 to i64

   ; #Copy_Word_Op at 54:33
   %_source_val13 = bitcast i64 %_loc_10 to i64
   %_reg13_2 = inttoptr i64 %_loc_9 to i64*
   %_dest13 = getelementptr i64, i64* %_reg13_2, i64 1
   store i64 %_source_val13, i64* %_dest13

   ; #Copy_Word_Op at 54:48
   %_source_val14 = bitcast i64 %_formal_param_2 to i64
   %_loc_13 = bitcast i64 %_source_val14 to i64

   ; #Make_Copy_In_Stg_Rgn_Op at 54:55
   %_desc15 = call i64* @_psc_get_type_desc_or_op_map(i64* %_Static_Link, i16 3, i16 1001)
   %_reg15_2 = inttoptr i64 %_loc_13 to i64*
   %_source_ptr15 = getelementptr i64, i64* %_reg15_2, i64 2
   %_source15 = load i64, i64* %_source_ptr15
   %_existing_obj15 = bitcast i64 %_loc_9 to i64
   %_result15 = call i64 @_psc_copy_object(i64* %_Context, i64* %_desc15, i64 %_source15, i64 %_existing_obj15)
   %_loc_12 = bitcast i64 %_result15 to i64

   ; #Copy_Word_Op at 54:55
   %_source_val16 = bitcast i64 %_loc_12 to i64
   %_reg16_2 = inttoptr i64 %_loc_9 to i64*
   %_dest16 = getelementptr i64, i64* %_reg16_2, i64 2
   store i64 %_source_val16, i64* %_dest16

   ; #Copy_Address_Op at 54:68
   %_source_val17 = bitcast i64* %_formal_param_1 to i64*
   %_loc_15 = bitcast i64* %_source_val17 to i64*

   ; #Store_Address_Op at 54:68
   %_reg18_1 = bitcast i64* %_loc_15 to i64*
   %_addr18 = getelementptr i64, i64* %_reg18_1, i64 0
   %_reg18_2 = inttoptr i64 %_loc_9 to i64*
   %_dest_ptr18_Orig = getelementptr i64, i64* %_reg18_2, i64 3
   %_dest_ptr18 = bitcast i64* %_dest_ptr18_Orig to i64**
   store i64* %_addr18, i64** %_dest_ptr18

   ; #Copy_Word_Op at 54:16
   %_source19 = bitcast i64* %_loc_8 to i64* 
   %_source_val19 = load i64, i64* %_source19
   %_loc_7 = bitcast i64 %_source_val19 to i64

   ; #Copy_Word_Op at 54:9
   %_source_val20 = bitcast i64 %_loc_7 to i64
   %_dest20 = getelementptr i64, i64* %_Param_Area, i64 0
   store i64 %_source_val20, i64* %_dest20

   ; #Check_Not_Null_Op at 54:9
   %_arg_ptr21 = getelementptr i64, i64* %_Param_Area, i64 0
   %_arg21 = load i64, i64* %_arg_ptr21
   %_val_no_reg21 = and i64 %_arg21, -4294967295
   %_is_null21 = icmp eq i64 %_val_no_reg21, -144115188075855871
   br i1 %_is_null21, label %_fail21, label %_lbl22
   _fail21:
   %_str_ptr_ptr21 = load i64*, i64** @$Strings
   %_str_ptr21 = getelementptr i64, i64* %_str_ptr_ptr21, i64 7
   %_assert_str21 = load i64, i64* %_str_ptr21
   store i64 %_assert_str21, i64* %_print_param21
   call void @_psc_runtime_message(i64* %_Context, i64* %_print_param21, i64* null)

   br label %_lbl22

_lbl22:
   ; #Return_Op at 54:9
   call void @_psc_finalize_stg_rgn(i64* %_Context, i64* %_Local_Area)
   %_result_reg22 = load i64, i64* %_Param_Area
   ret i64 %_result_reg22

   ; #Begin_Nested_Block_Op at 51:37
}

define internal i32 @"PSL.Containers.Slice.$slicing$.2.22block"(i64* %_Context, i64* %_Param_Area, i64* %_Static_Link) {
   %_Local_Area = alloca i64, i64 4
   %_sl = ptrtoint i64* %_Static_Link to i64
   %_pa = ptrtoint i64* %_Param_Area to i64
   %_store_pa = getelementptr i64, i64* %_Local_Area, i64 1
   store i64 %_pa, i64* %_store_pa
   store i64 %_sl, i64* %_Local_Area

   %_loc_2 = alloca i64
   %_call29_Param_Area = alloca i64, i64 3
   %_loc_11 = alloca i64
   %_call39_Param_Area = alloca i64, i64 3
   %_call47_Param_Area = alloca i64, i64 3

   ; #Declare_Obj_Op at 51:37

   ; #Copy_Word_Op at 51:10
   %_source25 = getelementptr i64, i64* %_Static_Link, i64 4
   %_source_val25 = load i64, i64* %_source25
   %_loc_9 = bitcast i64 %_source_val25 to i64

   ; #Copy_Word_Op at 51:17
   %_reg26_1 = inttoptr i64 %_loc_9 to i64*
   %_source26 = getelementptr i64, i64* %_reg26_1, i64 1
   %_source_val26 = load i64, i64* %_source26
   %_loc_7 = bitcast i64 %_source_val26 to i64

   ; #Copy_Word_Op at 51:25
   %_source27 = getelementptr i64, i64* %_Static_Link, i64 4
   %_source_val27 = load i64, i64* %_source27
   %_loc_10 = bitcast i64 %_source_val27 to i64

   ; #Copy_Word_Op at 51:32
   %_reg28_1 = inttoptr i64 %_loc_10 to i64*
   %_source28 = getelementptr i64, i64* %_reg28_1, i64 2
   %_source_val28 = load i64, i64* %_source28
   %_loc_8 = bitcast i64 %_source_val28 to i64

   ; #Call_Op at 51:23
   %_ptr_val0_29 = load i64, i64* %_Static_Link
   %_ptr0_29 = inttoptr i64 %_ptr_val0_29 to i64*
   %_call29_Static_Link = call i64* @_psc_get_type_desc_or_op_map(i64* %_ptr0_29, i16 3, i16 1001)
   %_new_arg_addr29_1 = getelementptr i64, i64* %_call29_Param_Area, i64 1
   store i64 %_loc_7, i64* %_new_arg_addr29_1
   %_new_arg_addr29_2 = getelementptr i64, i64* %_call29_Param_Area, i64 2
   store i64 %_loc_8, i64* %_new_arg_addr29_2
   call void @_psc_execute_compiled_nth_op_of_type(i64* %_Context, i64* %_call29_Param_Area, i64* %_call29_Static_Link, i16 3, i16 5)
   %_new_result_addr29_0 = getelementptr i64, i64* %_call29_Param_Area, i64 0
   %_new_result29_0 = load i64, i64* %_new_result_addr29_0
   %_loc_4 = bitcast i64 %_new_result29_0 to i64

   ; #Store_Int_Lit_Op at 51:23
   %_loc_5 = bitcast i64 4 to i64

   ; #Call_Op at 51:23
   %_first_arg31 = bitcast i64 %_loc_4 to i64
   %_secon_arg31 = bitcast i64 %_loc_5 to i64
   %_mask_shifted31 = lshr i64 %_secon_arg31, %_first_arg31
   %_resul31 = and i64 1, %_mask_shifted31
   %_resul31_ptr = bitcast i64* %_loc_2 to i64* 
   store i64 %_resul31, i64* %_resul31_ptr

   ; #If_Op at 51:37
   %_if_source_ptr32 = bitcast i64* %_loc_2 to i64* 
   %_if_source_val32 = load i64, i64* %_if_source_ptr32
   %_if_source_trunc32 = icmp eq i64 %_if_source_val32, 1
   br i1 %_if_source_trunc32, label %_lbl33, label %_lbl34

_lbl33:
   ; #Skip_Op at 51:37
   br label %_lbl52

_lbl34:
   ; #Declare_Obj_Op at 52:43

   ; #Copy_Word_Op at 52:12
   %_source35 = getelementptr i64, i64* %_Static_Link, i64 4
   %_source_val35 = load i64, i64* %_source35
   %_loc_18 = bitcast i64 %_source_val35 to i64

   ; #Copy_Word_Op at 52:19
   %_reg36_1 = inttoptr i64 %_loc_18 to i64*
   %_source36 = getelementptr i64, i64* %_reg36_1, i64 1
   %_source_val36 = load i64, i64* %_source36
   %_loc_16 = bitcast i64 %_source_val36 to i64

   ; #Copy_Word_Op at 52:28
   %_encl_local_ptr37_1 = getelementptr i64, i64* %_Static_Link, i64 5
   %_encl_local_ptr_ptr37_1 = bitcast i64* %_encl_local_ptr37_1 to i64**
   %_source37 = load i64*, i64** %_encl_local_ptr_ptr37_1
   %_source_val37 = load i64, i64* %_source37
   %_loc_19 = bitcast i64 %_source_val37 to i64

   ; #Copy_Word_Op at 52:37
   %_reg38_1 = inttoptr i64 %_loc_19 to i64*
   %_source38 = getelementptr i64, i64* %_reg38_1, i64 1
   %_source_val38 = load i64, i64* %_source38
   %_loc_17 = bitcast i64 %_source_val38 to i64

   ; #Call_Op at 52:25
   %_ptr_val0_39 = load i64, i64* %_Static_Link
   %_ptr0_39 = inttoptr i64 %_ptr_val0_39 to i64*
   %_call39_Static_Link = call i64* @_psc_get_type_desc_or_op_map(i64* %_ptr0_39, i16 3, i16 1001)
   %_new_arg_addr39_1 = getelementptr i64, i64* %_call39_Param_Area, i64 1
   store i64 %_loc_16, i64* %_new_arg_addr39_1
   %_new_arg_addr39_2 = getelementptr i64, i64* %_call39_Param_Area, i64 2
   store i64 %_loc_17, i64* %_new_arg_addr39_2
   call void @_psc_execute_compiled_nth_op_of_type(i64* %_Context, i64* %_call39_Param_Area, i64* %_call39_Static_Link, i16 3, i16 5)
   %_new_result_addr39_0 = getelementptr i64, i64* %_call39_Param_Area, i64 0
   %_new_result39_0 = load i64, i64* %_new_result_addr39_0
   %_loc_13 = bitcast i64 %_new_result39_0 to i64

   ; #Store_Int_Lit_Op at 52:25
   %_loc_14 = bitcast i64 6 to i64

   ; #Call_Op at 52:25
   %_first_arg41 = bitcast i64 %_loc_13 to i64
   %_secon_arg41 = bitcast i64 %_loc_14 to i64
   %_mask_shifted41 = lshr i64 %_secon_arg41, %_first_arg41
   %_resul41 = and i64 1, %_mask_shifted41
   %_resul41_ptr = bitcast i64* %_loc_11 to i64* 
   store i64 %_resul41, i64* %_resul41_ptr

   ; #If_Op at 52:43
   %_if_source_ptr42 = bitcast i64* %_loc_11 to i64* 
   %_if_source_val42 = load i64, i64* %_if_source_ptr42
   %_if_source_trunc42 = icmp eq i64 %_if_source_val42, 1
   br i1 %_if_source_trunc42, label %_lbl43, label %_lbl51

_lbl43:
   ; #Copy_Word_Op at 53:13
   %_source43 = getelementptr i64, i64* %_Static_Link, i64 4
   %_source_val43 = load i64, i64* %_source43
   %_loc_26 = bitcast i64 %_source_val43 to i64

   ; #Copy_Word_Op at 53:20
   %_reg44_1 = inttoptr i64 %_loc_26 to i64*
   %_source44 = getelementptr i64, i64* %_reg44_1, i64 2
   %_source_val44 = load i64, i64* %_source44
   %_loc_24 = bitcast i64 %_source_val44 to i64

   ; #Copy_Word_Op at 53:28
   %_encl_local_ptr45_1 = getelementptr i64, i64* %_Static_Link, i64 5
   %_encl_local_ptr_ptr45_1 = bitcast i64* %_encl_local_ptr45_1 to i64**
   %_source45 = load i64*, i64** %_encl_local_ptr_ptr45_1
   %_source_val45 = load i64, i64* %_source45
   %_loc_27 = bitcast i64 %_source_val45 to i64

   ; #Copy_Word_Op at 53:37
   %_reg46_1 = inttoptr i64 %_loc_27 to i64*
   %_source46 = getelementptr i64, i64* %_reg46_1, i64 2
   %_source_val46 = load i64, i64* %_source46
   %_loc_25 = bitcast i64 %_source_val46 to i64

   ; #Call_Op at 53:25
   %_ptr_val0_47 = load i64, i64* %_Static_Link
   %_ptr0_47 = inttoptr i64 %_ptr_val0_47 to i64*
   %_call47_Static_Link = call i64* @_psc_get_type_desc_or_op_map(i64* %_ptr0_47, i16 3, i16 1001)
   %_new_arg_addr47_1 = getelementptr i64, i64* %_call47_Param_Area, i64 1
   store i64 %_loc_24, i64* %_new_arg_addr47_1
   %_new_arg_addr47_2 = getelementptr i64, i64* %_call47_Param_Area, i64 2
   store i64 %_loc_25, i64* %_new_arg_addr47_2
   call void @_psc_execute_compiled_nth_op_of_type(i64* %_Context, i64* %_call47_Param_Area, i64* %_call47_Static_Link, i16 3, i16 5)
   %_new_result_addr47_0 = getelementptr i64, i64* %_call47_Param_Area, i64 0
   %_new_result47_0 = load i64, i64* %_new_result_addr47_0
   %_loc_21 = bitcast i64 %_new_result47_0 to i64

   ; #Store_Int_Lit_Op at 53:25
   %_loc_22 = bitcast i64 3 to i64

   ; #Call_Op at 53:25
   %_first_arg49 = bitcast i64 %_loc_21 to i64
   %_secon_arg49 = bitcast i64 %_loc_22 to i64
   %_mask_shifted49 = lshr i64 %_secon_arg49, %_first_arg49
   %_resul49 = and i64 1, %_mask_shifted49
   %_resul49_ptr = bitcast i64* %_loc_11 to i64* 
   store i64 %_resul49, i64* %_resul49_ptr

   ; #Skip_Op at 52:43
   br label %_lbl51

_lbl51:
   ; #Copy_Word_Op at 52:43
   %_source51 = bitcast i64* %_loc_11 to i64* 
   %_source_val51 = load i64, i64* %_source51
   %_dest51 = bitcast i64* %_loc_2 to i64* 
   store i64 %_source_val51, i64* %_dest51

   br label %_lbl52

_lbl52:
   ; #Copy_Word_Op at 51:37
   %_source52 = bitcast i64* %_loc_2 to i64* 
   %_source_val52 = load i64, i64* %_source52
   %_loc_1 = bitcast i64 %_source_val52 to i64

   ; #Copy_Word_Op at 0:0
   %_source_val53 = bitcast i64 %_loc_1 to i64
   %_dest53 = getelementptr i64, i64* %_Param_Area, i64 0
   store i64 %_source_val53, i64* %_dest53

   ; #Exit_Op at 0:0
   ret i32 0

}

define i64 @"PSL.Containers.Slice.$slicing$.3"(i64 %_formal_param_1, i64 %_formal_param_2, i64* %_Context, i64* %_Static_Link, i64 %_inited_output) {
   %_Local_Area = alloca i64, i64 6
   %_sl = ptrtoint i64* %_Static_Link to i64
   store i64 %_sl, i64* %_Local_Area

   %_Param_Area = alloca i64
   %_loc_1 = alloca i64
   %_print_param1 = alloca i64
   %_loc_4 = alloca i64
   %_print_param16 = alloca i64

   store i64 %_inited_output, i64* %_Param_Area
   %_param_addr_1 = getelementptr i64, i64* %_Local_Area, i64 4
   store i64 %_formal_param_1, i64* %_param_addr_1
   %_param_addr_2 = getelementptr i64, i64* %_Local_Area, i64 5
   store i64 %_formal_param_2, i64* %_param_addr_2
   
   ; #Check_Nested_Block_Op at 61:37
   %_call1_Static_Link = getelementptr i64, i64* %_Local_Area, i64 0
   %_Skip_Level1 = call i32 @"PSL.Containers.Slice.$slicing$.3.17block"(i64* %_Context, i64* %_loc_1, i64* %_call1_Static_Link)
   %_assert1 = load i64, i64* %_loc_1
   %_assert_trunc1 = icmp eq i64 %_assert1, 1
   br i1 %_assert_trunc1, label %_lbl2, label %_fail1
   _fail1:
   %_str_ptr_ptr1 = load i64*, i64** @$Strings
   %_str_ptr1 = getelementptr i64, i64* %_str_ptr_ptr1, i64 9
   %_assert_str1 = load i64, i64* %_str_ptr1
   store i64 %_assert_str1, i64* %_print_param1
   call void @_psc_runtime_message(i64* %_Context, i64* %_print_param1, i64* null)
   br label %_lbl2

_lbl2:
   ; #Declare_Obj_Op at 64:16

   ; #Create_Obj_Op at 64:16
   %_desc3 = getelementptr i64, i64* %_Static_Link, i64 0
   %_src_addr3 = getelementptr i64, i64* %_Param_Area, i64 0
   %_src3 = load i64, i64* %_src_addr3
   %_dest3 = call i64@_psc_new_object(i64* %_Context, i64* %_desc3, i64 %_src3)
   %_dest_addr3 = bitcast i64* %_loc_4 to i64* 
   store i64 %_dest3, i64* %_dest_addr3

   ; #Copy_Word_Op at 64:16
   %_source4 = bitcast i64* %_loc_4 to i64* 
   %_source_val4 = load i64, i64* %_source4
   %_loc_5 = bitcast i64 %_source_val4 to i64

   ; #Copy_Word_Op at 64:26
   %_source_val5 = bitcast i64 %_formal_param_2 to i64
   %_loc_7 = bitcast i64 %_source_val5 to i64

   ; #Make_Copy_In_Stg_Rgn_Op at 64:33
   %_desc6 = call i64* @_psc_get_type_desc_or_op_map(i64* %_Static_Link, i16 3, i16 1001)
   %_reg6_2 = inttoptr i64 %_loc_7 to i64*
   %_source_ptr6 = getelementptr i64, i64* %_reg6_2, i64 1
   %_source6 = load i64, i64* %_source_ptr6
   %_existing_obj6 = bitcast i64 %_loc_5 to i64
   %_result6 = call i64 @_psc_copy_object(i64* %_Context, i64* %_desc6, i64 %_source6, i64 %_existing_obj6)
   %_loc_6 = bitcast i64 %_result6 to i64

   ; #Copy_Word_Op at 64:33
   %_source_val7 = bitcast i64 %_loc_6 to i64
   %_reg7_2 = inttoptr i64 %_loc_5 to i64*
   %_dest7 = getelementptr i64, i64* %_reg7_2, i64 1
   store i64 %_source_val7, i64* %_dest7

   ; #Copy_Word_Op at 64:48
   %_source_val8 = bitcast i64 %_formal_param_2 to i64
   %_loc_9 = bitcast i64 %_source_val8 to i64

   ; #Make_Copy_In_Stg_Rgn_Op at 64:55
   %_desc9 = call i64* @_psc_get_type_desc_or_op_map(i64* %_Static_Link, i16 3, i16 1001)
   %_reg9_2 = inttoptr i64 %_loc_9 to i64*
   %_source_ptr9 = getelementptr i64, i64* %_reg9_2, i64 2
   %_source9 = load i64, i64* %_source_ptr9
   %_existing_obj9 = bitcast i64 %_loc_5 to i64
   %_result9 = call i64 @_psc_copy_object(i64* %_Context, i64* %_desc9, i64 %_source9, i64 %_existing_obj9)
   %_loc_8 = bitcast i64 %_result9 to i64

   ; #Copy_Word_Op at 64:55
   %_source_val10 = bitcast i64 %_loc_8 to i64
   %_reg10_2 = inttoptr i64 %_loc_5 to i64*
   %_dest10 = getelementptr i64, i64* %_reg10_2, i64 2
   store i64 %_source_val10, i64* %_dest10

   ; #Copy_Word_Op at 64:68
   %_source_val11 = bitcast i64 %_formal_param_1 to i64
   %_loc_11 = bitcast i64 %_source_val11 to i64

   ; #Copy_Address_Op at 64:70
   %_reg12_1 = inttoptr i64 %_loc_11 to i64*
   %_source12_Orig = getelementptr i64, i64* %_reg12_1, i64 3
   %_source12 = bitcast i64* %_source12_Orig to i64**
   %_source_val12 = load i64*, i64** %_source12
   %_loc_12 = bitcast i64* %_source_val12 to i64*

   ; #Store_Address_Op at 64:70
   %_reg13_1 = bitcast i64* %_loc_12 to i64*
   %_addr13 = getelementptr i64, i64* %_reg13_1, i64 0
   %_reg13_2 = inttoptr i64 %_loc_5 to i64*
   %_dest_ptr13_Orig = getelementptr i64, i64* %_reg13_2, i64 3
   %_dest_ptr13 = bitcast i64* %_dest_ptr13_Orig to i64**
   store i64* %_addr13, i64** %_dest_ptr13

   ; #Copy_Word_Op at 64:16
   %_source14 = bitcast i64* %_loc_4 to i64* 
   %_source_val14 = load i64, i64* %_source14
   %_loc_3 = bitcast i64 %_source_val14 to i64

   ; #Copy_Word_Op at 64:9
   %_source_val15 = bitcast i64 %_loc_3 to i64
   %_dest15 = getelementptr i64, i64* %_Param_Area, i64 0
   store i64 %_source_val15, i64* %_dest15

   ; #Check_Not_Null_Op at 64:9
   %_arg_ptr16 = getelementptr i64, i64* %_Param_Area, i64 0
   %_arg16 = load i64, i64* %_arg_ptr16
   %_val_no_reg16 = and i64 %_arg16, -4294967295
   %_is_null16 = icmp eq i64 %_val_no_reg16, -144115188075855871
   br i1 %_is_null16, label %_fail16, label %_lbl17
   _fail16:
   %_str_ptr_ptr16 = load i64*, i64** @$Strings
   %_str_ptr16 = getelementptr i64, i64* %_str_ptr_ptr16, i64 10
   %_assert_str16 = load i64, i64* %_str_ptr16
   store i64 %_assert_str16, i64* %_print_param16
   call void @_psc_runtime_message(i64* %_Context, i64* %_print_param16, i64* null)

   br label %_lbl17

_lbl17:
   ; #Return_Op at 64:9
   %_result_reg17 = load i64, i64* %_Param_Area
   ret i64 %_result_reg17

   ; #Begin_Nested_Block_Op at 61:37
}

define internal i32 @"PSL.Containers.Slice.$slicing$.3.17block"(i64* %_Context, i64* %_Param_Area, i64* %_Static_Link) {
   %_Local_Area = alloca i64, i64 4
   %_sl = ptrtoint i64* %_Static_Link to i64
   %_pa = ptrtoint i64* %_Param_Area to i64
   %_store_pa = getelementptr i64, i64* %_Local_Area, i64 1
   store i64 %_pa, i64* %_store_pa
   store i64 %_sl, i64* %_Local_Area

   %_loc_2 = alloca i64
   %_call24_Param_Area = alloca i64, i64 3
   %_loc_11 = alloca i64
   %_call34_Param_Area = alloca i64, i64 3
   %_call42_Param_Area = alloca i64, i64 3

   ; #Declare_Obj_Op at 61:37

   ; #Copy_Word_Op at 61:10
   %_source20 = getelementptr i64, i64* %_Static_Link, i64 5
   %_source_val20 = load i64, i64* %_source20
   %_loc_9 = bitcast i64 %_source_val20 to i64

   ; #Copy_Word_Op at 61:17
   %_reg21_1 = inttoptr i64 %_loc_9 to i64*
   %_source21 = getelementptr i64, i64* %_reg21_1, i64 1
   %_source_val21 = load i64, i64* %_source21
   %_loc_7 = bitcast i64 %_source_val21 to i64

   ; #Copy_Word_Op at 61:25
   %_source22 = getelementptr i64, i64* %_Static_Link, i64 5
   %_source_val22 = load i64, i64* %_source22
   %_loc_10 = bitcast i64 %_source_val22 to i64

   ; #Copy_Word_Op at 61:32
   %_reg23_1 = inttoptr i64 %_loc_10 to i64*
   %_source23 = getelementptr i64, i64* %_reg23_1, i64 2
   %_source_val23 = load i64, i64* %_source23
   %_loc_8 = bitcast i64 %_source_val23 to i64

   ; #Call_Op at 61:23
   %_ptr_val0_24 = load i64, i64* %_Static_Link
   %_ptr0_24 = inttoptr i64 %_ptr_val0_24 to i64*
   %_call24_Static_Link = call i64* @_psc_get_type_desc_or_op_map(i64* %_ptr0_24, i16 3, i16 1001)
   %_new_arg_addr24_1 = getelementptr i64, i64* %_call24_Param_Area, i64 1
   store i64 %_loc_7, i64* %_new_arg_addr24_1
   %_new_arg_addr24_2 = getelementptr i64, i64* %_call24_Param_Area, i64 2
   store i64 %_loc_8, i64* %_new_arg_addr24_2
   call void @_psc_execute_compiled_nth_op_of_type(i64* %_Context, i64* %_call24_Param_Area, i64* %_call24_Static_Link, i16 3, i16 5)
   %_new_result_addr24_0 = getelementptr i64, i64* %_call24_Param_Area, i64 0
   %_new_result24_0 = load i64, i64* %_new_result_addr24_0
   %_loc_4 = bitcast i64 %_new_result24_0 to i64

   ; #Store_Int_Lit_Op at 61:23
   %_loc_5 = bitcast i64 4 to i64

   ; #Call_Op at 61:23
   %_first_arg26 = bitcast i64 %_loc_4 to i64
   %_secon_arg26 = bitcast i64 %_loc_5 to i64
   %_mask_shifted26 = lshr i64 %_secon_arg26, %_first_arg26
   %_resul26 = and i64 1, %_mask_shifted26
   %_resul26_ptr = bitcast i64* %_loc_2 to i64* 
   store i64 %_resul26, i64* %_resul26_ptr

   ; #If_Op at 61:37
   %_if_source_ptr27 = bitcast i64* %_loc_2 to i64* 
   %_if_source_val27 = load i64, i64* %_if_source_ptr27
   %_if_source_trunc27 = icmp eq i64 %_if_source_val27, 1
   br i1 %_if_source_trunc27, label %_lbl28, label %_lbl29

_lbl28:
   ; #Skip_Op at 61:37
   br label %_lbl47

_lbl29:
   ; #Declare_Obj_Op at 62:36

   ; #Copy_Word_Op at 62:12
   %_source30 = getelementptr i64, i64* %_Static_Link, i64 5
   %_source_val30 = load i64, i64* %_source30
   %_loc_18 = bitcast i64 %_source_val30 to i64

   ; #Copy_Word_Op at 62:19
   %_reg31_1 = inttoptr i64 %_loc_18 to i64*
   %_source31 = getelementptr i64, i64* %_reg31_1, i64 1
   %_source_val31 = load i64, i64* %_source31
   %_loc_16 = bitcast i64 %_source_val31 to i64

   ; #Copy_Word_Op at 62:28
   %_source32 = getelementptr i64, i64* %_Static_Link, i64 4
   %_source_val32 = load i64, i64* %_source32
   %_loc_19 = bitcast i64 %_source_val32 to i64

   ; #Copy_Word_Op at 62:30
   %_reg33_1 = inttoptr i64 %_loc_19 to i64*
   %_source33 = getelementptr i64, i64* %_reg33_1, i64 1
   %_source_val33 = load i64, i64* %_source33
   %_loc_17 = bitcast i64 %_source_val33 to i64

   ; #Call_Op at 62:25
   %_ptr_val0_34 = load i64, i64* %_Static_Link
   %_ptr0_34 = inttoptr i64 %_ptr_val0_34 to i64*
   %_call34_Static_Link = call i64* @_psc_get_type_desc_or_op_map(i64* %_ptr0_34, i16 3, i16 1001)
   %_new_arg_addr34_1 = getelementptr i64, i64* %_call34_Param_Area, i64 1
   store i64 %_loc_16, i64* %_new_arg_addr34_1
   %_new_arg_addr34_2 = getelementptr i64, i64* %_call34_Param_Area, i64 2
   store i64 %_loc_17, i64* %_new_arg_addr34_2
   call void @_psc_execute_compiled_nth_op_of_type(i64* %_Context, i64* %_call34_Param_Area, i64* %_call34_Static_Link, i16 3, i16 5)
   %_new_result_addr34_0 = getelementptr i64, i64* %_call34_Param_Area, i64 0
   %_new_result34_0 = load i64, i64* %_new_result_addr34_0
   %_loc_13 = bitcast i64 %_new_result34_0 to i64

   ; #Store_Int_Lit_Op at 62:25
   %_loc_14 = bitcast i64 6 to i64

   ; #Call_Op at 62:25
   %_first_arg36 = bitcast i64 %_loc_13 to i64
   %_secon_arg36 = bitcast i64 %_loc_14 to i64
   %_mask_shifted36 = lshr i64 %_secon_arg36, %_first_arg36
   %_resul36 = and i64 1, %_mask_shifted36
   %_resul36_ptr = bitcast i64* %_loc_11 to i64* 
   store i64 %_resul36, i64* %_resul36_ptr

   ; #If_Op at 62:36
   %_if_source_ptr37 = bitcast i64* %_loc_11 to i64* 
   %_if_source_val37 = load i64, i64* %_if_source_ptr37
   %_if_source_trunc37 = icmp eq i64 %_if_source_val37, 1
   br i1 %_if_source_trunc37, label %_lbl38, label %_lbl46

_lbl38:
   ; #Copy_Word_Op at 62:45
   %_source38 = getelementptr i64, i64* %_Static_Link, i64 5
   %_source_val38 = load i64, i64* %_source38
   %_loc_26 = bitcast i64 %_source_val38 to i64

   ; #Copy_Word_Op at 62:52
   %_reg39_1 = inttoptr i64 %_loc_26 to i64*
   %_source39 = getelementptr i64, i64* %_reg39_1, i64 2
   %_source_val39 = load i64, i64* %_source39
   %_loc_24 = bitcast i64 %_source_val39 to i64

   ; #Copy_Word_Op at 62:60
   %_source40 = getelementptr i64, i64* %_Static_Link, i64 4
   %_source_val40 = load i64, i64* %_source40
   %_loc_27 = bitcast i64 %_source_val40 to i64

   ; #Copy_Word_Op at 62:62
   %_reg41_1 = inttoptr i64 %_loc_27 to i64*
   %_source41 = getelementptr i64, i64* %_reg41_1, i64 2
   %_source_val41 = load i64, i64* %_source41
   %_loc_25 = bitcast i64 %_source_val41 to i64

   ; #Call_Op at 62:57
   %_ptr_val0_42 = load i64, i64* %_Static_Link
   %_ptr0_42 = inttoptr i64 %_ptr_val0_42 to i64*
   %_call42_Static_Link = call i64* @_psc_get_type_desc_or_op_map(i64* %_ptr0_42, i16 3, i16 1001)
   %_new_arg_addr42_1 = getelementptr i64, i64* %_call42_Param_Area, i64 1
   store i64 %_loc_24, i64* %_new_arg_addr42_1
   %_new_arg_addr42_2 = getelementptr i64, i64* %_call42_Param_Area, i64 2
   store i64 %_loc_25, i64* %_new_arg_addr42_2
   call void @_psc_execute_compiled_nth_op_of_type(i64* %_Context, i64* %_call42_Param_Area, i64* %_call42_Static_Link, i16 3, i16 5)
   %_new_result_addr42_0 = getelementptr i64, i64* %_call42_Param_Area, i64 0
   %_new_result42_0 = load i64, i64* %_new_result_addr42_0
   %_loc_21 = bitcast i64 %_new_result42_0 to i64

   ; #Store_Int_Lit_Op at 62:57
   %_loc_22 = bitcast i64 3 to i64

   ; #Call_Op at 62:57
   %_first_arg44 = bitcast i64 %_loc_21 to i64
   %_secon_arg44 = bitcast i64 %_loc_22 to i64
   %_mask_shifted44 = lshr i64 %_secon_arg44, %_first_arg44
   %_resul44 = and i64 1, %_mask_shifted44
   %_resul44_ptr = bitcast i64* %_loc_11 to i64* 
   store i64 %_resul44, i64* %_resul44_ptr

   ; #Skip_Op at 62:36
   br label %_lbl46

_lbl46:
   ; #Copy_Word_Op at 62:36
   %_source46 = bitcast i64* %_loc_11 to i64* 
   %_source_val46 = load i64, i64* %_source46
   %_dest46 = bitcast i64* %_loc_2 to i64* 
   store i64 %_source_val46, i64* %_dest46

   br label %_lbl47

_lbl47:
   ; #Copy_Word_Op at 61:37
   %_source47 = bitcast i64* %_loc_2 to i64* 
   %_source_val47 = load i64, i64* %_source47
   %_loc_1 = bitcast i64 %_source_val47 to i64

   ; #Copy_Word_Op at 0:0
   %_source_val48 = bitcast i64 %_loc_1 to i64
   %_dest48 = getelementptr i64, i64* %_Param_Area, i64 0
   store i64 %_source_val48, i64* %_dest48

   ; #Exit_Op at 0:0
   ret i32 0

}

define i64* @"PSL.Containers.Slice.$indexing$"(i64 %_formal_param_1, i64 %_formal_param_2, i64* %_Context, i64* %_Static_Link) {
   %_Local_Area = alloca i64, i64 6
   %_sl = ptrtoint i64* %_Static_Link to i64
   store i64 %_sl, i64* %_Local_Area

   %_Param_Area = alloca i64
   %_loc_1 = alloca i64
   %_print_param1 = alloca i64
   %_call6_Param_Area = alloca i64, i64 3

   %_param_addr_1 = getelementptr i64, i64* %_Local_Area, i64 4
   store i64 %_formal_param_1, i64* %_param_addr_1
   %_param_addr_2 = getelementptr i64, i64* %_Local_Area, i64 5
   store i64 %_formal_param_2, i64* %_param_addr_2
   
   ; #Check_Nested_Block_Op at 70:27
   %_call1_Static_Link = getelementptr i64, i64* %_Local_Area, i64 0
   %_Skip_Level1 = call i32 @"PSL.Containers.Slice.$indexing$.8block"(i64* %_Context, i64* %_loc_1, i64* %_call1_Static_Link)
   %_assert1 = load i64, i64* %_loc_1
   %_assert_trunc1 = icmp eq i64 %_assert1, 1
   br i1 %_assert_trunc1, label %_lbl2, label %_fail1
   _fail1:
   %_str_ptr_ptr1 = load i64*, i64** @$Strings
   %_str_ptr1 = getelementptr i64, i64* %_str_ptr_ptr1, i64 12
   %_assert_str1 = load i64, i64* %_str_ptr1
   store i64 %_assert_str1, i64* %_print_param1
   call void @_psc_runtime_message(i64* %_Context, i64* %_print_param1, i64* null)
   br label %_lbl2

_lbl2:
   ; #Copy_Word_Op at 72:16
   %_source_val2 = bitcast i64 %_formal_param_1 to i64
   %_loc_8 = bitcast i64 %_source_val2 to i64

   ; #Copy_Address_Op at 72:18
   %_reg3_1 = inttoptr i64 %_loc_8 to i64*
   %_source3_Orig = getelementptr i64, i64* %_reg3_1, i64 3
   %_source3 = bitcast i64* %_source3_Orig to i64**
   %_source_val3 = load i64*, i64** %_source3
   %_loc_9 = bitcast i64* %_source_val3 to i64*

   ; #Store_Address_Op at 72:18
   %_reg4_1 = bitcast i64* %_loc_9 to i64*
   %_addr4 = getelementptr i64, i64* %_reg4_1, i64 0
   %_loc_6 = bitcast i64* %_addr4 to i64*

   ; #Copy_Word_Op at 72:22
   %_source_val5 = bitcast i64 %_formal_param_2 to i64
   %_loc_7 = bitcast i64 %_source_val5 to i64

   ; #Call_Op at 72:18
   %_cur_td6 = bitcast i64* %_Static_Link to %struct.TD*
   %_param_arr_ptr6 = getelementptr %struct.TD, %struct.TD* %_cur_td6, i32 0, i32 26
   %_param_arr6 = load %struct.ParamInfo*, %struct.ParamInfo** %_param_arr_ptr6
   %_formal_td_ptr_ptr6 = getelementptr %struct.ParamInfo, %struct.ParamInfo* %_param_arr6, i32 0, i32 1, i32 0
   %_formal_td6 = load %struct.TD*, %struct.TD** %_formal_td_ptr_ptr6
   %_call6_Static_Link = bitcast %struct.TD* %_formal_td6 to i64*
   %_new_arg_addr6_1 = getelementptr i64, i64* %_call6_Param_Area, i64 1
   %_new_arg_addr6_1_ptr = bitcast i64* %_new_arg_addr6_1 to i64**
   store i64* %_loc_6, i64** %_new_arg_addr6_1_ptr
   %_new_arg_addr6_2 = getelementptr i64, i64* %_call6_Param_Area, i64 2
   store i64 %_loc_7, i64* %_new_arg_addr6_2
   call void @_psc_execute_compiled_nth_op_of_type(i64* %_Context, i64* %_call6_Param_Area, i64* %_call6_Static_Link, i16 3, i16 1)
   %_new_result_addr6_0 = getelementptr i64, i64* %_call6_Param_Area, i64 0
   %_new_result_addr_ind6_0 = bitcast i64* %_new_result_addr6_0 to i64**
   %_new_result6_0 = load i64*, i64** %_new_result_addr_ind6_0
   %_loc_4 = bitcast i64* %_new_result6_0 to i64*

   ; #Store_Address_Op at 72:9
   %_reg7_1 = bitcast i64* %_loc_4 to i64*
   %_addr7 = getelementptr i64, i64* %_reg7_1, i64 0
   %_dest_ptr7_Orig = getelementptr i64, i64* %_Param_Area, i64 0
   %_dest_ptr7 = bitcast i64* %_dest_ptr7_Orig to i64**
   store i64* %_addr7, i64** %_dest_ptr7

   ; #Return_Op at 72:9
   %_result_reg_ptr8 = bitcast i64* %_Param_Area to i64**
   %_result_reg8 = load i64*, i64** %_result_reg_ptr8
   ret i64* %_result_reg8

   ; #Begin_Nested_Block_Op at 70:27
}

define internal i32 @"PSL.Containers.Slice.$indexing$.8block"(i64* %_Context, i64* %_Param_Area, i64* %_Static_Link) {
   %_Local_Area = alloca i64, i64 4
   %_sl = ptrtoint i64* %_Static_Link to i64
   %_pa = ptrtoint i64* %_Param_Area to i64
   %_store_pa = getelementptr i64, i64* %_Local_Area, i64 1
   store i64 %_pa, i64* %_store_pa
   store i64 %_sl, i64* %_Local_Area

   %_loc_2 = alloca i64
   %_call14_Param_Area = alloca i64, i64 3
   %_call21_Param_Area = alloca i64, i64 3

   ; #Declare_Obj_Op at 70:27

   ; #Copy_Word_Op at 70:10
   %_source11 = getelementptr i64, i64* %_Static_Link, i64 5
   %_source_val11 = load i64, i64* %_source11
   %_loc_7 = bitcast i64 %_source_val11 to i64

   ; #Copy_Word_Op at 70:19
   %_source12 = getelementptr i64, i64* %_Static_Link, i64 4
   %_source_val12 = load i64, i64* %_source12
   %_loc_9 = bitcast i64 %_source_val12 to i64

   ; #Copy_Word_Op at 70:21
   %_reg13_1 = inttoptr i64 %_loc_9 to i64*
   %_source13 = getelementptr i64, i64* %_reg13_1, i64 1
   %_source_val13 = load i64, i64* %_source13
   %_loc_8 = bitcast i64 %_source_val13 to i64

   ; #Call_Op at 70:16
   %_ptr_val0_14 = load i64, i64* %_Static_Link
   %_ptr0_14 = inttoptr i64 %_ptr_val0_14 to i64*
   %_call14_Static_Link = call i64* @_psc_get_type_desc_or_op_map(i64* %_ptr0_14, i16 3, i16 1001)
   %_new_arg_addr14_1 = getelementptr i64, i64* %_call14_Param_Area, i64 1
   store i64 %_loc_7, i64* %_new_arg_addr14_1
   %_new_arg_addr14_2 = getelementptr i64, i64* %_call14_Param_Area, i64 2
   store i64 %_loc_8, i64* %_new_arg_addr14_2
   call void @_psc_execute_compiled_nth_op_of_type(i64* %_Context, i64* %_call14_Param_Area, i64* %_call14_Static_Link, i16 3, i16 5)
   %_new_result_addr14_0 = getelementptr i64, i64* %_call14_Param_Area, i64 0
   %_new_result14_0 = load i64, i64* %_new_result_addr14_0
   %_loc_4 = bitcast i64 %_new_result14_0 to i64

   ; #Store_Int_Lit_Op at 70:16
   %_loc_5 = bitcast i64 6 to i64

   ; #Call_Op at 70:16
   %_first_arg16 = bitcast i64 %_loc_4 to i64
   %_secon_arg16 = bitcast i64 %_loc_5 to i64
   %_mask_shifted16 = lshr i64 %_secon_arg16, %_first_arg16
   %_resul16 = and i64 1, %_mask_shifted16
   %_resul16_ptr = bitcast i64* %_loc_2 to i64* 
   store i64 %_resul16, i64* %_resul16_ptr

   ; #If_Op at 70:27
   %_if_source_ptr17 = bitcast i64* %_loc_2 to i64* 
   %_if_source_val17 = load i64, i64* %_if_source_ptr17
   %_if_source_trunc17 = icmp eq i64 %_if_source_val17, 1
   br i1 %_if_source_trunc17, label %_lbl18, label %_lbl25

_lbl18:
   ; #Copy_Word_Op at 70:36
   %_source18 = getelementptr i64, i64* %_Static_Link, i64 5
   %_source_val18 = load i64, i64* %_source18
   %_loc_14 = bitcast i64 %_source_val18 to i64

   ; #Copy_Word_Op at 70:45
   %_source19 = getelementptr i64, i64* %_Static_Link, i64 4
   %_source_val19 = load i64, i64* %_source19
   %_loc_16 = bitcast i64 %_source_val19 to i64

   ; #Copy_Word_Op at 70:47
   %_reg20_1 = inttoptr i64 %_loc_16 to i64*
   %_source20 = getelementptr i64, i64* %_reg20_1, i64 2
   %_source_val20 = load i64, i64* %_source20
   %_loc_15 = bitcast i64 %_source_val20 to i64

   ; #Call_Op at 70:42
   %_ptr_val0_21 = load i64, i64* %_Static_Link
   %_ptr0_21 = inttoptr i64 %_ptr_val0_21 to i64*
   %_call21_Static_Link = call i64* @_psc_get_type_desc_or_op_map(i64* %_ptr0_21, i16 3, i16 1001)
   %_new_arg_addr21_1 = getelementptr i64, i64* %_call21_Param_Area, i64 1
   store i64 %_loc_14, i64* %_new_arg_addr21_1
   %_new_arg_addr21_2 = getelementptr i64, i64* %_call21_Param_Area, i64 2
   store i64 %_loc_15, i64* %_new_arg_addr21_2
   call void @_psc_execute_compiled_nth_op_of_type(i64* %_Context, i64* %_call21_Param_Area, i64* %_call21_Static_Link, i16 3, i16 5)
   %_new_result_addr21_0 = getelementptr i64, i64* %_call21_Param_Area, i64 0
   %_new_result21_0 = load i64, i64* %_new_result_addr21_0
   %_loc_11 = bitcast i64 %_new_result21_0 to i64

   ; #Store_Int_Lit_Op at 70:42
   %_loc_12 = bitcast i64 3 to i64

   ; #Call_Op at 70:42
   %_first_arg23 = bitcast i64 %_loc_11 to i64
   %_secon_arg23 = bitcast i64 %_loc_12 to i64
   %_mask_shifted23 = lshr i64 %_secon_arg23, %_first_arg23
   %_resul23 = and i64 1, %_mask_shifted23
   %_resul23_ptr = bitcast i64* %_loc_2 to i64* 
   store i64 %_resul23, i64* %_resul23_ptr

   ; #Skip_Op at 70:27
   br label %_lbl25

_lbl25:
   ; #Copy_Word_Op at 70:27
   %_source25 = bitcast i64* %_loc_2 to i64* 
   %_source_val25 = load i64, i64* %_source25
   %_loc_1 = bitcast i64 %_source_val25 to i64

   ; #Copy_Word_Op at 0:0
   %_source_val26 = bitcast i64 %_loc_1 to i64
   %_dest26 = getelementptr i64, i64* %_Param_Area, i64 0
   store i64 %_source_val26, i64* %_dest26

   ; #Exit_Op at 0:0
   ret i32 0

}

define i64 @"PSL.Containers.Slice.$index_set$"(i64 %_formal_param_1, i64* %_Context, i64* %_Static_Link, i64 %_inited_output) {
   %_Local_Area = alloca i64, i64 4
   %_sl = ptrtoint i64* %_Static_Link to i64
   store i64 %_sl, i64* %_Local_Area

   %_Param_Area = alloca i64
   %_output.I6 = alloca i64
   %_loc_.I6_2 = alloca i64
   %_print_param.I6.10 = alloca i64
   %_print_param8 = alloca i64

   store i64 %_inited_output, i64* %_Param_Area
   
   ; #Store_Null_Of_Same_Stg_Rgn_Op at 76:24
   %_cur_td1 = bitcast i64* %_Static_Link to %struct.TD*
   %_nested_types_arr_ptr1 = getelementptr %struct.TD, %struct.TD* %_cur_td1, i32 0, i32 35
   %_nested_types_arr1 = load %struct.TD**, %struct.TD*** %_nested_types_arr_ptr1
   %_nested_td_ptr_ptr1 = getelementptr %struct.TD*, %struct.TD** %_nested_types_arr1, i32 0
   %_nested_td1 = load %struct.TD*, %struct.TD** %_nested_td_ptr_ptr1
   %_desc1 = bitcast %struct.TD* %_nested_td1 to i64*
   %_source_ptr1 = getelementptr i64, i64* %_Param_Area, i64 0
   %_source1 = load i64, i64* %_source_ptr1
   %_td1 = bitcast i64* %_desc1 to %struct.TD*
   %_is_small_ptr1 = getelementptr %struct.TD, %struct.TD* %_td1, i32 0, i32 13
   %_is_small1 = load i8, i8* %_is_small_ptr1
   %_is_small_bool1 = trunc i8 %_is_small1 to i1
   br i1 %_is_small_bool1, label %_small_label1, label %_large_label1
   _small_label1:
   %_small_null_ptr1 = getelementptr %struct.TD, %struct.TD* %_td1, i32 0, i32 17
   %_small_null1 = load i64, i64* %_small_null_ptr1
   br label %_join_small_and_large1
   _large_label1:
   %_high_and_low_bits1 = and i64 %_source1, or (i64 shl (i64 1, i64 63), i64 1)
   %_is_special_bit1 = icmp eq i64 %_high_and_low_bits1, or (i64 shl (i64 1, i64 63), i64 1)
   br i1 %_is_special_bit1, label %_is_special_label1, label %_not_special_label1
   _is_special_label1:
   %_spcl_rgn_times2_1 = and i64 %_source1, 4294967295
   br label %_last_large_label1
   _not_special_label1:
   %_header_ptr1 = inttoptr i64 %_source1 to i64*
   %_hdr_of_src1 = load i64, i64* %_header_ptr1
   %_region_bits1 = and i64 %_hdr_of_src1, 4294901760
   %_normal_rgn_times2_1 = lshr i64 %_region_bits1, 15
   br label %_last_large_label1
   _last_large_label1:
   %_rgn_times2_1 = phi i64 [%_spcl_rgn_times2_1, %_is_special_label1], [%_normal_rgn_times2_1, %_not_special_label1]
   %_large_null1 = or i64 -144115188075855871, %_rgn_times2_1
   br label %_join_small_and_large1
   _join_small_and_large1:
   %_null1 = phi i64 [%_small_null1, %_small_label1],[%_large_null1, %_last_large_label1]
   %_loc_2 = bitcast i64 %_null1 to i64

   ; #Copy_Word_Op at 76:16
   %_source_val2 = bitcast i64 %_formal_param_1 to i64
   %_loc_5 = bitcast i64 %_source_val2 to i64

   ; #Copy_Word_Op at 76:18
   %_reg3_1 = inttoptr i64 %_loc_5 to i64*
   %_source3 = getelementptr i64, i64* %_reg3_1, i64 1
   %_source_val3 = load i64, i64* %_source3
   %_loc_3 = bitcast i64 %_source_val3 to i64

   ; #Copy_Word_Op at 76:27
   %_source_val4 = bitcast i64 %_formal_param_1 to i64
   %_loc_6 = bitcast i64 %_source_val4 to i64

   ; #Copy_Word_Op at 76:29
   %_reg5_1 = inttoptr i64 %_loc_6 to i64*
   %_source5 = getelementptr i64, i64* %_reg5_1, i64 2
   %_source_val5 = load i64, i64* %_source5
   %_loc_4 = bitcast i64 %_source_val5 to i64

   ; #Call_Op at 76:24
   ; inlining call on ".."
   store i64 %_loc_2, i64* %_output.I6
   %_cur_td6 = bitcast i64* %_Static_Link to %struct.TD*
   %_nested_types_arr_ptr6 = getelementptr %struct.TD, %struct.TD* %_cur_td6, i32 0, i32 35
   %_nested_types_arr6 = load %struct.TD**, %struct.TD*** %_nested_types_arr_ptr6
   %_nested_td_ptr_ptr6 = getelementptr %struct.TD*, %struct.TD** %_nested_types_arr6, i32 0
   %_nested_td6 = load %struct.TD*, %struct.TD** %_nested_td_ptr_ptr6
   %_call6_Static_Link = bitcast %struct.TD* %_nested_td6 to i64*

   ; #Declare_Obj_Op at 34:16

   ; #Create_Obj_Op at 34:16
   %_desc.I6.2 = getelementptr i64, i64* %_call6_Static_Link, i64 0
   %_src_addr.I6.2 = bitcast i64* %_output.I6 to i64*
   %_src.I6.2 = load i64, i64* %_src_addr.I6.2
   %_dest.I6.2 = call i64@_psc_new_object(i64* %_Context, i64* %_desc.I6.2, i64 %_src.I6.2)
   %_dest_addr.I6.2 = bitcast i64* %_loc_.I6_2 to i64* 
   store i64 %_dest.I6.2, i64* %_dest_addr.I6.2

   ; #Copy_Word_Op at 34:16
   %_source.I6.3 = bitcast i64* %_loc_.I6_2 to i64* 
   %_source_val.I6.3 = load i64, i64* %_source.I6.3
   %_loc_.I6_3 = bitcast i64 %_source_val.I6.3 to i64

   ; #Make_Copy_In_Stg_Rgn_Op at 34:26
   %_cur_td.I6.4 = bitcast i64* %_call6_Static_Link to %struct.TD*
   %_param_arr_ptr.I6.4 = getelementptr %struct.TD, %struct.TD* %_cur_td.I6.4, i32 0, i32 26
   %_param_arr.I6.4 = load %struct.ParamInfo*, %struct.ParamInfo** %_param_arr_ptr.I6.4
   %_formal_td_ptr_ptr.I6.4 = getelementptr %struct.ParamInfo, %struct.ParamInfo* %_param_arr.I6.4, i32 0, i32 1, i32 0
   %_formal_td.I6.4 = load %struct.TD*, %struct.TD** %_formal_td_ptr_ptr.I6.4
   %_desc.I6.4 = bitcast %struct.TD* %_formal_td.I6.4 to i64*
   %_source.I6.4 = bitcast i64 %_loc_3 to i64
   %_existing_obj.I6.4 = bitcast i64 %_loc_.I6_3 to i64
   %_result.I6.4 = call i64 @_psc_copy_object(i64* %_Context, i64* %_desc.I6.4, i64 %_source.I6.4, i64 %_existing_obj.I6.4)
   %_loc_.I6_4 = bitcast i64 %_result.I6.4 to i64

   ; #Copy_Word_Op at 34:26
   %_source_val.I6.5 = bitcast i64 %_loc_.I6_4 to i64
   %_reg.I6.5_2 = inttoptr i64 %_loc_.I6_3 to i64*
   %_dest.I6.5 = getelementptr i64, i64* %_reg.I6.5_2, i64 1
   store i64 %_source_val.I6.5, i64* %_dest.I6.5

   ; #Make_Copy_In_Stg_Rgn_Op at 34:40
   %_cur_td.I6.6 = bitcast i64* %_call6_Static_Link to %struct.TD*
   %_param_arr_ptr.I6.6 = getelementptr %struct.TD, %struct.TD* %_cur_td.I6.6, i32 0, i32 26
   %_param_arr.I6.6 = load %struct.ParamInfo*, %struct.ParamInfo** %_param_arr_ptr.I6.6
   %_formal_td_ptr_ptr.I6.6 = getelementptr %struct.ParamInfo, %struct.ParamInfo* %_param_arr.I6.6, i32 0, i32 1, i32 0
   %_formal_td.I6.6 = load %struct.TD*, %struct.TD** %_formal_td_ptr_ptr.I6.6
   %_desc.I6.6 = bitcast %struct.TD* %_formal_td.I6.6 to i64*
   %_source.I6.6 = bitcast i64 %_loc_4 to i64
   %_existing_obj.I6.6 = bitcast i64 %_loc_.I6_3 to i64
   %_result.I6.6 = call i64 @_psc_copy_object(i64* %_Context, i64* %_desc.I6.6, i64 %_source.I6.6, i64 %_existing_obj.I6.6)
   %_loc_.I6_5 = bitcast i64 %_result.I6.6 to i64

   ; #Copy_Word_Op at 34:40
   %_source_val.I6.7 = bitcast i64 %_loc_.I6_5 to i64
   %_reg.I6.7_2 = inttoptr i64 %_loc_.I6_3 to i64*
   %_dest.I6.7 = getelementptr i64, i64* %_reg.I6.7_2, i64 2
   store i64 %_source_val.I6.7, i64* %_dest.I6.7

   ; #Copy_Word_Op at 34:16
   %_source.I6.8 = bitcast i64* %_loc_.I6_2 to i64* 
   %_source_val.I6.8 = load i64, i64* %_source.I6.8
   %_loc_.I6_1 = bitcast i64 %_source_val.I6.8 to i64

   ; #Copy_Word_Op at 34:9
   %_source_val.I6.9 = bitcast i64 %_loc_.I6_1 to i64
   %_dest.I6.9 = bitcast i64* %_output.I6 to i64*
   store i64 %_source_val.I6.9, i64* %_dest.I6.9

   ; #Check_Not_Null_Op at 34:9
   %_arg_ptr.I6.10 = bitcast i64* %_output.I6 to i64*
   %_arg.I6.10 = load i64, i64* %_arg_ptr.I6.10
   %_val_no_reg.I6.10 = and i64 %_arg.I6.10, -4294967295
   %_is_null.I6.10 = icmp eq i64 %_val_no_reg.I6.10, -144115188075855871
   br i1 %_is_null.I6.10, label %_fail.I6.10, label %_lbl.I6_11
   _fail.I6.10:
   %_str_ptr_ptr.I6.10 = load i64*, i64** @$Strings
   %_str_ptr.I6.10 = getelementptr i64, i64* %_str_ptr_ptr.I6.10, i64 14
   %_assert_str.I6.10 = load i64, i64* %_str_ptr.I6.10
   store i64 %_assert_str.I6.10, i64* %_print_param.I6.10
   call void @_psc_runtime_message(i64* %_Context, i64* %_print_param.I6.10, i64* null)

   br label %_lbl.I6_11

_lbl.I6_11:
   ; #Return_Op at 34:9

   %_new_result6 = load i64, i64* %_output.I6
   %_loc_1 = bitcast i64 %_new_result6 to i64

   ; #Copy_Word_Op at 76:9
   %_source_val7 = bitcast i64 %_loc_1 to i64
   %_dest7 = getelementptr i64, i64* %_Param_Area, i64 0
   store i64 %_source_val7, i64* %_dest7

   ; #Check_Not_Null_Op at 76:9
   %_arg_ptr8 = getelementptr i64, i64* %_Param_Area, i64 0
   %_arg8 = load i64, i64* %_arg_ptr8
   %_cur_td8 = bitcast i64* %_Static_Link to %struct.TD*
   %_nested_types_arr_ptr8 = getelementptr %struct.TD, %struct.TD* %_cur_td8, i32 0, i32 35
   %_nested_types_arr8 = load %struct.TD**, %struct.TD*** %_nested_types_arr_ptr8
   %_nested_td_ptr_ptr8 = getelementptr %struct.TD*, %struct.TD** %_nested_types_arr8, i32 0
   %_nested_td8 = load %struct.TD*, %struct.TD** %_nested_td_ptr_ptr8
   %_desc8 = bitcast %struct.TD* %_nested_td8 to i64*
   %_td8 = bitcast i64* %_desc8 to %struct.TD*
   %_is_small_ptr8 = getelementptr %struct.TD, %struct.TD* %_td8, i32 0, i32 13
   %_is_small8 = load i8, i8* %_is_small_ptr8
   %_is_small_bool8 = trunc i8 %_is_small8 to i1
   br i1 %_is_small_bool8, label %_is_small_lbl8, label %_is_large_lbl8
   _is_small_lbl8:
   %_small_null_ptr8 = getelementptr %struct.TD, %struct.TD* %_td8, i32 0, i32 17
   %_small_null8 = load i64, i64* %_small_null_ptr8
   %_small_result8 = icmp eq i64 %_arg8, %_small_null8
   br label %_join8
   _is_large_lbl8:
   %_val_no_reg8 = and i64 %_arg8, -4294967295
   %_large_result8 = icmp eq i64 %_val_no_reg8, -144115188075855871
   br label %_join8
   _join8:
   %_is_null8 = phi i1 [%_small_result8, %_is_small_lbl8], [%_large_result8, %_is_large_lbl8]
   br i1 %_is_null8, label %_fail8, label %_lbl9
   _fail8:
   %_str_ptr_ptr8 = load i64*, i64** @$Strings
   %_str_ptr8 = getelementptr i64, i64* %_str_ptr_ptr8, i64 15
   %_assert_str8 = load i64, i64* %_str_ptr8
   store i64 %_assert_str8, i64* %_print_param8
   call void @_psc_runtime_message(i64* %_Context, i64* %_print_param8, i64* null)

   br label %_lbl9

_lbl9:
   ; #Return_Op at 76:9
   %_result_reg9 = load i64, i64* %_Param_Area
   ret i64 %_result_reg9

}

