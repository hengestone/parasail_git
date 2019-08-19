declare void @"PSL.Core.AA_Tree.$<|=$"(i64*, i64*, i64*, i64*)
declare i64 @"PSL.Core.AA_Tree.Count"(i64, i64*, i64*)
declare void @"PSL.Core.AA_Tree.Delete"(i64*, i64, i64*, i64*)
declare i64 @"PSL.Core.AA_Tree.First"(i64, i64*, i64*, i64)
declare void @"PSL.Core.AA_Tree.Insert"(i64*, i64, i64*, i64*)
declare i64 @"PSL.Core.AA_Tree.Last"(i64, i64*, i64*, i64)
declare i64 @"PSL.Core.AA_Tree.Max_No_Greater"(i64, i64, i64*, i64*, i64)
declare i64 @"PSL.Core.AA_Tree.Min_No_Less"(i64, i64, i64*, i64*, i64)
declare i64 @"PSL.Core.AA_Tree.Next"(i64, i64, i64*, i64*, i64)
declare i64 @"PSL.Core.AA_Tree.Overlapping"(i64, i64, i64*, i64*, i64)
declare i64 @"PSL.Core.AA_Tree.Prev"(i64, i64, i64*, i64*, i64)
declare i64 @"PSL.Core.AA_Tree.Remove_Any"(i64*, i64*, i64*, i64)
declare i64 @"PSL.Core.AA_Tree.Remove_First"(i64*, i64*, i64*, i64)
declare i64 @"PSL.Core.AA_Tree.Remove_Last"(i64*, i64*, i64*, i64)
declare void @_psc_assign_word(i64*, i64*, i64*, i64)
declare i64 @_psc_copy_object(i64*, i64*, i64, i64)
declare void @_psc_finalize_stg_rgn(i64*, i64*)
declare void @_psc_initialize_stg_rgn(i64*, i64*)
declare void @_psc_move_object(i64*, i64*, i64*, i64*)
declare i64 @_psc_new_object(i64*, i64*, i64)
declare void @_psc_reconstruct_strings(i16, i8**, i64*)
declare void @_psc_register_compiled_operations(i16, i16*, void(i64*, i64*, i64*)**, i32*, i64*, i32, i16*, i32(i64*, i64*, i64*)**)
declare void @"_psc_runtime_message"(i64*, i64*, i64*)

@$Module_Op_Indices = internal constant [64 x i16] [
i16 1, i16 22, i16 1, i16 14, i16 1, i16 50, i16 1, i16 2, i16 1, i16 30
, i16 1, i16 32, i16 1, i16 44, i16 1, i16 45, i16 1, i16 43, i16 1, i16 17
, i16 1, i16 12, i16 1, i16 46, i16 1, i16 23, i16 1, i16 24, i16 1, i16 49
, i16 1, i16 31, i16 1, i16 10, i16 1, i16 18, i16 1, i16 4, i16 1, i16 15
, i16 1, i16 48, i16 1, i16 27, i16 1, i16 8, i16 1, i16 41, i16 1, i16 6
, i16 1, i16 42, i16 1, i16 20, i16 1, i16 16, i16 1, i16 38, i16 1, i16 28
, i16 1, i16 47, i16 1, i16 39]

@$Local_Funcs = internal constant [32 x void(i64*, i64*, i64*)*] [

void(i64*, i64*, i64*)* bitcast( void (i64*, i64, i64*, i64*)* @"PSL.Containers.Ordered_Set.$-=$" to void(i64*, i64*, i64*)*)
, void(i64*, i64*, i64*)* bitcast( void (i64*, i64, i64*, i64*)* @"PSL.Containers.Ordered_Set.$|=$" to void(i64*, i64*, i64*)*)
, void(i64*, i64*, i64*)* bitcast( i64 (i64*, i64*, i64*, i64)* @"PSL.Containers.Ordered_Set.Remove_Any" to void(i64*, i64*, i64*)*)
, void(i64*, i64*, i64*)* bitcast( i64 (i64*, i64*, i64)* @"PSL.Containers.Ordered_Set.$[]$" to void(i64*, i64*, i64*)*)
, void(i64*, i64*, i64*)* bitcast( void (i64*, i64, i64*, i64*)* @"PSL.Containers.Ordered_Set.$xor=$" to void(i64*, i64*, i64*)*)
, void(i64*, i64*, i64*)* bitcast( i64 (i64, i64, i64*, i64*)* @"PSL.Containers.Ordered_Set.$=?$" to void(i64*, i64*, i64*)*)
, void(i64*, i64*, i64*)* bitcast( i64 (i64, i64, i64*, i64*, i64)* @"PSL.Containers.Ordered_Set.Next" to void(i64*, i64*, i64*)*)
, void(i64*, i64*, i64*)* bitcast( i64 (i64, i64, i64*, i64*, i64)* @"PSL.Containers.Ordered_Set.Prev" to void(i64*, i64*, i64*)*)
, void(i64*, i64*, i64*)* bitcast( i64 (i64, i64*, i64*, i64)* @"PSL.Containers.Ordered_Set.Any_Element" to void(i64*, i64*, i64*)*)
, void(i64*, i64*, i64*)* bitcast( void (i64*, i64, i64*, i64*)* @"PSL.Containers.Ordered_Set.$|=$.2" to void(i64*, i64*, i64*)*)
, void(i64*, i64*, i64*)* bitcast( i64 (i64, i64, i64*, i64*, i64)* @"PSL.Containers.Ordered_Set.$|$.4" to void(i64*, i64*, i64*)*)
, void(i64*, i64*, i64*)* bitcast( i64 (i64, i64, i64*, i64*, i64)* @"PSL.Containers.Ordered_Set.Min_No_Less" to void(i64*, i64*, i64*)*)
, void(i64*, i64*, i64*)* bitcast( void (i64*, i64, i64*, i64*)* @"PSL.Containers.Ordered_Set.$-=$.2" to void(i64*, i64*, i64*)*)
, void(i64*, i64*, i64*)* bitcast( i64 (i64, i64, i64*, i64*, i64)* @"PSL.Containers.Ordered_Set.$and$" to void(i64*, i64*, i64*)*)
, void(i64*, i64*, i64*)* bitcast( i64 (i64*, i64*, i64*, i64)* @"PSL.Containers.Ordered_Set.Remove_Last" to void(i64*, i64*, i64*)*)
, void(i64*, i64*, i64*)* bitcast( i64 (i64, i64, i64*, i64*)* @"PSL.Containers.Ordered_Set.$in$" to void(i64*, i64*, i64*)*)
, void(i64*, i64*, i64*)* bitcast( i64 (i64, i64, i64*, i64*, i64)* @"PSL.Containers.Ordered_Set.$|$.3" to void(i64*, i64*, i64*)*)
, void(i64*, i64*, i64*)* bitcast( i64 (i64, i64, i64*, i64*, i64)* @"PSL.Containers.Ordered_Set.$-$" to void(i64*, i64*, i64*)*)
, void(i64*, i64*, i64*)* bitcast( i64 (i64, i64*, i64*, i64)* @"PSL.Containers.Ordered_Set.Singleton" to void(i64*, i64*, i64*)*)
, void(i64*, i64*, i64*)* bitcast( void (i64*, i64*, i64*, i64*)* @"PSL.Containers.Ordered_Set.$<|=$" to void(i64*, i64*, i64*)*)
, void(i64*, i64*, i64*)* bitcast( i64 (i64*, i64*, i64*, i64)* @"PSL.Containers.Ordered_Set.Remove_First" to void(i64*, i64*, i64*)*)
, void(i64*, i64*, i64*)* bitcast( void (i64*, i64, i64*, i64*)* @"PSL.Containers.Ordered_Set.$and=$" to void(i64*, i64*, i64*)*)
, void(i64*, i64*, i64*)* bitcast( i64 (i64, i64, i64*, i64*, i64)* @"PSL.Containers.Ordered_Set.$|$.2" to void(i64*, i64*, i64*)*)
, void(i64*, i64*, i64*)* bitcast( i64 (i64, i64*, i64*, i64)* @"PSL.Containers.Ordered_Set.First" to void(i64*, i64*, i64*)*)
, void(i64*, i64*, i64*)* bitcast( i64 (i64, i64, i64*, i64*, i64)* @"PSL.Containers.Ordered_Set.$|$" to void(i64*, i64*, i64*)*)
, void(i64*, i64*, i64*)* bitcast( i64 (i64, i64*, i64*, i64)* @"PSL.Containers.Ordered_Set.Last" to void(i64*, i64*, i64*)*)
, void(i64*, i64*, i64*)* bitcast( i64 (i64, i64, i64*, i64*, i64)* @"PSL.Containers.Ordered_Set.$-$.2" to void(i64*, i64*, i64*)*)
, void(i64*, i64*, i64*)* bitcast( void (i64*, i64*, i64*, i64*)* @"PSL.Containers.Ordered_Set.$<|=$.2" to void(i64*, i64*, i64*)*)
, void(i64*, i64*, i64*)* bitcast( i64 (i64, i64*, i64*)* @"PSL.Containers.Ordered_Set.Count" to void(i64*, i64*, i64*)*)
, void(i64*, i64*, i64*)* bitcast( i64 (i64, i64, i64*, i64*, i64)* @"PSL.Containers.Ordered_Set.$xor$" to void(i64*, i64*, i64*)*)
, void(i64*, i64*, i64*)* bitcast( i64 (i64, i64, i64*, i64*, i64)* @"PSL.Containers.Ordered_Set.Max_No_Greater" to void(i64*, i64*, i64*)*)
, void(i64*, i64*, i64*)* bitcast( i64 (i64, i64*, i64*)* @"PSL.Containers.Ordered_Set.Is_Empty" to void(i64*, i64*, i64*)*)]

@$Local_Funcs_Conv_Descs = internal constant [32 x i32] [
i32 512, i32 512, i32 33620224, i32 33619968, i32 512, i32 66048, i32 33620480
, i32 33620480, i32 33620224, i32 512, i32 33620480, i32 33620480, i32 512
, i32 33620480, i32 33620224, i32 66048, i32 33620480, i32 33620480
, i32 33620224, i32 512, i32 33620224, i32 512, i32 33620480, i32 33620224
, i32 33620480, i32 33620224, i32 33620480, i32 512, i32 65792, i32 33620480
, i32 33620480, i32 65792]

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
@"$Anon_Const_20_1" = internal constant i64 3; "from_univ"(#unordered)
@"$Anon_Const_20_2" = internal constant i64 2; "from_univ"(#greater)
@"$Anon_Const_20_3" = internal constant i64 0; "from_univ"(#less)
@"$Anon_Const_20_4" = internal constant i64 1; "from_univ"(#equal)
@$str_stream1 = internal constant [32 x i8] 

[i8 28, i8 0, i8 0, i8 0, i8 80, i8 83, i8 76, i8 58, i8 58, i8 67, i8 111
, i8 110, i8 116, i8 97, i8 105, i8 110, i8 101, i8 114, i8 115, i8 58, i8 58
, i8 79, i8 114, i8 100, i8 101, i8 114, i8 101, i8 100, i8 95, i8 83, i8 101
, i8 116]

@$str_stream2 = internal constant [8 x i8] 

[i8 4, i8 0, i8 0, i8 0, i8 34, i8 91, i8 93, i8 34]

@$str_stream3 = internal constant [101 x i8] 

[i8 97, i8 0, i8 0, i8 0, i8 47, i8 85, i8 115, i8 101, i8 114, i8 115, i8 47
, i8 115, i8 116, i8 116, i8 47, i8 95, i8 112, i8 97, i8 114, i8 97, i8 115
, i8 97, i8 105, i8 108, i8 47, i8 108, i8 105, i8 98, i8 47, i8 97, i8 97
, i8 97, i8 47, i8 97, i8 97, i8 97, i8 48, i8 52, i8 54, i8 111, i8 114
, i8 100, i8 101, i8 114, i8 101, i8 100, i8 95, i8 115, i8 101, i8 116, i8 46
, i8 112, i8 115, i8 105, i8 58, i8 49, i8 48, i8 49, i8 58, i8 57, i8 58
, i8 32, i8 69, i8 114, i8 114, i8 111, i8 114, i8 58, i8 32, i8 78, i8 117
, i8 108, i8 108, i8 32, i8 118, i8 97, i8 108, i8 117, i8 101, i8 32, i8 110
, i8 111, i8 116, i8 32, i8 112, i8 101, i8 114, i8 109, i8 105, i8 116, i8 116
, i8 101, i8 100, i8 32, i8 104, i8 101, i8 114, i8 101, i8 58, i8 32, i8 10]

@$str_stream4 = internal constant [13 x i8] 

[i8 9, i8 0, i8 0, i8 0, i8 83, i8 105, i8 110, i8 103, i8 108, i8 101, i8 116
, i8 111, i8 110]

@$str_stream5 = internal constant [101 x i8] 

[i8 97, i8 0, i8 0, i8 0, i8 47, i8 85, i8 115, i8 101, i8 114, i8 115, i8 47
, i8 115, i8 116, i8 116, i8 47, i8 95, i8 112, i8 97, i8 114, i8 97, i8 115
, i8 97, i8 105, i8 108, i8 47, i8 108, i8 105, i8 98, i8 47, i8 97, i8 97
, i8 97, i8 47, i8 97, i8 97, i8 97, i8 48, i8 52, i8 54, i8 111, i8 114
, i8 100, i8 101, i8 114, i8 101, i8 100, i8 95, i8 115, i8 101, i8 116, i8 46
, i8 112, i8 115, i8 105, i8 58, i8 49, i8 48, i8 56, i8 58, i8 53, i8 58
, i8 32, i8 69, i8 114, i8 114, i8 111, i8 114, i8 58, i8 32, i8 78, i8 117
, i8 108, i8 108, i8 32, i8 118, i8 97, i8 108, i8 117, i8 101, i8 32, i8 110
, i8 111, i8 116, i8 32, i8 112, i8 101, i8 114, i8 109, i8 105, i8 116, i8 116
, i8 101, i8 100, i8 32, i8 104, i8 101, i8 114, i8 101, i8 58, i8 32, i8 10]

@$str_stream6 = internal constant [7 x i8] 

[i8 3, i8 0, i8 0, i8 0, i8 34, i8 124, i8 34]

@$str_stream7 = internal constant [101 x i8] 

[i8 97, i8 0, i8 0, i8 0, i8 47, i8 85, i8 115, i8 101, i8 114, i8 115, i8 47
, i8 115, i8 116, i8 116, i8 47, i8 95, i8 112, i8 97, i8 114, i8 97, i8 115
, i8 97, i8 105, i8 108, i8 47, i8 108, i8 105, i8 98, i8 47, i8 97, i8 97
, i8 97, i8 47, i8 97, i8 97, i8 97, i8 48, i8 52, i8 54, i8 111, i8 114
, i8 100, i8 101, i8 114, i8 101, i8 100, i8 95, i8 115, i8 101, i8 116, i8 46
, i8 112, i8 115, i8 105, i8 58, i8 49, i8 49, i8 53, i8 58, i8 53, i8 58
, i8 32, i8 69, i8 114, i8 114, i8 111, i8 114, i8 58, i8 32, i8 78, i8 117
, i8 108, i8 108, i8 32, i8 118, i8 97, i8 108, i8 117, i8 101, i8 32, i8 110
, i8 111, i8 116, i8 32, i8 112, i8 101, i8 114, i8 109, i8 105, i8 116, i8 116
, i8 101, i8 100, i8 32, i8 104, i8 101, i8 114, i8 101, i8 58, i8 32, i8 10]

@$str_stream8 = internal constant [9 x i8] 

[i8 5, i8 0, i8 0, i8 0, i8 34, i8 124, i8 34, i8 35, i8 50]

@$str_stream9 = internal constant [101 x i8] 

[i8 97, i8 0, i8 0, i8 0, i8 47, i8 85, i8 115, i8 101, i8 114, i8 115, i8 47
, i8 115, i8 116, i8 116, i8 47, i8 95, i8 112, i8 97, i8 114, i8 97, i8 115
, i8 97, i8 105, i8 108, i8 47, i8 108, i8 105, i8 98, i8 47, i8 97, i8 97
, i8 97, i8 47, i8 97, i8 97, i8 97, i8 48, i8 52, i8 54, i8 111, i8 114
, i8 100, i8 101, i8 114, i8 101, i8 100, i8 95, i8 115, i8 101, i8 116, i8 46
, i8 112, i8 115, i8 105, i8 58, i8 49, i8 50, i8 50, i8 58, i8 53, i8 58
, i8 32, i8 69, i8 114, i8 114, i8 111, i8 114, i8 58, i8 32, i8 78, i8 117
, i8 108, i8 108, i8 32, i8 118, i8 97, i8 108, i8 117, i8 101, i8 32, i8 110
, i8 111, i8 116, i8 32, i8 112, i8 101, i8 114, i8 109, i8 105, i8 116, i8 116
, i8 101, i8 100, i8 32, i8 104, i8 101, i8 114, i8 101, i8 58, i8 32, i8 10]

@$str_stream10 = internal constant [9 x i8] 

[i8 5, i8 0, i8 0, i8 0, i8 34, i8 124, i8 34, i8 35, i8 51]

@$str_stream11 = internal constant [101 x i8] 

[i8 97, i8 0, i8 0, i8 0, i8 47, i8 85, i8 115, i8 101, i8 114, i8 115, i8 47
, i8 115, i8 116, i8 116, i8 47, i8 95, i8 112, i8 97, i8 114, i8 97, i8 115
, i8 97, i8 105, i8 108, i8 47, i8 108, i8 105, i8 98, i8 47, i8 97, i8 97
, i8 97, i8 47, i8 97, i8 97, i8 97, i8 48, i8 52, i8 54, i8 111, i8 114
, i8 100, i8 101, i8 114, i8 101, i8 100, i8 95, i8 115, i8 101, i8 116, i8 46
, i8 112, i8 115, i8 105, i8 58, i8 49, i8 50, i8 54, i8 58, i8 57, i8 58
, i8 32, i8 69, i8 114, i8 114, i8 111, i8 114, i8 58, i8 32, i8 78, i8 117
, i8 108, i8 108, i8 32, i8 118, i8 97, i8 108, i8 117, i8 101, i8 32, i8 110
, i8 111, i8 116, i8 32, i8 112, i8 101, i8 114, i8 109, i8 105, i8 116, i8 116
, i8 101, i8 100, i8 32, i8 104, i8 101, i8 114, i8 101, i8 58, i8 32, i8 10]

@$str_stream12 = internal constant [9 x i8] 

[i8 5, i8 0, i8 0, i8 0, i8 34, i8 124, i8 34, i8 35, i8 52]

@$str_stream13 = internal constant [101 x i8] 

[i8 97, i8 0, i8 0, i8 0, i8 47, i8 85, i8 115, i8 101, i8 114, i8 115, i8 47
, i8 115, i8 116, i8 116, i8 47, i8 95, i8 112, i8 97, i8 114, i8 97, i8 115
, i8 97, i8 105, i8 108, i8 47, i8 108, i8 105, i8 98, i8 47, i8 97, i8 97
, i8 97, i8 47, i8 97, i8 97, i8 97, i8 48, i8 52, i8 54, i8 111, i8 114
, i8 100, i8 101, i8 114, i8 101, i8 100, i8 95, i8 115, i8 101, i8 116, i8 46
, i8 112, i8 115, i8 105, i8 58, i8 49, i8 51, i8 51, i8 58, i8 53, i8 58
, i8 32, i8 69, i8 114, i8 114, i8 111, i8 114, i8 58, i8 32, i8 78, i8 117
, i8 108, i8 108, i8 32, i8 118, i8 97, i8 108, i8 117, i8 101, i8 32, i8 110
, i8 111, i8 116, i8 32, i8 112, i8 101, i8 114, i8 109, i8 105, i8 116, i8 116
, i8 101, i8 100, i8 32, i8 104, i8 101, i8 114, i8 101, i8 58, i8 32, i8 10]

@$str_stream14 = internal constant [8 x i8] 

[i8 4, i8 0, i8 0, i8 0, i8 34, i8 124, i8 61, i8 34]

@$str_stream15 = internal constant [9 x i8] 

[i8 5, i8 0, i8 0, i8 0, i8 34, i8 60, i8 124, i8 61, i8 34]

@$str_stream16 = internal constant [11 x i8] 

[i8 7, i8 0, i8 0, i8 0, i8 34, i8 60, i8 124, i8 61, i8 34, i8 35, i8 50]

@$str_stream17 = internal constant [10 x i8] 

[i8 6, i8 0, i8 0, i8 0, i8 34, i8 124, i8 61, i8 34, i8 35, i8 50]

@$str_stream18 = internal constant [7 x i8] 

[i8 3, i8 0, i8 0, i8 0, i8 34, i8 45, i8 34]

@$str_stream19 = internal constant [101 x i8] 

[i8 97, i8 0, i8 0, i8 0, i8 47, i8 85, i8 115, i8 101, i8 114, i8 115, i8 47
, i8 115, i8 116, i8 116, i8 47, i8 95, i8 112, i8 97, i8 114, i8 97, i8 115
, i8 97, i8 105, i8 108, i8 47, i8 108, i8 105, i8 98, i8 47, i8 97, i8 97
, i8 97, i8 47, i8 97, i8 97, i8 97, i8 48, i8 52, i8 54, i8 111, i8 114
, i8 100, i8 101, i8 114, i8 101, i8 100, i8 95, i8 115, i8 101, i8 116, i8 46
, i8 112, i8 115, i8 105, i8 58, i8 49, i8 56, i8 50, i8 58, i8 53, i8 58
, i8 32, i8 69, i8 114, i8 114, i8 111, i8 114, i8 58, i8 32, i8 78, i8 117
, i8 108, i8 108, i8 32, i8 118, i8 97, i8 108, i8 117, i8 101, i8 32, i8 110
, i8 111, i8 116, i8 32, i8 112, i8 101, i8 114, i8 109, i8 105, i8 116, i8 116
, i8 101, i8 100, i8 32, i8 104, i8 101, i8 114, i8 101, i8 58, i8 32, i8 10]

@$str_stream20 = internal constant [9 x i8] 

[i8 5, i8 0, i8 0, i8 0, i8 34, i8 45, i8 34, i8 35, i8 50]

@$str_stream21 = internal constant [101 x i8] 

[i8 97, i8 0, i8 0, i8 0, i8 47, i8 85, i8 115, i8 101, i8 114, i8 115, i8 47
, i8 115, i8 116, i8 116, i8 47, i8 95, i8 112, i8 97, i8 114, i8 97, i8 115
, i8 97, i8 105, i8 108, i8 47, i8 108, i8 105, i8 98, i8 47, i8 97, i8 97
, i8 97, i8 47, i8 97, i8 97, i8 97, i8 48, i8 52, i8 54, i8 111, i8 114
, i8 100, i8 101, i8 114, i8 101, i8 100, i8 95, i8 115, i8 101, i8 116, i8 46
, i8 112, i8 115, i8 105, i8 58, i8 49, i8 56, i8 57, i8 58, i8 53, i8 58
, i8 32, i8 69, i8 114, i8 114, i8 111, i8 114, i8 58, i8 32, i8 78, i8 117
, i8 108, i8 108, i8 32, i8 118, i8 97, i8 108, i8 117, i8 101, i8 32, i8 110
, i8 111, i8 116, i8 32, i8 112, i8 101, i8 114, i8 109, i8 105, i8 116, i8 116
, i8 101, i8 100, i8 32, i8 104, i8 101, i8 114, i8 101, i8 58, i8 32, i8 10]

@$str_stream22 = internal constant [8 x i8] 

[i8 4, i8 0, i8 0, i8 0, i8 34, i8 45, i8 61, i8 34]

@$str_stream23 = internal constant [10 x i8] 

[i8 6, i8 0, i8 0, i8 0, i8 34, i8 45, i8 61, i8 34, i8 35, i8 50]

@$str_stream24 = internal constant [9 x i8] 

[i8 5, i8 0, i8 0, i8 0, i8 34, i8 97, i8 110, i8 100, i8 34]

@$str_stream25 = internal constant [101 x i8] 

[i8 97, i8 0, i8 0, i8 0, i8 47, i8 85, i8 115, i8 101, i8 114, i8 115, i8 47
, i8 115, i8 116, i8 116, i8 47, i8 95, i8 112, i8 97, i8 114, i8 97, i8 115
, i8 97, i8 105, i8 108, i8 47, i8 108, i8 105, i8 98, i8 47, i8 97, i8 97
, i8 97, i8 47, i8 97, i8 97, i8 97, i8 48, i8 52, i8 54, i8 111, i8 114
, i8 100, i8 101, i8 114, i8 101, i8 100, i8 95, i8 115, i8 101, i8 116, i8 46
, i8 112, i8 115, i8 105, i8 58, i8 50, i8 52, i8 52, i8 58, i8 57, i8 58
, i8 32, i8 69, i8 114, i8 114, i8 111, i8 114, i8 58, i8 32, i8 78, i8 117
, i8 108, i8 108, i8 32, i8 118, i8 97, i8 108, i8 117, i8 101, i8 32, i8 110
, i8 111, i8 116, i8 32, i8 112, i8 101, i8 114, i8 109, i8 105, i8 116, i8 116
, i8 101, i8 100, i8 32, i8 104, i8 101, i8 114, i8 101, i8 58, i8 32, i8 10]

@$str_stream26 = internal constant [101 x i8] 

[i8 97, i8 0, i8 0, i8 0, i8 47, i8 85, i8 115, i8 101, i8 114, i8 115, i8 47
, i8 115, i8 116, i8 116, i8 47, i8 95, i8 112, i8 97, i8 114, i8 97, i8 115
, i8 97, i8 105, i8 108, i8 47, i8 108, i8 105, i8 98, i8 47, i8 97, i8 97
, i8 97, i8 47, i8 97, i8 97, i8 97, i8 48, i8 52, i8 54, i8 111, i8 114
, i8 100, i8 101, i8 114, i8 101, i8 100, i8 95, i8 115, i8 101, i8 116, i8 46
, i8 112, i8 115, i8 105, i8 58, i8 50, i8 49, i8 51, i8 58, i8 53, i8 58
, i8 32, i8 69, i8 114, i8 114, i8 111, i8 114, i8 58, i8 32, i8 78, i8 117
, i8 108, i8 108, i8 32, i8 118, i8 97, i8 108, i8 117, i8 101, i8 32, i8 110
, i8 111, i8 116, i8 32, i8 112, i8 101, i8 114, i8 109, i8 105, i8 116, i8 116
, i8 101, i8 100, i8 32, i8 104, i8 101, i8 114, i8 101, i8 58, i8 32, i8 10]

@$str_stream27 = internal constant [10 x i8] 

[i8 6, i8 0, i8 0, i8 0, i8 34, i8 97, i8 110, i8 100, i8 61, i8 34]

@$str_stream28 = internal constant [9 x i8] 

[i8 5, i8 0, i8 0, i8 0, i8 34, i8 120, i8 111, i8 114, i8 34]

@$str_stream29 = internal constant [101 x i8] 

[i8 97, i8 0, i8 0, i8 0, i8 47, i8 85, i8 115, i8 101, i8 114, i8 115, i8 47
, i8 115, i8 116, i8 116, i8 47, i8 95, i8 112, i8 97, i8 114, i8 97, i8 115
, i8 97, i8 105, i8 108, i8 47, i8 108, i8 105, i8 98, i8 47, i8 97, i8 97
, i8 97, i8 47, i8 97, i8 97, i8 97, i8 48, i8 52, i8 54, i8 111, i8 114
, i8 100, i8 101, i8 114, i8 101, i8 100, i8 95, i8 115, i8 101, i8 116, i8 46
, i8 112, i8 115, i8 105, i8 58, i8 50, i8 50, i8 57, i8 58, i8 53, i8 58
, i8 32, i8 69, i8 114, i8 114, i8 111, i8 114, i8 58, i8 32, i8 78, i8 117
, i8 108, i8 108, i8 32, i8 118, i8 97, i8 108, i8 117, i8 101, i8 32, i8 110
, i8 111, i8 116, i8 32, i8 112, i8 101, i8 114, i8 109, i8 105, i8 116, i8 116
, i8 101, i8 100, i8 32, i8 104, i8 101, i8 114, i8 101, i8 58, i8 32, i8 10]

@$str_stream30 = internal constant [10 x i8] 

[i8 6, i8 0, i8 0, i8 0, i8 34, i8 120, i8 111, i8 114, i8 61, i8 34]

@$str_stream31 = internal constant [8 x i8] 

[i8 4, i8 0, i8 0, i8 0, i8 34, i8 105, i8 110, i8 34]

@$str_stream32 = internal constant [8 x i8] 

[i8 4, i8 0, i8 0, i8 0, i8 34, i8 61, i8 63, i8 34]

@$str_stream33 = internal constant [101 x i8] 

[i8 97, i8 0, i8 0, i8 0, i8 47, i8 85, i8 115, i8 101, i8 114, i8 115, i8 47
, i8 115, i8 116, i8 116, i8 47, i8 95, i8 112, i8 97, i8 114, i8 97, i8 115
, i8 97, i8 105, i8 108, i8 47, i8 108, i8 105, i8 98, i8 47, i8 97, i8 97
, i8 97, i8 47, i8 97, i8 97, i8 97, i8 48, i8 52, i8 54, i8 111, i8 114
, i8 100, i8 101, i8 114, i8 101, i8 100, i8 95, i8 115, i8 101, i8 116, i8 46
, i8 112, i8 115, i8 105, i8 58, i8 50, i8 56, i8 51, i8 58, i8 57, i8 58
, i8 32, i8 69, i8 114, i8 114, i8 111, i8 114, i8 58, i8 32, i8 78, i8 117
, i8 108, i8 108, i8 32, i8 118, i8 97, i8 108, i8 117, i8 101, i8 32, i8 110
, i8 111, i8 116, i8 32, i8 112, i8 101, i8 114, i8 109, i8 105, i8 116, i8 116
, i8 101, i8 100, i8 32, i8 104, i8 101, i8 114, i8 101, i8 58, i8 32, i8 10]

@$str_stream34 = internal constant [102 x i8] 

[i8 98, i8 0, i8 0, i8 0, i8 47, i8 85, i8 115, i8 101, i8 114, i8 115, i8 47
, i8 115, i8 116, i8 116, i8 47, i8 95, i8 112, i8 97, i8 114, i8 97, i8 115
, i8 97, i8 105, i8 108, i8 47, i8 108, i8 105, i8 98, i8 47, i8 97, i8 97
, i8 97, i8 47, i8 97, i8 97, i8 97, i8 48, i8 52, i8 54, i8 111, i8 114
, i8 100, i8 101, i8 114, i8 101, i8 100, i8 95, i8 115, i8 101, i8 116, i8 46
, i8 112, i8 115, i8 105, i8 58, i8 50, i8 54, i8 53, i8 58, i8 49, i8 55
, i8 58, i8 32, i8 69, i8 114, i8 114, i8 111, i8 114, i8 58, i8 32, i8 78
, i8 117, i8 108, i8 108, i8 32, i8 118, i8 97, i8 108, i8 117, i8 101, i8 32
, i8 110, i8 111, i8 116, i8 32, i8 112, i8 101, i8 114, i8 109, i8 105, i8 116
, i8 116, i8 101, i8 100, i8 32, i8 104, i8 101, i8 114, i8 101, i8 58, i8 32
, i8 10]

@$str_stream35 = internal constant [102 x i8] 

[i8 98, i8 0, i8 0, i8 0, i8 47, i8 85, i8 115, i8 101, i8 114, i8 115, i8 47
, i8 115, i8 116, i8 116, i8 47, i8 95, i8 112, i8 97, i8 114, i8 97, i8 115
, i8 97, i8 105, i8 108, i8 47, i8 108, i8 105, i8 98, i8 47, i8 97, i8 97
, i8 97, i8 47, i8 97, i8 97, i8 97, i8 48, i8 52, i8 54, i8 111, i8 114
, i8 100, i8 101, i8 114, i8 101, i8 100, i8 95, i8 115, i8 101, i8 116, i8 46
, i8 112, i8 115, i8 105, i8 58, i8 50, i8 54, i8 56, i8 58, i8 49, i8 55
, i8 58, i8 32, i8 69, i8 114, i8 114, i8 111, i8 114, i8 58, i8 32, i8 78
, i8 117, i8 108, i8 108, i8 32, i8 118, i8 97, i8 108, i8 117, i8 101, i8 32
, i8 110, i8 111, i8 116, i8 32, i8 112, i8 101, i8 114, i8 109, i8 105, i8 116
, i8 116, i8 101, i8 100, i8 32, i8 104, i8 101, i8 114, i8 101, i8 58, i8 32
, i8 10]

@$str_stream36 = internal constant [102 x i8] 

[i8 98, i8 0, i8 0, i8 0, i8 47, i8 85, i8 115, i8 101, i8 114, i8 115, i8 47
, i8 115, i8 116, i8 116, i8 47, i8 95, i8 112, i8 97, i8 114, i8 97, i8 115
, i8 97, i8 105, i8 108, i8 47, i8 108, i8 105, i8 98, i8 47, i8 97, i8 97
, i8 97, i8 47, i8 97, i8 97, i8 97, i8 48, i8 52, i8 54, i8 111, i8 114
, i8 100, i8 101, i8 114, i8 101, i8 100, i8 95, i8 115, i8 101, i8 116, i8 46
, i8 112, i8 115, i8 105, i8 58, i8 50, i8 55, i8 52, i8 58, i8 49, i8 55
, i8 58, i8 32, i8 69, i8 114, i8 114, i8 111, i8 114, i8 58, i8 32, i8 78
, i8 117, i8 108, i8 108, i8 32, i8 118, i8 97, i8 108, i8 117, i8 101, i8 32
, i8 110, i8 111, i8 116, i8 32, i8 112, i8 101, i8 114, i8 109, i8 105, i8 116
, i8 116, i8 101, i8 100, i8 32, i8 104, i8 101, i8 114, i8 101, i8 58, i8 32
, i8 10]

@$str_stream37 = internal constant [102 x i8] 

[i8 98, i8 0, i8 0, i8 0, i8 47, i8 85, i8 115, i8 101, i8 114, i8 115, i8 47
, i8 115, i8 116, i8 116, i8 47, i8 95, i8 112, i8 97, i8 114, i8 97, i8 115
, i8 97, i8 105, i8 108, i8 47, i8 108, i8 105, i8 98, i8 47, i8 97, i8 97
, i8 97, i8 47, i8 97, i8 97, i8 97, i8 48, i8 52, i8 54, i8 111, i8 114
, i8 100, i8 101, i8 114, i8 101, i8 100, i8 95, i8 115, i8 101, i8 116, i8 46
, i8 112, i8 115, i8 105, i8 58, i8 50, i8 55, i8 54, i8 58, i8 49, i8 55
, i8 58, i8 32, i8 69, i8 114, i8 114, i8 111, i8 114, i8 58, i8 32, i8 78
, i8 117, i8 108, i8 108, i8 32, i8 118, i8 97, i8 108, i8 117, i8 101, i8 32
, i8 110, i8 111, i8 116, i8 32, i8 112, i8 101, i8 114, i8 109, i8 105, i8 116
, i8 116, i8 101, i8 100, i8 32, i8 104, i8 101, i8 114, i8 101, i8 58, i8 32
, i8 10]

@$str_stream38 = internal constant [9 x i8] 

[i8 5, i8 0, i8 0, i8 0, i8 67, i8 111, i8 117, i8 110, i8 116]

@$str_stream39 = internal constant [12 x i8] 

[i8 8, i8 0, i8 0, i8 0, i8 73, i8 115, i8 95, i8 69, i8 109, i8 112, i8 116
, i8 121]

@$str_stream40 = internal constant [101 x i8] 

[i8 97, i8 0, i8 0, i8 0, i8 47, i8 85, i8 115, i8 101, i8 114, i8 115, i8 47
, i8 115, i8 116, i8 116, i8 47, i8 95, i8 112, i8 97, i8 114, i8 97, i8 115
, i8 97, i8 105, i8 108, i8 47, i8 108, i8 105, i8 98, i8 47, i8 97, i8 97
, i8 97, i8 47, i8 97, i8 97, i8 97, i8 48, i8 52, i8 54, i8 111, i8 114
, i8 100, i8 101, i8 114, i8 101, i8 100, i8 95, i8 115, i8 101, i8 116, i8 46
, i8 112, i8 115, i8 105, i8 58, i8 50, i8 56, i8 55, i8 58, i8 57, i8 58
, i8 32, i8 69, i8 114, i8 114, i8 111, i8 114, i8 58, i8 32, i8 78, i8 117
, i8 108, i8 108, i8 32, i8 118, i8 97, i8 108, i8 117, i8 101, i8 32, i8 110
, i8 111, i8 116, i8 32, i8 112, i8 101, i8 114, i8 109, i8 105, i8 116, i8 116
, i8 101, i8 100, i8 32, i8 104, i8 101, i8 114, i8 101, i8 58, i8 32, i8 10]

@$str_stream41 = internal constant [9 x i8] 

[i8 5, i8 0, i8 0, i8 0, i8 70, i8 105, i8 114, i8 115, i8 116]

@$str_stream42 = internal constant [8 x i8] 

[i8 4, i8 0, i8 0, i8 0, i8 76, i8 97, i8 115, i8 116]

@$str_stream43 = internal constant [15 x i8] 

[i8 11, i8 0, i8 0, i8 0, i8 65, i8 110, i8 121, i8 95, i8 69, i8 108, i8 101
, i8 109, i8 101, i8 110, i8 116]

@$str_stream44 = internal constant [8 x i8] 

[i8 4, i8 0, i8 0, i8 0, i8 78, i8 101, i8 120, i8 116]

@$str_stream45 = internal constant [8 x i8] 

[i8 4, i8 0, i8 0, i8 0, i8 80, i8 114, i8 101, i8 118]

@$str_stream46 = internal constant [15 x i8] 

[i8 11, i8 0, i8 0, i8 0, i8 77, i8 105, i8 110, i8 95, i8 78, i8 111, i8 95
, i8 76, i8 101, i8 115, i8 115]

@$str_stream47 = internal constant [18 x i8] 

[i8 14, i8 0, i8 0, i8 0, i8 77, i8 97, i8 120, i8 95, i8 78, i8 111, i8 95
, i8 71, i8 114, i8 101, i8 97, i8 116, i8 101, i8 114]

@$str_stream48 = internal constant [16 x i8] 

[i8 12, i8 0, i8 0, i8 0, i8 82, i8 101, i8 109, i8 111, i8 118, i8 101, i8 95
, i8 70, i8 105, i8 114, i8 115, i8 116]

@$str_stream49 = internal constant [15 x i8] 

[i8 11, i8 0, i8 0, i8 0, i8 82, i8 101, i8 109, i8 111, i8 118, i8 101, i8 95
, i8 76, i8 97, i8 115, i8 116]

@$str_stream50 = internal constant [14 x i8] 

[i8 10, i8 0, i8 0, i8 0, i8 82, i8 101, i8 109, i8 111, i8 118, i8 101, i8 95
, i8 65, i8 110, i8 121]

@$Str_Streams = internal constant [50 x i8*] [
i8* bitcast ([32 x i8]* @$str_stream1 to i8*), 
i8* bitcast ([8 x i8]* @$str_stream2 to i8*), 
i8* bitcast ([101 x i8]* @$str_stream3 to i8*), 
i8* bitcast ([13 x i8]* @$str_stream4 to i8*), 
i8* bitcast ([101 x i8]* @$str_stream5 to i8*), 
i8* bitcast ([7 x i8]* @$str_stream6 to i8*), 
i8* bitcast ([101 x i8]* @$str_stream7 to i8*), 
i8* bitcast ([9 x i8]* @$str_stream8 to i8*), 
i8* bitcast ([101 x i8]* @$str_stream9 to i8*), 
i8* bitcast ([9 x i8]* @$str_stream10 to i8*), 
i8* bitcast ([101 x i8]* @$str_stream11 to i8*), 
i8* bitcast ([9 x i8]* @$str_stream12 to i8*), 
i8* bitcast ([101 x i8]* @$str_stream13 to i8*), 
i8* bitcast ([8 x i8]* @$str_stream14 to i8*), 
i8* bitcast ([9 x i8]* @$str_stream15 to i8*), 
i8* bitcast ([11 x i8]* @$str_stream16 to i8*), 
i8* bitcast ([10 x i8]* @$str_stream17 to i8*), 
i8* bitcast ([7 x i8]* @$str_stream18 to i8*), 
i8* bitcast ([101 x i8]* @$str_stream19 to i8*), 
i8* bitcast ([9 x i8]* @$str_stream20 to i8*), 
i8* bitcast ([101 x i8]* @$str_stream21 to i8*), 
i8* bitcast ([8 x i8]* @$str_stream22 to i8*), 
i8* bitcast ([10 x i8]* @$str_stream23 to i8*), 
i8* bitcast ([9 x i8]* @$str_stream24 to i8*), 
i8* bitcast ([101 x i8]* @$str_stream25 to i8*), 
i8* bitcast ([101 x i8]* @$str_stream26 to i8*), 
i8* bitcast ([10 x i8]* @$str_stream27 to i8*), 
i8* bitcast ([9 x i8]* @$str_stream28 to i8*), 
i8* bitcast ([101 x i8]* @$str_stream29 to i8*), 
i8* bitcast ([10 x i8]* @$str_stream30 to i8*), 
i8* bitcast ([8 x i8]* @$str_stream31 to i8*), 
i8* bitcast ([8 x i8]* @$str_stream32 to i8*), 
i8* bitcast ([101 x i8]* @$str_stream33 to i8*), 
i8* bitcast ([102 x i8]* @$str_stream34 to i8*), 
i8* bitcast ([102 x i8]* @$str_stream35 to i8*), 
i8* bitcast ([102 x i8]* @$str_stream36 to i8*), 
i8* bitcast ([102 x i8]* @$str_stream37 to i8*), 
i8* bitcast ([9 x i8]* @$str_stream38 to i8*), 
i8* bitcast ([12 x i8]* @$str_stream39 to i8*), 
i8* bitcast ([101 x i8]* @$str_stream40 to i8*), 
i8* bitcast ([9 x i8]* @$str_stream41 to i8*), 
i8* bitcast ([8 x i8]* @$str_stream42 to i8*), 
i8* bitcast ([15 x i8]* @$str_stream43 to i8*), 
i8* bitcast ([8 x i8]* @$str_stream44 to i8*), 
i8* bitcast ([8 x i8]* @$str_stream45 to i8*), 
i8* bitcast ([15 x i8]* @$str_stream46 to i8*), 
i8* bitcast ([18 x i8]* @$str_stream47 to i8*), 
i8* bitcast ([16 x i8]* @$str_stream48 to i8*), 
i8* bitcast ([15 x i8]* @$str_stream49 to i8*), 
i8* bitcast ([14 x i8]* @$str_stream50 to i8*)]
@$String_Table = internal global [50 x i64] 
[i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, 
 i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, 
 i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, 
 i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, 
 i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, 
 i64 0]
@$Strings = internal constant i64* bitcast ([50 x i64]* @$String_Table to i64*)
@_psc_global_to_do = external global {i64*, void()*}*
define internal void @$initialize_streams() {
   %_Str_Tab = load i64*, i64** @$Strings
   call void @_psc_reconstruct_strings(i16 50, i8** bitcast ([50 x i8*]* @$Str_Streams to i8**), i64* %_Str_Tab)
   call void @_psc_register_compiled_operations(i16 32, i16* bitcast ([64 x i16]* @$Module_Op_Indices to i16*), void(i64*, i64*, i64*)** bitcast ([32 x void(i64*, i64*, i64*)*]* @$Local_Funcs to void(i64*, i64*, i64*)**), i32* bitcast ([32 x i32]* @$Local_Funcs_Conv_Descs to i32*), i64* %_Str_Tab, i32 0, i16* bitcast ([0 x i16]* @$Internal_Precond_Indices to i16*), i32(i64*, i64*, i64*)** bitcast ([0 x i32(i64*, i64*, i64*)*]* @$Internal_Precond_Blocks to i32(i64*, i64*, i64*)**))
   ret void
}
@"_node_/Users/stt/_parasail/lib/aaa/aaa046ordered_set.psi" = global {i64*, void()*} {i64* null, void()* @$initialize_streams}
define internal void @$add_to_todo() {
   %_next = load {i64*, void()*}*, {i64*, void()*}** @_psc_global_to_do
   %_nextc = bitcast {i64*, void()*}* %_next to i64*
   %_node.next_ptr = getelementptr {i64*, void()*}, {i64*, void()*}* @"_node_/Users/stt/_parasail/lib/aaa/aaa046ordered_set.psi", i32 0, i32 0
   store i64* %_nextc, i64** %_node.next_ptr
   store {i64*, void()*}* @"_node_/Users/stt/_parasail/lib/aaa/aaa046ordered_set.psi", {i64*, void()*}** @_psc_global_to_do
   ret void
}
@llvm.global_ctors = appending global [1 x {i32, void ()*}] [{i32, void()*} {i32 65535, void ()* @$add_to_todo}]

define i64 @"PSL.Containers.Ordered_Set.$[]$"(i64* %_Context, i64* %_Static_Link, i64 %_inited_output) {
   %_Local_Area = alloca i64, i64 4
   %_sl = ptrtoint i64* %_Static_Link to i64
   store i64 %_sl, i64* %_Local_Area

   %_Param_Area = alloca i64
   %_loc_2 = alloca i64
   %_output.I5 = alloca i64
   %_print_param11 = alloca i64

   store i64 %_inited_output, i64* %_Param_Area
   
   ; #Declare_Obj_Op at 101:16

   ; #Create_Obj_Op at 101:16
   %_desc2 = getelementptr i64, i64* %_Static_Link, i64 0
   %_src_addr2 = getelementptr i64, i64* %_Param_Area, i64 0
   %_src2 = load i64, i64* %_src_addr2
   %_dest2 = call i64@_psc_new_object(i64* %_Context, i64* %_desc2, i64 %_src2)
   %_dest_addr2 = bitcast i64* %_loc_2 to i64* 
   store i64 %_dest2, i64* %_dest_addr2

   ; #Copy_Word_Op at 101:16
   %_source3 = bitcast i64* %_loc_2 to i64* 
   %_source_val3 = load i64, i64* %_source3
   %_loc_3 = bitcast i64 %_source_val3 to i64

   ; #Store_Null_Of_Same_Stg_Rgn_Op at 101:26
   %_cur_td4 = bitcast i64* %_Static_Link to %struct.TD*
   %_nested_types_arr_ptr4 = getelementptr %struct.TD, %struct.TD* %_cur_td4, i32 0, i32 35
   %_nested_types_arr4 = load %struct.TD**, %struct.TD*** %_nested_types_arr_ptr4
   %_nested_td_ptr_ptr4 = getelementptr %struct.TD*, %struct.TD** %_nested_types_arr4, i32 0
   %_nested_td4 = load %struct.TD*, %struct.TD** %_nested_td_ptr_ptr4
   %_desc4 = bitcast %struct.TD* %_nested_td4 to i64*
   %_source4 = bitcast i64 %_loc_3 to i64
   %_td4 = bitcast i64* %_desc4 to %struct.TD*
   %_is_small_ptr4 = getelementptr %struct.TD, %struct.TD* %_td4, i32 0, i32 13
   %_is_small4 = load i8, i8* %_is_small_ptr4
   %_is_small_bool4 = trunc i8 %_is_small4 to i1
   br i1 %_is_small_bool4, label %_small_label4, label %_large_label4
   _small_label4:
   %_small_null_ptr4 = getelementptr %struct.TD, %struct.TD* %_td4, i32 0, i32 17
   %_small_null4 = load i64, i64* %_small_null_ptr4
   br label %_join_small_and_large4
   _large_label4:
   %_high_and_low_bits4 = and i64 %_source4, or (i64 shl (i64 1, i64 63), i64 1)
   %_is_special_bit4 = icmp eq i64 %_high_and_low_bits4, or (i64 shl (i64 1, i64 63), i64 1)
   br i1 %_is_special_bit4, label %_is_special_label4, label %_not_special_label4
   _is_special_label4:
   %_spcl_rgn_times2_4 = and i64 %_source4, 4294967295
   br label %_last_large_label4
   _not_special_label4:
   %_header_ptr4 = inttoptr i64 %_source4 to i64*
   %_hdr_of_src4 = load i64, i64* %_header_ptr4
   %_region_bits4 = and i64 %_hdr_of_src4, 4294901760
   %_normal_rgn_times2_4 = lshr i64 %_region_bits4, 15
   br label %_last_large_label4
   _last_large_label4:
   %_rgn_times2_4 = phi i64 [%_spcl_rgn_times2_4, %_is_special_label4], [%_normal_rgn_times2_4, %_not_special_label4]
   %_large_null4 = or i64 -144115188075855871, %_rgn_times2_4
   br label %_join_small_and_large4
   _join_small_and_large4:
   %_null4 = phi i64 [%_small_null4, %_small_label4],[%_large_null4, %_last_large_label4]
   %_loc_5 = bitcast i64 %_null4 to i64

   ; #Call_Op at 101:26
   ; inlining call on "[]"
   store i64 %_loc_5, i64* %_output.I5
   %_cur_td5 = bitcast i64* %_Static_Link to %struct.TD*
   %_nested_types_arr_ptr5 = getelementptr %struct.TD, %struct.TD* %_cur_td5, i32 0, i32 35
   %_nested_types_arr5 = load %struct.TD**, %struct.TD*** %_nested_types_arr_ptr5
   %_nested_td_ptr_ptr5 = getelementptr %struct.TD*, %struct.TD** %_nested_types_arr5, i32 0
   %_nested_td5 = load %struct.TD*, %struct.TD** %_nested_td_ptr_ptr5
   %_call5_Static_Link = bitcast %struct.TD* %_nested_td5 to i64*

   ; #Store_Null_Of_Same_Stg_Rgn_Op at 227:16
   %_source_ptr.I5.1 = bitcast i64* %_output.I5 to i64*
   %_source.I5.1 = load i64, i64* %_source_ptr.I5.1
   %_high_and_low_bits.I5.1 = and i64 %_source.I5.1, or (i64 shl (i64 1, i64 63), i64 1)
   %_is_special_bit.I5.1 = icmp eq i64 %_high_and_low_bits.I5.1, or (i64 shl (i64 1, i64 63), i64 1)
   br i1 %_is_special_bit.I5.1, label %_is_special_label.I5.1, label %_not_special_label.I5.1
   _is_special_label.I5.1:
   %_spcl_rgn_times2_.I5.1 = and i64 %_source.I5.1, 4294967295
   br label %_join_label.I5.1
   _not_special_label.I5.1:
   %_header_ptr.I5.1 = inttoptr i64 %_source.I5.1 to i64*
   %_hdr_of_src.I5.1 = load i64, i64* %_header_ptr.I5.1
   %_region_bits.I5.1 = and i64 %_hdr_of_src.I5.1, 4294901760
   %_normal_rgn_times2_.I5.1 = lshr i64 %_region_bits.I5.1, 15
   br label %_join_label.I5.1
   _join_label.I5.1:
   %_rgn_times2_.I5.1 = phi i64 [%_spcl_rgn_times2_.I5.1, %_is_special_label.I5.1], [%_normal_rgn_times2_.I5.1, %_not_special_label.I5.1]
   %_null.I5.1 = or i64 -144115188075855871, %_rgn_times2_.I5.1
   %_loc_.I5_1 = bitcast i64 %_null.I5.1 to i64

   ; #Copy_Word_Op at 227:9
   %_source_val.I5.2 = bitcast i64 %_loc_.I5_1 to i64
   %_dest.I5.2 = bitcast i64* %_output.I5 to i64*
   store i64 %_source_val.I5.2, i64* %_dest.I5.2

   ; #Return_Op at 227:9

   %_new_result5 = load i64, i64* %_output.I5
   %_loc_4 = bitcast i64 %_new_result5 to i64

   ; #Copy_Word_Op at 101:26
   %_source_val6 = bitcast i64 %_loc_4 to i64
   %_reg6_2 = inttoptr i64 %_loc_3 to i64*
   %_dest6 = getelementptr i64, i64* %_reg6_2, i64 1
   store i64 %_source_val6, i64* %_dest6

   ; #Store_Int_Lit_Op at 101:39
   %_loc_6 = bitcast i64 0 to i64

   ; #Copy_Word_Op at 101:39
   %_source_val8 = bitcast i64 %_loc_6 to i64
   %_reg8_2 = inttoptr i64 %_loc_3 to i64*
   %_dest8 = getelementptr i64, i64* %_reg8_2, i64 2
   store i64 %_source_val8, i64* %_dest8

   ; #Copy_Word_Op at 101:16
   %_source9 = bitcast i64* %_loc_2 to i64* 
   %_source_val9 = load i64, i64* %_source9
   %_loc_1 = bitcast i64 %_source_val9 to i64

   ; #Copy_Word_Op at 101:9
   %_source_val10 = bitcast i64 %_loc_1 to i64
   %_dest10 = getelementptr i64, i64* %_Param_Area, i64 0
   store i64 %_source_val10, i64* %_dest10

   ; #Check_Not_Null_Op at 101:9
   %_arg_ptr11 = getelementptr i64, i64* %_Param_Area, i64 0
   %_arg11 = load i64, i64* %_arg_ptr11
   %_val_no_reg11 = and i64 %_arg11, -4294967295
   %_is_null11 = icmp eq i64 %_val_no_reg11, -144115188075855871
   br i1 %_is_null11, label %_fail11, label %_lbl12
   _fail11:
   %_str_ptr_ptr11 = load i64*, i64** @$Strings
   %_str_ptr11 = getelementptr i64, i64* %_str_ptr_ptr11, i64 2
   %_assert_str11 = load i64, i64* %_str_ptr11
   store i64 %_assert_str11, i64* %_print_param11
   call void @_psc_runtime_message(i64* %_Context, i64* %_print_param11, i64* null)

   br label %_lbl12

_lbl12:
   ; #Return_Op at 101:9
   %_result_reg12 = load i64, i64* %_Param_Area
   ret i64 %_result_reg12

}

define i64 @"PSL.Containers.Ordered_Set.Singleton"(i64 %_formal_param_1, i64* %_Context, i64* %_Static_Link, i64 %_inited_output) {
   %_Local_Area = alloca i64, i64 4
   %_sl = ptrtoint i64* %_Static_Link to i64
   store i64 %_sl, i64* %_Local_Area

   %_Param_Area = alloca i64
   %_output.I2 = alloca i64
   %_loc_.I2_2 = alloca i64
   %_output.I2.I5 = alloca i64
   %_print_param.I2.11 = alloca i64
   %_loc_.I7_1 = alloca i64
   %_print_param11 = alloca i64

   store i64 %_inited_output, i64* %_Param_Area
   
   ; #Store_Null_Of_Same_Stg_Rgn_Op at 105:19
   %_source_ptr1 = getelementptr i64, i64* %_Param_Area, i64 0
   %_source1 = load i64, i64* %_source_ptr1
   %_high_and_low_bits1 = and i64 %_source1, or (i64 shl (i64 1, i64 63), i64 1)
   %_is_special_bit1 = icmp eq i64 %_high_and_low_bits1, or (i64 shl (i64 1, i64 63), i64 1)
   br i1 %_is_special_bit1, label %_is_special_label1, label %_not_special_label1
   _is_special_label1:
   %_spcl_rgn_times2_1 = and i64 %_source1, 4294967295
   br label %_join_label1
   _not_special_label1:
   %_header_ptr1 = inttoptr i64 %_source1 to i64*
   %_hdr_of_src1 = load i64, i64* %_header_ptr1
   %_region_bits1 = and i64 %_hdr_of_src1, 4294901760
   %_normal_rgn_times2_1 = lshr i64 %_region_bits1, 15
   br label %_join_label1
   _join_label1:
   %_rgn_times2_1 = phi i64 [%_spcl_rgn_times2_1, %_is_special_label1], [%_normal_rgn_times2_1, %_not_special_label1]
   %_null1 = or i64 -144115188075855871, %_rgn_times2_1
   %_loc_2 = bitcast i64 %_null1 to i64

   ; #Call_Op at 105:19
   ; inlining call on "[]"
   store i64 %_loc_2, i64* %_output.I2
   %_call2_Static_Link = getelementptr i64, i64* %_Static_Link, i64 0

   ; #Declare_Obj_Op at 101:16

   ; #Create_Obj_Op at 101:16
   %_desc.I2.2 = getelementptr i64, i64* %_call2_Static_Link, i64 0
   %_src_addr.I2.2 = bitcast i64* %_output.I2 to i64*
   %_src.I2.2 = load i64, i64* %_src_addr.I2.2
   %_dest.I2.2 = call i64@_psc_new_object(i64* %_Context, i64* %_desc.I2.2, i64 %_src.I2.2)
   %_dest_addr.I2.2 = bitcast i64* %_loc_.I2_2 to i64* 
   store i64 %_dest.I2.2, i64* %_dest_addr.I2.2

   ; #Copy_Word_Op at 101:16
   %_source.I2.3 = bitcast i64* %_loc_.I2_2 to i64* 
   %_source_val.I2.3 = load i64, i64* %_source.I2.3
   %_loc_.I2_3 = bitcast i64 %_source_val.I2.3 to i64

   ; #Store_Null_Of_Same_Stg_Rgn_Op at 101:26
   %_cur_td.I2.4 = bitcast i64* %_call2_Static_Link to %struct.TD*
   %_nested_types_arr_ptr.I2.4 = getelementptr %struct.TD, %struct.TD* %_cur_td.I2.4, i32 0, i32 35
   %_nested_types_arr.I2.4 = load %struct.TD**, %struct.TD*** %_nested_types_arr_ptr.I2.4
   %_nested_td_ptr_ptr.I2.4 = getelementptr %struct.TD*, %struct.TD** %_nested_types_arr.I2.4, i32 0
   %_nested_td.I2.4 = load %struct.TD*, %struct.TD** %_nested_td_ptr_ptr.I2.4
   %_desc.I2.4 = bitcast %struct.TD* %_nested_td.I2.4 to i64*
   %_source.I2.4 = bitcast i64 %_loc_.I2_3 to i64
   %_td.I2.4 = bitcast i64* %_desc.I2.4 to %struct.TD*
   %_is_small_ptr.I2.4 = getelementptr %struct.TD, %struct.TD* %_td.I2.4, i32 0, i32 13
   %_is_small.I2.4 = load i8, i8* %_is_small_ptr.I2.4
   %_is_small_bool.I2.4 = trunc i8 %_is_small.I2.4 to i1
   br i1 %_is_small_bool.I2.4, label %_small_label.I2.4, label %_large_label.I2.4
   _small_label.I2.4:
   %_small_null_ptr.I2.4 = getelementptr %struct.TD, %struct.TD* %_td.I2.4, i32 0, i32 17
   %_small_null.I2.4 = load i64, i64* %_small_null_ptr.I2.4
   br label %_join_small_and_large.I2.4
   _large_label.I2.4:
   %_high_and_low_bits.I2.4 = and i64 %_source.I2.4, or (i64 shl (i64 1, i64 63), i64 1)
   %_is_special_bit.I2.4 = icmp eq i64 %_high_and_low_bits.I2.4, or (i64 shl (i64 1, i64 63), i64 1)
   br i1 %_is_special_bit.I2.4, label %_is_special_label.I2.4, label %_not_special_label.I2.4
   _is_special_label.I2.4:
   %_spcl_rgn_times2_.I2.4 = and i64 %_source.I2.4, 4294967295
   br label %_last_large_label.I2.4
   _not_special_label.I2.4:
   %_header_ptr.I2.4 = inttoptr i64 %_source.I2.4 to i64*
   %_hdr_of_src.I2.4 = load i64, i64* %_header_ptr.I2.4
   %_region_bits.I2.4 = and i64 %_hdr_of_src.I2.4, 4294901760
   %_normal_rgn_times2_.I2.4 = lshr i64 %_region_bits.I2.4, 15
   br label %_last_large_label.I2.4
   _last_large_label.I2.4:
   %_rgn_times2_.I2.4 = phi i64 [%_spcl_rgn_times2_.I2.4, %_is_special_label.I2.4], [%_normal_rgn_times2_.I2.4, %_not_special_label.I2.4]
   %_large_null.I2.4 = or i64 -144115188075855871, %_rgn_times2_.I2.4
   br label %_join_small_and_large.I2.4
   _join_small_and_large.I2.4:
   %_null.I2.4 = phi i64 [%_small_null.I2.4, %_small_label.I2.4],[%_large_null.I2.4, %_last_large_label.I2.4]
   %_loc_.I2_5 = bitcast i64 %_null.I2.4 to i64

   ; #Call_Op at 101:26
   ; inlining call on "[]"
   store i64 %_loc_.I2_5, i64* %_output.I2.I5
   %_cur_td.I2.5 = bitcast i64* %_call2_Static_Link to %struct.TD*
   %_nested_types_arr_ptr.I2.5 = getelementptr %struct.TD, %struct.TD* %_cur_td.I2.5, i32 0, i32 35
   %_nested_types_arr.I2.5 = load %struct.TD**, %struct.TD*** %_nested_types_arr_ptr.I2.5
   %_nested_td_ptr_ptr.I2.5 = getelementptr %struct.TD*, %struct.TD** %_nested_types_arr.I2.5, i32 0
   %_nested_td.I2.5 = load %struct.TD*, %struct.TD** %_nested_td_ptr_ptr.I2.5
   %_call.I2.5_Static_Link = bitcast %struct.TD* %_nested_td.I2.5 to i64*

   ; #Store_Null_Of_Same_Stg_Rgn_Op at 227:16
   %_source_ptr.I2.I5.1 = bitcast i64* %_output.I2.I5 to i64*
   %_source.I2.I5.1 = load i64, i64* %_source_ptr.I2.I5.1
   %_high_and_low_bits.I2.I5.1 = and i64 %_source.I2.I5.1, or (i64 shl (i64 1, i64 63), i64 1)
   %_is_special_bit.I2.I5.1 = icmp eq i64 %_high_and_low_bits.I2.I5.1, or (i64 shl (i64 1, i64 63), i64 1)
   br i1 %_is_special_bit.I2.I5.1, label %_is_special_label.I2.I5.1, label %_not_special_label.I2.I5.1
   _is_special_label.I2.I5.1:
   %_spcl_rgn_times2_.I2.I5.1 = and i64 %_source.I2.I5.1, 4294967295
   br label %_join_label.I2.I5.1
   _not_special_label.I2.I5.1:
   %_header_ptr.I2.I5.1 = inttoptr i64 %_source.I2.I5.1 to i64*
   %_hdr_of_src.I2.I5.1 = load i64, i64* %_header_ptr.I2.I5.1
   %_region_bits.I2.I5.1 = and i64 %_hdr_of_src.I2.I5.1, 4294901760
   %_normal_rgn_times2_.I2.I5.1 = lshr i64 %_region_bits.I2.I5.1, 15
   br label %_join_label.I2.I5.1
   _join_label.I2.I5.1:
   %_rgn_times2_.I2.I5.1 = phi i64 [%_spcl_rgn_times2_.I2.I5.1, %_is_special_label.I2.I5.1], [%_normal_rgn_times2_.I2.I5.1, %_not_special_label.I2.I5.1]
   %_null.I2.I5.1 = or i64 -144115188075855871, %_rgn_times2_.I2.I5.1
   %_loc_.I2.I5_1 = bitcast i64 %_null.I2.I5.1 to i64

   ; #Copy_Word_Op at 227:9
   %_source_val.I2.I5.2 = bitcast i64 %_loc_.I2.I5_1 to i64
   %_dest.I2.I5.2 = bitcast i64* %_output.I2.I5 to i64*
   store i64 %_source_val.I2.I5.2, i64* %_dest.I2.I5.2

   ; #Return_Op at 227:9

   %_new_result.I2.5 = load i64, i64* %_output.I2.I5
   %_loc_.I2_4 = bitcast i64 %_new_result.I2.5 to i64

   ; #Copy_Word_Op at 101:26
   %_source_val.I2.6 = bitcast i64 %_loc_.I2_4 to i64
   %_reg.I2.6_2 = inttoptr i64 %_loc_.I2_3 to i64*
   %_dest.I2.6 = getelementptr i64, i64* %_reg.I2.6_2, i64 1
   store i64 %_source_val.I2.6, i64* %_dest.I2.6

   ; #Store_Int_Lit_Op at 101:39
   %_loc_.I2_6 = bitcast i64 0 to i64

   ; #Copy_Word_Op at 101:39
   %_source_val.I2.8 = bitcast i64 %_loc_.I2_6 to i64
   %_reg.I2.8_2 = inttoptr i64 %_loc_.I2_3 to i64*
   %_dest.I2.8 = getelementptr i64, i64* %_reg.I2.8_2, i64 2
   store i64 %_source_val.I2.8, i64* %_dest.I2.8

   ; #Copy_Word_Op at 101:16
   %_source.I2.9 = bitcast i64* %_loc_.I2_2 to i64* 
   %_source_val.I2.9 = load i64, i64* %_source.I2.9
   %_loc_.I2_1 = bitcast i64 %_source_val.I2.9 to i64

   ; #Copy_Word_Op at 101:9
   %_source_val.I2.10 = bitcast i64 %_loc_.I2_1 to i64
   %_dest.I2.10 = bitcast i64* %_output.I2 to i64*
   store i64 %_source_val.I2.10, i64* %_dest.I2.10

   ; #Check_Not_Null_Op at 101:9
   %_arg_ptr.I2.11 = bitcast i64* %_output.I2 to i64*
   %_arg.I2.11 = load i64, i64* %_arg_ptr.I2.11
   %_val_no_reg.I2.11 = and i64 %_arg.I2.11, -4294967295
   %_is_null.I2.11 = icmp eq i64 %_val_no_reg.I2.11, -144115188075855871
   br i1 %_is_null.I2.11, label %_fail.I2.11, label %_lbl.I2_12
   _fail.I2.11:
   %_str_ptr_ptr.I2.11 = load i64*, i64** @$Strings
   %_str_ptr.I2.11 = getelementptr i64, i64* %_str_ptr_ptr.I2.11, i64 2
   %_assert_str.I2.11 = load i64, i64* %_str_ptr.I2.11
   store i64 %_assert_str.I2.11, i64* %_print_param.I2.11
   call void @_psc_runtime_message(i64* %_Context, i64* %_print_param.I2.11, i64* null)

   br label %_lbl.I2_12

_lbl.I2_12:
   ; #Return_Op at 101:9

   %_new_result2 = load i64, i64* %_output.I2
   %_loc_1 = bitcast i64 %_new_result2 to i64

   ; #Assign_Word_Op at 105:9
   %_desc3 = getelementptr i64, i64* %_Static_Link, i64 0
   %_source3 = bitcast i64 %_loc_1 to i64
   %_dest_ptr3 = getelementptr i64, i64* %_Param_Area, i64 0
   call void @_psc_assign_word(i64* %_Context, i64* %_desc3, i64* %_dest_ptr3, i64 %_source3)

   ; #Copy_Word_Op at 106:9
   %_source4 = getelementptr i64, i64* %_Param_Area, i64 0
   %_source_val4 = load i64, i64* %_source4
   %_loc_5 = bitcast i64 %_source_val4 to i64

   ; #Store_Address_Op at 106:16
   %_reg5_1 = inttoptr i64 %_loc_5 to i64*
   %_addr5 = getelementptr i64, i64* %_reg5_1, i64 1
   %_loc_3 = bitcast i64* %_addr5 to i64*

   ; #Copy_Word_Op at 106:25
   %_source_val6 = bitcast i64 %_formal_param_1 to i64
   %_loc_4 = bitcast i64 %_source_val6 to i64

   ; #Call_Op at 106:16
   ; inlining call on Insert
   %_cur_td7 = bitcast i64* %_Static_Link to %struct.TD*
   %_nested_types_arr_ptr7 = getelementptr %struct.TD, %struct.TD* %_cur_td7, i32 0, i32 35
   %_nested_types_arr7 = load %struct.TD**, %struct.TD*** %_nested_types_arr_ptr7
   %_nested_td_ptr_ptr7 = getelementptr %struct.TD*, %struct.TD** %_nested_types_arr7, i32 0
   %_nested_td7 = load %struct.TD*, %struct.TD** %_nested_td_ptr_ptr7
   %_call7_Static_Link = bitcast %struct.TD* %_nested_td7 to i64*

   ; #Declare_Obj_Op at 281:13

   ; #Copy_Address_Op at 281:24
   %_source_val.I7.2 = bitcast i64* %_loc_3 to i64*
   %_loc_.I7_2 = bitcast i64* %_source_val.I7.2 to i64*

   ; #Store_Null_Of_Same_Stg_Rgn_Op at 281:24
   %_cur_td.I7.3 = bitcast i64* %_call7_Static_Link to %struct.TD*
   %_param_arr_ptr.I7.3 = getelementptr %struct.TD, %struct.TD* %_cur_td.I7.3, i32 0, i32 26
   %_param_arr.I7.3 = load %struct.ParamInfo*, %struct.ParamInfo** %_param_arr_ptr.I7.3
   %_formal_td_ptr_ptr.I7.3 = getelementptr %struct.ParamInfo, %struct.ParamInfo* %_param_arr.I7.3, i32 0, i32 1, i32 0
   %_formal_td.I7.3 = load %struct.TD*, %struct.TD** %_formal_td_ptr_ptr.I7.3
   %_desc.I7.3 = bitcast %struct.TD* %_formal_td.I7.3 to i64*
   %_reg.I7.3_1 = bitcast i64* %_loc_.I7_2 to i64*
   %_source_ptr.I7.3 = getelementptr i64, i64* %_reg.I7.3_1, i64 0
   %_source.I7.3 = load i64, i64* %_source_ptr.I7.3
   %_td.I7.3 = bitcast i64* %_desc.I7.3 to %struct.TD*
   %_is_small_ptr.I7.3 = getelementptr %struct.TD, %struct.TD* %_td.I7.3, i32 0, i32 13
   %_is_small.I7.3 = load i8, i8* %_is_small_ptr.I7.3
   %_is_small_bool.I7.3 = trunc i8 %_is_small.I7.3 to i1
   br i1 %_is_small_bool.I7.3, label %_small_label.I7.3, label %_large_label.I7.3
   _small_label.I7.3:
   %_small_null_ptr.I7.3 = getelementptr %struct.TD, %struct.TD* %_td.I7.3, i32 0, i32 17
   %_small_null.I7.3 = load i64, i64* %_small_null_ptr.I7.3
   br label %_join_small_and_large.I7.3
   _large_label.I7.3:
   %_high_and_low_bits.I7.3 = and i64 %_source.I7.3, or (i64 shl (i64 1, i64 63), i64 1)
   %_is_special_bit.I7.3 = icmp eq i64 %_high_and_low_bits.I7.3, or (i64 shl (i64 1, i64 63), i64 1)
   br i1 %_is_special_bit.I7.3, label %_is_special_label.I7.3, label %_not_special_label.I7.3
   _is_special_label.I7.3:
   %_spcl_rgn_times2_.I7.3 = and i64 %_source.I7.3, 4294967295
   br label %_last_large_label.I7.3
   _not_special_label.I7.3:
   %_header_ptr.I7.3 = inttoptr i64 %_source.I7.3 to i64*
   %_hdr_of_src.I7.3 = load i64, i64* %_header_ptr.I7.3
   %_region_bits.I7.3 = and i64 %_hdr_of_src.I7.3, 4294901760
   %_normal_rgn_times2_.I7.3 = lshr i64 %_region_bits.I7.3, 15
   br label %_last_large_label.I7.3
   _last_large_label.I7.3:
   %_rgn_times2_.I7.3 = phi i64 [%_spcl_rgn_times2_.I7.3, %_is_special_label.I7.3], [%_normal_rgn_times2_.I7.3, %_not_special_label.I7.3]
   %_large_null.I7.3 = or i64 -144115188075855871, %_rgn_times2_.I7.3
   br label %_join_small_and_large.I7.3
   _join_small_and_large.I7.3:
   %_null.I7.3 = phi i64 [%_small_null.I7.3, %_small_label.I7.3],[%_large_null.I7.3, %_last_large_label.I7.3]
   %_dest_ptr.I7.3 = bitcast i64* %_loc_.I7_1 to i64* 
   store i64 %_null.I7.3, i64* %_dest_ptr.I7.3

   ; #Make_Copy_In_Stg_Rgn_Op at 281:29
   %_cur_td.I7.4 = bitcast i64* %_call7_Static_Link to %struct.TD*
   %_param_arr_ptr.I7.4 = getelementptr %struct.TD, %struct.TD* %_cur_td.I7.4, i32 0, i32 26
   %_param_arr.I7.4 = load %struct.ParamInfo*, %struct.ParamInfo** %_param_arr_ptr.I7.4
   %_formal_td_ptr_ptr.I7.4 = getelementptr %struct.ParamInfo, %struct.ParamInfo* %_param_arr.I7.4, i32 0, i32 1, i32 0
   %_formal_td.I7.4 = load %struct.TD*, %struct.TD** %_formal_td_ptr_ptr.I7.4
   %_desc.I7.4 = bitcast %struct.TD* %_formal_td.I7.4 to i64*
   %_source.I7.4 = bitcast i64 %_loc_4 to i64
   %_existing_ptr.I7.4 = bitcast i64* %_loc_.I7_1 to i64* 
   %_existing_obj.I7.4 = load i64, i64* %_existing_ptr.I7.4
   %_result.I7.4 = call i64 @_psc_copy_object(i64* %_Context, i64* %_desc.I7.4, i64 %_source.I7.4, i64 %_existing_obj.I7.4)
   %_dest_ptr.I7.4 = bitcast i64* %_loc_.I7_1 to i64* 
   store i64 %_result.I7.4, i64* %_dest_ptr.I7.4

   ; #Copy_Address_Op at 282:9
   %_source_val.I7.5 = bitcast i64* %_loc_3 to i64*
   %_loc_.I7_5 = bitcast i64* %_source_val.I7.5 to i64*

   ; #Store_Address_Op at 282:9
   %_reg.I7.6_1 = bitcast i64* %_loc_.I7_5 to i64*
   %_addr.I7.6 = getelementptr i64, i64* %_reg.I7.6_1, i64 0
   %_loc_.I7_3 = bitcast i64* %_addr.I7.6 to i64*

   ; #Store_Address_Op at 282:9
   %_addr.I7.7 = bitcast i64* %_loc_.I7_1 to i64* 
   %_loc_.I7_4 = bitcast i64* %_addr.I7.7 to i64*

   ; #Call_Op at 282:9
   %_call.I7.8_Static_Link = getelementptr i64, i64* %_call7_Static_Link, i64 0
   call void @"PSL.Core.AA_Tree.$<|=$"(i64* %_loc_.I7_3, i64* %_loc_.I7_4, i64* %_Context, i64* %_call.I7.8_Static_Link)

   ; #Return_Op at 283:5


   ; #Copy_Word_Op at 107:9
   %_source8 = getelementptr i64, i64* %_Param_Area, i64 0
   %_source_val8 = load i64, i64* %_source8
   %_loc_7 = bitcast i64 %_source_val8 to i64

   ; #Store_Int_Lit_Op at 107:25
   %_loc_6 = bitcast i64 1 to i64

   ; #Copy_Word_Op at 107:16
   %_source_val10 = bitcast i64 %_loc_6 to i64
   %_reg10_2 = inttoptr i64 %_loc_7 to i64*
   %_dest10 = getelementptr i64, i64* %_reg10_2, i64 2
   store i64 %_source_val10, i64* %_dest10

   ; #Check_Not_Null_Op at 108:5
   %_arg_ptr11 = getelementptr i64, i64* %_Param_Area, i64 0
   %_arg11 = load i64, i64* %_arg_ptr11
   %_val_no_reg11 = and i64 %_arg11, -4294967295
   %_is_null11 = icmp eq i64 %_val_no_reg11, -144115188075855871
   br i1 %_is_null11, label %_fail11, label %_lbl12
   _fail11:
   %_str_ptr_ptr11 = load i64*, i64** @$Strings
   %_str_ptr11 = getelementptr i64, i64* %_str_ptr_ptr11, i64 4
   %_assert_str11 = load i64, i64* %_str_ptr11
   store i64 %_assert_str11, i64* %_print_param11
   call void @_psc_runtime_message(i64* %_Context, i64* %_print_param11, i64* null)

   br label %_lbl12

_lbl12:
   ; #Return_Op at 108:5
   %_result_reg12 = load i64, i64* %_Param_Area
   ret i64 %_result_reg12

}

define i64 @"PSL.Containers.Ordered_Set.$|$"(i64 %_formal_param_1, i64 %_formal_param_2, i64* %_Context, i64* %_Static_Link, i64 %_inited_output) {
   %_Local_Area = alloca i64, i64 4
   %_sl = ptrtoint i64* %_Static_Link to i64
   store i64 %_sl, i64* %_Local_Area

   %_Param_Area = alloca i64
   %_output.I2 = alloca i64
   %_loc_.I2_2 = alloca i64
   %_output.I2.I5 = alloca i64
   %_print_param.I2.11 = alloca i64
   %_loc_.I7_1 = alloca i64
   %_loc_.I11_1 = alloca i64
   %_print_param17 = alloca i64

   store i64 %_inited_output, i64* %_Param_Area
   
   ; #Store_Null_Of_Same_Stg_Rgn_Op at 111:19
   %_source_ptr1 = getelementptr i64, i64* %_Param_Area, i64 0
   %_source1 = load i64, i64* %_source_ptr1
   %_high_and_low_bits1 = and i64 %_source1, or (i64 shl (i64 1, i64 63), i64 1)
   %_is_special_bit1 = icmp eq i64 %_high_and_low_bits1, or (i64 shl (i64 1, i64 63), i64 1)
   br i1 %_is_special_bit1, label %_is_special_label1, label %_not_special_label1
   _is_special_label1:
   %_spcl_rgn_times2_1 = and i64 %_source1, 4294967295
   br label %_join_label1
   _not_special_label1:
   %_header_ptr1 = inttoptr i64 %_source1 to i64*
   %_hdr_of_src1 = load i64, i64* %_header_ptr1
   %_region_bits1 = and i64 %_hdr_of_src1, 4294901760
   %_normal_rgn_times2_1 = lshr i64 %_region_bits1, 15
   br label %_join_label1
   _join_label1:
   %_rgn_times2_1 = phi i64 [%_spcl_rgn_times2_1, %_is_special_label1], [%_normal_rgn_times2_1, %_not_special_label1]
   %_null1 = or i64 -144115188075855871, %_rgn_times2_1
   %_loc_2 = bitcast i64 %_null1 to i64

   ; #Call_Op at 111:19
   ; inlining call on "[]"
   store i64 %_loc_2, i64* %_output.I2
   %_call2_Static_Link = getelementptr i64, i64* %_Static_Link, i64 0

   ; #Declare_Obj_Op at 101:16

   ; #Create_Obj_Op at 101:16
   %_desc.I2.2 = getelementptr i64, i64* %_call2_Static_Link, i64 0
   %_src_addr.I2.2 = bitcast i64* %_output.I2 to i64*
   %_src.I2.2 = load i64, i64* %_src_addr.I2.2
   %_dest.I2.2 = call i64@_psc_new_object(i64* %_Context, i64* %_desc.I2.2, i64 %_src.I2.2)
   %_dest_addr.I2.2 = bitcast i64* %_loc_.I2_2 to i64* 
   store i64 %_dest.I2.2, i64* %_dest_addr.I2.2

   ; #Copy_Word_Op at 101:16
   %_source.I2.3 = bitcast i64* %_loc_.I2_2 to i64* 
   %_source_val.I2.3 = load i64, i64* %_source.I2.3
   %_loc_.I2_3 = bitcast i64 %_source_val.I2.3 to i64

   ; #Store_Null_Of_Same_Stg_Rgn_Op at 101:26
   %_cur_td.I2.4 = bitcast i64* %_call2_Static_Link to %struct.TD*
   %_nested_types_arr_ptr.I2.4 = getelementptr %struct.TD, %struct.TD* %_cur_td.I2.4, i32 0, i32 35
   %_nested_types_arr.I2.4 = load %struct.TD**, %struct.TD*** %_nested_types_arr_ptr.I2.4
   %_nested_td_ptr_ptr.I2.4 = getelementptr %struct.TD*, %struct.TD** %_nested_types_arr.I2.4, i32 0
   %_nested_td.I2.4 = load %struct.TD*, %struct.TD** %_nested_td_ptr_ptr.I2.4
   %_desc.I2.4 = bitcast %struct.TD* %_nested_td.I2.4 to i64*
   %_source.I2.4 = bitcast i64 %_loc_.I2_3 to i64
   %_td.I2.4 = bitcast i64* %_desc.I2.4 to %struct.TD*
   %_is_small_ptr.I2.4 = getelementptr %struct.TD, %struct.TD* %_td.I2.4, i32 0, i32 13
   %_is_small.I2.4 = load i8, i8* %_is_small_ptr.I2.4
   %_is_small_bool.I2.4 = trunc i8 %_is_small.I2.4 to i1
   br i1 %_is_small_bool.I2.4, label %_small_label.I2.4, label %_large_label.I2.4
   _small_label.I2.4:
   %_small_null_ptr.I2.4 = getelementptr %struct.TD, %struct.TD* %_td.I2.4, i32 0, i32 17
   %_small_null.I2.4 = load i64, i64* %_small_null_ptr.I2.4
   br label %_join_small_and_large.I2.4
   _large_label.I2.4:
   %_high_and_low_bits.I2.4 = and i64 %_source.I2.4, or (i64 shl (i64 1, i64 63), i64 1)
   %_is_special_bit.I2.4 = icmp eq i64 %_high_and_low_bits.I2.4, or (i64 shl (i64 1, i64 63), i64 1)
   br i1 %_is_special_bit.I2.4, label %_is_special_label.I2.4, label %_not_special_label.I2.4
   _is_special_label.I2.4:
   %_spcl_rgn_times2_.I2.4 = and i64 %_source.I2.4, 4294967295
   br label %_last_large_label.I2.4
   _not_special_label.I2.4:
   %_header_ptr.I2.4 = inttoptr i64 %_source.I2.4 to i64*
   %_hdr_of_src.I2.4 = load i64, i64* %_header_ptr.I2.4
   %_region_bits.I2.4 = and i64 %_hdr_of_src.I2.4, 4294901760
   %_normal_rgn_times2_.I2.4 = lshr i64 %_region_bits.I2.4, 15
   br label %_last_large_label.I2.4
   _last_large_label.I2.4:
   %_rgn_times2_.I2.4 = phi i64 [%_spcl_rgn_times2_.I2.4, %_is_special_label.I2.4], [%_normal_rgn_times2_.I2.4, %_not_special_label.I2.4]
   %_large_null.I2.4 = or i64 -144115188075855871, %_rgn_times2_.I2.4
   br label %_join_small_and_large.I2.4
   _join_small_and_large.I2.4:
   %_null.I2.4 = phi i64 [%_small_null.I2.4, %_small_label.I2.4],[%_large_null.I2.4, %_last_large_label.I2.4]
   %_loc_.I2_5 = bitcast i64 %_null.I2.4 to i64

   ; #Call_Op at 101:26
   ; inlining call on "[]"
   store i64 %_loc_.I2_5, i64* %_output.I2.I5
   %_cur_td.I2.5 = bitcast i64* %_call2_Static_Link to %struct.TD*
   %_nested_types_arr_ptr.I2.5 = getelementptr %struct.TD, %struct.TD* %_cur_td.I2.5, i32 0, i32 35
   %_nested_types_arr.I2.5 = load %struct.TD**, %struct.TD*** %_nested_types_arr_ptr.I2.5
   %_nested_td_ptr_ptr.I2.5 = getelementptr %struct.TD*, %struct.TD** %_nested_types_arr.I2.5, i32 0
   %_nested_td.I2.5 = load %struct.TD*, %struct.TD** %_nested_td_ptr_ptr.I2.5
   %_call.I2.5_Static_Link = bitcast %struct.TD* %_nested_td.I2.5 to i64*

   ; #Store_Null_Of_Same_Stg_Rgn_Op at 227:16
   %_source_ptr.I2.I5.1 = bitcast i64* %_output.I2.I5 to i64*
   %_source.I2.I5.1 = load i64, i64* %_source_ptr.I2.I5.1
   %_high_and_low_bits.I2.I5.1 = and i64 %_source.I2.I5.1, or (i64 shl (i64 1, i64 63), i64 1)
   %_is_special_bit.I2.I5.1 = icmp eq i64 %_high_and_low_bits.I2.I5.1, or (i64 shl (i64 1, i64 63), i64 1)
   br i1 %_is_special_bit.I2.I5.1, label %_is_special_label.I2.I5.1, label %_not_special_label.I2.I5.1
   _is_special_label.I2.I5.1:
   %_spcl_rgn_times2_.I2.I5.1 = and i64 %_source.I2.I5.1, 4294967295
   br label %_join_label.I2.I5.1
   _not_special_label.I2.I5.1:
   %_header_ptr.I2.I5.1 = inttoptr i64 %_source.I2.I5.1 to i64*
   %_hdr_of_src.I2.I5.1 = load i64, i64* %_header_ptr.I2.I5.1
   %_region_bits.I2.I5.1 = and i64 %_hdr_of_src.I2.I5.1, 4294901760
   %_normal_rgn_times2_.I2.I5.1 = lshr i64 %_region_bits.I2.I5.1, 15
   br label %_join_label.I2.I5.1
   _join_label.I2.I5.1:
   %_rgn_times2_.I2.I5.1 = phi i64 [%_spcl_rgn_times2_.I2.I5.1, %_is_special_label.I2.I5.1], [%_normal_rgn_times2_.I2.I5.1, %_not_special_label.I2.I5.1]
   %_null.I2.I5.1 = or i64 -144115188075855871, %_rgn_times2_.I2.I5.1
   %_loc_.I2.I5_1 = bitcast i64 %_null.I2.I5.1 to i64

   ; #Copy_Word_Op at 227:9
   %_source_val.I2.I5.2 = bitcast i64 %_loc_.I2.I5_1 to i64
   %_dest.I2.I5.2 = bitcast i64* %_output.I2.I5 to i64*
   store i64 %_source_val.I2.I5.2, i64* %_dest.I2.I5.2

   ; #Return_Op at 227:9

   %_new_result.I2.5 = load i64, i64* %_output.I2.I5
   %_loc_.I2_4 = bitcast i64 %_new_result.I2.5 to i64

   ; #Copy_Word_Op at 101:26
   %_source_val.I2.6 = bitcast i64 %_loc_.I2_4 to i64
   %_reg.I2.6_2 = inttoptr i64 %_loc_.I2_3 to i64*
   %_dest.I2.6 = getelementptr i64, i64* %_reg.I2.6_2, i64 1
   store i64 %_source_val.I2.6, i64* %_dest.I2.6

   ; #Store_Int_Lit_Op at 101:39
   %_loc_.I2_6 = bitcast i64 0 to i64

   ; #Copy_Word_Op at 101:39
   %_source_val.I2.8 = bitcast i64 %_loc_.I2_6 to i64
   %_reg.I2.8_2 = inttoptr i64 %_loc_.I2_3 to i64*
   %_dest.I2.8 = getelementptr i64, i64* %_reg.I2.8_2, i64 2
   store i64 %_source_val.I2.8, i64* %_dest.I2.8

   ; #Copy_Word_Op at 101:16
   %_source.I2.9 = bitcast i64* %_loc_.I2_2 to i64* 
   %_source_val.I2.9 = load i64, i64* %_source.I2.9
   %_loc_.I2_1 = bitcast i64 %_source_val.I2.9 to i64

   ; #Copy_Word_Op at 101:9
   %_source_val.I2.10 = bitcast i64 %_loc_.I2_1 to i64
   %_dest.I2.10 = bitcast i64* %_output.I2 to i64*
   store i64 %_source_val.I2.10, i64* %_dest.I2.10

   ; #Check_Not_Null_Op at 101:9
   %_arg_ptr.I2.11 = bitcast i64* %_output.I2 to i64*
   %_arg.I2.11 = load i64, i64* %_arg_ptr.I2.11
   %_val_no_reg.I2.11 = and i64 %_arg.I2.11, -4294967295
   %_is_null.I2.11 = icmp eq i64 %_val_no_reg.I2.11, -144115188075855871
   br i1 %_is_null.I2.11, label %_fail.I2.11, label %_lbl.I2_12
   _fail.I2.11:
   %_str_ptr_ptr.I2.11 = load i64*, i64** @$Strings
   %_str_ptr.I2.11 = getelementptr i64, i64* %_str_ptr_ptr.I2.11, i64 2
   %_assert_str.I2.11 = load i64, i64* %_str_ptr.I2.11
   store i64 %_assert_str.I2.11, i64* %_print_param.I2.11
   call void @_psc_runtime_message(i64* %_Context, i64* %_print_param.I2.11, i64* null)

   br label %_lbl.I2_12

_lbl.I2_12:
   ; #Return_Op at 101:9

   %_new_result2 = load i64, i64* %_output.I2
   %_loc_1 = bitcast i64 %_new_result2 to i64

   ; #Assign_Word_Op at 111:9
   %_desc3 = getelementptr i64, i64* %_Static_Link, i64 0
   %_source3 = bitcast i64 %_loc_1 to i64
   %_dest_ptr3 = getelementptr i64, i64* %_Param_Area, i64 0
   call void @_psc_assign_word(i64* %_Context, i64* %_desc3, i64* %_dest_ptr3, i64 %_source3)

   ; #Copy_Word_Op at 112:9
   %_source4 = getelementptr i64, i64* %_Param_Area, i64 0
   %_source_val4 = load i64, i64* %_source4
   %_loc_5 = bitcast i64 %_source_val4 to i64

   ; #Store_Address_Op at 112:16
   %_reg5_1 = inttoptr i64 %_loc_5 to i64*
   %_addr5 = getelementptr i64, i64* %_reg5_1, i64 1
   %_loc_3 = bitcast i64* %_addr5 to i64*

   ; #Copy_Word_Op at 112:25
   %_source_val6 = bitcast i64 %_formal_param_1 to i64
   %_loc_4 = bitcast i64 %_source_val6 to i64

   ; #Call_Op at 112:16
   ; inlining call on Insert
   %_cur_td7 = bitcast i64* %_Static_Link to %struct.TD*
   %_nested_types_arr_ptr7 = getelementptr %struct.TD, %struct.TD* %_cur_td7, i32 0, i32 35
   %_nested_types_arr7 = load %struct.TD**, %struct.TD*** %_nested_types_arr_ptr7
   %_nested_td_ptr_ptr7 = getelementptr %struct.TD*, %struct.TD** %_nested_types_arr7, i32 0
   %_nested_td7 = load %struct.TD*, %struct.TD** %_nested_td_ptr_ptr7
   %_call7_Static_Link = bitcast %struct.TD* %_nested_td7 to i64*

   ; #Declare_Obj_Op at 281:13

   ; #Copy_Address_Op at 281:24
   %_source_val.I7.2 = bitcast i64* %_loc_3 to i64*
   %_loc_.I7_2 = bitcast i64* %_source_val.I7.2 to i64*

   ; #Store_Null_Of_Same_Stg_Rgn_Op at 281:24
   %_cur_td.I7.3 = bitcast i64* %_call7_Static_Link to %struct.TD*
   %_param_arr_ptr.I7.3 = getelementptr %struct.TD, %struct.TD* %_cur_td.I7.3, i32 0, i32 26
   %_param_arr.I7.3 = load %struct.ParamInfo*, %struct.ParamInfo** %_param_arr_ptr.I7.3
   %_formal_td_ptr_ptr.I7.3 = getelementptr %struct.ParamInfo, %struct.ParamInfo* %_param_arr.I7.3, i32 0, i32 1, i32 0
   %_formal_td.I7.3 = load %struct.TD*, %struct.TD** %_formal_td_ptr_ptr.I7.3
   %_desc.I7.3 = bitcast %struct.TD* %_formal_td.I7.3 to i64*
   %_reg.I7.3_1 = bitcast i64* %_loc_.I7_2 to i64*
   %_source_ptr.I7.3 = getelementptr i64, i64* %_reg.I7.3_1, i64 0
   %_source.I7.3 = load i64, i64* %_source_ptr.I7.3
   %_td.I7.3 = bitcast i64* %_desc.I7.3 to %struct.TD*
   %_is_small_ptr.I7.3 = getelementptr %struct.TD, %struct.TD* %_td.I7.3, i32 0, i32 13
   %_is_small.I7.3 = load i8, i8* %_is_small_ptr.I7.3
   %_is_small_bool.I7.3 = trunc i8 %_is_small.I7.3 to i1
   br i1 %_is_small_bool.I7.3, label %_small_label.I7.3, label %_large_label.I7.3
   _small_label.I7.3:
   %_small_null_ptr.I7.3 = getelementptr %struct.TD, %struct.TD* %_td.I7.3, i32 0, i32 17
   %_small_null.I7.3 = load i64, i64* %_small_null_ptr.I7.3
   br label %_join_small_and_large.I7.3
   _large_label.I7.3:
   %_high_and_low_bits.I7.3 = and i64 %_source.I7.3, or (i64 shl (i64 1, i64 63), i64 1)
   %_is_special_bit.I7.3 = icmp eq i64 %_high_and_low_bits.I7.3, or (i64 shl (i64 1, i64 63), i64 1)
   br i1 %_is_special_bit.I7.3, label %_is_special_label.I7.3, label %_not_special_label.I7.3
   _is_special_label.I7.3:
   %_spcl_rgn_times2_.I7.3 = and i64 %_source.I7.3, 4294967295
   br label %_last_large_label.I7.3
   _not_special_label.I7.3:
   %_header_ptr.I7.3 = inttoptr i64 %_source.I7.3 to i64*
   %_hdr_of_src.I7.3 = load i64, i64* %_header_ptr.I7.3
   %_region_bits.I7.3 = and i64 %_hdr_of_src.I7.3, 4294901760
   %_normal_rgn_times2_.I7.3 = lshr i64 %_region_bits.I7.3, 15
   br label %_last_large_label.I7.3
   _last_large_label.I7.3:
   %_rgn_times2_.I7.3 = phi i64 [%_spcl_rgn_times2_.I7.3, %_is_special_label.I7.3], [%_normal_rgn_times2_.I7.3, %_not_special_label.I7.3]
   %_large_null.I7.3 = or i64 -144115188075855871, %_rgn_times2_.I7.3
   br label %_join_small_and_large.I7.3
   _join_small_and_large.I7.3:
   %_null.I7.3 = phi i64 [%_small_null.I7.3, %_small_label.I7.3],[%_large_null.I7.3, %_last_large_label.I7.3]
   %_dest_ptr.I7.3 = bitcast i64* %_loc_.I7_1 to i64* 
   store i64 %_null.I7.3, i64* %_dest_ptr.I7.3

   ; #Make_Copy_In_Stg_Rgn_Op at 281:29
   %_cur_td.I7.4 = bitcast i64* %_call7_Static_Link to %struct.TD*
   %_param_arr_ptr.I7.4 = getelementptr %struct.TD, %struct.TD* %_cur_td.I7.4, i32 0, i32 26
   %_param_arr.I7.4 = load %struct.ParamInfo*, %struct.ParamInfo** %_param_arr_ptr.I7.4
   %_formal_td_ptr_ptr.I7.4 = getelementptr %struct.ParamInfo, %struct.ParamInfo* %_param_arr.I7.4, i32 0, i32 1, i32 0
   %_formal_td.I7.4 = load %struct.TD*, %struct.TD** %_formal_td_ptr_ptr.I7.4
   %_desc.I7.4 = bitcast %struct.TD* %_formal_td.I7.4 to i64*
   %_source.I7.4 = bitcast i64 %_loc_4 to i64
   %_existing_ptr.I7.4 = bitcast i64* %_loc_.I7_1 to i64* 
   %_existing_obj.I7.4 = load i64, i64* %_existing_ptr.I7.4
   %_result.I7.4 = call i64 @_psc_copy_object(i64* %_Context, i64* %_desc.I7.4, i64 %_source.I7.4, i64 %_existing_obj.I7.4)
   %_dest_ptr.I7.4 = bitcast i64* %_loc_.I7_1 to i64* 
   store i64 %_result.I7.4, i64* %_dest_ptr.I7.4

   ; #Copy_Address_Op at 282:9
   %_source_val.I7.5 = bitcast i64* %_loc_3 to i64*
   %_loc_.I7_5 = bitcast i64* %_source_val.I7.5 to i64*

   ; #Store_Address_Op at 282:9
   %_reg.I7.6_1 = bitcast i64* %_loc_.I7_5 to i64*
   %_addr.I7.6 = getelementptr i64, i64* %_reg.I7.6_1, i64 0
   %_loc_.I7_3 = bitcast i64* %_addr.I7.6 to i64*

   ; #Store_Address_Op at 282:9
   %_addr.I7.7 = bitcast i64* %_loc_.I7_1 to i64* 
   %_loc_.I7_4 = bitcast i64* %_addr.I7.7 to i64*

   ; #Call_Op at 282:9
   %_call.I7.8_Static_Link = getelementptr i64, i64* %_call7_Static_Link, i64 0
   call void @"PSL.Core.AA_Tree.$<|=$"(i64* %_loc_.I7_3, i64* %_loc_.I7_4, i64* %_Context, i64* %_call.I7.8_Static_Link)

   ; #Return_Op at 283:5


   ; #Copy_Word_Op at 113:9
   %_source8 = getelementptr i64, i64* %_Param_Area, i64 0
   %_source_val8 = load i64, i64* %_source8
   %_loc_8 = bitcast i64 %_source_val8 to i64

   ; #Store_Address_Op at 113:16
   %_reg9_1 = inttoptr i64 %_loc_8 to i64*
   %_addr9 = getelementptr i64, i64* %_reg9_1, i64 1
   %_loc_6 = bitcast i64* %_addr9 to i64*

   ; #Copy_Word_Op at 113:25
   %_source_val10 = bitcast i64 %_formal_param_2 to i64
   %_loc_7 = bitcast i64 %_source_val10 to i64

   ; #Call_Op at 113:16
   ; inlining call on Insert
   %_cur_td11 = bitcast i64* %_Static_Link to %struct.TD*
   %_nested_types_arr_ptr11 = getelementptr %struct.TD, %struct.TD* %_cur_td11, i32 0, i32 35
   %_nested_types_arr11 = load %struct.TD**, %struct.TD*** %_nested_types_arr_ptr11
   %_nested_td_ptr_ptr11 = getelementptr %struct.TD*, %struct.TD** %_nested_types_arr11, i32 0
   %_nested_td11 = load %struct.TD*, %struct.TD** %_nested_td_ptr_ptr11
   %_call11_Static_Link = bitcast %struct.TD* %_nested_td11 to i64*

   ; #Declare_Obj_Op at 281:13

   ; #Copy_Address_Op at 281:24
   %_source_val.I11.2 = bitcast i64* %_loc_6 to i64*
   %_loc_.I11_2 = bitcast i64* %_source_val.I11.2 to i64*

   ; #Store_Null_Of_Same_Stg_Rgn_Op at 281:24
   %_cur_td.I11.3 = bitcast i64* %_call11_Static_Link to %struct.TD*
   %_param_arr_ptr.I11.3 = getelementptr %struct.TD, %struct.TD* %_cur_td.I11.3, i32 0, i32 26
   %_param_arr.I11.3 = load %struct.ParamInfo*, %struct.ParamInfo** %_param_arr_ptr.I11.3
   %_formal_td_ptr_ptr.I11.3 = getelementptr %struct.ParamInfo, %struct.ParamInfo* %_param_arr.I11.3, i32 0, i32 1, i32 0
   %_formal_td.I11.3 = load %struct.TD*, %struct.TD** %_formal_td_ptr_ptr.I11.3
   %_desc.I11.3 = bitcast %struct.TD* %_formal_td.I11.3 to i64*
   %_reg.I11.3_1 = bitcast i64* %_loc_.I11_2 to i64*
   %_source_ptr.I11.3 = getelementptr i64, i64* %_reg.I11.3_1, i64 0
   %_source.I11.3 = load i64, i64* %_source_ptr.I11.3
   %_td.I11.3 = bitcast i64* %_desc.I11.3 to %struct.TD*
   %_is_small_ptr.I11.3 = getelementptr %struct.TD, %struct.TD* %_td.I11.3, i32 0, i32 13
   %_is_small.I11.3 = load i8, i8* %_is_small_ptr.I11.3
   %_is_small_bool.I11.3 = trunc i8 %_is_small.I11.3 to i1
   br i1 %_is_small_bool.I11.3, label %_small_label.I11.3, label %_large_label.I11.3
   _small_label.I11.3:
   %_small_null_ptr.I11.3 = getelementptr %struct.TD, %struct.TD* %_td.I11.3, i32 0, i32 17
   %_small_null.I11.3 = load i64, i64* %_small_null_ptr.I11.3
   br label %_join_small_and_large.I11.3
   _large_label.I11.3:
   %_high_and_low_bits.I11.3 = and i64 %_source.I11.3, or (i64 shl (i64 1, i64 63), i64 1)
   %_is_special_bit.I11.3 = icmp eq i64 %_high_and_low_bits.I11.3, or (i64 shl (i64 1, i64 63), i64 1)
   br i1 %_is_special_bit.I11.3, label %_is_special_label.I11.3, label %_not_special_label.I11.3
   _is_special_label.I11.3:
   %_spcl_rgn_times2_.I11.3 = and i64 %_source.I11.3, 4294967295
   br label %_last_large_label.I11.3
   _not_special_label.I11.3:
   %_header_ptr.I11.3 = inttoptr i64 %_source.I11.3 to i64*
   %_hdr_of_src.I11.3 = load i64, i64* %_header_ptr.I11.3
   %_region_bits.I11.3 = and i64 %_hdr_of_src.I11.3, 4294901760
   %_normal_rgn_times2_.I11.3 = lshr i64 %_region_bits.I11.3, 15
   br label %_last_large_label.I11.3
   _last_large_label.I11.3:
   %_rgn_times2_.I11.3 = phi i64 [%_spcl_rgn_times2_.I11.3, %_is_special_label.I11.3], [%_normal_rgn_times2_.I11.3, %_not_special_label.I11.3]
   %_large_null.I11.3 = or i64 -144115188075855871, %_rgn_times2_.I11.3
   br label %_join_small_and_large.I11.3
   _join_small_and_large.I11.3:
   %_null.I11.3 = phi i64 [%_small_null.I11.3, %_small_label.I11.3],[%_large_null.I11.3, %_last_large_label.I11.3]
   %_dest_ptr.I11.3 = bitcast i64* %_loc_.I11_1 to i64* 
   store i64 %_null.I11.3, i64* %_dest_ptr.I11.3

   ; #Make_Copy_In_Stg_Rgn_Op at 281:29
   %_cur_td.I11.4 = bitcast i64* %_call11_Static_Link to %struct.TD*
   %_param_arr_ptr.I11.4 = getelementptr %struct.TD, %struct.TD* %_cur_td.I11.4, i32 0, i32 26
   %_param_arr.I11.4 = load %struct.ParamInfo*, %struct.ParamInfo** %_param_arr_ptr.I11.4
   %_formal_td_ptr_ptr.I11.4 = getelementptr %struct.ParamInfo, %struct.ParamInfo* %_param_arr.I11.4, i32 0, i32 1, i32 0
   %_formal_td.I11.4 = load %struct.TD*, %struct.TD** %_formal_td_ptr_ptr.I11.4
   %_desc.I11.4 = bitcast %struct.TD* %_formal_td.I11.4 to i64*
   %_source.I11.4 = bitcast i64 %_loc_7 to i64
   %_existing_ptr.I11.4 = bitcast i64* %_loc_.I11_1 to i64* 
   %_existing_obj.I11.4 = load i64, i64* %_existing_ptr.I11.4
   %_result.I11.4 = call i64 @_psc_copy_object(i64* %_Context, i64* %_desc.I11.4, i64 %_source.I11.4, i64 %_existing_obj.I11.4)
   %_dest_ptr.I11.4 = bitcast i64* %_loc_.I11_1 to i64* 
   store i64 %_result.I11.4, i64* %_dest_ptr.I11.4

   ; #Copy_Address_Op at 282:9
   %_source_val.I11.5 = bitcast i64* %_loc_6 to i64*
   %_loc_.I11_5 = bitcast i64* %_source_val.I11.5 to i64*

   ; #Store_Address_Op at 282:9
   %_reg.I11.6_1 = bitcast i64* %_loc_.I11_5 to i64*
   %_addr.I11.6 = getelementptr i64, i64* %_reg.I11.6_1, i64 0
   %_loc_.I11_3 = bitcast i64* %_addr.I11.6 to i64*

   ; #Store_Address_Op at 282:9
   %_addr.I11.7 = bitcast i64* %_loc_.I11_1 to i64* 
   %_loc_.I11_4 = bitcast i64* %_addr.I11.7 to i64*

   ; #Call_Op at 282:9
   %_call.I11.8_Static_Link = getelementptr i64, i64* %_call11_Static_Link, i64 0
   call void @"PSL.Core.AA_Tree.$<|=$"(i64* %_loc_.I11_3, i64* %_loc_.I11_4, i64* %_Context, i64* %_call.I11.8_Static_Link)

   ; #Return_Op at 283:5


   ; #Copy_Word_Op at 114:9
   %_source12 = getelementptr i64, i64* %_Param_Area, i64 0
   %_source_val12 = load i64, i64* %_source12
   %_loc_10 = bitcast i64 %_source_val12 to i64

   ; #Copy_Word_Op at 114:31
   %_source13 = getelementptr i64, i64* %_Param_Area, i64 0
   %_source_val13 = load i64, i64* %_source13
   %_loc_13 = bitcast i64 %_source_val13 to i64

   ; #Copy_Word_Op at 114:38
   %_reg14_1 = inttoptr i64 %_loc_13 to i64*
   %_source14 = getelementptr i64, i64* %_reg14_1, i64 1
   %_source_val14 = load i64, i64* %_source14
   %_loc_12 = bitcast i64 %_source_val14 to i64

   ; #Call_Op at 114:25
   %_cur_td15 = bitcast i64* %_Static_Link to %struct.TD*
   %_nested_types_arr_ptr15 = getelementptr %struct.TD, %struct.TD* %_cur_td15, i32 0, i32 35
   %_nested_types_arr15 = load %struct.TD**, %struct.TD*** %_nested_types_arr_ptr15
   %_nested_td_ptr_ptr15 = getelementptr %struct.TD*, %struct.TD** %_nested_types_arr15, i32 0
   %_nested_td15 = load %struct.TD*, %struct.TD** %_nested_td_ptr_ptr15
   %_call15_Static_Link = bitcast %struct.TD* %_nested_td15 to i64*
   %_new_result15_0 = call i64 @"PSL.Core.AA_Tree.Count"(i64 %_loc_12, i64* %_Context, i64* %_call15_Static_Link)
   %_loc_9 = bitcast i64 %_new_result15_0 to i64

   ; #Copy_Word_Op at 114:16
   %_source_val16 = bitcast i64 %_loc_9 to i64
   %_reg16_2 = inttoptr i64 %_loc_10 to i64*
   %_dest16 = getelementptr i64, i64* %_reg16_2, i64 2
   store i64 %_source_val16, i64* %_dest16

   ; #Check_Not_Null_Op at 115:5
   %_arg_ptr17 = getelementptr i64, i64* %_Param_Area, i64 0
   %_arg17 = load i64, i64* %_arg_ptr17
   %_val_no_reg17 = and i64 %_arg17, -4294967295
   %_is_null17 = icmp eq i64 %_val_no_reg17, -144115188075855871
   br i1 %_is_null17, label %_fail17, label %_lbl18
   _fail17:
   %_str_ptr_ptr17 = load i64*, i64** @$Strings
   %_str_ptr17 = getelementptr i64, i64* %_str_ptr_ptr17, i64 6
   %_assert_str17 = load i64, i64* %_str_ptr17
   store i64 %_assert_str17, i64* %_print_param17
   call void @_psc_runtime_message(i64* %_Context, i64* %_print_param17, i64* null)

   br label %_lbl18

_lbl18:
   ; #Return_Op at 115:5
   %_result_reg18 = load i64, i64* %_Param_Area
   ret i64 %_result_reg18

}

define i64 @"PSL.Containers.Ordered_Set.$|$.2"(i64 %_formal_param_1, i64 %_formal_param_2, i64* %_Context, i64* %_Static_Link, i64 %_inited_output) {
   %_Local_Area = alloca i64, i64 4
   %_sl = ptrtoint i64* %_Static_Link to i64
   store i64 %_sl, i64* %_Local_Area

   %_Param_Area = alloca i64
   %_loc_.I6_1 = alloca i64
   %_print_param12 = alloca i64

   store i64 %_inited_output, i64* %_Param_Area
   
   ; #Make_Copy_In_Stg_Rgn_Op at 119:19
   %_desc1 = getelementptr i64, i64* %_Static_Link, i64 0
   %_source1 = bitcast i64 %_formal_param_1 to i64
   %_existing_ptr1 = getelementptr i64, i64* %_Param_Area, i64 0
   %_existing_obj1 = load i64, i64* %_existing_ptr1
   %_result1 = call i64 @_psc_copy_object(i64* %_Context, i64* %_desc1, i64 %_source1, i64 %_existing_obj1)
   %_loc_1 = bitcast i64 %_result1 to i64

   ; #Assign_Word_Op at 119:9
   %_desc2 = getelementptr i64, i64* %_Static_Link, i64 0
   %_source2 = bitcast i64 %_loc_1 to i64
   %_dest_ptr2 = getelementptr i64, i64* %_Param_Area, i64 0
   call void @_psc_assign_word(i64* %_Context, i64* %_desc2, i64* %_dest_ptr2, i64 %_source2)

   ; #Copy_Word_Op at 120:9
   %_source3 = getelementptr i64, i64* %_Param_Area, i64 0
   %_source_val3 = load i64, i64* %_source3
   %_loc_4 = bitcast i64 %_source_val3 to i64

   ; #Store_Address_Op at 120:16
   %_reg4_1 = inttoptr i64 %_loc_4 to i64*
   %_addr4 = getelementptr i64, i64* %_reg4_1, i64 1
   %_loc_2 = bitcast i64* %_addr4 to i64*

   ; #Copy_Word_Op at 120:25
   %_source_val5 = bitcast i64 %_formal_param_2 to i64
   %_loc_3 = bitcast i64 %_source_val5 to i64

   ; #Call_Op at 120:16
   ; inlining call on Insert
   %_cur_td6 = bitcast i64* %_Static_Link to %struct.TD*
   %_nested_types_arr_ptr6 = getelementptr %struct.TD, %struct.TD* %_cur_td6, i32 0, i32 35
   %_nested_types_arr6 = load %struct.TD**, %struct.TD*** %_nested_types_arr_ptr6
   %_nested_td_ptr_ptr6 = getelementptr %struct.TD*, %struct.TD** %_nested_types_arr6, i32 0
   %_nested_td6 = load %struct.TD*, %struct.TD** %_nested_td_ptr_ptr6
   %_call6_Static_Link = bitcast %struct.TD* %_nested_td6 to i64*

   ; #Declare_Obj_Op at 281:13

   ; #Copy_Address_Op at 281:24
   %_source_val.I6.2 = bitcast i64* %_loc_2 to i64*
   %_loc_.I6_2 = bitcast i64* %_source_val.I6.2 to i64*

   ; #Store_Null_Of_Same_Stg_Rgn_Op at 281:24
   %_cur_td.I6.3 = bitcast i64* %_call6_Static_Link to %struct.TD*
   %_param_arr_ptr.I6.3 = getelementptr %struct.TD, %struct.TD* %_cur_td.I6.3, i32 0, i32 26
   %_param_arr.I6.3 = load %struct.ParamInfo*, %struct.ParamInfo** %_param_arr_ptr.I6.3
   %_formal_td_ptr_ptr.I6.3 = getelementptr %struct.ParamInfo, %struct.ParamInfo* %_param_arr.I6.3, i32 0, i32 1, i32 0
   %_formal_td.I6.3 = load %struct.TD*, %struct.TD** %_formal_td_ptr_ptr.I6.3
   %_desc.I6.3 = bitcast %struct.TD* %_formal_td.I6.3 to i64*
   %_reg.I6.3_1 = bitcast i64* %_loc_.I6_2 to i64*
   %_source_ptr.I6.3 = getelementptr i64, i64* %_reg.I6.3_1, i64 0
   %_source.I6.3 = load i64, i64* %_source_ptr.I6.3
   %_td.I6.3 = bitcast i64* %_desc.I6.3 to %struct.TD*
   %_is_small_ptr.I6.3 = getelementptr %struct.TD, %struct.TD* %_td.I6.3, i32 0, i32 13
   %_is_small.I6.3 = load i8, i8* %_is_small_ptr.I6.3
   %_is_small_bool.I6.3 = trunc i8 %_is_small.I6.3 to i1
   br i1 %_is_small_bool.I6.3, label %_small_label.I6.3, label %_large_label.I6.3
   _small_label.I6.3:
   %_small_null_ptr.I6.3 = getelementptr %struct.TD, %struct.TD* %_td.I6.3, i32 0, i32 17
   %_small_null.I6.3 = load i64, i64* %_small_null_ptr.I6.3
   br label %_join_small_and_large.I6.3
   _large_label.I6.3:
   %_high_and_low_bits.I6.3 = and i64 %_source.I6.3, or (i64 shl (i64 1, i64 63), i64 1)
   %_is_special_bit.I6.3 = icmp eq i64 %_high_and_low_bits.I6.3, or (i64 shl (i64 1, i64 63), i64 1)
   br i1 %_is_special_bit.I6.3, label %_is_special_label.I6.3, label %_not_special_label.I6.3
   _is_special_label.I6.3:
   %_spcl_rgn_times2_.I6.3 = and i64 %_source.I6.3, 4294967295
   br label %_last_large_label.I6.3
   _not_special_label.I6.3:
   %_header_ptr.I6.3 = inttoptr i64 %_source.I6.3 to i64*
   %_hdr_of_src.I6.3 = load i64, i64* %_header_ptr.I6.3
   %_region_bits.I6.3 = and i64 %_hdr_of_src.I6.3, 4294901760
   %_normal_rgn_times2_.I6.3 = lshr i64 %_region_bits.I6.3, 15
   br label %_last_large_label.I6.3
   _last_large_label.I6.3:
   %_rgn_times2_.I6.3 = phi i64 [%_spcl_rgn_times2_.I6.3, %_is_special_label.I6.3], [%_normal_rgn_times2_.I6.3, %_not_special_label.I6.3]
   %_large_null.I6.3 = or i64 -144115188075855871, %_rgn_times2_.I6.3
   br label %_join_small_and_large.I6.3
   _join_small_and_large.I6.3:
   %_null.I6.3 = phi i64 [%_small_null.I6.3, %_small_label.I6.3],[%_large_null.I6.3, %_last_large_label.I6.3]
   %_dest_ptr.I6.3 = bitcast i64* %_loc_.I6_1 to i64* 
   store i64 %_null.I6.3, i64* %_dest_ptr.I6.3

   ; #Make_Copy_In_Stg_Rgn_Op at 281:29
   %_cur_td.I6.4 = bitcast i64* %_call6_Static_Link to %struct.TD*
   %_param_arr_ptr.I6.4 = getelementptr %struct.TD, %struct.TD* %_cur_td.I6.4, i32 0, i32 26
   %_param_arr.I6.4 = load %struct.ParamInfo*, %struct.ParamInfo** %_param_arr_ptr.I6.4
   %_formal_td_ptr_ptr.I6.4 = getelementptr %struct.ParamInfo, %struct.ParamInfo* %_param_arr.I6.4, i32 0, i32 1, i32 0
   %_formal_td.I6.4 = load %struct.TD*, %struct.TD** %_formal_td_ptr_ptr.I6.4
   %_desc.I6.4 = bitcast %struct.TD* %_formal_td.I6.4 to i64*
   %_source.I6.4 = bitcast i64 %_loc_3 to i64
   %_existing_ptr.I6.4 = bitcast i64* %_loc_.I6_1 to i64* 
   %_existing_obj.I6.4 = load i64, i64* %_existing_ptr.I6.4
   %_result.I6.4 = call i64 @_psc_copy_object(i64* %_Context, i64* %_desc.I6.4, i64 %_source.I6.4, i64 %_existing_obj.I6.4)
   %_dest_ptr.I6.4 = bitcast i64* %_loc_.I6_1 to i64* 
   store i64 %_result.I6.4, i64* %_dest_ptr.I6.4

   ; #Copy_Address_Op at 282:9
   %_source_val.I6.5 = bitcast i64* %_loc_2 to i64*
   %_loc_.I6_5 = bitcast i64* %_source_val.I6.5 to i64*

   ; #Store_Address_Op at 282:9
   %_reg.I6.6_1 = bitcast i64* %_loc_.I6_5 to i64*
   %_addr.I6.6 = getelementptr i64, i64* %_reg.I6.6_1, i64 0
   %_loc_.I6_3 = bitcast i64* %_addr.I6.6 to i64*

   ; #Store_Address_Op at 282:9
   %_addr.I6.7 = bitcast i64* %_loc_.I6_1 to i64* 
   %_loc_.I6_4 = bitcast i64* %_addr.I6.7 to i64*

   ; #Call_Op at 282:9
   %_call.I6.8_Static_Link = getelementptr i64, i64* %_call6_Static_Link, i64 0
   call void @"PSL.Core.AA_Tree.$<|=$"(i64* %_loc_.I6_3, i64* %_loc_.I6_4, i64* %_Context, i64* %_call.I6.8_Static_Link)

   ; #Return_Op at 283:5


   ; #Copy_Word_Op at 121:9
   %_source7 = getelementptr i64, i64* %_Param_Area, i64 0
   %_source_val7 = load i64, i64* %_source7
   %_loc_6 = bitcast i64 %_source_val7 to i64

   ; #Copy_Word_Op at 121:31
   %_source8 = getelementptr i64, i64* %_Param_Area, i64 0
   %_source_val8 = load i64, i64* %_source8
   %_loc_9 = bitcast i64 %_source_val8 to i64

   ; #Copy_Word_Op at 121:38
   %_reg9_1 = inttoptr i64 %_loc_9 to i64*
   %_source9 = getelementptr i64, i64* %_reg9_1, i64 1
   %_source_val9 = load i64, i64* %_source9
   %_loc_8 = bitcast i64 %_source_val9 to i64

   ; #Call_Op at 121:25
   %_cur_td10 = bitcast i64* %_Static_Link to %struct.TD*
   %_nested_types_arr_ptr10 = getelementptr %struct.TD, %struct.TD* %_cur_td10, i32 0, i32 35
   %_nested_types_arr10 = load %struct.TD**, %struct.TD*** %_nested_types_arr_ptr10
   %_nested_td_ptr_ptr10 = getelementptr %struct.TD*, %struct.TD** %_nested_types_arr10, i32 0
   %_nested_td10 = load %struct.TD*, %struct.TD** %_nested_td_ptr_ptr10
   %_call10_Static_Link = bitcast %struct.TD* %_nested_td10 to i64*
   %_new_result10_0 = call i64 @"PSL.Core.AA_Tree.Count"(i64 %_loc_8, i64* %_Context, i64* %_call10_Static_Link)
   %_loc_5 = bitcast i64 %_new_result10_0 to i64

   ; #Copy_Word_Op at 121:16
   %_source_val11 = bitcast i64 %_loc_5 to i64
   %_reg11_2 = inttoptr i64 %_loc_6 to i64*
   %_dest11 = getelementptr i64, i64* %_reg11_2, i64 2
   store i64 %_source_val11, i64* %_dest11

   ; #Check_Not_Null_Op at 122:5
   %_arg_ptr12 = getelementptr i64, i64* %_Param_Area, i64 0
   %_arg12 = load i64, i64* %_arg_ptr12
   %_val_no_reg12 = and i64 %_arg12, -4294967295
   %_is_null12 = icmp eq i64 %_val_no_reg12, -144115188075855871
   br i1 %_is_null12, label %_fail12, label %_lbl13
   _fail12:
   %_str_ptr_ptr12 = load i64*, i64** @$Strings
   %_str_ptr12 = getelementptr i64, i64* %_str_ptr_ptr12, i64 8
   %_assert_str12 = load i64, i64* %_str_ptr12
   store i64 %_assert_str12, i64* %_print_param12
   call void @_psc_runtime_message(i64* %_Context, i64* %_print_param12, i64* null)

   br label %_lbl13

_lbl13:
   ; #Return_Op at 122:5
   %_result_reg13 = load i64, i64* %_Param_Area
   ret i64 %_result_reg13

}

define i64 @"PSL.Containers.Ordered_Set.$|$.3"(i64 %_formal_param_1, i64 %_formal_param_2, i64* %_Context, i64* %_Static_Link, i64 %_inited_output) {
   %_Local_Area = alloca i64, i64 4
   %_sl = ptrtoint i64* %_Static_Link to i64
   store i64 %_sl, i64* %_Local_Area

   %_Param_Area = alloca i64
   %_output.I4 = alloca i64
   %_print_param.I4.12 = alloca i64
   %_print_param6 = alloca i64

   store i64 %_inited_output, i64* %_Param_Area
   
   ; #Store_Null_Of_Same_Stg_Rgn_Op at 126:22
   %_source_ptr1 = getelementptr i64, i64* %_Param_Area, i64 0
   %_source1 = load i64, i64* %_source_ptr1
   %_high_and_low_bits1 = and i64 %_source1, or (i64 shl (i64 1, i64 63), i64 1)
   %_is_special_bit1 = icmp eq i64 %_high_and_low_bits1, or (i64 shl (i64 1, i64 63), i64 1)
   br i1 %_is_special_bit1, label %_is_special_label1, label %_not_special_label1
   _is_special_label1:
   %_spcl_rgn_times2_1 = and i64 %_source1, 4294967295
   br label %_join_label1
   _not_special_label1:
   %_header_ptr1 = inttoptr i64 %_source1 to i64*
   %_hdr_of_src1 = load i64, i64* %_header_ptr1
   %_region_bits1 = and i64 %_hdr_of_src1, 4294901760
   %_normal_rgn_times2_1 = lshr i64 %_region_bits1, 15
   br label %_join_label1
   _join_label1:
   %_rgn_times2_1 = phi i64 [%_spcl_rgn_times2_1, %_is_special_label1], [%_normal_rgn_times2_1, %_not_special_label1]
   %_null1 = or i64 -144115188075855871, %_rgn_times2_1
   %_loc_2 = bitcast i64 %_null1 to i64

   ; #Copy_Word_Op at 126:16
   %_source_val2 = bitcast i64 %_formal_param_2 to i64
   %_loc_3 = bitcast i64 %_source_val2 to i64

   ; #Copy_Word_Op at 126:24
   %_source_val3 = bitcast i64 %_formal_param_1 to i64
   %_loc_4 = bitcast i64 %_source_val3 to i64

   ; #Call_Op at 126:22
   ; inlining call on "|"
   store i64 %_loc_2, i64* %_output.I4
   %_call4_Static_Link = getelementptr i64, i64* %_Static_Link, i64 0

   ; #Make_Copy_In_Stg_Rgn_Op at 119:19
   %_desc.I4.1 = getelementptr i64, i64* %_call4_Static_Link, i64 0
   %_source.I4.1 = bitcast i64 %_loc_3 to i64
   %_existing_ptr.I4.1 = bitcast i64* %_output.I4 to i64*
   %_existing_obj.I4.1 = load i64, i64* %_existing_ptr.I4.1
   %_result.I4.1 = call i64 @_psc_copy_object(i64* %_Context, i64* %_desc.I4.1, i64 %_source.I4.1, i64 %_existing_obj.I4.1)
   %_loc_.I4_1 = bitcast i64 %_result.I4.1 to i64

   ; #Assign_Word_Op at 119:9
   %_desc.I4.2 = getelementptr i64, i64* %_call4_Static_Link, i64 0
   %_source.I4.2 = bitcast i64 %_loc_.I4_1 to i64
   %_dest_ptr.I4.2 = bitcast i64* %_output.I4 to i64*
   call void @_psc_assign_word(i64* %_Context, i64* %_desc.I4.2, i64* %_dest_ptr.I4.2, i64 %_source.I4.2)

   ; #Copy_Word_Op at 120:9
   %_source.I4.3 = bitcast i64* %_output.I4 to i64*
   %_source_val.I4.3 = load i64, i64* %_source.I4.3
   %_loc_.I4_4 = bitcast i64 %_source_val.I4.3 to i64

   ; #Store_Address_Op at 120:16
   %_reg.I4.4_1 = inttoptr i64 %_loc_.I4_4 to i64*
   %_addr.I4.4 = getelementptr i64, i64* %_reg.I4.4_1, i64 1
   %_loc_.I4_2 = bitcast i64* %_addr.I4.4 to i64*

   ; #Copy_Word_Op at 120:25
   %_source_val.I4.5 = bitcast i64 %_loc_4 to i64
   %_loc_.I4_3 = bitcast i64 %_source_val.I4.5 to i64

   ; #Call_Op at 120:16
   %_cur_td.I4.6 = bitcast i64* %_call4_Static_Link to %struct.TD*
   %_nested_types_arr_ptr.I4.6 = getelementptr %struct.TD, %struct.TD* %_cur_td.I4.6, i32 0, i32 35
   %_nested_types_arr.I4.6 = load %struct.TD**, %struct.TD*** %_nested_types_arr_ptr.I4.6
   %_nested_td_ptr_ptr.I4.6 = getelementptr %struct.TD*, %struct.TD** %_nested_types_arr.I4.6, i32 0
   %_nested_td.I4.6 = load %struct.TD*, %struct.TD** %_nested_td_ptr_ptr.I4.6
   %_call.I4.6_Static_Link = bitcast %struct.TD* %_nested_td.I4.6 to i64*
   call void @"PSL.Core.AA_Tree.Insert"(i64* %_loc_.I4_2, i64 %_loc_.I4_3, i64* %_Context, i64* %_call.I4.6_Static_Link)

   ; #Copy_Word_Op at 121:9
   %_source.I4.7 = bitcast i64* %_output.I4 to i64*
   %_source_val.I4.7 = load i64, i64* %_source.I4.7
   %_loc_.I4_6 = bitcast i64 %_source_val.I4.7 to i64

   ; #Copy_Word_Op at 121:31
   %_source.I4.8 = bitcast i64* %_output.I4 to i64*
   %_source_val.I4.8 = load i64, i64* %_source.I4.8
   %_loc_.I4_9 = bitcast i64 %_source_val.I4.8 to i64

   ; #Copy_Word_Op at 121:38
   %_reg.I4.9_1 = inttoptr i64 %_loc_.I4_9 to i64*
   %_source.I4.9 = getelementptr i64, i64* %_reg.I4.9_1, i64 1
   %_source_val.I4.9 = load i64, i64* %_source.I4.9
   %_loc_.I4_8 = bitcast i64 %_source_val.I4.9 to i64

   ; #Call_Op at 121:25
   %_cur_td.I4.10 = bitcast i64* %_call4_Static_Link to %struct.TD*
   %_nested_types_arr_ptr.I4.10 = getelementptr %struct.TD, %struct.TD* %_cur_td.I4.10, i32 0, i32 35
   %_nested_types_arr.I4.10 = load %struct.TD**, %struct.TD*** %_nested_types_arr_ptr.I4.10
   %_nested_td_ptr_ptr.I4.10 = getelementptr %struct.TD*, %struct.TD** %_nested_types_arr.I4.10, i32 0
   %_nested_td.I4.10 = load %struct.TD*, %struct.TD** %_nested_td_ptr_ptr.I4.10
   %_call.I4.10_Static_Link = bitcast %struct.TD* %_nested_td.I4.10 to i64*
   %_new_result.I4.10_0 = call i64 @"PSL.Core.AA_Tree.Count"(i64 %_loc_.I4_8, i64* %_Context, i64* %_call.I4.10_Static_Link)
   %_loc_.I4_5 = bitcast i64 %_new_result.I4.10_0 to i64

   ; #Copy_Word_Op at 121:16
   %_source_val.I4.11 = bitcast i64 %_loc_.I4_5 to i64
   %_reg.I4.11_2 = inttoptr i64 %_loc_.I4_6 to i64*
   %_dest.I4.11 = getelementptr i64, i64* %_reg.I4.11_2, i64 2
   store i64 %_source_val.I4.11, i64* %_dest.I4.11

   ; #Check_Not_Null_Op at 122:5
   %_arg_ptr.I4.12 = bitcast i64* %_output.I4 to i64*
   %_arg.I4.12 = load i64, i64* %_arg_ptr.I4.12
   %_val_no_reg.I4.12 = and i64 %_arg.I4.12, -4294967295
   %_is_null.I4.12 = icmp eq i64 %_val_no_reg.I4.12, -144115188075855871
   br i1 %_is_null.I4.12, label %_fail.I4.12, label %_lbl.I4_13
   _fail.I4.12:
   %_str_ptr_ptr.I4.12 = load i64*, i64** @$Strings
   %_str_ptr.I4.12 = getelementptr i64, i64* %_str_ptr_ptr.I4.12, i64 8
   %_assert_str.I4.12 = load i64, i64* %_str_ptr.I4.12
   store i64 %_assert_str.I4.12, i64* %_print_param.I4.12
   call void @_psc_runtime_message(i64* %_Context, i64* %_print_param.I4.12, i64* null)

   br label %_lbl.I4_13

_lbl.I4_13:
   ; #Return_Op at 122:5

   %_new_result4 = load i64, i64* %_output.I4
   %_loc_1 = bitcast i64 %_new_result4 to i64

   ; #Copy_Word_Op at 126:9
   %_source_val5 = bitcast i64 %_loc_1 to i64
   %_dest5 = getelementptr i64, i64* %_Param_Area, i64 0
   store i64 %_source_val5, i64* %_dest5

   ; #Check_Not_Null_Op at 126:9
   %_arg_ptr6 = getelementptr i64, i64* %_Param_Area, i64 0
   %_arg6 = load i64, i64* %_arg_ptr6
   %_val_no_reg6 = and i64 %_arg6, -4294967295
   %_is_null6 = icmp eq i64 %_val_no_reg6, -144115188075855871
   br i1 %_is_null6, label %_fail6, label %_lbl7
   _fail6:
   %_str_ptr_ptr6 = load i64*, i64** @$Strings
   %_str_ptr6 = getelementptr i64, i64* %_str_ptr_ptr6, i64 10
   %_assert_str6 = load i64, i64* %_str_ptr6
   store i64 %_assert_str6, i64* %_print_param6
   call void @_psc_runtime_message(i64* %_Context, i64* %_print_param6, i64* null)

   br label %_lbl7

_lbl7:
   ; #Return_Op at 126:9
   %_result_reg7 = load i64, i64* %_Param_Area
   ret i64 %_result_reg7

}

define i64 @"PSL.Containers.Ordered_Set.$|$.4"(i64 %_formal_param_1, i64 %_formal_param_2, i64* %_Context, i64* %_Static_Link, i64 %_inited_output) {
   %_Local_Area = alloca i64, i64 4
   %_sl = ptrtoint i64* %_Static_Link to i64
   store i64 %_sl, i64* %_Local_Area

   %_Param_Area = alloca i64
   %_loc_.I5_1 = alloca i64
   %_print_param6 = alloca i64

   store i64 %_inited_output, i64* %_Param_Area
   %_pa = ptrtoint i64* %_Param_Area to i64
   %_store_pa = getelementptr i64, i64* %_Local_Area, i64 1
   store i64 %_pa, i64* %_store_pa
   
   ; #Make_Copy_In_Stg_Rgn_Op at 131:19
   %_desc1 = getelementptr i64, i64* %_Static_Link, i64 0
   %_source1 = bitcast i64 %_formal_param_1 to i64
   %_existing_ptr1 = getelementptr i64, i64* %_Param_Area, i64 0
   %_existing_obj1 = load i64, i64* %_existing_ptr1
   %_result1 = call i64 @_psc_copy_object(i64* %_Context, i64* %_desc1, i64 %_source1, i64 %_existing_obj1)
   %_loc_1 = bitcast i64 %_result1 to i64

   ; #Assign_Word_Op at 131:9
   %_desc2 = getelementptr i64, i64* %_Static_Link, i64 0
   %_source2 = bitcast i64 %_loc_1 to i64
   %_dest_ptr2 = getelementptr i64, i64* %_Param_Area, i64 0
   call void @_psc_assign_word(i64* %_Context, i64* %_desc2, i64* %_dest_ptr2, i64 %_source2)

   ; #Store_Address_Op at 132:9
   %_addr3 = getelementptr i64, i64* %_Param_Area, i64 0
   %_loc_2 = bitcast i64* %_addr3 to i64*

   ; #Copy_Word_Op at 132:19
   %_source_val4 = bitcast i64 %_formal_param_2 to i64
   %_loc_3 = bitcast i64 %_source_val4 to i64

   ; #Call_Op at 132:9
   ; inlining call on "|="
   %_call5_Static_Link = getelementptr i64, i64* %_Static_Link, i64 0

   ; #Declare_Obj_Op at 173:13

   ; #Copy_Address_Op at 173:28
   %_source_val.I5.2 = bitcast i64* %_loc_2 to i64*
   %_loc_.I5_2 = bitcast i64* %_source_val.I5.2 to i64*

   ; #Store_Null_Of_Same_Stg_Rgn_Op at 173:28
   %_reg.I5.3_1 = bitcast i64* %_loc_.I5_2 to i64*
   %_source_ptr.I5.3 = getelementptr i64, i64* %_reg.I5.3_1, i64 0
   %_source.I5.3 = load i64, i64* %_source_ptr.I5.3
   %_high_and_low_bits.I5.3 = and i64 %_source.I5.3, or (i64 shl (i64 1, i64 63), i64 1)
   %_is_special_bit.I5.3 = icmp eq i64 %_high_and_low_bits.I5.3, or (i64 shl (i64 1, i64 63), i64 1)
   br i1 %_is_special_bit.I5.3, label %_is_special_label.I5.3, label %_not_special_label.I5.3
   _is_special_label.I5.3:
   %_spcl_rgn_times2_.I5.3 = and i64 %_source.I5.3, 4294967295
   br label %_join_label.I5.3
   _not_special_label.I5.3:
   %_header_ptr.I5.3 = inttoptr i64 %_source.I5.3 to i64*
   %_hdr_of_src.I5.3 = load i64, i64* %_header_ptr.I5.3
   %_region_bits.I5.3 = and i64 %_hdr_of_src.I5.3, 4294901760
   %_normal_rgn_times2_.I5.3 = lshr i64 %_region_bits.I5.3, 15
   br label %_join_label.I5.3
   _join_label.I5.3:
   %_rgn_times2_.I5.3 = phi i64 [%_spcl_rgn_times2_.I5.3, %_is_special_label.I5.3], [%_normal_rgn_times2_.I5.3, %_not_special_label.I5.3]
   %_null.I5.3 = or i64 -144115188075855871, %_rgn_times2_.I5.3
   %_dest_ptr.I5.3 = bitcast i64* %_loc_.I5_1 to i64* 
   store i64 %_null.I5.3, i64* %_dest_ptr.I5.3

   ; #Make_Copy_In_Stg_Rgn_Op at 173:36
   %_desc.I5.4 = getelementptr i64, i64* %_call5_Static_Link, i64 0
   %_source.I5.4 = bitcast i64 %_loc_3 to i64
   %_existing_ptr.I5.4 = bitcast i64* %_loc_.I5_1 to i64* 
   %_existing_obj.I5.4 = load i64, i64* %_existing_ptr.I5.4
   %_result.I5.4 = call i64 @_psc_copy_object(i64* %_Context, i64* %_desc.I5.4, i64 %_source.I5.4, i64 %_existing_obj.I5.4)
   %_dest_ptr.I5.4 = bitcast i64* %_loc_.I5_1 to i64* 
   store i64 %_result.I5.4, i64* %_dest_ptr.I5.4

   ; #Copy_Address_Op at 174:9
   %_source_val.I5.5 = bitcast i64* %_loc_2 to i64*
   %_loc_.I5_5 = bitcast i64* %_source_val.I5.5 to i64*

   ; #Store_Address_Op at 174:9
   %_reg.I5.6_1 = bitcast i64* %_loc_.I5_5 to i64*
   %_addr.I5.6 = getelementptr i64, i64* %_reg.I5.6_1, i64 0
   %_loc_.I5_3 = bitcast i64* %_addr.I5.6 to i64*

   ; #Store_Address_Op at 174:9
   %_addr.I5.7 = bitcast i64* %_loc_.I5_1 to i64* 
   %_loc_.I5_4 = bitcast i64* %_addr.I5.7 to i64*

   ; #Call_Op at 174:9
   %_call.I5.8_Static_Link = getelementptr i64, i64* %_call5_Static_Link, i64 0
   call void @"PSL.Containers.Ordered_Set.$<|=$.2"(i64* %_loc_.I5_3, i64* %_loc_.I5_4, i64* %_Context, i64* %_call.I5.8_Static_Link)

   ; #Return_Op at 175:5


   ; #Check_Not_Null_Op at 133:5
   %_arg_ptr6 = getelementptr i64, i64* %_Param_Area, i64 0
   %_arg6 = load i64, i64* %_arg_ptr6
   %_val_no_reg6 = and i64 %_arg6, -4294967295
   %_is_null6 = icmp eq i64 %_val_no_reg6, -144115188075855871
   br i1 %_is_null6, label %_fail6, label %_lbl7
   _fail6:
   %_str_ptr_ptr6 = load i64*, i64** @$Strings
   %_str_ptr6 = getelementptr i64, i64* %_str_ptr_ptr6, i64 12
   %_assert_str6 = load i64, i64* %_str_ptr6
   store i64 %_assert_str6, i64* %_print_param6
   call void @_psc_runtime_message(i64* %_Context, i64* %_print_param6, i64* null)

   br label %_lbl7

_lbl7:
   ; #Return_Op at 133:5
   %_result_reg7 = load i64, i64* %_Param_Area
   ret i64 %_result_reg7

}

define void @"PSL.Containers.Ordered_Set.$|=$"(i64* %_formal_param_0, i64 %_formal_param_1, i64* %_Context, i64* %_Static_Link) {
   %_Local_Area = alloca i64, i64 4
   %_sl = ptrtoint i64* %_Static_Link to i64
   store i64 %_sl, i64* %_Local_Area

   %_loc_.I5_1 = alloca i64

   
   ; #Copy_Address_Op at 136:9
   %_source_val1 = bitcast i64* %_formal_param_0 to i64*
   %_loc_4 = bitcast i64* %_source_val1 to i64*

   ; #Copy_Word_Op at 136:9
   %_reg2_1 = bitcast i64* %_loc_4 to i64*
   %_source2 = getelementptr i64, i64* %_reg2_1, i64 0
   %_source_val2 = load i64, i64* %_source2
   %_loc_3 = bitcast i64 %_source_val2 to i64

   ; #Store_Address_Op at 136:14
   %_reg3_1 = inttoptr i64 %_loc_3 to i64*
   %_addr3 = getelementptr i64, i64* %_reg3_1, i64 1
   %_loc_1 = bitcast i64* %_addr3 to i64*

   ; #Copy_Word_Op at 136:23
   %_source_val4 = bitcast i64 %_formal_param_1 to i64
   %_loc_2 = bitcast i64 %_source_val4 to i64

   ; #Call_Op at 136:14
   ; inlining call on Insert
   %_cur_td5 = bitcast i64* %_Static_Link to %struct.TD*
   %_nested_types_arr_ptr5 = getelementptr %struct.TD, %struct.TD* %_cur_td5, i32 0, i32 35
   %_nested_types_arr5 = load %struct.TD**, %struct.TD*** %_nested_types_arr_ptr5
   %_nested_td_ptr_ptr5 = getelementptr %struct.TD*, %struct.TD** %_nested_types_arr5, i32 0
   %_nested_td5 = load %struct.TD*, %struct.TD** %_nested_td_ptr_ptr5
   %_call5_Static_Link = bitcast %struct.TD* %_nested_td5 to i64*

   ; #Declare_Obj_Op at 281:13

   ; #Copy_Address_Op at 281:24
   %_source_val.I5.2 = bitcast i64* %_loc_1 to i64*
   %_loc_.I5_2 = bitcast i64* %_source_val.I5.2 to i64*

   ; #Store_Null_Of_Same_Stg_Rgn_Op at 281:24
   %_cur_td.I5.3 = bitcast i64* %_call5_Static_Link to %struct.TD*
   %_param_arr_ptr.I5.3 = getelementptr %struct.TD, %struct.TD* %_cur_td.I5.3, i32 0, i32 26
   %_param_arr.I5.3 = load %struct.ParamInfo*, %struct.ParamInfo** %_param_arr_ptr.I5.3
   %_formal_td_ptr_ptr.I5.3 = getelementptr %struct.ParamInfo, %struct.ParamInfo* %_param_arr.I5.3, i32 0, i32 1, i32 0
   %_formal_td.I5.3 = load %struct.TD*, %struct.TD** %_formal_td_ptr_ptr.I5.3
   %_desc.I5.3 = bitcast %struct.TD* %_formal_td.I5.3 to i64*
   %_reg.I5.3_1 = bitcast i64* %_loc_.I5_2 to i64*
   %_source_ptr.I5.3 = getelementptr i64, i64* %_reg.I5.3_1, i64 0
   %_source.I5.3 = load i64, i64* %_source_ptr.I5.3
   %_td.I5.3 = bitcast i64* %_desc.I5.3 to %struct.TD*
   %_is_small_ptr.I5.3 = getelementptr %struct.TD, %struct.TD* %_td.I5.3, i32 0, i32 13
   %_is_small.I5.3 = load i8, i8* %_is_small_ptr.I5.3
   %_is_small_bool.I5.3 = trunc i8 %_is_small.I5.3 to i1
   br i1 %_is_small_bool.I5.3, label %_small_label.I5.3, label %_large_label.I5.3
   _small_label.I5.3:
   %_small_null_ptr.I5.3 = getelementptr %struct.TD, %struct.TD* %_td.I5.3, i32 0, i32 17
   %_small_null.I5.3 = load i64, i64* %_small_null_ptr.I5.3
   br label %_join_small_and_large.I5.3
   _large_label.I5.3:
   %_high_and_low_bits.I5.3 = and i64 %_source.I5.3, or (i64 shl (i64 1, i64 63), i64 1)
   %_is_special_bit.I5.3 = icmp eq i64 %_high_and_low_bits.I5.3, or (i64 shl (i64 1, i64 63), i64 1)
   br i1 %_is_special_bit.I5.3, label %_is_special_label.I5.3, label %_not_special_label.I5.3
   _is_special_label.I5.3:
   %_spcl_rgn_times2_.I5.3 = and i64 %_source.I5.3, 4294967295
   br label %_last_large_label.I5.3
   _not_special_label.I5.3:
   %_header_ptr.I5.3 = inttoptr i64 %_source.I5.3 to i64*
   %_hdr_of_src.I5.3 = load i64, i64* %_header_ptr.I5.3
   %_region_bits.I5.3 = and i64 %_hdr_of_src.I5.3, 4294901760
   %_normal_rgn_times2_.I5.3 = lshr i64 %_region_bits.I5.3, 15
   br label %_last_large_label.I5.3
   _last_large_label.I5.3:
   %_rgn_times2_.I5.3 = phi i64 [%_spcl_rgn_times2_.I5.3, %_is_special_label.I5.3], [%_normal_rgn_times2_.I5.3, %_not_special_label.I5.3]
   %_large_null.I5.3 = or i64 -144115188075855871, %_rgn_times2_.I5.3
   br label %_join_small_and_large.I5.3
   _join_small_and_large.I5.3:
   %_null.I5.3 = phi i64 [%_small_null.I5.3, %_small_label.I5.3],[%_large_null.I5.3, %_last_large_label.I5.3]
   %_dest_ptr.I5.3 = bitcast i64* %_loc_.I5_1 to i64* 
   store i64 %_null.I5.3, i64* %_dest_ptr.I5.3

   ; #Make_Copy_In_Stg_Rgn_Op at 281:29
   %_cur_td.I5.4 = bitcast i64* %_call5_Static_Link to %struct.TD*
   %_param_arr_ptr.I5.4 = getelementptr %struct.TD, %struct.TD* %_cur_td.I5.4, i32 0, i32 26
   %_param_arr.I5.4 = load %struct.ParamInfo*, %struct.ParamInfo** %_param_arr_ptr.I5.4
   %_formal_td_ptr_ptr.I5.4 = getelementptr %struct.ParamInfo, %struct.ParamInfo* %_param_arr.I5.4, i32 0, i32 1, i32 0
   %_formal_td.I5.4 = load %struct.TD*, %struct.TD** %_formal_td_ptr_ptr.I5.4
   %_desc.I5.4 = bitcast %struct.TD* %_formal_td.I5.4 to i64*
   %_source.I5.4 = bitcast i64 %_loc_2 to i64
   %_existing_ptr.I5.4 = bitcast i64* %_loc_.I5_1 to i64* 
   %_existing_obj.I5.4 = load i64, i64* %_existing_ptr.I5.4
   %_result.I5.4 = call i64 @_psc_copy_object(i64* %_Context, i64* %_desc.I5.4, i64 %_source.I5.4, i64 %_existing_obj.I5.4)
   %_dest_ptr.I5.4 = bitcast i64* %_loc_.I5_1 to i64* 
   store i64 %_result.I5.4, i64* %_dest_ptr.I5.4

   ; #Copy_Address_Op at 282:9
   %_source_val.I5.5 = bitcast i64* %_loc_1 to i64*
   %_loc_.I5_5 = bitcast i64* %_source_val.I5.5 to i64*

   ; #Store_Address_Op at 282:9
   %_reg.I5.6_1 = bitcast i64* %_loc_.I5_5 to i64*
   %_addr.I5.6 = getelementptr i64, i64* %_reg.I5.6_1, i64 0
   %_loc_.I5_3 = bitcast i64* %_addr.I5.6 to i64*

   ; #Store_Address_Op at 282:9
   %_addr.I5.7 = bitcast i64* %_loc_.I5_1 to i64* 
   %_loc_.I5_4 = bitcast i64* %_addr.I5.7 to i64*

   ; #Call_Op at 282:9
   %_call.I5.8_Static_Link = getelementptr i64, i64* %_call5_Static_Link, i64 0
   call void @"PSL.Core.AA_Tree.$<|=$"(i64* %_loc_.I5_3, i64* %_loc_.I5_4, i64* %_Context, i64* %_call.I5.8_Static_Link)

   ; #Return_Op at 283:5


   ; #Copy_Address_Op at 137:9
   %_source_val6 = bitcast i64* %_formal_param_0 to i64*
   %_loc_7 = bitcast i64* %_source_val6 to i64*

   ; #Copy_Word_Op at 137:9
   %_reg7_1 = bitcast i64* %_loc_7 to i64*
   %_source7 = getelementptr i64, i64* %_reg7_1, i64 0
   %_source_val7 = load i64, i64* %_source7
   %_loc_6 = bitcast i64 %_source_val7 to i64

   ; #Copy_Address_Op at 137:29
   %_source_val8 = bitcast i64* %_formal_param_0 to i64*
   %_loc_11 = bitcast i64* %_source_val8 to i64*

   ; #Copy_Word_Op at 137:29
   %_reg9_1 = bitcast i64* %_loc_11 to i64*
   %_source9 = getelementptr i64, i64* %_reg9_1, i64 0
   %_source_val9 = load i64, i64* %_source9
   %_loc_10 = bitcast i64 %_source_val9 to i64

   ; #Copy_Word_Op at 137:34
   %_reg10_1 = inttoptr i64 %_loc_10 to i64*
   %_source10 = getelementptr i64, i64* %_reg10_1, i64 1
   %_source_val10 = load i64, i64* %_source10
   %_loc_9 = bitcast i64 %_source_val10 to i64

   ; #Call_Op at 137:23
   %_cur_td11 = bitcast i64* %_Static_Link to %struct.TD*
   %_nested_types_arr_ptr11 = getelementptr %struct.TD, %struct.TD* %_cur_td11, i32 0, i32 35
   %_nested_types_arr11 = load %struct.TD**, %struct.TD*** %_nested_types_arr_ptr11
   %_nested_td_ptr_ptr11 = getelementptr %struct.TD*, %struct.TD** %_nested_types_arr11, i32 0
   %_nested_td11 = load %struct.TD*, %struct.TD** %_nested_td_ptr_ptr11
   %_call11_Static_Link = bitcast %struct.TD* %_nested_td11 to i64*
   %_new_result11_0 = call i64 @"PSL.Core.AA_Tree.Count"(i64 %_loc_9, i64* %_Context, i64* %_call11_Static_Link)
   %_loc_5 = bitcast i64 %_new_result11_0 to i64

   ; #Copy_Word_Op at 137:14
   %_source_val12 = bitcast i64 %_loc_5 to i64
   %_reg12_2 = inttoptr i64 %_loc_6 to i64*
   %_dest12 = getelementptr i64, i64* %_reg12_2, i64 2
   store i64 %_source_val12, i64* %_dest12

   ; #Return_Op at 138:5
   ret void

}

define void @"PSL.Containers.Ordered_Set.$<|=$"(i64* %_formal_param_0, i64* %_formal_param_1, i64* %_Context, i64* %_Static_Link) {
   %_Local_Area = alloca i64, i64 4
   %_sl = ptrtoint i64* %_Static_Link to i64
   store i64 %_sl, i64* %_Local_Area


   
   ; #Copy_Address_Op at 143:9
   %_source_val1 = bitcast i64* %_formal_param_0 to i64*
   %_loc_4 = bitcast i64* %_source_val1 to i64*

   ; #Copy_Word_Op at 143:9
   %_reg2_1 = bitcast i64* %_loc_4 to i64*
   %_source2 = getelementptr i64, i64* %_reg2_1, i64 0
   %_source_val2 = load i64, i64* %_source2
   %_loc_3 = bitcast i64 %_source_val2 to i64

   ; #Store_Address_Op at 143:14
   %_reg3_1 = inttoptr i64 %_loc_3 to i64*
   %_addr3 = getelementptr i64, i64* %_reg3_1, i64 1
   %_loc_1 = bitcast i64* %_addr3 to i64*

   ; #Copy_Address_Op at 143:24
   %_source_val4 = bitcast i64* %_formal_param_1 to i64*
   %_loc_5 = bitcast i64* %_source_val4 to i64*

   ; #Store_Address_Op at 143:14
   %_reg5_1 = bitcast i64* %_loc_5 to i64*
   %_addr5 = getelementptr i64, i64* %_reg5_1, i64 0
   %_loc_2 = bitcast i64* %_addr5 to i64*

   ; #Call_Op at 143:14
   %_cur_td6 = bitcast i64* %_Static_Link to %struct.TD*
   %_nested_types_arr_ptr6 = getelementptr %struct.TD, %struct.TD* %_cur_td6, i32 0, i32 35
   %_nested_types_arr6 = load %struct.TD**, %struct.TD*** %_nested_types_arr_ptr6
   %_nested_td_ptr_ptr6 = getelementptr %struct.TD*, %struct.TD** %_nested_types_arr6, i32 0
   %_nested_td6 = load %struct.TD*, %struct.TD** %_nested_td_ptr_ptr6
   %_call6_Static_Link = bitcast %struct.TD* %_nested_td6 to i64*
   call void @"PSL.Core.AA_Tree.$<|=$"(i64* %_loc_1, i64* %_loc_2, i64* %_Context, i64* %_call6_Static_Link)

   ; #Copy_Address_Op at 144:9
   %_source_val7 = bitcast i64* %_formal_param_0 to i64*
   %_loc_8 = bitcast i64* %_source_val7 to i64*

   ; #Copy_Word_Op at 144:9
   %_reg8_1 = bitcast i64* %_loc_8 to i64*
   %_source8 = getelementptr i64, i64* %_reg8_1, i64 0
   %_source_val8 = load i64, i64* %_source8
   %_loc_7 = bitcast i64 %_source_val8 to i64

   ; #Copy_Address_Op at 144:29
   %_source_val9 = bitcast i64* %_formal_param_0 to i64*
   %_loc_12 = bitcast i64* %_source_val9 to i64*

   ; #Copy_Word_Op at 144:29
   %_reg10_1 = bitcast i64* %_loc_12 to i64*
   %_source10 = getelementptr i64, i64* %_reg10_1, i64 0
   %_source_val10 = load i64, i64* %_source10
   %_loc_11 = bitcast i64 %_source_val10 to i64

   ; #Copy_Word_Op at 144:34
   %_reg11_1 = inttoptr i64 %_loc_11 to i64*
   %_source11 = getelementptr i64, i64* %_reg11_1, i64 1
   %_source_val11 = load i64, i64* %_source11
   %_loc_10 = bitcast i64 %_source_val11 to i64

   ; #Call_Op at 144:23
   %_cur_td12 = bitcast i64* %_Static_Link to %struct.TD*
   %_nested_types_arr_ptr12 = getelementptr %struct.TD, %struct.TD* %_cur_td12, i32 0, i32 35
   %_nested_types_arr12 = load %struct.TD**, %struct.TD*** %_nested_types_arr_ptr12
   %_nested_td_ptr_ptr12 = getelementptr %struct.TD*, %struct.TD** %_nested_types_arr12, i32 0
   %_nested_td12 = load %struct.TD*, %struct.TD** %_nested_td_ptr_ptr12
   %_call12_Static_Link = bitcast %struct.TD* %_nested_td12 to i64*
   %_new_result12_0 = call i64 @"PSL.Core.AA_Tree.Count"(i64 %_loc_10, i64* %_Context, i64* %_call12_Static_Link)
   %_loc_6 = bitcast i64 %_new_result12_0 to i64

   ; #Copy_Word_Op at 144:14
   %_source_val13 = bitcast i64 %_loc_6 to i64
   %_reg13_2 = inttoptr i64 %_loc_7 to i64*
   %_dest13 = getelementptr i64, i64* %_reg13_2, i64 2
   store i64 %_source_val13, i64* %_dest13

   ; #Return_Op at 145:5
   ret void

}

define void @"PSL.Containers.Ordered_Set.$<|=$.2"(i64* %_formal_param_0, i64* %_formal_param_1, i64* %_Context, i64* %_Static_Link) {
   %_Local_Area = alloca i64, i64 4
   %_sl = ptrtoint i64* %_Static_Link to i64
   store i64 %_sl, i64* %_Local_Area

   %_loc_24 = alloca i64

   
   ; #Copy_Address_Op at 150:12
   %_source_val1 = bitcast i64* %_formal_param_0 to i64*
   %_loc_9 = bitcast i64* %_source_val1 to i64*

   ; #Copy_Word_Op at 150:12
   %_reg2_1 = bitcast i64* %_loc_9 to i64*
   %_source2 = getelementptr i64, i64* %_reg2_1, i64 0
   %_source_val2 = load i64, i64* %_source2
   %_loc_8 = bitcast i64 %_source_val2 to i64

   ; #Copy_Word_Op at 150:17
   %_reg3_1 = inttoptr i64 %_loc_8 to i64*
   %_source3 = getelementptr i64, i64* %_reg3_1, i64 2
   %_source_val3 = load i64, i64* %_source3
   %_loc_6 = bitcast i64 %_source_val3 to i64

   ; #Store_Int_Lit_Op at 150:26
   %_loc_7 = bitcast i64 0 to i64

   ; #Call_Op at 150:23
   ; =? + to-bool optimization
   %_left5 = bitcast i64 %_loc_6 to i64
   %_right5 = bitcast i64 %_loc_7 to i64
   %_result5 = icmp eq i64 %_left5, %_right5
   br i1 %_result5, label %_lbl9, label %_lbl25

_lbl9:
   ; #Copy_Address_Op at 151:13
   %_source_val9 = bitcast i64* %_formal_param_0 to i64*
   %_loc_12 = bitcast i64* %_source_val9 to i64*

   ; #Copy_Word_Op at 151:13
   %_reg10_1 = bitcast i64* %_loc_12 to i64*
   %_source10 = getelementptr i64, i64* %_reg10_1, i64 0
   %_source_val10 = load i64, i64* %_source10
   %_loc_11 = bitcast i64 %_source_val10 to i64

   ; #Copy_Address_Op at 151:28
   %_source_val11 = bitcast i64* %_formal_param_1 to i64*
   %_loc_14 = bitcast i64* %_source_val11 to i64*

   ; #Copy_Word_Op at 151:28
   %_reg12_1 = bitcast i64* %_loc_14 to i64*
   %_source12 = getelementptr i64, i64* %_reg12_1, i64 0
   %_source_val12 = load i64, i64* %_source12
   %_loc_13 = bitcast i64 %_source_val12 to i64

   ; #Move_Obj_Op at 151:18
   %_reg13_1 = inttoptr i64 %_loc_13 to i64*
   %_source_ptr13 = getelementptr i64, i64* %_reg13_1, i64 1
   %_reg13_2 = inttoptr i64 %_loc_11 to i64*
   %_dest_ptr13 = getelementptr i64, i64* %_reg13_2, i64 1
   %_cur_td13 = bitcast i64* %_Static_Link to %struct.TD*
   %_nested_types_arr_ptr13 = getelementptr %struct.TD, %struct.TD* %_cur_td13, i32 0, i32 35
   %_nested_types_arr13 = load %struct.TD**, %struct.TD*** %_nested_types_arr_ptr13
   %_nested_td_ptr_ptr13 = getelementptr %struct.TD*, %struct.TD** %_nested_types_arr13, i32 0
   %_nested_td13 = load %struct.TD*, %struct.TD** %_nested_td_ptr_ptr13
   %_desc13 = bitcast %struct.TD* %_nested_td13 to i64*
   call void @_psc_move_object(i64* %_Context, i64* %_desc13, i64* %_dest_ptr13, i64* %_source_ptr13)

   ; #Copy_Address_Op at 152:13
   %_source_val14 = bitcast i64* %_formal_param_0 to i64*
   %_loc_17 = bitcast i64* %_source_val14 to i64*

   ; #Copy_Word_Op at 152:13
   %_reg15_1 = bitcast i64* %_loc_17 to i64*
   %_source15 = getelementptr i64, i64* %_reg15_1, i64 0
   %_source_val15 = load i64, i64* %_source15
   %_loc_16 = bitcast i64 %_source_val15 to i64

   ; #Copy_Address_Op at 152:27
   %_source_val16 = bitcast i64* %_formal_param_1 to i64*
   %_loc_19 = bitcast i64* %_source_val16 to i64*

   ; #Copy_Word_Op at 152:27
   %_reg17_1 = bitcast i64* %_loc_19 to i64*
   %_source17 = getelementptr i64, i64* %_reg17_1, i64 0
   %_source_val17 = load i64, i64* %_source17
   %_loc_18 = bitcast i64 %_source_val17 to i64

   ; #Copy_Word_Op at 152:33
   %_reg18_1 = inttoptr i64 %_loc_18 to i64*
   %_source18 = getelementptr i64, i64* %_reg18_1, i64 2
   %_source_val18 = load i64, i64* %_source18
   %_loc_15 = bitcast i64 %_source_val18 to i64

   ; #Copy_Word_Op at 152:18
   %_source_val19 = bitcast i64 %_loc_15 to i64
   %_reg19_2 = inttoptr i64 %_loc_16 to i64*
   %_dest19 = getelementptr i64, i64* %_reg19_2, i64 2
   store i64 %_source_val19, i64* %_dest19

   ; #Copy_Address_Op at 153:13
   %_source_val20 = bitcast i64* %_formal_param_1 to i64*
   %_loc_22 = bitcast i64* %_source_val20 to i64*

   ; #Copy_Word_Op at 153:13
   %_reg21_1 = bitcast i64* %_loc_22 to i64*
   %_source21 = getelementptr i64, i64* %_reg21_1, i64 0
   %_source_val21 = load i64, i64* %_source21
   %_loc_21 = bitcast i64 %_source_val21 to i64

   ; #Store_Int_Lit_Op at 153:28
   %_loc_20 = bitcast i64 0 to i64

   ; #Copy_Word_Op at 153:19
   %_source_val23 = bitcast i64 %_loc_20 to i64
   %_reg23_2 = inttoptr i64 %_loc_21 to i64*
   %_dest23 = getelementptr i64, i64* %_reg23_2, i64 2
   store i64 %_source_val23, i64* %_dest23

   ; #Skip_Op at 156:13
   br label %_lbl51

_lbl25:
   ; #Store_Int_Lit_Op at 156:13
   %_loc_23 = bitcast i64 1 to i64

   ; #If_Op at 156:13
   %_if_source_val26 = bitcast i64 %_loc_23 to i64
   %_if_source_trunc26 = icmp eq i64 %_if_source_val26, 1
   br i1 %_if_source_trunc26, label %_lbl27, label %_lbl51

_lbl27:
   ; #Declare_Obj_Op at 158:21

   ; #Copy_Address_Op at 158:30
   %_source_val28 = bitcast i64* %_formal_param_0 to i64*
   %_loc_25 = bitcast i64* %_source_val28 to i64*

   ; #Store_Null_Of_Same_Stg_Rgn_Op at 158:30
   %_cur_td29 = bitcast i64* %_Static_Link to %struct.TD*
   %_param_arr_ptr29 = getelementptr %struct.TD, %struct.TD* %_cur_td29, i32 0, i32 26
   %_param_arr29 = load %struct.ParamInfo*, %struct.ParamInfo** %_param_arr_ptr29
   %_formal_td_ptr_ptr29 = getelementptr %struct.ParamInfo, %struct.ParamInfo* %_param_arr29, i32 0, i32 1, i32 0
   %_formal_td29 = load %struct.TD*, %struct.TD** %_formal_td_ptr_ptr29
   %_desc29 = bitcast %struct.TD* %_formal_td29 to i64*
   %_reg29_1 = bitcast i64* %_loc_25 to i64*
   %_source_ptr29 = getelementptr i64, i64* %_reg29_1, i64 0
   %_source29 = load i64, i64* %_source_ptr29
   %_td29 = bitcast i64* %_desc29 to %struct.TD*
   %_is_small_ptr29 = getelementptr %struct.TD, %struct.TD* %_td29, i32 0, i32 13
   %_is_small29 = load i8, i8* %_is_small_ptr29
   %_is_small_bool29 = trunc i8 %_is_small29 to i1
   br i1 %_is_small_bool29, label %_small_label29, label %_large_label29
   _small_label29:
   %_small_null_ptr29 = getelementptr %struct.TD, %struct.TD* %_td29, i32 0, i32 17
   %_small_null29 = load i64, i64* %_small_null_ptr29
   br label %_join_small_and_large29
   _large_label29:
   %_high_and_low_bits29 = and i64 %_source29, or (i64 shl (i64 1, i64 63), i64 1)
   %_is_special_bit29 = icmp eq i64 %_high_and_low_bits29, or (i64 shl (i64 1, i64 63), i64 1)
   br i1 %_is_special_bit29, label %_is_special_label29, label %_not_special_label29
   _is_special_label29:
   %_spcl_rgn_times2_29 = and i64 %_source29, 4294967295
   br label %_last_large_label29
   _not_special_label29:
   %_header_ptr29 = inttoptr i64 %_source29 to i64*
   %_hdr_of_src29 = load i64, i64* %_header_ptr29
   %_region_bits29 = and i64 %_hdr_of_src29, 4294901760
   %_normal_rgn_times2_29 = lshr i64 %_region_bits29, 15
   br label %_last_large_label29
   _last_large_label29:
   %_rgn_times2_29 = phi i64 [%_spcl_rgn_times2_29, %_is_special_label29], [%_normal_rgn_times2_29, %_not_special_label29]
   %_large_null29 = or i64 -144115188075855871, %_rgn_times2_29
   br label %_join_small_and_large29
   _join_small_and_large29:
   %_null29 = phi i64 [%_small_null29, %_small_label29],[%_large_null29, %_last_large_label29]
   %_dest_ptr29 = bitcast i64* %_loc_24 to i64* 
   store i64 %_null29, i64* %_dest_ptr29

   ; #Copy_Word_Op at 158:38
   %_source30 = bitcast i64* %_loc_24 to i64* 
   %_source_val30 = load i64, i64* %_source30
   %_loc_26 = bitcast i64 %_source_val30 to i64

   ; #Copy_Address_Op at 158:49
   %_source_val31 = bitcast i64* %_formal_param_1 to i64*
   %_loc_28 = bitcast i64* %_source_val31 to i64*

   ; #Store_Address_Op at 158:38
   %_reg32_1 = bitcast i64* %_loc_28 to i64*
   %_addr32 = getelementptr i64, i64* %_reg32_1, i64 0
   %_loc_27 = bitcast i64* %_addr32 to i64*

   ; #Call_Op at 158:38
   %_call33_Static_Link = getelementptr i64, i64* %_Static_Link, i64 0
   %_new_result33_0 = call i64 @"PSL.Containers.Ordered_Set.Remove_Any"(i64* %_loc_27, i64* %_Context, i64* %_call33_Static_Link, i64 %_loc_26)
   %_result_addr33_0 = bitcast i64* %_loc_24 to i64* 
   store i64 %_new_result33_0, i64* %_result_addr33_0

   ; #Copy_Word_Op at 160:20
   %_source34 = bitcast i64* %_loc_24 to i64* 
   %_source_val34 = load i64, i64* %_source34
   %_loc_30 = bitcast i64 %_source_val34 to i64

   ; #Is_Null_Op at 160:20
   %_arg35 = bitcast i64 %_loc_30 to i64
   %_cur_td35 = bitcast i64* %_Static_Link to %struct.TD*
   %_param_arr_ptr35 = getelementptr %struct.TD, %struct.TD* %_cur_td35, i32 0, i32 26
   %_param_arr35 = load %struct.ParamInfo*, %struct.ParamInfo** %_param_arr_ptr35
   %_formal_td_ptr_ptr35 = getelementptr %struct.ParamInfo, %struct.ParamInfo* %_param_arr35, i32 0, i32 1, i32 0
   %_formal_td35 = load %struct.TD*, %struct.TD** %_formal_td_ptr_ptr35
   %_desc35 = bitcast %struct.TD* %_formal_td35 to i64*
   %_td35 = bitcast i64* %_desc35 to %struct.TD*
   %_is_small_ptr35 = getelementptr %struct.TD, %struct.TD* %_td35, i32 0, i32 13
   %_is_small35 = load i8, i8* %_is_small_ptr35
   %_is_small_bool35 = trunc i8 %_is_small35 to i1
   br i1 %_is_small_bool35, label %_is_small_lbl35, label %_is_large_lbl35
   _is_small_lbl35:
   %_small_null_ptr35 = getelementptr %struct.TD, %struct.TD* %_td35, i32 0, i32 17
   %_small_null35 = load i64, i64* %_small_null_ptr35
   %_small_result35 = icmp eq i64 %_arg35, %_small_null35
   br label %_join35
   _is_large_lbl35:
   %_val_no_reg35 = and i64 %_arg35, -4294967295
   %_large_result35 = icmp eq i64 %_val_no_reg35, -144115188075855871
   br label %_join35
   _join35:
   %_result_bit35 = phi i1 [%_small_result35, %_is_small_lbl35], [%_large_result35, %_is_large_lbl35]
   %_result_ext35 = zext i1 %_result_bit35 to i64
   %_loc_29 = bitcast i64 %_result_ext35 to i64

   ; #If_Op at 160:20
   %_if_source_val36 = bitcast i64 %_loc_29 to i64
   %_if_source_trunc36 = icmp eq i64 %_if_source_val36, 1
   br i1 %_if_source_trunc36, label %_lbl37, label %_lbl45

_lbl37:
   ; #Copy_Address_Op at 161:21
   %_source_val37 = bitcast i64* %_formal_param_0 to i64*
   %_loc_33 = bitcast i64* %_source_val37 to i64*

   ; #Copy_Word_Op at 161:21
   %_reg38_1 = bitcast i64* %_loc_33 to i64*
   %_source38 = getelementptr i64, i64* %_reg38_1, i64 0
   %_source_val38 = load i64, i64* %_source38
   %_loc_32 = bitcast i64 %_source_val38 to i64

   ; #Copy_Address_Op at 161:41
   %_source_val39 = bitcast i64* %_formal_param_0 to i64*
   %_loc_37 = bitcast i64* %_source_val39 to i64*

   ; #Copy_Word_Op at 161:41
   %_reg40_1 = bitcast i64* %_loc_37 to i64*
   %_source40 = getelementptr i64, i64* %_reg40_1, i64 0
   %_source_val40 = load i64, i64* %_source40
   %_loc_36 = bitcast i64 %_source_val40 to i64

   ; #Copy_Word_Op at 161:46
   %_reg41_1 = inttoptr i64 %_loc_36 to i64*
   %_source41 = getelementptr i64, i64* %_reg41_1, i64 1
   %_source_val41 = load i64, i64* %_source41
   %_loc_35 = bitcast i64 %_source_val41 to i64

   ; #Call_Op at 161:35
   %_cur_td42 = bitcast i64* %_Static_Link to %struct.TD*
   %_nested_types_arr_ptr42 = getelementptr %struct.TD, %struct.TD* %_cur_td42, i32 0, i32 35
   %_nested_types_arr42 = load %struct.TD**, %struct.TD*** %_nested_types_arr_ptr42
   %_nested_td_ptr_ptr42 = getelementptr %struct.TD*, %struct.TD** %_nested_types_arr42, i32 0
   %_nested_td42 = load %struct.TD*, %struct.TD** %_nested_td_ptr_ptr42
   %_call42_Static_Link = bitcast %struct.TD* %_nested_td42 to i64*
   %_new_result42_0 = call i64 @"PSL.Core.AA_Tree.Count"(i64 %_loc_35, i64* %_Context, i64* %_call42_Static_Link)
   %_loc_31 = bitcast i64 %_new_result42_0 to i64

   ; #Copy_Word_Op at 161:26
   %_source_val43 = bitcast i64 %_loc_31 to i64
   %_reg43_2 = inttoptr i64 %_loc_32 to i64*
   %_dest43 = getelementptr i64, i64* %_reg43_2, i64 2
   store i64 %_source_val43, i64* %_dest43

   ; #Return_Op at 162:21
   ret void

_lbl45:
   ; #Copy_Address_Op at 165:17
   %_source_val45 = bitcast i64* %_formal_param_0 to i64*
   %_loc_41 = bitcast i64* %_source_val45 to i64*

   ; #Copy_Word_Op at 165:17
   %_reg46_1 = bitcast i64* %_loc_41 to i64*
   %_source46 = getelementptr i64, i64* %_reg46_1, i64 0
   %_source_val46 = load i64, i64* %_source46
   %_loc_40 = bitcast i64 %_source_val46 to i64

   ; #Store_Address_Op at 165:22
   %_reg47_1 = inttoptr i64 %_loc_40 to i64*
   %_addr47 = getelementptr i64, i64* %_reg47_1, i64 1
   %_loc_38 = bitcast i64* %_addr47 to i64*

   ; #Store_Address_Op at 165:22
   %_addr48 = bitcast i64* %_loc_24 to i64* 
   %_loc_39 = bitcast i64* %_addr48 to i64*

   ; #Call_Op at 165:22
   %_cur_td49 = bitcast i64* %_Static_Link to %struct.TD*
   %_nested_types_arr_ptr49 = getelementptr %struct.TD, %struct.TD* %_cur_td49, i32 0, i32 35
   %_nested_types_arr49 = load %struct.TD**, %struct.TD*** %_nested_types_arr_ptr49
   %_nested_td_ptr_ptr49 = getelementptr %struct.TD*, %struct.TD** %_nested_types_arr49, i32 0
   %_nested_td49 = load %struct.TD*, %struct.TD** %_nested_td_ptr_ptr49
   %_call49_Static_Link = bitcast %struct.TD* %_nested_td49 to i64*
   call void @"PSL.Core.AA_Tree.$<|=$"(i64* %_loc_38, i64* %_loc_39, i64* %_Context, i64* %_call49_Static_Link)

   ; #Skip_Op at 156:13
   br label %_lbl25

_lbl51:
   ; #Return_Op at 169:5
   ret void

}

define void @"PSL.Containers.Ordered_Set.$|=$.2"(i64* %_formal_param_0, i64 %_formal_param_1, i64* %_Context, i64* %_Static_Link) {
   %_Local_Area = alloca i64, i64 4
   %_sl = ptrtoint i64* %_Static_Link to i64
   store i64 %_sl, i64* %_Local_Area

   %_loc_1 = alloca i64

   
   ; #Declare_Obj_Op at 173:13

   ; #Copy_Address_Op at 173:28
   %_source_val2 = bitcast i64* %_formal_param_0 to i64*
   %_loc_2 = bitcast i64* %_source_val2 to i64*

   ; #Store_Null_Of_Same_Stg_Rgn_Op at 173:28
   %_reg3_1 = bitcast i64* %_loc_2 to i64*
   %_source_ptr3 = getelementptr i64, i64* %_reg3_1, i64 0
   %_source3 = load i64, i64* %_source_ptr3
   %_high_and_low_bits3 = and i64 %_source3, or (i64 shl (i64 1, i64 63), i64 1)
   %_is_special_bit3 = icmp eq i64 %_high_and_low_bits3, or (i64 shl (i64 1, i64 63), i64 1)
   br i1 %_is_special_bit3, label %_is_special_label3, label %_not_special_label3
   _is_special_label3:
   %_spcl_rgn_times2_3 = and i64 %_source3, 4294967295
   br label %_join_label3
   _not_special_label3:
   %_header_ptr3 = inttoptr i64 %_source3 to i64*
   %_hdr_of_src3 = load i64, i64* %_header_ptr3
   %_region_bits3 = and i64 %_hdr_of_src3, 4294901760
   %_normal_rgn_times2_3 = lshr i64 %_region_bits3, 15
   br label %_join_label3
   _join_label3:
   %_rgn_times2_3 = phi i64 [%_spcl_rgn_times2_3, %_is_special_label3], [%_normal_rgn_times2_3, %_not_special_label3]
   %_null3 = or i64 -144115188075855871, %_rgn_times2_3
   %_dest_ptr3 = bitcast i64* %_loc_1 to i64* 
   store i64 %_null3, i64* %_dest_ptr3

   ; #Make_Copy_In_Stg_Rgn_Op at 173:36
   %_desc4 = getelementptr i64, i64* %_Static_Link, i64 0
   %_source4 = bitcast i64 %_formal_param_1 to i64
   %_existing_ptr4 = bitcast i64* %_loc_1 to i64* 
   %_existing_obj4 = load i64, i64* %_existing_ptr4
   %_result4 = call i64 @_psc_copy_object(i64* %_Context, i64* %_desc4, i64 %_source4, i64 %_existing_obj4)
   %_dest_ptr4 = bitcast i64* %_loc_1 to i64* 
   store i64 %_result4, i64* %_dest_ptr4

   ; #Copy_Address_Op at 174:9
   %_source_val5 = bitcast i64* %_formal_param_0 to i64*
   %_loc_5 = bitcast i64* %_source_val5 to i64*

   ; #Store_Address_Op at 174:9
   %_reg6_1 = bitcast i64* %_loc_5 to i64*
   %_addr6 = getelementptr i64, i64* %_reg6_1, i64 0
   %_loc_3 = bitcast i64* %_addr6 to i64*

   ; #Store_Address_Op at 174:9
   %_addr7 = bitcast i64* %_loc_1 to i64* 
   %_loc_4 = bitcast i64* %_addr7 to i64*

   ; #Call_Op at 174:9
   %_call8_Static_Link = getelementptr i64, i64* %_Static_Link, i64 0
   call void @"PSL.Containers.Ordered_Set.$<|=$.2"(i64* %_loc_3, i64* %_loc_4, i64* %_Context, i64* %_call8_Static_Link)

   ; #Return_Op at 175:5
   ret void

}

define i64 @"PSL.Containers.Ordered_Set.$-$"(i64 %_formal_param_1, i64 %_formal_param_2, i64* %_Context, i64* %_Static_Link, i64 %_inited_output) {
   %_Local_Area = alloca i64, i64 4
   %_sl = ptrtoint i64* %_Static_Link to i64
   store i64 %_sl, i64* %_Local_Area

   %_Param_Area = alloca i64
   %_print_param6 = alloca i64

   store i64 %_inited_output, i64* %_Param_Area
   %_pa = ptrtoint i64* %_Param_Area to i64
   %_store_pa = getelementptr i64, i64* %_Local_Area, i64 1
   store i64 %_pa, i64* %_store_pa
   
   ; #Make_Copy_In_Stg_Rgn_Op at 180:19
   %_desc1 = getelementptr i64, i64* %_Static_Link, i64 0
   %_source1 = bitcast i64 %_formal_param_1 to i64
   %_existing_ptr1 = getelementptr i64, i64* %_Param_Area, i64 0
   %_existing_obj1 = load i64, i64* %_existing_ptr1
   %_result1 = call i64 @_psc_copy_object(i64* %_Context, i64* %_desc1, i64 %_source1, i64 %_existing_obj1)
   %_loc_1 = bitcast i64 %_result1 to i64

   ; #Assign_Word_Op at 180:9
   %_desc2 = getelementptr i64, i64* %_Static_Link, i64 0
   %_source2 = bitcast i64 %_loc_1 to i64
   %_dest_ptr2 = getelementptr i64, i64* %_Param_Area, i64 0
   call void @_psc_assign_word(i64* %_Context, i64* %_desc2, i64* %_dest_ptr2, i64 %_source2)

   ; #Store_Address_Op at 181:9
   %_addr3 = getelementptr i64, i64* %_Param_Area, i64 0
   %_loc_2 = bitcast i64* %_addr3 to i64*

   ; #Copy_Word_Op at 181:19
   %_source_val4 = bitcast i64 %_formal_param_2 to i64
   %_loc_3 = bitcast i64 %_source_val4 to i64

   ; #Call_Op at 181:9
   %_call5_Static_Link = getelementptr i64, i64* %_Static_Link, i64 0
   call void @"PSL.Containers.Ordered_Set.$-=$.2"(i64* %_loc_2, i64 %_loc_3, i64* %_Context, i64* %_call5_Static_Link)

   ; #Check_Not_Null_Op at 182:5
   %_arg_ptr6 = getelementptr i64, i64* %_Param_Area, i64 0
   %_arg6 = load i64, i64* %_arg_ptr6
   %_val_no_reg6 = and i64 %_arg6, -4294967295
   %_is_null6 = icmp eq i64 %_val_no_reg6, -144115188075855871
   br i1 %_is_null6, label %_fail6, label %_lbl7
   _fail6:
   %_str_ptr_ptr6 = load i64*, i64** @$Strings
   %_str_ptr6 = getelementptr i64, i64* %_str_ptr_ptr6, i64 18
   %_assert_str6 = load i64, i64* %_str_ptr6
   store i64 %_assert_str6, i64* %_print_param6
   call void @_psc_runtime_message(i64* %_Context, i64* %_print_param6, i64* null)

   br label %_lbl7

_lbl7:
   ; #Return_Op at 182:5
   %_result_reg7 = load i64, i64* %_Param_Area
   ret i64 %_result_reg7

}

define i64 @"PSL.Containers.Ordered_Set.$-$.2"(i64 %_formal_param_1, i64 %_formal_param_2, i64* %_Context, i64* %_Static_Link, i64 %_inited_output) {
   %_Local_Area = alloca i64, i64 4
   %_sl = ptrtoint i64* %_Static_Link to i64
   store i64 %_sl, i64* %_Local_Area

   %_Param_Area = alloca i64
   %_print_param6 = alloca i64

   store i64 %_inited_output, i64* %_Param_Area
   %_pa = ptrtoint i64* %_Param_Area to i64
   %_store_pa = getelementptr i64, i64* %_Local_Area, i64 1
   store i64 %_pa, i64* %_store_pa
   
   ; #Make_Copy_In_Stg_Rgn_Op at 187:19
   %_desc1 = getelementptr i64, i64* %_Static_Link, i64 0
   %_source1 = bitcast i64 %_formal_param_1 to i64
   %_existing_ptr1 = getelementptr i64, i64* %_Param_Area, i64 0
   %_existing_obj1 = load i64, i64* %_existing_ptr1
   %_result1 = call i64 @_psc_copy_object(i64* %_Context, i64* %_desc1, i64 %_source1, i64 %_existing_obj1)
   %_loc_1 = bitcast i64 %_result1 to i64

   ; #Assign_Word_Op at 187:9
   %_desc2 = getelementptr i64, i64* %_Static_Link, i64 0
   %_source2 = bitcast i64 %_loc_1 to i64
   %_dest_ptr2 = getelementptr i64, i64* %_Param_Area, i64 0
   call void @_psc_assign_word(i64* %_Context, i64* %_desc2, i64* %_dest_ptr2, i64 %_source2)

   ; #Store_Address_Op at 188:9
   %_addr3 = getelementptr i64, i64* %_Param_Area, i64 0
   %_loc_2 = bitcast i64* %_addr3 to i64*

   ; #Copy_Word_Op at 188:19
   %_source_val4 = bitcast i64 %_formal_param_2 to i64
   %_loc_3 = bitcast i64 %_source_val4 to i64

   ; #Call_Op at 188:9
   ; inlining call on "-="
   %_call5_Static_Link = getelementptr i64, i64* %_Static_Link, i64 0

   ; #Copy_Address_Op at 193:16
   %_source_val.I5.1 = bitcast i64* %_loc_2 to i64*
   %_loc_.I5_4 = bitcast i64* %_source_val.I5.1 to i64*

   ; #Copy_Word_Op at 193:16
   %_reg.I5.2_1 = bitcast i64* %_loc_.I5_4 to i64*
   %_source.I5.2 = getelementptr i64, i64* %_reg.I5.2_1, i64 0
   %_source_val.I5.2 = load i64, i64* %_source.I5.2
   %_loc_.I5_3 = bitcast i64 %_source_val.I5.2 to i64

   ; #Store_Address_Op at 193:9
   %_reg.I5.3_1 = inttoptr i64 %_loc_.I5_3 to i64*
   %_addr.I5.3 = getelementptr i64, i64* %_reg.I5.3_1, i64 1
   %_loc_.I5_1 = bitcast i64* %_addr.I5.3 to i64*

   ; #Copy_Word_Op at 193:25
   %_source_val.I5.4 = bitcast i64 %_loc_3 to i64
   %_loc_.I5_2 = bitcast i64 %_source_val.I5.4 to i64

   ; #Call_Op at 193:9
   %_cur_td.I5.5 = bitcast i64* %_call5_Static_Link to %struct.TD*
   %_nested_types_arr_ptr.I5.5 = getelementptr %struct.TD, %struct.TD* %_cur_td.I5.5, i32 0, i32 35
   %_nested_types_arr.I5.5 = load %struct.TD**, %struct.TD*** %_nested_types_arr_ptr.I5.5
   %_nested_td_ptr_ptr.I5.5 = getelementptr %struct.TD*, %struct.TD** %_nested_types_arr.I5.5, i32 0
   %_nested_td.I5.5 = load %struct.TD*, %struct.TD** %_nested_td_ptr_ptr.I5.5
   %_call.I5.5_Static_Link = bitcast %struct.TD* %_nested_td.I5.5 to i64*
   call void @"PSL.Core.AA_Tree.Delete"(i64* %_loc_.I5_1, i64 %_loc_.I5_2, i64* %_Context, i64* %_call.I5.5_Static_Link)

   ; #Copy_Address_Op at 194:9
   %_source_val.I5.6 = bitcast i64* %_loc_2 to i64*
   %_loc_.I5_7 = bitcast i64* %_source_val.I5.6 to i64*

   ; #Copy_Word_Op at 194:9
   %_reg.I5.7_1 = bitcast i64* %_loc_.I5_7 to i64*
   %_source.I5.7 = getelementptr i64, i64* %_reg.I5.7_1, i64 0
   %_source_val.I5.7 = load i64, i64* %_source.I5.7
   %_loc_.I5_6 = bitcast i64 %_source_val.I5.7 to i64

   ; #Copy_Address_Op at 194:26
   %_source_val.I5.8 = bitcast i64* %_loc_2 to i64*
   %_loc_.I5_11 = bitcast i64* %_source_val.I5.8 to i64*

   ; #Copy_Word_Op at 194:26
   %_reg.I5.9_1 = bitcast i64* %_loc_.I5_11 to i64*
   %_source.I5.9 = getelementptr i64, i64* %_reg.I5.9_1, i64 0
   %_source_val.I5.9 = load i64, i64* %_source.I5.9
   %_loc_.I5_10 = bitcast i64 %_source_val.I5.9 to i64

   ; #Copy_Word_Op at 194:28
   %_reg.I5.10_1 = inttoptr i64 %_loc_.I5_10 to i64*
   %_source.I5.10 = getelementptr i64, i64* %_reg.I5.10_1, i64 1
   %_source_val.I5.10 = load i64, i64* %_source.I5.10
   %_loc_.I5_9 = bitcast i64 %_source_val.I5.10 to i64

   ; #Call_Op at 194:20
   %_cur_td.I5.11 = bitcast i64* %_call5_Static_Link to %struct.TD*
   %_nested_types_arr_ptr.I5.11 = getelementptr %struct.TD, %struct.TD* %_cur_td.I5.11, i32 0, i32 35
   %_nested_types_arr.I5.11 = load %struct.TD**, %struct.TD*** %_nested_types_arr_ptr.I5.11
   %_nested_td_ptr_ptr.I5.11 = getelementptr %struct.TD*, %struct.TD** %_nested_types_arr.I5.11, i32 0
   %_nested_td.I5.11 = load %struct.TD*, %struct.TD** %_nested_td_ptr_ptr.I5.11
   %_call.I5.11_Static_Link = bitcast %struct.TD* %_nested_td.I5.11 to i64*
   %_new_result.I5.11_0 = call i64 @"PSL.Core.AA_Tree.Count"(i64 %_loc_.I5_9, i64* %_Context, i64* %_call.I5.11_Static_Link)
   %_loc_.I5_5 = bitcast i64 %_new_result.I5.11_0 to i64

   ; #Copy_Word_Op at 194:11
   %_source_val.I5.12 = bitcast i64 %_loc_.I5_5 to i64
   %_reg.I5.12_2 = inttoptr i64 %_loc_.I5_6 to i64*
   %_dest.I5.12 = getelementptr i64, i64* %_reg.I5.12_2, i64 2
   store i64 %_source_val.I5.12, i64* %_dest.I5.12

   ; #Return_Op at 195:5


   ; #Check_Not_Null_Op at 189:5
   %_arg_ptr6 = getelementptr i64, i64* %_Param_Area, i64 0
   %_arg6 = load i64, i64* %_arg_ptr6
   %_val_no_reg6 = and i64 %_arg6, -4294967295
   %_is_null6 = icmp eq i64 %_val_no_reg6, -144115188075855871
   br i1 %_is_null6, label %_fail6, label %_lbl7
   _fail6:
   %_str_ptr_ptr6 = load i64*, i64** @$Strings
   %_str_ptr6 = getelementptr i64, i64* %_str_ptr_ptr6, i64 20
   %_assert_str6 = load i64, i64* %_str_ptr6
   store i64 %_assert_str6, i64* %_print_param6
   call void @_psc_runtime_message(i64* %_Context, i64* %_print_param6, i64* null)

   br label %_lbl7

_lbl7:
   ; #Return_Op at 189:5
   %_result_reg7 = load i64, i64* %_Param_Area
   ret i64 %_result_reg7

}

define void @"PSL.Containers.Ordered_Set.$-=$"(i64* %_formal_param_0, i64 %_formal_param_1, i64* %_Context, i64* %_Static_Link) {
   %_Local_Area = alloca i64, i64 4
   %_sl = ptrtoint i64* %_Static_Link to i64
   store i64 %_sl, i64* %_Local_Area


   
   ; #Copy_Address_Op at 193:16
   %_source_val1 = bitcast i64* %_formal_param_0 to i64*
   %_loc_4 = bitcast i64* %_source_val1 to i64*

   ; #Copy_Word_Op at 193:16
   %_reg2_1 = bitcast i64* %_loc_4 to i64*
   %_source2 = getelementptr i64, i64* %_reg2_1, i64 0
   %_source_val2 = load i64, i64* %_source2
   %_loc_3 = bitcast i64 %_source_val2 to i64

   ; #Store_Address_Op at 193:9
   %_reg3_1 = inttoptr i64 %_loc_3 to i64*
   %_addr3 = getelementptr i64, i64* %_reg3_1, i64 1
   %_loc_1 = bitcast i64* %_addr3 to i64*

   ; #Copy_Word_Op at 193:25
   %_source_val4 = bitcast i64 %_formal_param_1 to i64
   %_loc_2 = bitcast i64 %_source_val4 to i64

   ; #Call_Op at 193:9
   %_cur_td5 = bitcast i64* %_Static_Link to %struct.TD*
   %_nested_types_arr_ptr5 = getelementptr %struct.TD, %struct.TD* %_cur_td5, i32 0, i32 35
   %_nested_types_arr5 = load %struct.TD**, %struct.TD*** %_nested_types_arr_ptr5
   %_nested_td_ptr_ptr5 = getelementptr %struct.TD*, %struct.TD** %_nested_types_arr5, i32 0
   %_nested_td5 = load %struct.TD*, %struct.TD** %_nested_td_ptr_ptr5
   %_call5_Static_Link = bitcast %struct.TD* %_nested_td5 to i64*
   call void @"PSL.Core.AA_Tree.Delete"(i64* %_loc_1, i64 %_loc_2, i64* %_Context, i64* %_call5_Static_Link)

   ; #Copy_Address_Op at 194:9
   %_source_val6 = bitcast i64* %_formal_param_0 to i64*
   %_loc_7 = bitcast i64* %_source_val6 to i64*

   ; #Copy_Word_Op at 194:9
   %_reg7_1 = bitcast i64* %_loc_7 to i64*
   %_source7 = getelementptr i64, i64* %_reg7_1, i64 0
   %_source_val7 = load i64, i64* %_source7
   %_loc_6 = bitcast i64 %_source_val7 to i64

   ; #Copy_Address_Op at 194:26
   %_source_val8 = bitcast i64* %_formal_param_0 to i64*
   %_loc_11 = bitcast i64* %_source_val8 to i64*

   ; #Copy_Word_Op at 194:26
   %_reg9_1 = bitcast i64* %_loc_11 to i64*
   %_source9 = getelementptr i64, i64* %_reg9_1, i64 0
   %_source_val9 = load i64, i64* %_source9
   %_loc_10 = bitcast i64 %_source_val9 to i64

   ; #Copy_Word_Op at 194:28
   %_reg10_1 = inttoptr i64 %_loc_10 to i64*
   %_source10 = getelementptr i64, i64* %_reg10_1, i64 1
   %_source_val10 = load i64, i64* %_source10
   %_loc_9 = bitcast i64 %_source_val10 to i64

   ; #Call_Op at 194:20
   %_cur_td11 = bitcast i64* %_Static_Link to %struct.TD*
   %_nested_types_arr_ptr11 = getelementptr %struct.TD, %struct.TD* %_cur_td11, i32 0, i32 35
   %_nested_types_arr11 = load %struct.TD**, %struct.TD*** %_nested_types_arr_ptr11
   %_nested_td_ptr_ptr11 = getelementptr %struct.TD*, %struct.TD** %_nested_types_arr11, i32 0
   %_nested_td11 = load %struct.TD*, %struct.TD** %_nested_td_ptr_ptr11
   %_call11_Static_Link = bitcast %struct.TD* %_nested_td11 to i64*
   %_new_result11_0 = call i64 @"PSL.Core.AA_Tree.Count"(i64 %_loc_9, i64* %_Context, i64* %_call11_Static_Link)
   %_loc_5 = bitcast i64 %_new_result11_0 to i64

   ; #Copy_Word_Op at 194:11
   %_source_val12 = bitcast i64 %_loc_5 to i64
   %_reg12_2 = inttoptr i64 %_loc_6 to i64*
   %_dest12 = getelementptr i64, i64* %_reg12_2, i64 2
   store i64 %_source_val12, i64* %_dest12

   ; #Return_Op at 195:5
   ret void

}

define void @"PSL.Containers.Ordered_Set.$-=$.2"(i64* %_formal_param_0, i64 %_formal_param_1, i64* %_Context, i64* %_Static_Link) {
   %_Local_Area = alloca i64, i64 4
   %_sl = ptrtoint i64* %_Static_Link to i64
   store i64 %_sl, i64* %_Local_Area
   call void @_psc_initialize_stg_rgn(i64* %_Context, i64* %_Local_Area)
   %_Master = alloca i64, i64 3
   %_ms = ptrtoint i64* %_Master to i64
   %_store_ms = getelementptr i64, i64* %_Local_Area, i64 3
   store i64 %_ms, i64* %_store_ms

   %_loc_1 = alloca i64
   %_loc_3 = alloca i64
   %_loc_6 = alloca i64
   %_loc_11 = alloca i64

   
   ; #Declare_Obj_Op at 199:13

   ; #Store_Local_Null_Op at 199:13
   %_ctx2 = bitcast i64* %_Context to %struct.ExecCtx*
   %_large_null_ptr2 = getelementptr %struct.ExecCtx, %struct.ExecCtx* %_ctx2, i32 0, i32 1
   %_null2 = load i64, i64* %_large_null_ptr2
   %_dest_ptr2 = bitcast i64* %_loc_1 to i64* 
   store i64 %_null2, i64* %_dest_ptr2

   ; #Make_Copy_In_Stg_Rgn_Op at 199:21
   %_desc3 = getelementptr i64, i64* %_Static_Link, i64 0
   %_source3 = bitcast i64 %_formal_param_1 to i64
   %_existing_ptr3 = bitcast i64* %_loc_1 to i64* 
   %_existing_obj3 = load i64, i64* %_existing_ptr3
   %_result3 = call i64 @_psc_copy_object(i64* %_Context, i64* %_desc3, i64 %_source3, i64 %_existing_obj3)
   %_dest_ptr3 = bitcast i64* %_loc_1 to i64* 
   store i64 %_result3, i64* %_dest_ptr3

   ; #Declare_Obj_Op at 199:13

   ; #Store_Null_Of_Same_Stg_Rgn_Op at 199:13
   %_cur_td5 = bitcast i64* %_Static_Link to %struct.TD*
   %_param_arr_ptr5 = getelementptr %struct.TD, %struct.TD* %_cur_td5, i32 0, i32 26
   %_param_arr5 = load %struct.ParamInfo*, %struct.ParamInfo** %_param_arr_ptr5
   %_formal_td_ptr_ptr5 = getelementptr %struct.ParamInfo, %struct.ParamInfo* %_param_arr5, i32 0, i32 1, i32 0
   %_formal_td5 = load %struct.TD*, %struct.TD** %_formal_td_ptr_ptr5
   %_desc5 = bitcast %struct.TD* %_formal_td5 to i64*
   %_source_ptr5 = bitcast i64* %_loc_1 to i64* 
   %_source5 = load i64, i64* %_source_ptr5
   %_td5 = bitcast i64* %_desc5 to %struct.TD*
   %_is_small_ptr5 = getelementptr %struct.TD, %struct.TD* %_td5, i32 0, i32 13
   %_is_small5 = load i8, i8* %_is_small_ptr5
   %_is_small_bool5 = trunc i8 %_is_small5 to i1
   br i1 %_is_small_bool5, label %_small_label5, label %_large_label5
   _small_label5:
   %_small_null_ptr5 = getelementptr %struct.TD, %struct.TD* %_td5, i32 0, i32 17
   %_small_null5 = load i64, i64* %_small_null_ptr5
   br label %_join_small_and_large5
   _large_label5:
   %_high_and_low_bits5 = and i64 %_source5, or (i64 shl (i64 1, i64 63), i64 1)
   %_is_special_bit5 = icmp eq i64 %_high_and_low_bits5, or (i64 shl (i64 1, i64 63), i64 1)
   br i1 %_is_special_bit5, label %_is_special_label5, label %_not_special_label5
   _is_special_label5:
   %_spcl_rgn_times2_5 = and i64 %_source5, 4294967295
   br label %_last_large_label5
   _not_special_label5:
   %_header_ptr5 = inttoptr i64 %_source5 to i64*
   %_hdr_of_src5 = load i64, i64* %_header_ptr5
   %_region_bits5 = and i64 %_hdr_of_src5, 4294901760
   %_normal_rgn_times2_5 = lshr i64 %_region_bits5, 15
   br label %_last_large_label5
   _last_large_label5:
   %_rgn_times2_5 = phi i64 [%_spcl_rgn_times2_5, %_is_special_label5], [%_normal_rgn_times2_5, %_not_special_label5]
   %_large_null5 = or i64 -144115188075855871, %_rgn_times2_5
   br label %_join_small_and_large5
   _join_small_and_large5:
   %_null5 = phi i64 [%_small_null5, %_small_label5],[%_large_null5, %_last_large_label5]
   %_loc_4 = bitcast i64 %_null5 to i64

   ; #Store_Address_Op at 199:21
   %_addr6 = bitcast i64* %_loc_1 to i64* 
   %_loc_5 = bitcast i64* %_addr6 to i64*

   ; #Call_Op at 199:21
   %_call7_Static_Link = getelementptr i64, i64* %_Static_Link, i64 0
   %_new_result7_0 = call i64 @"PSL.Containers.Ordered_Set.Remove_Any"(i64* %_loc_5, i64* %_Context, i64* %_call7_Static_Link, i64 %_loc_4)
   %_result_addr7_0 = bitcast i64* %_loc_3 to i64* 
   store i64 %_new_result7_0, i64* %_result_addr7_0

   ; #Not_Null_Op at 199:21
   %_arg_ptr8 = bitcast i64* %_loc_3 to i64* 
   %_arg8 = load i64, i64* %_arg_ptr8
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
   br i1 %_is_small_bool8, label %_is_small_lbl8, label %_is_large_lbl8
   _is_small_lbl8:
   %_small_null_ptr8 = getelementptr %struct.TD, %struct.TD* %_td8, i32 0, i32 17
   %_small_null8 = load i64, i64* %_small_null_ptr8
   %_small_result8 = icmp ne i64 %_arg8, %_small_null8
   br label %_join8
   _is_large_lbl8:
   %_val_no_reg8 = and i64 %_arg8, -4294967295
   %_large_result8 = icmp ne i64 %_val_no_reg8, -144115188075855871
   br label %_join8
   _join8:
   %_result_bit8 = phi i1 [%_small_result8, %_is_small_lbl8], [%_large_result8, %_is_large_lbl8]
   %_result_ext8 = zext i1 %_result_bit8 to i64
   %_loc_2 = bitcast i64 %_result_ext8 to i64

   ; #If_Op at 199:13
   %_if_source_val9 = bitcast i64 %_loc_2 to i64
   %_if_source_trunc9 = icmp eq i64 %_if_source_val9, 1
   br i1 %_if_source_trunc9, label %_lbl10, label %_lbl24

_lbl10:
   ; #Declare_Obj_Op at 199:9

   ; #Copy_Word_Op at 199:9
   %_source11 = bitcast i64* %_loc_3 to i64* 
   %_source_val11 = load i64, i64* %_source11
   %_dest11 = bitcast i64* %_loc_6 to i64* 
   store i64 %_source_val11, i64* %_dest11

   br label %_lbl12

_lbl12:
   ; #Copy_Address_Op at 200:13
   %_source_val12 = bitcast i64* %_formal_param_0 to i64*
   %_loc_9 = bitcast i64* %_source_val12 to i64*

   ; #Store_Address_Op at 200:13
   %_reg13_1 = bitcast i64* %_loc_9 to i64*
   %_addr13 = getelementptr i64, i64* %_reg13_1, i64 0
   %_loc_7 = bitcast i64* %_addr13 to i64*

   ; #Copy_Word_Op at 200:21
   %_source14 = bitcast i64* %_loc_6 to i64* 
   %_source_val14 = load i64, i64* %_source14
   %_loc_8 = bitcast i64 %_source_val14 to i64

   ; #Call_Op at 200:13
   ; inlining call on "-="
   %_call15_Static_Link = getelementptr i64, i64* %_Static_Link, i64 0

   ; #Copy_Address_Op at 193:16
   %_source_val.I15.1 = bitcast i64* %_loc_7 to i64*
   %_loc_.I15_4 = bitcast i64* %_source_val.I15.1 to i64*

   ; #Copy_Word_Op at 193:16
   %_reg.I15.2_1 = bitcast i64* %_loc_.I15_4 to i64*
   %_source.I15.2 = getelementptr i64, i64* %_reg.I15.2_1, i64 0
   %_source_val.I15.2 = load i64, i64* %_source.I15.2
   %_loc_.I15_3 = bitcast i64 %_source_val.I15.2 to i64

   ; #Store_Address_Op at 193:9
   %_reg.I15.3_1 = inttoptr i64 %_loc_.I15_3 to i64*
   %_addr.I15.3 = getelementptr i64, i64* %_reg.I15.3_1, i64 1
   %_loc_.I15_1 = bitcast i64* %_addr.I15.3 to i64*

   ; #Copy_Word_Op at 193:25
   %_source_val.I15.4 = bitcast i64 %_loc_8 to i64
   %_loc_.I15_2 = bitcast i64 %_source_val.I15.4 to i64

   ; #Call_Op at 193:9
   %_cur_td.I15.5 = bitcast i64* %_call15_Static_Link to %struct.TD*
   %_nested_types_arr_ptr.I15.5 = getelementptr %struct.TD, %struct.TD* %_cur_td.I15.5, i32 0, i32 35
   %_nested_types_arr.I15.5 = load %struct.TD**, %struct.TD*** %_nested_types_arr_ptr.I15.5
   %_nested_td_ptr_ptr.I15.5 = getelementptr %struct.TD*, %struct.TD** %_nested_types_arr.I15.5, i32 0
   %_nested_td.I15.5 = load %struct.TD*, %struct.TD** %_nested_td_ptr_ptr.I15.5
   %_call.I15.5_Static_Link = bitcast %struct.TD* %_nested_td.I15.5 to i64*
   call void @"PSL.Core.AA_Tree.Delete"(i64* %_loc_.I15_1, i64 %_loc_.I15_2, i64* %_Context, i64* %_call.I15.5_Static_Link)

   ; #Copy_Address_Op at 194:9
   %_source_val.I15.6 = bitcast i64* %_loc_7 to i64*
   %_loc_.I15_7 = bitcast i64* %_source_val.I15.6 to i64*

   ; #Copy_Word_Op at 194:9
   %_reg.I15.7_1 = bitcast i64* %_loc_.I15_7 to i64*
   %_source.I15.7 = getelementptr i64, i64* %_reg.I15.7_1, i64 0
   %_source_val.I15.7 = load i64, i64* %_source.I15.7
   %_loc_.I15_6 = bitcast i64 %_source_val.I15.7 to i64

   ; #Copy_Address_Op at 194:26
   %_source_val.I15.8 = bitcast i64* %_loc_7 to i64*
   %_loc_.I15_11 = bitcast i64* %_source_val.I15.8 to i64*

   ; #Copy_Word_Op at 194:26
   %_reg.I15.9_1 = bitcast i64* %_loc_.I15_11 to i64*
   %_source.I15.9 = getelementptr i64, i64* %_reg.I15.9_1, i64 0
   %_source_val.I15.9 = load i64, i64* %_source.I15.9
   %_loc_.I15_10 = bitcast i64 %_source_val.I15.9 to i64

   ; #Copy_Word_Op at 194:28
   %_reg.I15.10_1 = inttoptr i64 %_loc_.I15_10 to i64*
   %_source.I15.10 = getelementptr i64, i64* %_reg.I15.10_1, i64 1
   %_source_val.I15.10 = load i64, i64* %_source.I15.10
   %_loc_.I15_9 = bitcast i64 %_source_val.I15.10 to i64

   ; #Call_Op at 194:20
   %_cur_td.I15.11 = bitcast i64* %_call15_Static_Link to %struct.TD*
   %_nested_types_arr_ptr.I15.11 = getelementptr %struct.TD, %struct.TD* %_cur_td.I15.11, i32 0, i32 35
   %_nested_types_arr.I15.11 = load %struct.TD**, %struct.TD*** %_nested_types_arr_ptr.I15.11
   %_nested_td_ptr_ptr.I15.11 = getelementptr %struct.TD*, %struct.TD** %_nested_types_arr.I15.11, i32 0
   %_nested_td.I15.11 = load %struct.TD*, %struct.TD** %_nested_td_ptr_ptr.I15.11
   %_call.I15.11_Static_Link = bitcast %struct.TD* %_nested_td.I15.11 to i64*
   %_new_result.I15.11_0 = call i64 @"PSL.Core.AA_Tree.Count"(i64 %_loc_.I15_9, i64* %_Context, i64* %_call.I15.11_Static_Link)
   %_loc_.I15_5 = bitcast i64 %_new_result.I15.11_0 to i64

   ; #Copy_Word_Op at 194:11
   %_source_val.I15.12 = bitcast i64 %_loc_.I15_5 to i64
   %_reg.I15.12_2 = inttoptr i64 %_loc_.I15_6 to i64*
   %_dest.I15.12 = getelementptr i64, i64* %_reg.I15.12_2, i64 2
   store i64 %_source_val.I15.12, i64* %_dest.I15.12

   ; #Return_Op at 195:5


   ; #Declare_Obj_Op at 199:13

   ; #Store_Null_Of_Same_Stg_Rgn_Op at 199:13
   %_cur_td17 = bitcast i64* %_Static_Link to %struct.TD*
   %_param_arr_ptr17 = getelementptr %struct.TD, %struct.TD* %_cur_td17, i32 0, i32 26
   %_param_arr17 = load %struct.ParamInfo*, %struct.ParamInfo** %_param_arr_ptr17
   %_formal_td_ptr_ptr17 = getelementptr %struct.ParamInfo, %struct.ParamInfo* %_param_arr17, i32 0, i32 1, i32 0
   %_formal_td17 = load %struct.TD*, %struct.TD** %_formal_td_ptr_ptr17
   %_desc17 = bitcast %struct.TD* %_formal_td17 to i64*
   %_source_ptr17 = bitcast i64* %_loc_1 to i64* 
   %_source17 = load i64, i64* %_source_ptr17
   %_td17 = bitcast i64* %_desc17 to %struct.TD*
   %_is_small_ptr17 = getelementptr %struct.TD, %struct.TD* %_td17, i32 0, i32 13
   %_is_small17 = load i8, i8* %_is_small_ptr17
   %_is_small_bool17 = trunc i8 %_is_small17 to i1
   br i1 %_is_small_bool17, label %_small_label17, label %_large_label17
   _small_label17:
   %_small_null_ptr17 = getelementptr %struct.TD, %struct.TD* %_td17, i32 0, i32 17
   %_small_null17 = load i64, i64* %_small_null_ptr17
   br label %_join_small_and_large17
   _large_label17:
   %_high_and_low_bits17 = and i64 %_source17, or (i64 shl (i64 1, i64 63), i64 1)
   %_is_special_bit17 = icmp eq i64 %_high_and_low_bits17, or (i64 shl (i64 1, i64 63), i64 1)
   br i1 %_is_special_bit17, label %_is_special_label17, label %_not_special_label17
   _is_special_label17:
   %_spcl_rgn_times2_17 = and i64 %_source17, 4294967295
   br label %_last_large_label17
   _not_special_label17:
   %_header_ptr17 = inttoptr i64 %_source17 to i64*
   %_hdr_of_src17 = load i64, i64* %_header_ptr17
   %_region_bits17 = and i64 %_hdr_of_src17, 4294901760
   %_normal_rgn_times2_17 = lshr i64 %_region_bits17, 15
   br label %_last_large_label17
   _last_large_label17:
   %_rgn_times2_17 = phi i64 [%_spcl_rgn_times2_17, %_is_special_label17], [%_normal_rgn_times2_17, %_not_special_label17]
   %_large_null17 = or i64 -144115188075855871, %_rgn_times2_17
   br label %_join_small_and_large17
   _join_small_and_large17:
   %_null17 = phi i64 [%_small_null17, %_small_label17],[%_large_null17, %_last_large_label17]
   %_loc_12 = bitcast i64 %_null17 to i64

   ; #Store_Address_Op at 199:21
   %_addr18 = bitcast i64* %_loc_1 to i64* 
   %_loc_13 = bitcast i64* %_addr18 to i64*

   ; #Call_Op at 199:21
   %_call19_Static_Link = getelementptr i64, i64* %_Static_Link, i64 0
   %_new_result19_0 = call i64 @"PSL.Containers.Ordered_Set.Remove_Any"(i64* %_loc_13, i64* %_Context, i64* %_call19_Static_Link, i64 %_loc_12)
   %_result_addr19_0 = bitcast i64* %_loc_11 to i64* 
   store i64 %_new_result19_0, i64* %_result_addr19_0

   ; #Not_Null_Op at 199:21
   %_arg_ptr20 = bitcast i64* %_loc_11 to i64* 
   %_arg20 = load i64, i64* %_arg_ptr20
   %_cur_td20 = bitcast i64* %_Static_Link to %struct.TD*
   %_param_arr_ptr20 = getelementptr %struct.TD, %struct.TD* %_cur_td20, i32 0, i32 26
   %_param_arr20 = load %struct.ParamInfo*, %struct.ParamInfo** %_param_arr_ptr20
   %_formal_td_ptr_ptr20 = getelementptr %struct.ParamInfo, %struct.ParamInfo* %_param_arr20, i32 0, i32 1, i32 0
   %_formal_td20 = load %struct.TD*, %struct.TD** %_formal_td_ptr_ptr20
   %_desc20 = bitcast %struct.TD* %_formal_td20 to i64*
   %_td20 = bitcast i64* %_desc20 to %struct.TD*
   %_is_small_ptr20 = getelementptr %struct.TD, %struct.TD* %_td20, i32 0, i32 13
   %_is_small20 = load i8, i8* %_is_small_ptr20
   %_is_small_bool20 = trunc i8 %_is_small20 to i1
   br i1 %_is_small_bool20, label %_is_small_lbl20, label %_is_large_lbl20
   _is_small_lbl20:
   %_small_null_ptr20 = getelementptr %struct.TD, %struct.TD* %_td20, i32 0, i32 17
   %_small_null20 = load i64, i64* %_small_null_ptr20
   %_small_result20 = icmp ne i64 %_arg20, %_small_null20
   br label %_join20
   _is_large_lbl20:
   %_val_no_reg20 = and i64 %_arg20, -4294967295
   %_large_result20 = icmp ne i64 %_val_no_reg20, -144115188075855871
   br label %_join20
   _join20:
   %_result_bit20 = phi i1 [%_small_result20, %_is_small_lbl20], [%_large_result20, %_is_large_lbl20]
   %_result_ext20 = zext i1 %_result_bit20 to i64
   %_loc_10 = bitcast i64 %_result_ext20 to i64

   ; #If_Op at 199:13
   %_if_source_val21 = bitcast i64 %_loc_10 to i64
   %_if_source_trunc21 = icmp eq i64 %_if_source_val21, 1
   br i1 %_if_source_trunc21, label %_lbl22, label %_lbl24

_lbl22:
   ; #Copy_Word_Op at 199:13
   %_source22 = bitcast i64* %_loc_11 to i64* 
   %_source_val22 = load i64, i64* %_source22
   %_dest22 = bitcast i64* %_loc_6 to i64* 
   store i64 %_source_val22, i64* %_dest22

   ; #Skip_Op at 199:9
   br label %_lbl12

_lbl24:
   ; #Return_Op at 202:5
   call void @_psc_finalize_stg_rgn(i64* %_Context, i64* %_Local_Area)
   ret void

}

define i64 @"PSL.Containers.Ordered_Set.$and$"(i64 %_formal_param_1, i64 %_formal_param_2, i64* %_Context, i64* %_Static_Link, i64 %_inited_output) {
   %_Local_Area = alloca i64, i64 4
   %_sl = ptrtoint i64* %_Static_Link to i64
   store i64 %_sl, i64* %_Local_Area
   call void @_psc_initialize_stg_rgn(i64* %_Context, i64* %_Local_Area)
   %_Master = alloca i64, i64 3
   %_ms = ptrtoint i64* %_Master to i64
   %_store_ms = getelementptr i64, i64* %_Local_Area, i64 3
   store i64 %_ms, i64* %_store_ms

   %_Param_Area = alloca i64
   %_output.I2 = alloca i64
   %_loc_.I2_2 = alloca i64
   %_output.I2.I5 = alloca i64
   %_print_param.I2.11 = alloca i64
   %_loc_3 = alloca i64
   %_loc_5 = alloca i64
   %_loc_8 = alloca i64
   %_output.I17 = alloca i64
   %_print_param.I17.8 = alloca i64
   %_loc_16 = alloca i64
   %_print_param30 = alloca i64

   store i64 %_inited_output, i64* %_Param_Area
   %_pa = ptrtoint i64* %_Param_Area to i64
   %_store_pa = getelementptr i64, i64* %_Local_Area, i64 1
   store i64 %_pa, i64* %_store_pa
   
   ; #Store_Null_Of_Same_Stg_Rgn_Op at 207:19
   %_source_ptr1 = getelementptr i64, i64* %_Param_Area, i64 0
   %_source1 = load i64, i64* %_source_ptr1
   %_high_and_low_bits1 = and i64 %_source1, or (i64 shl (i64 1, i64 63), i64 1)
   %_is_special_bit1 = icmp eq i64 %_high_and_low_bits1, or (i64 shl (i64 1, i64 63), i64 1)
   br i1 %_is_special_bit1, label %_is_special_label1, label %_not_special_label1
   _is_special_label1:
   %_spcl_rgn_times2_1 = and i64 %_source1, 4294967295
   br label %_join_label1
   _not_special_label1:
   %_header_ptr1 = inttoptr i64 %_source1 to i64*
   %_hdr_of_src1 = load i64, i64* %_header_ptr1
   %_region_bits1 = and i64 %_hdr_of_src1, 4294901760
   %_normal_rgn_times2_1 = lshr i64 %_region_bits1, 15
   br label %_join_label1
   _join_label1:
   %_rgn_times2_1 = phi i64 [%_spcl_rgn_times2_1, %_is_special_label1], [%_normal_rgn_times2_1, %_not_special_label1]
   %_null1 = or i64 -144115188075855871, %_rgn_times2_1
   %_loc_2 = bitcast i64 %_null1 to i64

   ; #Call_Op at 207:19
   ; inlining call on "[]"
   store i64 %_loc_2, i64* %_output.I2
   %_call2_Static_Link = getelementptr i64, i64* %_Static_Link, i64 0

   ; #Declare_Obj_Op at 101:16

   ; #Create_Obj_Op at 101:16
   %_desc.I2.2 = getelementptr i64, i64* %_call2_Static_Link, i64 0
   %_src_addr.I2.2 = bitcast i64* %_output.I2 to i64*
   %_src.I2.2 = load i64, i64* %_src_addr.I2.2
   %_dest.I2.2 = call i64@_psc_new_object(i64* %_Context, i64* %_desc.I2.2, i64 %_src.I2.2)
   %_dest_addr.I2.2 = bitcast i64* %_loc_.I2_2 to i64* 
   store i64 %_dest.I2.2, i64* %_dest_addr.I2.2

   ; #Copy_Word_Op at 101:16
   %_source.I2.3 = bitcast i64* %_loc_.I2_2 to i64* 
   %_source_val.I2.3 = load i64, i64* %_source.I2.3
   %_loc_.I2_3 = bitcast i64 %_source_val.I2.3 to i64

   ; #Store_Null_Of_Same_Stg_Rgn_Op at 101:26
   %_cur_td.I2.4 = bitcast i64* %_call2_Static_Link to %struct.TD*
   %_nested_types_arr_ptr.I2.4 = getelementptr %struct.TD, %struct.TD* %_cur_td.I2.4, i32 0, i32 35
   %_nested_types_arr.I2.4 = load %struct.TD**, %struct.TD*** %_nested_types_arr_ptr.I2.4
   %_nested_td_ptr_ptr.I2.4 = getelementptr %struct.TD*, %struct.TD** %_nested_types_arr.I2.4, i32 0
   %_nested_td.I2.4 = load %struct.TD*, %struct.TD** %_nested_td_ptr_ptr.I2.4
   %_desc.I2.4 = bitcast %struct.TD* %_nested_td.I2.4 to i64*
   %_source.I2.4 = bitcast i64 %_loc_.I2_3 to i64
   %_td.I2.4 = bitcast i64* %_desc.I2.4 to %struct.TD*
   %_is_small_ptr.I2.4 = getelementptr %struct.TD, %struct.TD* %_td.I2.4, i32 0, i32 13
   %_is_small.I2.4 = load i8, i8* %_is_small_ptr.I2.4
   %_is_small_bool.I2.4 = trunc i8 %_is_small.I2.4 to i1
   br i1 %_is_small_bool.I2.4, label %_small_label.I2.4, label %_large_label.I2.4
   _small_label.I2.4:
   %_small_null_ptr.I2.4 = getelementptr %struct.TD, %struct.TD* %_td.I2.4, i32 0, i32 17
   %_small_null.I2.4 = load i64, i64* %_small_null_ptr.I2.4
   br label %_join_small_and_large.I2.4
   _large_label.I2.4:
   %_high_and_low_bits.I2.4 = and i64 %_source.I2.4, or (i64 shl (i64 1, i64 63), i64 1)
   %_is_special_bit.I2.4 = icmp eq i64 %_high_and_low_bits.I2.4, or (i64 shl (i64 1, i64 63), i64 1)
   br i1 %_is_special_bit.I2.4, label %_is_special_label.I2.4, label %_not_special_label.I2.4
   _is_special_label.I2.4:
   %_spcl_rgn_times2_.I2.4 = and i64 %_source.I2.4, 4294967295
   br label %_last_large_label.I2.4
   _not_special_label.I2.4:
   %_header_ptr.I2.4 = inttoptr i64 %_source.I2.4 to i64*
   %_hdr_of_src.I2.4 = load i64, i64* %_header_ptr.I2.4
   %_region_bits.I2.4 = and i64 %_hdr_of_src.I2.4, 4294901760
   %_normal_rgn_times2_.I2.4 = lshr i64 %_region_bits.I2.4, 15
   br label %_last_large_label.I2.4
   _last_large_label.I2.4:
   %_rgn_times2_.I2.4 = phi i64 [%_spcl_rgn_times2_.I2.4, %_is_special_label.I2.4], [%_normal_rgn_times2_.I2.4, %_not_special_label.I2.4]
   %_large_null.I2.4 = or i64 -144115188075855871, %_rgn_times2_.I2.4
   br label %_join_small_and_large.I2.4
   _join_small_and_large.I2.4:
   %_null.I2.4 = phi i64 [%_small_null.I2.4, %_small_label.I2.4],[%_large_null.I2.4, %_last_large_label.I2.4]
   %_loc_.I2_5 = bitcast i64 %_null.I2.4 to i64

   ; #Call_Op at 101:26
   ; inlining call on "[]"
   store i64 %_loc_.I2_5, i64* %_output.I2.I5
   %_cur_td.I2.5 = bitcast i64* %_call2_Static_Link to %struct.TD*
   %_nested_types_arr_ptr.I2.5 = getelementptr %struct.TD, %struct.TD* %_cur_td.I2.5, i32 0, i32 35
   %_nested_types_arr.I2.5 = load %struct.TD**, %struct.TD*** %_nested_types_arr_ptr.I2.5
   %_nested_td_ptr_ptr.I2.5 = getelementptr %struct.TD*, %struct.TD** %_nested_types_arr.I2.5, i32 0
   %_nested_td.I2.5 = load %struct.TD*, %struct.TD** %_nested_td_ptr_ptr.I2.5
   %_call.I2.5_Static_Link = bitcast %struct.TD* %_nested_td.I2.5 to i64*

   ; #Store_Null_Of_Same_Stg_Rgn_Op at 227:16
   %_source_ptr.I2.I5.1 = bitcast i64* %_output.I2.I5 to i64*
   %_source.I2.I5.1 = load i64, i64* %_source_ptr.I2.I5.1
   %_high_and_low_bits.I2.I5.1 = and i64 %_source.I2.I5.1, or (i64 shl (i64 1, i64 63), i64 1)
   %_is_special_bit.I2.I5.1 = icmp eq i64 %_high_and_low_bits.I2.I5.1, or (i64 shl (i64 1, i64 63), i64 1)
   br i1 %_is_special_bit.I2.I5.1, label %_is_special_label.I2.I5.1, label %_not_special_label.I2.I5.1
   _is_special_label.I2.I5.1:
   %_spcl_rgn_times2_.I2.I5.1 = and i64 %_source.I2.I5.1, 4294967295
   br label %_join_label.I2.I5.1
   _not_special_label.I2.I5.1:
   %_header_ptr.I2.I5.1 = inttoptr i64 %_source.I2.I5.1 to i64*
   %_hdr_of_src.I2.I5.1 = load i64, i64* %_header_ptr.I2.I5.1
   %_region_bits.I2.I5.1 = and i64 %_hdr_of_src.I2.I5.1, 4294901760
   %_normal_rgn_times2_.I2.I5.1 = lshr i64 %_region_bits.I2.I5.1, 15
   br label %_join_label.I2.I5.1
   _join_label.I2.I5.1:
   %_rgn_times2_.I2.I5.1 = phi i64 [%_spcl_rgn_times2_.I2.I5.1, %_is_special_label.I2.I5.1], [%_normal_rgn_times2_.I2.I5.1, %_not_special_label.I2.I5.1]
   %_null.I2.I5.1 = or i64 -144115188075855871, %_rgn_times2_.I2.I5.1
   %_loc_.I2.I5_1 = bitcast i64 %_null.I2.I5.1 to i64

   ; #Copy_Word_Op at 227:9
   %_source_val.I2.I5.2 = bitcast i64 %_loc_.I2.I5_1 to i64
   %_dest.I2.I5.2 = bitcast i64* %_output.I2.I5 to i64*
   store i64 %_source_val.I2.I5.2, i64* %_dest.I2.I5.2

   ; #Return_Op at 227:9

   %_new_result.I2.5 = load i64, i64* %_output.I2.I5
   %_loc_.I2_4 = bitcast i64 %_new_result.I2.5 to i64

   ; #Copy_Word_Op at 101:26
   %_source_val.I2.6 = bitcast i64 %_loc_.I2_4 to i64
   %_reg.I2.6_2 = inttoptr i64 %_loc_.I2_3 to i64*
   %_dest.I2.6 = getelementptr i64, i64* %_reg.I2.6_2, i64 1
   store i64 %_source_val.I2.6, i64* %_dest.I2.6

   ; #Store_Int_Lit_Op at 101:39
   %_loc_.I2_6 = bitcast i64 0 to i64

   ; #Copy_Word_Op at 101:39
   %_source_val.I2.8 = bitcast i64 %_loc_.I2_6 to i64
   %_reg.I2.8_2 = inttoptr i64 %_loc_.I2_3 to i64*
   %_dest.I2.8 = getelementptr i64, i64* %_reg.I2.8_2, i64 2
   store i64 %_source_val.I2.8, i64* %_dest.I2.8

   ; #Copy_Word_Op at 101:16
   %_source.I2.9 = bitcast i64* %_loc_.I2_2 to i64* 
   %_source_val.I2.9 = load i64, i64* %_source.I2.9
   %_loc_.I2_1 = bitcast i64 %_source_val.I2.9 to i64

   ; #Copy_Word_Op at 101:9
   %_source_val.I2.10 = bitcast i64 %_loc_.I2_1 to i64
   %_dest.I2.10 = bitcast i64* %_output.I2 to i64*
   store i64 %_source_val.I2.10, i64* %_dest.I2.10

   ; #Check_Not_Null_Op at 101:9
   %_arg_ptr.I2.11 = bitcast i64* %_output.I2 to i64*
   %_arg.I2.11 = load i64, i64* %_arg_ptr.I2.11
   %_val_no_reg.I2.11 = and i64 %_arg.I2.11, -4294967295
   %_is_null.I2.11 = icmp eq i64 %_val_no_reg.I2.11, -144115188075855871
   br i1 %_is_null.I2.11, label %_fail.I2.11, label %_lbl.I2_12
   _fail.I2.11:
   %_str_ptr_ptr.I2.11 = load i64*, i64** @$Strings
   %_str_ptr.I2.11 = getelementptr i64, i64* %_str_ptr_ptr.I2.11, i64 2
   %_assert_str.I2.11 = load i64, i64* %_str_ptr.I2.11
   store i64 %_assert_str.I2.11, i64* %_print_param.I2.11
   call void @_psc_runtime_message(i64* %_Context, i64* %_print_param.I2.11, i64* null)

   br label %_lbl.I2_12

_lbl.I2_12:
   ; #Return_Op at 101:9

   %_new_result2 = load i64, i64* %_output.I2
   %_loc_1 = bitcast i64 %_new_result2 to i64

   ; #Assign_Word_Op at 207:9
   %_desc3 = getelementptr i64, i64* %_Static_Link, i64 0
   %_source3 = bitcast i64 %_loc_1 to i64
   %_dest_ptr3 = getelementptr i64, i64* %_Param_Area, i64 0
   call void @_psc_assign_word(i64* %_Context, i64* %_desc3, i64* %_dest_ptr3, i64 %_source3)

   ; #Declare_Obj_Op at 208:13

   ; #Store_Local_Null_Op at 208:13
   %_ctx5 = bitcast i64* %_Context to %struct.ExecCtx*
   %_large_null_ptr5 = getelementptr %struct.ExecCtx, %struct.ExecCtx* %_ctx5, i32 0, i32 1
   %_null5 = load i64, i64* %_large_null_ptr5
   %_dest_ptr5 = bitcast i64* %_loc_3 to i64* 
   store i64 %_null5, i64* %_dest_ptr5

   ; #Make_Copy_In_Stg_Rgn_Op at 208:21
   %_desc6 = getelementptr i64, i64* %_Static_Link, i64 0
   %_source6 = bitcast i64 %_formal_param_2 to i64
   %_existing_ptr6 = bitcast i64* %_loc_3 to i64* 
   %_existing_obj6 = load i64, i64* %_existing_ptr6
   %_result6 = call i64 @_psc_copy_object(i64* %_Context, i64* %_desc6, i64 %_source6, i64 %_existing_obj6)
   %_dest_ptr6 = bitcast i64* %_loc_3 to i64* 
   store i64 %_result6, i64* %_dest_ptr6

   ; #Declare_Obj_Op at 208:13

   ; #Store_Null_Of_Same_Stg_Rgn_Op at 208:13
   %_cur_td8 = bitcast i64* %_Static_Link to %struct.TD*
   %_param_arr_ptr8 = getelementptr %struct.TD, %struct.TD* %_cur_td8, i32 0, i32 26
   %_param_arr8 = load %struct.ParamInfo*, %struct.ParamInfo** %_param_arr_ptr8
   %_formal_td_ptr_ptr8 = getelementptr %struct.ParamInfo, %struct.ParamInfo* %_param_arr8, i32 0, i32 1, i32 0
   %_formal_td8 = load %struct.TD*, %struct.TD** %_formal_td_ptr_ptr8
   %_desc8 = bitcast %struct.TD* %_formal_td8 to i64*
   %_source_ptr8 = bitcast i64* %_loc_3 to i64* 
   %_source8 = load i64, i64* %_source_ptr8
   %_td8 = bitcast i64* %_desc8 to %struct.TD*
   %_is_small_ptr8 = getelementptr %struct.TD, %struct.TD* %_td8, i32 0, i32 13
   %_is_small8 = load i8, i8* %_is_small_ptr8
   %_is_small_bool8 = trunc i8 %_is_small8 to i1
   br i1 %_is_small_bool8, label %_small_label8, label %_large_label8
   _small_label8:
   %_small_null_ptr8 = getelementptr %struct.TD, %struct.TD* %_td8, i32 0, i32 17
   %_small_null8 = load i64, i64* %_small_null_ptr8
   br label %_join_small_and_large8
   _large_label8:
   %_high_and_low_bits8 = and i64 %_source8, or (i64 shl (i64 1, i64 63), i64 1)
   %_is_special_bit8 = icmp eq i64 %_high_and_low_bits8, or (i64 shl (i64 1, i64 63), i64 1)
   br i1 %_is_special_bit8, label %_is_special_label8, label %_not_special_label8
   _is_special_label8:
   %_spcl_rgn_times2_8 = and i64 %_source8, 4294967295
   br label %_last_large_label8
   _not_special_label8:
   %_header_ptr8 = inttoptr i64 %_source8 to i64*
   %_hdr_of_src8 = load i64, i64* %_header_ptr8
   %_region_bits8 = and i64 %_hdr_of_src8, 4294901760
   %_normal_rgn_times2_8 = lshr i64 %_region_bits8, 15
   br label %_last_large_label8
   _last_large_label8:
   %_rgn_times2_8 = phi i64 [%_spcl_rgn_times2_8, %_is_special_label8], [%_normal_rgn_times2_8, %_not_special_label8]
   %_large_null8 = or i64 -144115188075855871, %_rgn_times2_8
   br label %_join_small_and_large8
   _join_small_and_large8:
   %_null8 = phi i64 [%_small_null8, %_small_label8],[%_large_null8, %_last_large_label8]
   %_loc_6 = bitcast i64 %_null8 to i64

   ; #Store_Address_Op at 208:21
   %_addr9 = bitcast i64* %_loc_3 to i64* 
   %_loc_7 = bitcast i64* %_addr9 to i64*

   ; #Call_Op at 208:21
   %_call10_Static_Link = getelementptr i64, i64* %_Static_Link, i64 0
   %_new_result10_0 = call i64 @"PSL.Containers.Ordered_Set.Remove_Any"(i64* %_loc_7, i64* %_Context, i64* %_call10_Static_Link, i64 %_loc_6)
   %_result_addr10_0 = bitcast i64* %_loc_5 to i64* 
   store i64 %_new_result10_0, i64* %_result_addr10_0

   ; #Not_Null_Op at 208:21
   %_arg_ptr11 = bitcast i64* %_loc_5 to i64* 
   %_arg11 = load i64, i64* %_arg_ptr11
   %_cur_td11 = bitcast i64* %_Static_Link to %struct.TD*
   %_param_arr_ptr11 = getelementptr %struct.TD, %struct.TD* %_cur_td11, i32 0, i32 26
   %_param_arr11 = load %struct.ParamInfo*, %struct.ParamInfo** %_param_arr_ptr11
   %_formal_td_ptr_ptr11 = getelementptr %struct.ParamInfo, %struct.ParamInfo* %_param_arr11, i32 0, i32 1, i32 0
   %_formal_td11 = load %struct.TD*, %struct.TD** %_formal_td_ptr_ptr11
   %_desc11 = bitcast %struct.TD* %_formal_td11 to i64*
   %_td11 = bitcast i64* %_desc11 to %struct.TD*
   %_is_small_ptr11 = getelementptr %struct.TD, %struct.TD* %_td11, i32 0, i32 13
   %_is_small11 = load i8, i8* %_is_small_ptr11
   %_is_small_bool11 = trunc i8 %_is_small11 to i1
   br i1 %_is_small_bool11, label %_is_small_lbl11, label %_is_large_lbl11
   _is_small_lbl11:
   %_small_null_ptr11 = getelementptr %struct.TD, %struct.TD* %_td11, i32 0, i32 17
   %_small_null11 = load i64, i64* %_small_null_ptr11
   %_small_result11 = icmp ne i64 %_arg11, %_small_null11
   br label %_join11
   _is_large_lbl11:
   %_val_no_reg11 = and i64 %_arg11, -4294967295
   %_large_result11 = icmp ne i64 %_val_no_reg11, -144115188075855871
   br label %_join11
   _join11:
   %_result_bit11 = phi i1 [%_small_result11, %_is_small_lbl11], [%_large_result11, %_is_large_lbl11]
   %_result_ext11 = zext i1 %_result_bit11 to i64
   %_loc_4 = bitcast i64 %_result_ext11 to i64

   ; #If_Op at 208:13
   %_if_source_val12 = bitcast i64 %_loc_4 to i64
   %_if_source_trunc12 = icmp eq i64 %_if_source_val12, 1
   br i1 %_if_source_trunc12, label %_lbl13, label %_lbl30

_lbl13:
   ; #Declare_Obj_Op at 208:9

   ; #Copy_Word_Op at 208:9
   %_source14 = bitcast i64* %_loc_5 to i64* 
   %_source_val14 = load i64, i64* %_source14
   %_dest14 = bitcast i64* %_loc_8 to i64* 
   store i64 %_source_val14, i64* %_dest14

   br label %_lbl15

_lbl15:
   ; #Copy_Word_Op at 209:16
   %_source15 = bitcast i64* %_loc_8 to i64* 
   %_source_val15 = load i64, i64* %_source15
   %_loc_11 = bitcast i64 %_source_val15 to i64

   ; #Copy_Word_Op at 209:24
   %_source_val16 = bitcast i64 %_formal_param_1 to i64
   %_loc_12 = bitcast i64 %_source_val16 to i64

   ; #Call_Op at 209:21
   ; inlining call on "in"
   %_call17_Static_Link = getelementptr i64, i64* %_Static_Link, i64 0

   ; #Store_Local_Null_Op at 244:16
   %_cur_td.I17.1 = bitcast i64* %_call17_Static_Link to %struct.TD*
   %_param_arr_ptr.I17.1 = getelementptr %struct.TD, %struct.TD* %_cur_td.I17.1, i32 0, i32 26
   %_param_arr.I17.1 = load %struct.ParamInfo*, %struct.ParamInfo** %_param_arr_ptr.I17.1
   %_formal_td_ptr_ptr.I17.1 = getelementptr %struct.ParamInfo, %struct.ParamInfo* %_param_arr.I17.1, i32 0, i32 1, i32 0
   %_formal_td.I17.1 = load %struct.TD*, %struct.TD** %_formal_td_ptr_ptr.I17.1
   %_desc.I17.1 = bitcast %struct.TD* %_formal_td.I17.1 to i64*
   %_td.I17.1 = bitcast i64* %_desc.I17.1 to %struct.TD*
   %_is_small_ptr.I17.1 = getelementptr %struct.TD, %struct.TD* %_td.I17.1, i32 0, i32 13
   %_is_small.I17.1 = load i8, i8* %_is_small_ptr.I17.1
   %_is_small_bool.I17.1 = trunc i8 %_is_small.I17.1 to i1
   %_small_null_ptr.I17.1 = getelementptr %struct.TD, %struct.TD* %_td.I17.1, i32 0, i32 17
   %_small_null.I17.1 = load i64, i64* %_small_null_ptr.I17.1
   %_ctx.I17.1 = bitcast i64* %_Context to %struct.ExecCtx*
   %_large_null_ptr.I17.1 = getelementptr %struct.ExecCtx, %struct.ExecCtx* %_ctx.I17.1, i32 0, i32 1
   %_large_null.I17.1 = load i64, i64* %_large_null_ptr.I17.1
   %_null.I17.1= select i1 %_is_small_bool.I17.1, i64 %_small_null.I17.1, i64 %_large_null.I17.1
   %_loc_.I17_3 = bitcast i64 %_null.I17.1 to i64

   ; #Copy_Word_Op at 244:28
   %_source_val.I17.2 = bitcast i64 %_loc_12 to i64
   %_loc_.I17_6 = bitcast i64 %_source_val.I17.2 to i64

   ; #Copy_Word_Op at 244:34
   %_reg.I17.3_1 = inttoptr i64 %_loc_.I17_6 to i64*
   %_source.I17.3 = getelementptr i64, i64* %_reg.I17.3_1, i64 1
   %_source_val.I17.3 = load i64, i64* %_source.I17.3
   %_loc_.I17_4 = bitcast i64 %_source_val.I17.3 to i64

   ; #Copy_Word_Op at 244:41
   %_source_val.I17.4 = bitcast i64 %_loc_11 to i64
   %_loc_.I17_5 = bitcast i64 %_source_val.I17.4 to i64

   ; #Call_Op at 244:16
   %_cur_td.I17.5 = bitcast i64* %_call17_Static_Link to %struct.TD*
   %_nested_types_arr_ptr.I17.5 = getelementptr %struct.TD, %struct.TD* %_cur_td.I17.5, i32 0, i32 35
   %_nested_types_arr.I17.5 = load %struct.TD**, %struct.TD*** %_nested_types_arr_ptr.I17.5
   %_nested_td_ptr_ptr.I17.5 = getelementptr %struct.TD*, %struct.TD** %_nested_types_arr.I17.5, i32 0
   %_nested_td.I17.5 = load %struct.TD*, %struct.TD** %_nested_td_ptr_ptr.I17.5
   %_call.I17.5_Static_Link = bitcast %struct.TD* %_nested_td.I17.5 to i64*
   %_new_result.I17.5_0 = call i64 @"PSL.Core.AA_Tree.Overlapping"(i64 %_loc_.I17_4, i64 %_loc_.I17_5, i64* %_Context, i64* %_call.I17.5_Static_Link, i64 %_loc_.I17_3)
   %_loc_.I17_2 = bitcast i64 %_new_result.I17.5_0 to i64

   ; #Not_Null_Op at 244:16
   %_arg.I17.6 = bitcast i64 %_loc_.I17_2 to i64
   %_cur_td.I17.6 = bitcast i64* %_call17_Static_Link to %struct.TD*
   %_param_arr_ptr.I17.6 = getelementptr %struct.TD, %struct.TD* %_cur_td.I17.6, i32 0, i32 26
   %_param_arr.I17.6 = load %struct.ParamInfo*, %struct.ParamInfo** %_param_arr_ptr.I17.6
   %_formal_td_ptr_ptr.I17.6 = getelementptr %struct.ParamInfo, %struct.ParamInfo* %_param_arr.I17.6, i32 0, i32 1, i32 0
   %_formal_td.I17.6 = load %struct.TD*, %struct.TD** %_formal_td_ptr_ptr.I17.6
   %_desc.I17.6 = bitcast %struct.TD* %_formal_td.I17.6 to i64*
   %_td.I17.6 = bitcast i64* %_desc.I17.6 to %struct.TD*
   %_is_small_ptr.I17.6 = getelementptr %struct.TD, %struct.TD* %_td.I17.6, i32 0, i32 13
   %_is_small.I17.6 = load i8, i8* %_is_small_ptr.I17.6
   %_is_small_bool.I17.6 = trunc i8 %_is_small.I17.6 to i1
   br i1 %_is_small_bool.I17.6, label %_is_small_lbl.I17.6, label %_is_large_lbl.I17.6
   _is_small_lbl.I17.6:
   %_small_null_ptr.I17.6 = getelementptr %struct.TD, %struct.TD* %_td.I17.6, i32 0, i32 17
   %_small_null.I17.6 = load i64, i64* %_small_null_ptr.I17.6
   %_small_result.I17.6 = icmp ne i64 %_arg.I17.6, %_small_null.I17.6
   br label %_join.I17.6
   _is_large_lbl.I17.6:
   %_val_no_reg.I17.6 = and i64 %_arg.I17.6, -4294967295
   %_large_result.I17.6 = icmp ne i64 %_val_no_reg.I17.6, -144115188075855871
   br label %_join.I17.6
   _join.I17.6:
   %_result_bit.I17.6 = phi i1 [%_small_result.I17.6, %_is_small_lbl.I17.6], [%_large_result.I17.6, %_is_large_lbl.I17.6]
   %_result_ext.I17.6 = zext i1 %_result_bit.I17.6 to i64
   %_loc_.I17_1 = bitcast i64 %_result_ext.I17.6 to i64

   ; #Copy_Word_Op at 244:9
   %_source_val.I17.7 = bitcast i64 %_loc_.I17_1 to i64
   %_dest.I17.7 = bitcast i64* %_output.I17 to i64*
   store i64 %_source_val.I17.7, i64* %_dest.I17.7

   ; #Check_Not_Null_Op at 244:9
   %_arg_ptr.I17.8 = bitcast i64* %_output.I17 to i64*
   %_arg.I17.8 = load i64, i64* %_arg_ptr.I17.8
   %_is_null.I17.8 = icmp eq i64 %_arg.I17.8, shl (i64 1, i64 63)
   br i1 %_is_null.I17.8, label %_fail.I17.8, label %_lbl.I17_9
   _fail.I17.8:
   %_str_ptr_ptr.I17.8 = load i64*, i64** @$Strings
   %_str_ptr.I17.8 = getelementptr i64, i64* %_str_ptr_ptr.I17.8, i64 24
   %_assert_str.I17.8 = load i64, i64* %_str_ptr.I17.8
   store i64 %_assert_str.I17.8, i64* %_print_param.I17.8
   call void @_psc_runtime_message(i64* %_Context, i64* %_print_param.I17.8, i64* null)

   br label %_lbl.I17_9

_lbl.I17_9:
   ; #Return_Op at 244:9

   %_new_result17 = load i64, i64* %_output.I17
   %_loc_9 = bitcast i64 %_new_result17 to i64

   ; #If_Op at 209:21
   %_if_source_val18 = bitcast i64 %_loc_9 to i64
   %_if_source_trunc18 = icmp eq i64 %_if_source_val18, 1
   br i1 %_if_source_trunc18, label %_lbl19, label %_lbl22

_lbl19:
   ; #Store_Address_Op at 210:17
   %_addr19 = getelementptr i64, i64* %_Param_Area, i64 0
   %_loc_13 = bitcast i64* %_addr19 to i64*

   ; #Copy_Word_Op at 210:27
   %_source20 = bitcast i64* %_loc_8 to i64* 
   %_source_val20 = load i64, i64* %_source20
   %_loc_14 = bitcast i64 %_source_val20 to i64

   ; #Call_Op at 210:17
   ; inlining call on "|="
   %_call21_Static_Link = getelementptr i64, i64* %_Static_Link, i64 0

   ; #Copy_Address_Op at 136:9
   %_source_val.I21.1 = bitcast i64* %_loc_13 to i64*
   %_loc_.I21_4 = bitcast i64* %_source_val.I21.1 to i64*

   ; #Copy_Word_Op at 136:9
   %_reg.I21.2_1 = bitcast i64* %_loc_.I21_4 to i64*
   %_source.I21.2 = getelementptr i64, i64* %_reg.I21.2_1, i64 0
   %_source_val.I21.2 = load i64, i64* %_source.I21.2
   %_loc_.I21_3 = bitcast i64 %_source_val.I21.2 to i64

   ; #Store_Address_Op at 136:14
   %_reg.I21.3_1 = inttoptr i64 %_loc_.I21_3 to i64*
   %_addr.I21.3 = getelementptr i64, i64* %_reg.I21.3_1, i64 1
   %_loc_.I21_1 = bitcast i64* %_addr.I21.3 to i64*

   ; #Copy_Word_Op at 136:23
   %_source_val.I21.4 = bitcast i64 %_loc_14 to i64
   %_loc_.I21_2 = bitcast i64 %_source_val.I21.4 to i64

   ; #Call_Op at 136:14
   %_cur_td.I21.5 = bitcast i64* %_call21_Static_Link to %struct.TD*
   %_nested_types_arr_ptr.I21.5 = getelementptr %struct.TD, %struct.TD* %_cur_td.I21.5, i32 0, i32 35
   %_nested_types_arr.I21.5 = load %struct.TD**, %struct.TD*** %_nested_types_arr_ptr.I21.5
   %_nested_td_ptr_ptr.I21.5 = getelementptr %struct.TD*, %struct.TD** %_nested_types_arr.I21.5, i32 0
   %_nested_td.I21.5 = load %struct.TD*, %struct.TD** %_nested_td_ptr_ptr.I21.5
   %_call.I21.5_Static_Link = bitcast %struct.TD* %_nested_td.I21.5 to i64*
   call void @"PSL.Core.AA_Tree.Insert"(i64* %_loc_.I21_1, i64 %_loc_.I21_2, i64* %_Context, i64* %_call.I21.5_Static_Link)

   ; #Copy_Address_Op at 137:9
   %_source_val.I21.6 = bitcast i64* %_loc_13 to i64*
   %_loc_.I21_7 = bitcast i64* %_source_val.I21.6 to i64*

   ; #Copy_Word_Op at 137:9
   %_reg.I21.7_1 = bitcast i64* %_loc_.I21_7 to i64*
   %_source.I21.7 = getelementptr i64, i64* %_reg.I21.7_1, i64 0
   %_source_val.I21.7 = load i64, i64* %_source.I21.7
   %_loc_.I21_6 = bitcast i64 %_source_val.I21.7 to i64

   ; #Copy_Address_Op at 137:29
   %_source_val.I21.8 = bitcast i64* %_loc_13 to i64*
   %_loc_.I21_11 = bitcast i64* %_source_val.I21.8 to i64*

   ; #Copy_Word_Op at 137:29
   %_reg.I21.9_1 = bitcast i64* %_loc_.I21_11 to i64*
   %_source.I21.9 = getelementptr i64, i64* %_reg.I21.9_1, i64 0
   %_source_val.I21.9 = load i64, i64* %_source.I21.9
   %_loc_.I21_10 = bitcast i64 %_source_val.I21.9 to i64

   ; #Copy_Word_Op at 137:34
   %_reg.I21.10_1 = inttoptr i64 %_loc_.I21_10 to i64*
   %_source.I21.10 = getelementptr i64, i64* %_reg.I21.10_1, i64 1
   %_source_val.I21.10 = load i64, i64* %_source.I21.10
   %_loc_.I21_9 = bitcast i64 %_source_val.I21.10 to i64

   ; #Call_Op at 137:23
   %_cur_td.I21.11 = bitcast i64* %_call21_Static_Link to %struct.TD*
   %_nested_types_arr_ptr.I21.11 = getelementptr %struct.TD, %struct.TD* %_cur_td.I21.11, i32 0, i32 35
   %_nested_types_arr.I21.11 = load %struct.TD**, %struct.TD*** %_nested_types_arr_ptr.I21.11
   %_nested_td_ptr_ptr.I21.11 = getelementptr %struct.TD*, %struct.TD** %_nested_types_arr.I21.11, i32 0
   %_nested_td.I21.11 = load %struct.TD*, %struct.TD** %_nested_td_ptr_ptr.I21.11
   %_call.I21.11_Static_Link = bitcast %struct.TD* %_nested_td.I21.11 to i64*
   %_new_result.I21.11_0 = call i64 @"PSL.Core.AA_Tree.Count"(i64 %_loc_.I21_9, i64* %_Context, i64* %_call.I21.11_Static_Link)
   %_loc_.I21_5 = bitcast i64 %_new_result.I21.11_0 to i64

   ; #Copy_Word_Op at 137:14
   %_source_val.I21.12 = bitcast i64 %_loc_.I21_5 to i64
   %_reg.I21.12_2 = inttoptr i64 %_loc_.I21_6 to i64*
   %_dest.I21.12 = getelementptr i64, i64* %_reg.I21.12_2, i64 2
   store i64 %_source_val.I21.12, i64* %_dest.I21.12

   ; #Return_Op at 138:5


   br label %_lbl22

_lbl22:
   ; #Declare_Obj_Op at 208:13

   ; #Store_Null_Of_Same_Stg_Rgn_Op at 208:13
   %_cur_td23 = bitcast i64* %_Static_Link to %struct.TD*
   %_param_arr_ptr23 = getelementptr %struct.TD, %struct.TD* %_cur_td23, i32 0, i32 26
   %_param_arr23 = load %struct.ParamInfo*, %struct.ParamInfo** %_param_arr_ptr23
   %_formal_td_ptr_ptr23 = getelementptr %struct.ParamInfo, %struct.ParamInfo* %_param_arr23, i32 0, i32 1, i32 0
   %_formal_td23 = load %struct.TD*, %struct.TD** %_formal_td_ptr_ptr23
   %_desc23 = bitcast %struct.TD* %_formal_td23 to i64*
   %_source_ptr23 = bitcast i64* %_loc_3 to i64* 
   %_source23 = load i64, i64* %_source_ptr23
   %_td23 = bitcast i64* %_desc23 to %struct.TD*
   %_is_small_ptr23 = getelementptr %struct.TD, %struct.TD* %_td23, i32 0, i32 13
   %_is_small23 = load i8, i8* %_is_small_ptr23
   %_is_small_bool23 = trunc i8 %_is_small23 to i1
   br i1 %_is_small_bool23, label %_small_label23, label %_large_label23
   _small_label23:
   %_small_null_ptr23 = getelementptr %struct.TD, %struct.TD* %_td23, i32 0, i32 17
   %_small_null23 = load i64, i64* %_small_null_ptr23
   br label %_join_small_and_large23
   _large_label23:
   %_high_and_low_bits23 = and i64 %_source23, or (i64 shl (i64 1, i64 63), i64 1)
   %_is_special_bit23 = icmp eq i64 %_high_and_low_bits23, or (i64 shl (i64 1, i64 63), i64 1)
   br i1 %_is_special_bit23, label %_is_special_label23, label %_not_special_label23
   _is_special_label23:
   %_spcl_rgn_times2_23 = and i64 %_source23, 4294967295
   br label %_last_large_label23
   _not_special_label23:
   %_header_ptr23 = inttoptr i64 %_source23 to i64*
   %_hdr_of_src23 = load i64, i64* %_header_ptr23
   %_region_bits23 = and i64 %_hdr_of_src23, 4294901760
   %_normal_rgn_times2_23 = lshr i64 %_region_bits23, 15
   br label %_last_large_label23
   _last_large_label23:
   %_rgn_times2_23 = phi i64 [%_spcl_rgn_times2_23, %_is_special_label23], [%_normal_rgn_times2_23, %_not_special_label23]
   %_large_null23 = or i64 -144115188075855871, %_rgn_times2_23
   br label %_join_small_and_large23
   _join_small_and_large23:
   %_null23 = phi i64 [%_small_null23, %_small_label23],[%_large_null23, %_last_large_label23]
   %_loc_17 = bitcast i64 %_null23 to i64

   ; #Store_Address_Op at 208:21
   %_addr24 = bitcast i64* %_loc_3 to i64* 
   %_loc_18 = bitcast i64* %_addr24 to i64*

   ; #Call_Op at 208:21
   %_call25_Static_Link = getelementptr i64, i64* %_Static_Link, i64 0
   %_new_result25_0 = call i64 @"PSL.Containers.Ordered_Set.Remove_Any"(i64* %_loc_18, i64* %_Context, i64* %_call25_Static_Link, i64 %_loc_17)
   %_result_addr25_0 = bitcast i64* %_loc_16 to i64* 
   store i64 %_new_result25_0, i64* %_result_addr25_0

   ; #Not_Null_Op at 208:21
   %_arg_ptr26 = bitcast i64* %_loc_16 to i64* 
   %_arg26 = load i64, i64* %_arg_ptr26
   %_cur_td26 = bitcast i64* %_Static_Link to %struct.TD*
   %_param_arr_ptr26 = getelementptr %struct.TD, %struct.TD* %_cur_td26, i32 0, i32 26
   %_param_arr26 = load %struct.ParamInfo*, %struct.ParamInfo** %_param_arr_ptr26
   %_formal_td_ptr_ptr26 = getelementptr %struct.ParamInfo, %struct.ParamInfo* %_param_arr26, i32 0, i32 1, i32 0
   %_formal_td26 = load %struct.TD*, %struct.TD** %_formal_td_ptr_ptr26
   %_desc26 = bitcast %struct.TD* %_formal_td26 to i64*
   %_td26 = bitcast i64* %_desc26 to %struct.TD*
   %_is_small_ptr26 = getelementptr %struct.TD, %struct.TD* %_td26, i32 0, i32 13
   %_is_small26 = load i8, i8* %_is_small_ptr26
   %_is_small_bool26 = trunc i8 %_is_small26 to i1
   br i1 %_is_small_bool26, label %_is_small_lbl26, label %_is_large_lbl26
   _is_small_lbl26:
   %_small_null_ptr26 = getelementptr %struct.TD, %struct.TD* %_td26, i32 0, i32 17
   %_small_null26 = load i64, i64* %_small_null_ptr26
   %_small_result26 = icmp ne i64 %_arg26, %_small_null26
   br label %_join26
   _is_large_lbl26:
   %_val_no_reg26 = and i64 %_arg26, -4294967295
   %_large_result26 = icmp ne i64 %_val_no_reg26, -144115188075855871
   br label %_join26
   _join26:
   %_result_bit26 = phi i1 [%_small_result26, %_is_small_lbl26], [%_large_result26, %_is_large_lbl26]
   %_result_ext26 = zext i1 %_result_bit26 to i64
   %_loc_15 = bitcast i64 %_result_ext26 to i64

   ; #If_Op at 208:13
   %_if_source_val27 = bitcast i64 %_loc_15 to i64
   %_if_source_trunc27 = icmp eq i64 %_if_source_val27, 1
   br i1 %_if_source_trunc27, label %_lbl28, label %_lbl30

_lbl28:
   ; #Copy_Word_Op at 208:13
   %_source28 = bitcast i64* %_loc_16 to i64* 
   %_source_val28 = load i64, i64* %_source28
   %_dest28 = bitcast i64* %_loc_8 to i64* 
   store i64 %_source_val28, i64* %_dest28

   ; #Skip_Op at 208:9
   br label %_lbl15

_lbl30:
   ; #Check_Not_Null_Op at 213:5
   %_arg_ptr30 = getelementptr i64, i64* %_Param_Area, i64 0
   %_arg30 = load i64, i64* %_arg_ptr30
   %_val_no_reg30 = and i64 %_arg30, -4294967295
   %_is_null30 = icmp eq i64 %_val_no_reg30, -144115188075855871
   br i1 %_is_null30, label %_fail30, label %_lbl31
   _fail30:
   %_str_ptr_ptr30 = load i64*, i64** @$Strings
   %_str_ptr30 = getelementptr i64, i64* %_str_ptr_ptr30, i64 25
   %_assert_str30 = load i64, i64* %_str_ptr30
   store i64 %_assert_str30, i64* %_print_param30
   call void @_psc_runtime_message(i64* %_Context, i64* %_print_param30, i64* null)

   br label %_lbl31

_lbl31:
   ; #Return_Op at 213:5
   call void @_psc_finalize_stg_rgn(i64* %_Context, i64* %_Local_Area)
   %_result_reg31 = load i64, i64* %_Param_Area
   ret i64 %_result_reg31

}

define void @"PSL.Containers.Ordered_Set.$and=$"(i64* %_formal_param_0, i64 %_formal_param_1, i64* %_Context, i64* %_Static_Link) {
   %_Local_Area = alloca i64, i64 4
   %_sl = ptrtoint i64* %_Static_Link to i64
   store i64 %_sl, i64* %_Local_Area
   call void @_psc_initialize_stg_rgn(i64* %_Context, i64* %_Local_Area)
   %_Master = alloca i64, i64 3
   %_ms = ptrtoint i64* %_Master to i64
   %_store_ms = getelementptr i64, i64* %_Local_Area, i64 3
   store i64 %_ms, i64* %_store_ms

   %_loc_1 = alloca i64
   %_loc_4 = alloca i64
   %_loc_7 = alloca i64
   %_output.I15 = alloca i64
   %_print_param.I15.8 = alloca i64
   %_loc_18 = alloca i64

   
   ; #Declare_Obj_Op at 217:13

   ; #Store_Local_Null_Op at 217:13
   %_ctx2 = bitcast i64* %_Context to %struct.ExecCtx*
   %_large_null_ptr2 = getelementptr %struct.ExecCtx, %struct.ExecCtx* %_ctx2, i32 0, i32 1
   %_null2 = load i64, i64* %_large_null_ptr2
   %_dest_ptr2 = bitcast i64* %_loc_1 to i64* 
   store i64 %_null2, i64* %_dest_ptr2

   ; #Copy_Address_Op at 217:21
   %_source_val3 = bitcast i64* %_formal_param_0 to i64*
   %_loc_2 = bitcast i64* %_source_val3 to i64*

   ; #Make_Copy_In_Stg_Rgn_Op at 217:21
   %_desc4 = getelementptr i64, i64* %_Static_Link, i64 0
   %_reg4_2 = bitcast i64* %_loc_2 to i64*
   %_source_ptr4 = getelementptr i64, i64* %_reg4_2, i64 0
   %_source4 = load i64, i64* %_source_ptr4
   %_existing_ptr4 = bitcast i64* %_loc_1 to i64* 
   %_existing_obj4 = load i64, i64* %_existing_ptr4
   %_result4 = call i64 @_psc_copy_object(i64* %_Context, i64* %_desc4, i64 %_source4, i64 %_existing_obj4)
   %_dest_ptr4 = bitcast i64* %_loc_1 to i64* 
   store i64 %_result4, i64* %_dest_ptr4

   ; #Declare_Obj_Op at 217:13

   ; #Store_Null_Of_Same_Stg_Rgn_Op at 217:13
   %_cur_td6 = bitcast i64* %_Static_Link to %struct.TD*
   %_param_arr_ptr6 = getelementptr %struct.TD, %struct.TD* %_cur_td6, i32 0, i32 26
   %_param_arr6 = load %struct.ParamInfo*, %struct.ParamInfo** %_param_arr_ptr6
   %_formal_td_ptr_ptr6 = getelementptr %struct.ParamInfo, %struct.ParamInfo* %_param_arr6, i32 0, i32 1, i32 0
   %_formal_td6 = load %struct.TD*, %struct.TD** %_formal_td_ptr_ptr6
   %_desc6 = bitcast %struct.TD* %_formal_td6 to i64*
   %_source_ptr6 = bitcast i64* %_loc_1 to i64* 
   %_source6 = load i64, i64* %_source_ptr6
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
   %_loc_5 = bitcast i64 %_null6 to i64

   ; #Store_Address_Op at 217:21
   %_addr7 = bitcast i64* %_loc_1 to i64* 
   %_loc_6 = bitcast i64* %_addr7 to i64*

   ; #Call_Op at 217:21
   %_call8_Static_Link = getelementptr i64, i64* %_Static_Link, i64 0
   %_new_result8_0 = call i64 @"PSL.Containers.Ordered_Set.Remove_Any"(i64* %_loc_6, i64* %_Context, i64* %_call8_Static_Link, i64 %_loc_5)
   %_result_addr8_0 = bitcast i64* %_loc_4 to i64* 
   store i64 %_new_result8_0, i64* %_result_addr8_0

   ; #Not_Null_Op at 217:21
   %_arg_ptr9 = bitcast i64* %_loc_4 to i64* 
   %_arg9 = load i64, i64* %_arg_ptr9
   %_cur_td9 = bitcast i64* %_Static_Link to %struct.TD*
   %_param_arr_ptr9 = getelementptr %struct.TD, %struct.TD* %_cur_td9, i32 0, i32 26
   %_param_arr9 = load %struct.ParamInfo*, %struct.ParamInfo** %_param_arr_ptr9
   %_formal_td_ptr_ptr9 = getelementptr %struct.ParamInfo, %struct.ParamInfo* %_param_arr9, i32 0, i32 1, i32 0
   %_formal_td9 = load %struct.TD*, %struct.TD** %_formal_td_ptr_ptr9
   %_desc9 = bitcast %struct.TD* %_formal_td9 to i64*
   %_td9 = bitcast i64* %_desc9 to %struct.TD*
   %_is_small_ptr9 = getelementptr %struct.TD, %struct.TD* %_td9, i32 0, i32 13
   %_is_small9 = load i8, i8* %_is_small_ptr9
   %_is_small_bool9 = trunc i8 %_is_small9 to i1
   br i1 %_is_small_bool9, label %_is_small_lbl9, label %_is_large_lbl9
   _is_small_lbl9:
   %_small_null_ptr9 = getelementptr %struct.TD, %struct.TD* %_td9, i32 0, i32 17
   %_small_null9 = load i64, i64* %_small_null_ptr9
   %_small_result9 = icmp ne i64 %_arg9, %_small_null9
   br label %_join9
   _is_large_lbl9:
   %_val_no_reg9 = and i64 %_arg9, -4294967295
   %_large_result9 = icmp ne i64 %_val_no_reg9, -144115188075855871
   br label %_join9
   _join9:
   %_result_bit9 = phi i1 [%_small_result9, %_is_small_lbl9], [%_large_result9, %_is_large_lbl9]
   %_result_ext9 = zext i1 %_result_bit9 to i64
   %_loc_3 = bitcast i64 %_result_ext9 to i64

   ; #If_Op at 217:13
   %_if_source_val10 = bitcast i64 %_loc_3 to i64
   %_if_source_trunc10 = icmp eq i64 %_if_source_val10, 1
   br i1 %_if_source_trunc10, label %_lbl11, label %_lbl30

_lbl11:
   ; #Declare_Obj_Op at 217:9

   ; #Copy_Word_Op at 217:9
   %_source12 = bitcast i64* %_loc_4 to i64* 
   %_source_val12 = load i64, i64* %_source12
   %_dest12 = bitcast i64* %_loc_7 to i64* 
   store i64 %_source_val12, i64* %_dest12

   br label %_lbl13

_lbl13:
   ; #Copy_Word_Op at 218:16
   %_source13 = bitcast i64* %_loc_7 to i64* 
   %_source_val13 = load i64, i64* %_source13
   %_loc_12 = bitcast i64 %_source_val13 to i64

   ; #Copy_Word_Op at 218:28
   %_source_val14 = bitcast i64 %_formal_param_1 to i64
   %_loc_13 = bitcast i64 %_source_val14 to i64

   ; #Call_Op at 218:21
   ; inlining call on "in"
   %_call15_Static_Link = getelementptr i64, i64* %_Static_Link, i64 0

   ; #Store_Local_Null_Op at 244:16
   %_cur_td.I15.1 = bitcast i64* %_call15_Static_Link to %struct.TD*
   %_param_arr_ptr.I15.1 = getelementptr %struct.TD, %struct.TD* %_cur_td.I15.1, i32 0, i32 26
   %_param_arr.I15.1 = load %struct.ParamInfo*, %struct.ParamInfo** %_param_arr_ptr.I15.1
   %_formal_td_ptr_ptr.I15.1 = getelementptr %struct.ParamInfo, %struct.ParamInfo* %_param_arr.I15.1, i32 0, i32 1, i32 0
   %_formal_td.I15.1 = load %struct.TD*, %struct.TD** %_formal_td_ptr_ptr.I15.1
   %_desc.I15.1 = bitcast %struct.TD* %_formal_td.I15.1 to i64*
   %_td.I15.1 = bitcast i64* %_desc.I15.1 to %struct.TD*
   %_is_small_ptr.I15.1 = getelementptr %struct.TD, %struct.TD* %_td.I15.1, i32 0, i32 13
   %_is_small.I15.1 = load i8, i8* %_is_small_ptr.I15.1
   %_is_small_bool.I15.1 = trunc i8 %_is_small.I15.1 to i1
   %_small_null_ptr.I15.1 = getelementptr %struct.TD, %struct.TD* %_td.I15.1, i32 0, i32 17
   %_small_null.I15.1 = load i64, i64* %_small_null_ptr.I15.1
   %_ctx.I15.1 = bitcast i64* %_Context to %struct.ExecCtx*
   %_large_null_ptr.I15.1 = getelementptr %struct.ExecCtx, %struct.ExecCtx* %_ctx.I15.1, i32 0, i32 1
   %_large_null.I15.1 = load i64, i64* %_large_null_ptr.I15.1
   %_null.I15.1= select i1 %_is_small_bool.I15.1, i64 %_small_null.I15.1, i64 %_large_null.I15.1
   %_loc_.I15_3 = bitcast i64 %_null.I15.1 to i64

   ; #Copy_Word_Op at 244:28
   %_source_val.I15.2 = bitcast i64 %_loc_13 to i64
   %_loc_.I15_6 = bitcast i64 %_source_val.I15.2 to i64

   ; #Copy_Word_Op at 244:34
   %_reg.I15.3_1 = inttoptr i64 %_loc_.I15_6 to i64*
   %_source.I15.3 = getelementptr i64, i64* %_reg.I15.3_1, i64 1
   %_source_val.I15.3 = load i64, i64* %_source.I15.3
   %_loc_.I15_4 = bitcast i64 %_source_val.I15.3 to i64

   ; #Copy_Word_Op at 244:41
   %_source_val.I15.4 = bitcast i64 %_loc_12 to i64
   %_loc_.I15_5 = bitcast i64 %_source_val.I15.4 to i64

   ; #Call_Op at 244:16
   %_cur_td.I15.5 = bitcast i64* %_call15_Static_Link to %struct.TD*
   %_nested_types_arr_ptr.I15.5 = getelementptr %struct.TD, %struct.TD* %_cur_td.I15.5, i32 0, i32 35
   %_nested_types_arr.I15.5 = load %struct.TD**, %struct.TD*** %_nested_types_arr_ptr.I15.5
   %_nested_td_ptr_ptr.I15.5 = getelementptr %struct.TD*, %struct.TD** %_nested_types_arr.I15.5, i32 0
   %_nested_td.I15.5 = load %struct.TD*, %struct.TD** %_nested_td_ptr_ptr.I15.5
   %_call.I15.5_Static_Link = bitcast %struct.TD* %_nested_td.I15.5 to i64*
   %_new_result.I15.5_0 = call i64 @"PSL.Core.AA_Tree.Overlapping"(i64 %_loc_.I15_4, i64 %_loc_.I15_5, i64* %_Context, i64* %_call.I15.5_Static_Link, i64 %_loc_.I15_3)
   %_loc_.I15_2 = bitcast i64 %_new_result.I15.5_0 to i64

   ; #Not_Null_Op at 244:16
   %_arg.I15.6 = bitcast i64 %_loc_.I15_2 to i64
   %_cur_td.I15.6 = bitcast i64* %_call15_Static_Link to %struct.TD*
   %_param_arr_ptr.I15.6 = getelementptr %struct.TD, %struct.TD* %_cur_td.I15.6, i32 0, i32 26
   %_param_arr.I15.6 = load %struct.ParamInfo*, %struct.ParamInfo** %_param_arr_ptr.I15.6
   %_formal_td_ptr_ptr.I15.6 = getelementptr %struct.ParamInfo, %struct.ParamInfo* %_param_arr.I15.6, i32 0, i32 1, i32 0
   %_formal_td.I15.6 = load %struct.TD*, %struct.TD** %_formal_td_ptr_ptr.I15.6
   %_desc.I15.6 = bitcast %struct.TD* %_formal_td.I15.6 to i64*
   %_td.I15.6 = bitcast i64* %_desc.I15.6 to %struct.TD*
   %_is_small_ptr.I15.6 = getelementptr %struct.TD, %struct.TD* %_td.I15.6, i32 0, i32 13
   %_is_small.I15.6 = load i8, i8* %_is_small_ptr.I15.6
   %_is_small_bool.I15.6 = trunc i8 %_is_small.I15.6 to i1
   br i1 %_is_small_bool.I15.6, label %_is_small_lbl.I15.6, label %_is_large_lbl.I15.6
   _is_small_lbl.I15.6:
   %_small_null_ptr.I15.6 = getelementptr %struct.TD, %struct.TD* %_td.I15.6, i32 0, i32 17
   %_small_null.I15.6 = load i64, i64* %_small_null_ptr.I15.6
   %_small_result.I15.6 = icmp ne i64 %_arg.I15.6, %_small_null.I15.6
   br label %_join.I15.6
   _is_large_lbl.I15.6:
   %_val_no_reg.I15.6 = and i64 %_arg.I15.6, -4294967295
   %_large_result.I15.6 = icmp ne i64 %_val_no_reg.I15.6, -144115188075855871
   br label %_join.I15.6
   _join.I15.6:
   %_result_bit.I15.6 = phi i1 [%_small_result.I15.6, %_is_small_lbl.I15.6], [%_large_result.I15.6, %_is_large_lbl.I15.6]
   %_result_ext.I15.6 = zext i1 %_result_bit.I15.6 to i64
   %_loc_.I15_1 = bitcast i64 %_result_ext.I15.6 to i64

   ; #Copy_Word_Op at 244:9
   %_source_val.I15.7 = bitcast i64 %_loc_.I15_1 to i64
   %_dest.I15.7 = bitcast i64* %_output.I15 to i64*
   store i64 %_source_val.I15.7, i64* %_dest.I15.7

   ; #Check_Not_Null_Op at 244:9
   %_arg_ptr.I15.8 = bitcast i64* %_output.I15 to i64*
   %_arg.I15.8 = load i64, i64* %_arg_ptr.I15.8
   %_is_null.I15.8 = icmp eq i64 %_arg.I15.8, shl (i64 1, i64 63)
   br i1 %_is_null.I15.8, label %_fail.I15.8, label %_lbl.I15_9
   _fail.I15.8:
   %_str_ptr_ptr.I15.8 = load i64*, i64** @$Strings
   %_str_ptr.I15.8 = getelementptr i64, i64* %_str_ptr_ptr.I15.8, i64 24
   %_assert_str.I15.8 = load i64, i64* %_str_ptr.I15.8
   store i64 %_assert_str.I15.8, i64* %_print_param.I15.8
   call void @_psc_runtime_message(i64* %_Context, i64* %_print_param.I15.8, i64* null)

   br label %_lbl.I15_9

_lbl.I15_9:
   ; #Return_Op at 244:9

   %_new_result15 = load i64, i64* %_output.I15
   %_loc_10 = bitcast i64 %_new_result15 to i64

   ; #Call_Op at 218:21
   %_n16 = bitcast i64 %_loc_10 to i64
   %_result16 = xor i64 1, %_n16
   %_loc_8 = bitcast i64 %_result16 to i64

   ; #If_Op at 218:21
   %_if_source_val17 = bitcast i64 %_loc_8 to i64
   %_if_source_trunc17 = icmp eq i64 %_if_source_val17, 1
   br i1 %_if_source_trunc17, label %_lbl18, label %_lbl22

_lbl18:
   ; #Copy_Address_Op at 219:17
   %_source_val18 = bitcast i64* %_formal_param_0 to i64*
   %_loc_16 = bitcast i64* %_source_val18 to i64*

   ; #Store_Address_Op at 219:17
   %_reg19_1 = bitcast i64* %_loc_16 to i64*
   %_addr19 = getelementptr i64, i64* %_reg19_1, i64 0
   %_loc_14 = bitcast i64* %_addr19 to i64*

   ; #Copy_Word_Op at 219:25
   %_source20 = bitcast i64* %_loc_7 to i64* 
   %_source_val20 = load i64, i64* %_source20
   %_loc_15 = bitcast i64 %_source_val20 to i64

   ; #Call_Op at 219:17
   ; inlining call on "-="
   %_call21_Static_Link = getelementptr i64, i64* %_Static_Link, i64 0

   ; #Copy_Address_Op at 193:16
   %_source_val.I21.1 = bitcast i64* %_loc_14 to i64*
   %_loc_.I21_4 = bitcast i64* %_source_val.I21.1 to i64*

   ; #Copy_Word_Op at 193:16
   %_reg.I21.2_1 = bitcast i64* %_loc_.I21_4 to i64*
   %_source.I21.2 = getelementptr i64, i64* %_reg.I21.2_1, i64 0
   %_source_val.I21.2 = load i64, i64* %_source.I21.2
   %_loc_.I21_3 = bitcast i64 %_source_val.I21.2 to i64

   ; #Store_Address_Op at 193:9
   %_reg.I21.3_1 = inttoptr i64 %_loc_.I21_3 to i64*
   %_addr.I21.3 = getelementptr i64, i64* %_reg.I21.3_1, i64 1
   %_loc_.I21_1 = bitcast i64* %_addr.I21.3 to i64*

   ; #Copy_Word_Op at 193:25
   %_source_val.I21.4 = bitcast i64 %_loc_15 to i64
   %_loc_.I21_2 = bitcast i64 %_source_val.I21.4 to i64

   ; #Call_Op at 193:9
   %_cur_td.I21.5 = bitcast i64* %_call21_Static_Link to %struct.TD*
   %_nested_types_arr_ptr.I21.5 = getelementptr %struct.TD, %struct.TD* %_cur_td.I21.5, i32 0, i32 35
   %_nested_types_arr.I21.5 = load %struct.TD**, %struct.TD*** %_nested_types_arr_ptr.I21.5
   %_nested_td_ptr_ptr.I21.5 = getelementptr %struct.TD*, %struct.TD** %_nested_types_arr.I21.5, i32 0
   %_nested_td.I21.5 = load %struct.TD*, %struct.TD** %_nested_td_ptr_ptr.I21.5
   %_call.I21.5_Static_Link = bitcast %struct.TD* %_nested_td.I21.5 to i64*
   call void @"PSL.Core.AA_Tree.Delete"(i64* %_loc_.I21_1, i64 %_loc_.I21_2, i64* %_Context, i64* %_call.I21.5_Static_Link)

   ; #Copy_Address_Op at 194:9
   %_source_val.I21.6 = bitcast i64* %_loc_14 to i64*
   %_loc_.I21_7 = bitcast i64* %_source_val.I21.6 to i64*

   ; #Copy_Word_Op at 194:9
   %_reg.I21.7_1 = bitcast i64* %_loc_.I21_7 to i64*
   %_source.I21.7 = getelementptr i64, i64* %_reg.I21.7_1, i64 0
   %_source_val.I21.7 = load i64, i64* %_source.I21.7
   %_loc_.I21_6 = bitcast i64 %_source_val.I21.7 to i64

   ; #Copy_Address_Op at 194:26
   %_source_val.I21.8 = bitcast i64* %_loc_14 to i64*
   %_loc_.I21_11 = bitcast i64* %_source_val.I21.8 to i64*

   ; #Copy_Word_Op at 194:26
   %_reg.I21.9_1 = bitcast i64* %_loc_.I21_11 to i64*
   %_source.I21.9 = getelementptr i64, i64* %_reg.I21.9_1, i64 0
   %_source_val.I21.9 = load i64, i64* %_source.I21.9
   %_loc_.I21_10 = bitcast i64 %_source_val.I21.9 to i64

   ; #Copy_Word_Op at 194:28
   %_reg.I21.10_1 = inttoptr i64 %_loc_.I21_10 to i64*
   %_source.I21.10 = getelementptr i64, i64* %_reg.I21.10_1, i64 1
   %_source_val.I21.10 = load i64, i64* %_source.I21.10
   %_loc_.I21_9 = bitcast i64 %_source_val.I21.10 to i64

   ; #Call_Op at 194:20
   %_cur_td.I21.11 = bitcast i64* %_call21_Static_Link to %struct.TD*
   %_nested_types_arr_ptr.I21.11 = getelementptr %struct.TD, %struct.TD* %_cur_td.I21.11, i32 0, i32 35
   %_nested_types_arr.I21.11 = load %struct.TD**, %struct.TD*** %_nested_types_arr_ptr.I21.11
   %_nested_td_ptr_ptr.I21.11 = getelementptr %struct.TD*, %struct.TD** %_nested_types_arr.I21.11, i32 0
   %_nested_td.I21.11 = load %struct.TD*, %struct.TD** %_nested_td_ptr_ptr.I21.11
   %_call.I21.11_Static_Link = bitcast %struct.TD* %_nested_td.I21.11 to i64*
   %_new_result.I21.11_0 = call i64 @"PSL.Core.AA_Tree.Count"(i64 %_loc_.I21_9, i64* %_Context, i64* %_call.I21.11_Static_Link)
   %_loc_.I21_5 = bitcast i64 %_new_result.I21.11_0 to i64

   ; #Copy_Word_Op at 194:11
   %_source_val.I21.12 = bitcast i64 %_loc_.I21_5 to i64
   %_reg.I21.12_2 = inttoptr i64 %_loc_.I21_6 to i64*
   %_dest.I21.12 = getelementptr i64, i64* %_reg.I21.12_2, i64 2
   store i64 %_source_val.I21.12, i64* %_dest.I21.12

   ; #Return_Op at 195:5


   br label %_lbl22

_lbl22:
   ; #Declare_Obj_Op at 217:13

   ; #Store_Null_Of_Same_Stg_Rgn_Op at 217:13
   %_cur_td23 = bitcast i64* %_Static_Link to %struct.TD*
   %_param_arr_ptr23 = getelementptr %struct.TD, %struct.TD* %_cur_td23, i32 0, i32 26
   %_param_arr23 = load %struct.ParamInfo*, %struct.ParamInfo** %_param_arr_ptr23
   %_formal_td_ptr_ptr23 = getelementptr %struct.ParamInfo, %struct.ParamInfo* %_param_arr23, i32 0, i32 1, i32 0
   %_formal_td23 = load %struct.TD*, %struct.TD** %_formal_td_ptr_ptr23
   %_desc23 = bitcast %struct.TD* %_formal_td23 to i64*
   %_source_ptr23 = bitcast i64* %_loc_1 to i64* 
   %_source23 = load i64, i64* %_source_ptr23
   %_td23 = bitcast i64* %_desc23 to %struct.TD*
   %_is_small_ptr23 = getelementptr %struct.TD, %struct.TD* %_td23, i32 0, i32 13
   %_is_small23 = load i8, i8* %_is_small_ptr23
   %_is_small_bool23 = trunc i8 %_is_small23 to i1
   br i1 %_is_small_bool23, label %_small_label23, label %_large_label23
   _small_label23:
   %_small_null_ptr23 = getelementptr %struct.TD, %struct.TD* %_td23, i32 0, i32 17
   %_small_null23 = load i64, i64* %_small_null_ptr23
   br label %_join_small_and_large23
   _large_label23:
   %_high_and_low_bits23 = and i64 %_source23, or (i64 shl (i64 1, i64 63), i64 1)
   %_is_special_bit23 = icmp eq i64 %_high_and_low_bits23, or (i64 shl (i64 1, i64 63), i64 1)
   br i1 %_is_special_bit23, label %_is_special_label23, label %_not_special_label23
   _is_special_label23:
   %_spcl_rgn_times2_23 = and i64 %_source23, 4294967295
   br label %_last_large_label23
   _not_special_label23:
   %_header_ptr23 = inttoptr i64 %_source23 to i64*
   %_hdr_of_src23 = load i64, i64* %_header_ptr23
   %_region_bits23 = and i64 %_hdr_of_src23, 4294901760
   %_normal_rgn_times2_23 = lshr i64 %_region_bits23, 15
   br label %_last_large_label23
   _last_large_label23:
   %_rgn_times2_23 = phi i64 [%_spcl_rgn_times2_23, %_is_special_label23], [%_normal_rgn_times2_23, %_not_special_label23]
   %_large_null23 = or i64 -144115188075855871, %_rgn_times2_23
   br label %_join_small_and_large23
   _join_small_and_large23:
   %_null23 = phi i64 [%_small_null23, %_small_label23],[%_large_null23, %_last_large_label23]
   %_loc_19 = bitcast i64 %_null23 to i64

   ; #Store_Address_Op at 217:21
   %_addr24 = bitcast i64* %_loc_1 to i64* 
   %_loc_20 = bitcast i64* %_addr24 to i64*

   ; #Call_Op at 217:21
   %_call25_Static_Link = getelementptr i64, i64* %_Static_Link, i64 0
   %_new_result25_0 = call i64 @"PSL.Containers.Ordered_Set.Remove_Any"(i64* %_loc_20, i64* %_Context, i64* %_call25_Static_Link, i64 %_loc_19)
   %_result_addr25_0 = bitcast i64* %_loc_18 to i64* 
   store i64 %_new_result25_0, i64* %_result_addr25_0

   ; #Not_Null_Op at 217:21
   %_arg_ptr26 = bitcast i64* %_loc_18 to i64* 
   %_arg26 = load i64, i64* %_arg_ptr26
   %_cur_td26 = bitcast i64* %_Static_Link to %struct.TD*
   %_param_arr_ptr26 = getelementptr %struct.TD, %struct.TD* %_cur_td26, i32 0, i32 26
   %_param_arr26 = load %struct.ParamInfo*, %struct.ParamInfo** %_param_arr_ptr26
   %_formal_td_ptr_ptr26 = getelementptr %struct.ParamInfo, %struct.ParamInfo* %_param_arr26, i32 0, i32 1, i32 0
   %_formal_td26 = load %struct.TD*, %struct.TD** %_formal_td_ptr_ptr26
   %_desc26 = bitcast %struct.TD* %_formal_td26 to i64*
   %_td26 = bitcast i64* %_desc26 to %struct.TD*
   %_is_small_ptr26 = getelementptr %struct.TD, %struct.TD* %_td26, i32 0, i32 13
   %_is_small26 = load i8, i8* %_is_small_ptr26
   %_is_small_bool26 = trunc i8 %_is_small26 to i1
   br i1 %_is_small_bool26, label %_is_small_lbl26, label %_is_large_lbl26
   _is_small_lbl26:
   %_small_null_ptr26 = getelementptr %struct.TD, %struct.TD* %_td26, i32 0, i32 17
   %_small_null26 = load i64, i64* %_small_null_ptr26
   %_small_result26 = icmp ne i64 %_arg26, %_small_null26
   br label %_join26
   _is_large_lbl26:
   %_val_no_reg26 = and i64 %_arg26, -4294967295
   %_large_result26 = icmp ne i64 %_val_no_reg26, -144115188075855871
   br label %_join26
   _join26:
   %_result_bit26 = phi i1 [%_small_result26, %_is_small_lbl26], [%_large_result26, %_is_large_lbl26]
   %_result_ext26 = zext i1 %_result_bit26 to i64
   %_loc_17 = bitcast i64 %_result_ext26 to i64

   ; #If_Op at 217:13
   %_if_source_val27 = bitcast i64 %_loc_17 to i64
   %_if_source_trunc27 = icmp eq i64 %_if_source_val27, 1
   br i1 %_if_source_trunc27, label %_lbl28, label %_lbl30

_lbl28:
   ; #Copy_Word_Op at 217:13
   %_source28 = bitcast i64* %_loc_18 to i64* 
   %_source_val28 = load i64, i64* %_source28
   %_dest28 = bitcast i64* %_loc_7 to i64* 
   store i64 %_source_val28, i64* %_dest28

   ; #Skip_Op at 217:9
   br label %_lbl13

_lbl30:
   ; #Return_Op at 222:5
   call void @_psc_finalize_stg_rgn(i64* %_Context, i64* %_Local_Area)
   ret void

}

define i64 @"PSL.Containers.Ordered_Set.$xor$"(i64 %_formal_param_1, i64 %_formal_param_2, i64* %_Context, i64* %_Static_Link, i64 %_inited_output) {
   %_Local_Area = alloca i64, i64 4
   %_sl = ptrtoint i64* %_Static_Link to i64
   store i64 %_sl, i64* %_Local_Area

   %_Param_Area = alloca i64
   %_print_param6 = alloca i64

   store i64 %_inited_output, i64* %_Param_Area
   %_pa = ptrtoint i64* %_Param_Area to i64
   %_store_pa = getelementptr i64, i64* %_Local_Area, i64 1
   store i64 %_pa, i64* %_store_pa
   
   ; #Make_Copy_In_Stg_Rgn_Op at 227:19
   %_desc1 = getelementptr i64, i64* %_Static_Link, i64 0
   %_source1 = bitcast i64 %_formal_param_1 to i64
   %_existing_ptr1 = getelementptr i64, i64* %_Param_Area, i64 0
   %_existing_obj1 = load i64, i64* %_existing_ptr1
   %_result1 = call i64 @_psc_copy_object(i64* %_Context, i64* %_desc1, i64 %_source1, i64 %_existing_obj1)
   %_loc_1 = bitcast i64 %_result1 to i64

   ; #Assign_Word_Op at 227:9
   %_desc2 = getelementptr i64, i64* %_Static_Link, i64 0
   %_source2 = bitcast i64 %_loc_1 to i64
   %_dest_ptr2 = getelementptr i64, i64* %_Param_Area, i64 0
   call void @_psc_assign_word(i64* %_Context, i64* %_desc2, i64* %_dest_ptr2, i64 %_source2)

   ; #Store_Address_Op at 228:9
   %_addr3 = getelementptr i64, i64* %_Param_Area, i64 0
   %_loc_2 = bitcast i64* %_addr3 to i64*

   ; #Copy_Word_Op at 228:21
   %_source_val4 = bitcast i64 %_formal_param_2 to i64
   %_loc_3 = bitcast i64 %_source_val4 to i64

   ; #Call_Op at 228:9
   %_call5_Static_Link = getelementptr i64, i64* %_Static_Link, i64 0
   call void @"PSL.Containers.Ordered_Set.$xor=$"(i64* %_loc_2, i64 %_loc_3, i64* %_Context, i64* %_call5_Static_Link)

   ; #Check_Not_Null_Op at 229:5
   %_arg_ptr6 = getelementptr i64, i64* %_Param_Area, i64 0
   %_arg6 = load i64, i64* %_arg_ptr6
   %_val_no_reg6 = and i64 %_arg6, -4294967295
   %_is_null6 = icmp eq i64 %_val_no_reg6, -144115188075855871
   br i1 %_is_null6, label %_fail6, label %_lbl7
   _fail6:
   %_str_ptr_ptr6 = load i64*, i64** @$Strings
   %_str_ptr6 = getelementptr i64, i64* %_str_ptr_ptr6, i64 28
   %_assert_str6 = load i64, i64* %_str_ptr6
   store i64 %_assert_str6, i64* %_print_param6
   call void @_psc_runtime_message(i64* %_Context, i64* %_print_param6, i64* null)

   br label %_lbl7

_lbl7:
   ; #Return_Op at 229:5
   %_result_reg7 = load i64, i64* %_Param_Area
   ret i64 %_result_reg7

}

define void @"PSL.Containers.Ordered_Set.$xor=$"(i64* %_formal_param_0, i64 %_formal_param_1, i64* %_Context, i64* %_Static_Link) {
   %_Local_Area = alloca i64, i64 4
   %_sl = ptrtoint i64* %_Static_Link to i64
   store i64 %_sl, i64* %_Local_Area
   call void @_psc_initialize_stg_rgn(i64* %_Context, i64* %_Local_Area)
   %_Master = alloca i64, i64 3
   %_ms = ptrtoint i64* %_Master to i64
   %_store_ms = getelementptr i64, i64* %_Local_Area, i64 3
   store i64 %_ms, i64* %_store_ms

   %_loc_1 = alloca i64
   %_loc_3 = alloca i64
   %_loc_6 = alloca i64
   %_output.I15 = alloca i64
   %_print_param.I15.8 = alloca i64
   %_loc_19 = alloca i64

   
   ; #Declare_Obj_Op at 234:13

   ; #Store_Local_Null_Op at 234:13
   %_ctx2 = bitcast i64* %_Context to %struct.ExecCtx*
   %_large_null_ptr2 = getelementptr %struct.ExecCtx, %struct.ExecCtx* %_ctx2, i32 0, i32 1
   %_null2 = load i64, i64* %_large_null_ptr2
   %_dest_ptr2 = bitcast i64* %_loc_1 to i64* 
   store i64 %_null2, i64* %_dest_ptr2

   ; #Make_Copy_In_Stg_Rgn_Op at 234:21
   %_desc3 = getelementptr i64, i64* %_Static_Link, i64 0
   %_source3 = bitcast i64 %_formal_param_1 to i64
   %_existing_ptr3 = bitcast i64* %_loc_1 to i64* 
   %_existing_obj3 = load i64, i64* %_existing_ptr3
   %_result3 = call i64 @_psc_copy_object(i64* %_Context, i64* %_desc3, i64 %_source3, i64 %_existing_obj3)
   %_dest_ptr3 = bitcast i64* %_loc_1 to i64* 
   store i64 %_result3, i64* %_dest_ptr3

   ; #Declare_Obj_Op at 234:13

   ; #Store_Null_Of_Same_Stg_Rgn_Op at 234:13
   %_cur_td5 = bitcast i64* %_Static_Link to %struct.TD*
   %_param_arr_ptr5 = getelementptr %struct.TD, %struct.TD* %_cur_td5, i32 0, i32 26
   %_param_arr5 = load %struct.ParamInfo*, %struct.ParamInfo** %_param_arr_ptr5
   %_formal_td_ptr_ptr5 = getelementptr %struct.ParamInfo, %struct.ParamInfo* %_param_arr5, i32 0, i32 1, i32 0
   %_formal_td5 = load %struct.TD*, %struct.TD** %_formal_td_ptr_ptr5
   %_desc5 = bitcast %struct.TD* %_formal_td5 to i64*
   %_source_ptr5 = bitcast i64* %_loc_1 to i64* 
   %_source5 = load i64, i64* %_source_ptr5
   %_td5 = bitcast i64* %_desc5 to %struct.TD*
   %_is_small_ptr5 = getelementptr %struct.TD, %struct.TD* %_td5, i32 0, i32 13
   %_is_small5 = load i8, i8* %_is_small_ptr5
   %_is_small_bool5 = trunc i8 %_is_small5 to i1
   br i1 %_is_small_bool5, label %_small_label5, label %_large_label5
   _small_label5:
   %_small_null_ptr5 = getelementptr %struct.TD, %struct.TD* %_td5, i32 0, i32 17
   %_small_null5 = load i64, i64* %_small_null_ptr5
   br label %_join_small_and_large5
   _large_label5:
   %_high_and_low_bits5 = and i64 %_source5, or (i64 shl (i64 1, i64 63), i64 1)
   %_is_special_bit5 = icmp eq i64 %_high_and_low_bits5, or (i64 shl (i64 1, i64 63), i64 1)
   br i1 %_is_special_bit5, label %_is_special_label5, label %_not_special_label5
   _is_special_label5:
   %_spcl_rgn_times2_5 = and i64 %_source5, 4294967295
   br label %_last_large_label5
   _not_special_label5:
   %_header_ptr5 = inttoptr i64 %_source5 to i64*
   %_hdr_of_src5 = load i64, i64* %_header_ptr5
   %_region_bits5 = and i64 %_hdr_of_src5, 4294901760
   %_normal_rgn_times2_5 = lshr i64 %_region_bits5, 15
   br label %_last_large_label5
   _last_large_label5:
   %_rgn_times2_5 = phi i64 [%_spcl_rgn_times2_5, %_is_special_label5], [%_normal_rgn_times2_5, %_not_special_label5]
   %_large_null5 = or i64 -144115188075855871, %_rgn_times2_5
   br label %_join_small_and_large5
   _join_small_and_large5:
   %_null5 = phi i64 [%_small_null5, %_small_label5],[%_large_null5, %_last_large_label5]
   %_loc_4 = bitcast i64 %_null5 to i64

   ; #Store_Address_Op at 234:21
   %_addr6 = bitcast i64* %_loc_1 to i64* 
   %_loc_5 = bitcast i64* %_addr6 to i64*

   ; #Call_Op at 234:21
   %_call7_Static_Link = getelementptr i64, i64* %_Static_Link, i64 0
   %_new_result7_0 = call i64 @"PSL.Containers.Ordered_Set.Remove_Any"(i64* %_loc_5, i64* %_Context, i64* %_call7_Static_Link, i64 %_loc_4)
   %_result_addr7_0 = bitcast i64* %_loc_3 to i64* 
   store i64 %_new_result7_0, i64* %_result_addr7_0

   ; #Not_Null_Op at 234:21
   %_arg_ptr8 = bitcast i64* %_loc_3 to i64* 
   %_arg8 = load i64, i64* %_arg_ptr8
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
   br i1 %_is_small_bool8, label %_is_small_lbl8, label %_is_large_lbl8
   _is_small_lbl8:
   %_small_null_ptr8 = getelementptr %struct.TD, %struct.TD* %_td8, i32 0, i32 17
   %_small_null8 = load i64, i64* %_small_null_ptr8
   %_small_result8 = icmp ne i64 %_arg8, %_small_null8
   br label %_join8
   _is_large_lbl8:
   %_val_no_reg8 = and i64 %_arg8, -4294967295
   %_large_result8 = icmp ne i64 %_val_no_reg8, -144115188075855871
   br label %_join8
   _join8:
   %_result_bit8 = phi i1 [%_small_result8, %_is_small_lbl8], [%_large_result8, %_is_large_lbl8]
   %_result_ext8 = zext i1 %_result_bit8 to i64
   %_loc_2 = bitcast i64 %_result_ext8 to i64

   ; #If_Op at 234:13
   %_if_source_val9 = bitcast i64 %_loc_2 to i64
   %_if_source_trunc9 = icmp eq i64 %_if_source_val9, 1
   br i1 %_if_source_trunc9, label %_lbl10, label %_lbl34

_lbl10:
   ; #Declare_Obj_Op at 234:9

   ; #Copy_Word_Op at 234:9
   %_source11 = bitcast i64* %_loc_3 to i64* 
   %_source_val11 = load i64, i64* %_source11
   %_dest11 = bitcast i64* %_loc_6 to i64* 
   store i64 %_source_val11, i64* %_dest11

   br label %_lbl12

_lbl12:
   ; #Copy_Word_Op at 235:16
   %_source12 = bitcast i64* %_loc_6 to i64* 
   %_source_val12 = load i64, i64* %_source12
   %_loc_9 = bitcast i64 %_source_val12 to i64

   ; #Copy_Address_Op at 235:24
   %_source_val13 = bitcast i64* %_formal_param_0 to i64*
   %_loc_11 = bitcast i64* %_source_val13 to i64*

   ; #Copy_Word_Op at 235:24
   %_reg14_1 = bitcast i64* %_loc_11 to i64*
   %_source14 = getelementptr i64, i64* %_reg14_1, i64 0
   %_source_val14 = load i64, i64* %_source14
   %_loc_10 = bitcast i64 %_source_val14 to i64

   ; #Call_Op at 235:21
   ; inlining call on "in"
   %_call15_Static_Link = getelementptr i64, i64* %_Static_Link, i64 0

   ; #Store_Local_Null_Op at 244:16
   %_cur_td.I15.1 = bitcast i64* %_call15_Static_Link to %struct.TD*
   %_param_arr_ptr.I15.1 = getelementptr %struct.TD, %struct.TD* %_cur_td.I15.1, i32 0, i32 26
   %_param_arr.I15.1 = load %struct.ParamInfo*, %struct.ParamInfo** %_param_arr_ptr.I15.1
   %_formal_td_ptr_ptr.I15.1 = getelementptr %struct.ParamInfo, %struct.ParamInfo* %_param_arr.I15.1, i32 0, i32 1, i32 0
   %_formal_td.I15.1 = load %struct.TD*, %struct.TD** %_formal_td_ptr_ptr.I15.1
   %_desc.I15.1 = bitcast %struct.TD* %_formal_td.I15.1 to i64*
   %_td.I15.1 = bitcast i64* %_desc.I15.1 to %struct.TD*
   %_is_small_ptr.I15.1 = getelementptr %struct.TD, %struct.TD* %_td.I15.1, i32 0, i32 13
   %_is_small.I15.1 = load i8, i8* %_is_small_ptr.I15.1
   %_is_small_bool.I15.1 = trunc i8 %_is_small.I15.1 to i1
   %_small_null_ptr.I15.1 = getelementptr %struct.TD, %struct.TD* %_td.I15.1, i32 0, i32 17
   %_small_null.I15.1 = load i64, i64* %_small_null_ptr.I15.1
   %_ctx.I15.1 = bitcast i64* %_Context to %struct.ExecCtx*
   %_large_null_ptr.I15.1 = getelementptr %struct.ExecCtx, %struct.ExecCtx* %_ctx.I15.1, i32 0, i32 1
   %_large_null.I15.1 = load i64, i64* %_large_null_ptr.I15.1
   %_null.I15.1= select i1 %_is_small_bool.I15.1, i64 %_small_null.I15.1, i64 %_large_null.I15.1
   %_loc_.I15_3 = bitcast i64 %_null.I15.1 to i64

   ; #Copy_Word_Op at 244:28
   %_source_val.I15.2 = bitcast i64 %_loc_10 to i64
   %_loc_.I15_6 = bitcast i64 %_source_val.I15.2 to i64

   ; #Copy_Word_Op at 244:34
   %_reg.I15.3_1 = inttoptr i64 %_loc_.I15_6 to i64*
   %_source.I15.3 = getelementptr i64, i64* %_reg.I15.3_1, i64 1
   %_source_val.I15.3 = load i64, i64* %_source.I15.3
   %_loc_.I15_4 = bitcast i64 %_source_val.I15.3 to i64

   ; #Copy_Word_Op at 244:41
   %_source_val.I15.4 = bitcast i64 %_loc_9 to i64
   %_loc_.I15_5 = bitcast i64 %_source_val.I15.4 to i64

   ; #Call_Op at 244:16
   %_cur_td.I15.5 = bitcast i64* %_call15_Static_Link to %struct.TD*
   %_nested_types_arr_ptr.I15.5 = getelementptr %struct.TD, %struct.TD* %_cur_td.I15.5, i32 0, i32 35
   %_nested_types_arr.I15.5 = load %struct.TD**, %struct.TD*** %_nested_types_arr_ptr.I15.5
   %_nested_td_ptr_ptr.I15.5 = getelementptr %struct.TD*, %struct.TD** %_nested_types_arr.I15.5, i32 0
   %_nested_td.I15.5 = load %struct.TD*, %struct.TD** %_nested_td_ptr_ptr.I15.5
   %_call.I15.5_Static_Link = bitcast %struct.TD* %_nested_td.I15.5 to i64*
   %_new_result.I15.5_0 = call i64 @"PSL.Core.AA_Tree.Overlapping"(i64 %_loc_.I15_4, i64 %_loc_.I15_5, i64* %_Context, i64* %_call.I15.5_Static_Link, i64 %_loc_.I15_3)
   %_loc_.I15_2 = bitcast i64 %_new_result.I15.5_0 to i64

   ; #Not_Null_Op at 244:16
   %_arg.I15.6 = bitcast i64 %_loc_.I15_2 to i64
   %_cur_td.I15.6 = bitcast i64* %_call15_Static_Link to %struct.TD*
   %_param_arr_ptr.I15.6 = getelementptr %struct.TD, %struct.TD* %_cur_td.I15.6, i32 0, i32 26
   %_param_arr.I15.6 = load %struct.ParamInfo*, %struct.ParamInfo** %_param_arr_ptr.I15.6
   %_formal_td_ptr_ptr.I15.6 = getelementptr %struct.ParamInfo, %struct.ParamInfo* %_param_arr.I15.6, i32 0, i32 1, i32 0
   %_formal_td.I15.6 = load %struct.TD*, %struct.TD** %_formal_td_ptr_ptr.I15.6
   %_desc.I15.6 = bitcast %struct.TD* %_formal_td.I15.6 to i64*
   %_td.I15.6 = bitcast i64* %_desc.I15.6 to %struct.TD*
   %_is_small_ptr.I15.6 = getelementptr %struct.TD, %struct.TD* %_td.I15.6, i32 0, i32 13
   %_is_small.I15.6 = load i8, i8* %_is_small_ptr.I15.6
   %_is_small_bool.I15.6 = trunc i8 %_is_small.I15.6 to i1
   br i1 %_is_small_bool.I15.6, label %_is_small_lbl.I15.6, label %_is_large_lbl.I15.6
   _is_small_lbl.I15.6:
   %_small_null_ptr.I15.6 = getelementptr %struct.TD, %struct.TD* %_td.I15.6, i32 0, i32 17
   %_small_null.I15.6 = load i64, i64* %_small_null_ptr.I15.6
   %_small_result.I15.6 = icmp ne i64 %_arg.I15.6, %_small_null.I15.6
   br label %_join.I15.6
   _is_large_lbl.I15.6:
   %_val_no_reg.I15.6 = and i64 %_arg.I15.6, -4294967295
   %_large_result.I15.6 = icmp ne i64 %_val_no_reg.I15.6, -144115188075855871
   br label %_join.I15.6
   _join.I15.6:
   %_result_bit.I15.6 = phi i1 [%_small_result.I15.6, %_is_small_lbl.I15.6], [%_large_result.I15.6, %_is_large_lbl.I15.6]
   %_result_ext.I15.6 = zext i1 %_result_bit.I15.6 to i64
   %_loc_.I15_1 = bitcast i64 %_result_ext.I15.6 to i64

   ; #Copy_Word_Op at 244:9
   %_source_val.I15.7 = bitcast i64 %_loc_.I15_1 to i64
   %_dest.I15.7 = bitcast i64* %_output.I15 to i64*
   store i64 %_source_val.I15.7, i64* %_dest.I15.7

   ; #Check_Not_Null_Op at 244:9
   %_arg_ptr.I15.8 = bitcast i64* %_output.I15 to i64*
   %_arg.I15.8 = load i64, i64* %_arg_ptr.I15.8
   %_is_null.I15.8 = icmp eq i64 %_arg.I15.8, shl (i64 1, i64 63)
   br i1 %_is_null.I15.8, label %_fail.I15.8, label %_lbl.I15_9
   _fail.I15.8:
   %_str_ptr_ptr.I15.8 = load i64*, i64** @$Strings
   %_str_ptr.I15.8 = getelementptr i64, i64* %_str_ptr_ptr.I15.8, i64 24
   %_assert_str.I15.8 = load i64, i64* %_str_ptr.I15.8
   store i64 %_assert_str.I15.8, i64* %_print_param.I15.8
   call void @_psc_runtime_message(i64* %_Context, i64* %_print_param.I15.8, i64* null)

   br label %_lbl.I15_9

_lbl.I15_9:
   ; #Return_Op at 244:9

   %_new_result15 = load i64, i64* %_output.I15
   %_loc_7 = bitcast i64 %_new_result15 to i64

   ; #If_Op at 235:21
   %_if_source_val16 = bitcast i64 %_loc_7 to i64
   %_if_source_trunc16 = icmp eq i64 %_if_source_val16, 1
   br i1 %_if_source_trunc16, label %_lbl17, label %_lbl22

_lbl17:
   ; #Copy_Address_Op at 236:17
   %_source_val17 = bitcast i64* %_formal_param_0 to i64*
   %_loc_14 = bitcast i64* %_source_val17 to i64*

   ; #Store_Address_Op at 236:17
   %_reg18_1 = bitcast i64* %_loc_14 to i64*
   %_addr18 = getelementptr i64, i64* %_reg18_1, i64 0
   %_loc_12 = bitcast i64* %_addr18 to i64*

   ; #Copy_Word_Op at 236:25
   %_source19 = bitcast i64* %_loc_6 to i64* 
   %_source_val19 = load i64, i64* %_source19
   %_loc_13 = bitcast i64 %_source_val19 to i64

   ; #Call_Op at 236:17
   ; inlining call on "-="
   %_call20_Static_Link = getelementptr i64, i64* %_Static_Link, i64 0

   ; #Copy_Address_Op at 193:16
   %_source_val.I20.1 = bitcast i64* %_loc_12 to i64*
   %_loc_.I20_4 = bitcast i64* %_source_val.I20.1 to i64*

   ; #Copy_Word_Op at 193:16
   %_reg.I20.2_1 = bitcast i64* %_loc_.I20_4 to i64*
   %_source.I20.2 = getelementptr i64, i64* %_reg.I20.2_1, i64 0
   %_source_val.I20.2 = load i64, i64* %_source.I20.2
   %_loc_.I20_3 = bitcast i64 %_source_val.I20.2 to i64

   ; #Store_Address_Op at 193:9
   %_reg.I20.3_1 = inttoptr i64 %_loc_.I20_3 to i64*
   %_addr.I20.3 = getelementptr i64, i64* %_reg.I20.3_1, i64 1
   %_loc_.I20_1 = bitcast i64* %_addr.I20.3 to i64*

   ; #Copy_Word_Op at 193:25
   %_source_val.I20.4 = bitcast i64 %_loc_13 to i64
   %_loc_.I20_2 = bitcast i64 %_source_val.I20.4 to i64

   ; #Call_Op at 193:9
   %_cur_td.I20.5 = bitcast i64* %_call20_Static_Link to %struct.TD*
   %_nested_types_arr_ptr.I20.5 = getelementptr %struct.TD, %struct.TD* %_cur_td.I20.5, i32 0, i32 35
   %_nested_types_arr.I20.5 = load %struct.TD**, %struct.TD*** %_nested_types_arr_ptr.I20.5
   %_nested_td_ptr_ptr.I20.5 = getelementptr %struct.TD*, %struct.TD** %_nested_types_arr.I20.5, i32 0
   %_nested_td.I20.5 = load %struct.TD*, %struct.TD** %_nested_td_ptr_ptr.I20.5
   %_call.I20.5_Static_Link = bitcast %struct.TD* %_nested_td.I20.5 to i64*
   call void @"PSL.Core.AA_Tree.Delete"(i64* %_loc_.I20_1, i64 %_loc_.I20_2, i64* %_Context, i64* %_call.I20.5_Static_Link)

   ; #Copy_Address_Op at 194:9
   %_source_val.I20.6 = bitcast i64* %_loc_12 to i64*
   %_loc_.I20_7 = bitcast i64* %_source_val.I20.6 to i64*

   ; #Copy_Word_Op at 194:9
   %_reg.I20.7_1 = bitcast i64* %_loc_.I20_7 to i64*
   %_source.I20.7 = getelementptr i64, i64* %_reg.I20.7_1, i64 0
   %_source_val.I20.7 = load i64, i64* %_source.I20.7
   %_loc_.I20_6 = bitcast i64 %_source_val.I20.7 to i64

   ; #Copy_Address_Op at 194:26
   %_source_val.I20.8 = bitcast i64* %_loc_12 to i64*
   %_loc_.I20_11 = bitcast i64* %_source_val.I20.8 to i64*

   ; #Copy_Word_Op at 194:26
   %_reg.I20.9_1 = bitcast i64* %_loc_.I20_11 to i64*
   %_source.I20.9 = getelementptr i64, i64* %_reg.I20.9_1, i64 0
   %_source_val.I20.9 = load i64, i64* %_source.I20.9
   %_loc_.I20_10 = bitcast i64 %_source_val.I20.9 to i64

   ; #Copy_Word_Op at 194:28
   %_reg.I20.10_1 = inttoptr i64 %_loc_.I20_10 to i64*
   %_source.I20.10 = getelementptr i64, i64* %_reg.I20.10_1, i64 1
   %_source_val.I20.10 = load i64, i64* %_source.I20.10
   %_loc_.I20_9 = bitcast i64 %_source_val.I20.10 to i64

   ; #Call_Op at 194:20
   %_cur_td.I20.11 = bitcast i64* %_call20_Static_Link to %struct.TD*
   %_nested_types_arr_ptr.I20.11 = getelementptr %struct.TD, %struct.TD* %_cur_td.I20.11, i32 0, i32 35
   %_nested_types_arr.I20.11 = load %struct.TD**, %struct.TD*** %_nested_types_arr_ptr.I20.11
   %_nested_td_ptr_ptr.I20.11 = getelementptr %struct.TD*, %struct.TD** %_nested_types_arr.I20.11, i32 0
   %_nested_td.I20.11 = load %struct.TD*, %struct.TD** %_nested_td_ptr_ptr.I20.11
   %_call.I20.11_Static_Link = bitcast %struct.TD* %_nested_td.I20.11 to i64*
   %_new_result.I20.11_0 = call i64 @"PSL.Core.AA_Tree.Count"(i64 %_loc_.I20_9, i64* %_Context, i64* %_call.I20.11_Static_Link)
   %_loc_.I20_5 = bitcast i64 %_new_result.I20.11_0 to i64

   ; #Copy_Word_Op at 194:11
   %_source_val.I20.12 = bitcast i64 %_loc_.I20_5 to i64
   %_reg.I20.12_2 = inttoptr i64 %_loc_.I20_6 to i64*
   %_dest.I20.12 = getelementptr i64, i64* %_reg.I20.12_2, i64 2
   store i64 %_source_val.I20.12, i64* %_dest.I20.12

   ; #Return_Op at 195:5


   ; #Skip_Op at 238:17
   br label %_lbl26

_lbl22:
   ; #Copy_Address_Op at 238:17
   %_source_val22 = bitcast i64* %_formal_param_0 to i64*
   %_loc_17 = bitcast i64* %_source_val22 to i64*

   ; #Store_Address_Op at 238:17
   %_reg23_1 = bitcast i64* %_loc_17 to i64*
   %_addr23 = getelementptr i64, i64* %_reg23_1, i64 0
   %_loc_15 = bitcast i64* %_addr23 to i64*

   ; #Copy_Word_Op at 238:25
   %_source24 = bitcast i64* %_loc_6 to i64* 
   %_source_val24 = load i64, i64* %_source24
   %_loc_16 = bitcast i64 %_source_val24 to i64

   ; #Call_Op at 238:17
   ; inlining call on "|="
   %_call25_Static_Link = getelementptr i64, i64* %_Static_Link, i64 0

   ; #Copy_Address_Op at 136:9
   %_source_val.I25.1 = bitcast i64* %_loc_15 to i64*
   %_loc_.I25_4 = bitcast i64* %_source_val.I25.1 to i64*

   ; #Copy_Word_Op at 136:9
   %_reg.I25.2_1 = bitcast i64* %_loc_.I25_4 to i64*
   %_source.I25.2 = getelementptr i64, i64* %_reg.I25.2_1, i64 0
   %_source_val.I25.2 = load i64, i64* %_source.I25.2
   %_loc_.I25_3 = bitcast i64 %_source_val.I25.2 to i64

   ; #Store_Address_Op at 136:14
   %_reg.I25.3_1 = inttoptr i64 %_loc_.I25_3 to i64*
   %_addr.I25.3 = getelementptr i64, i64* %_reg.I25.3_1, i64 1
   %_loc_.I25_1 = bitcast i64* %_addr.I25.3 to i64*

   ; #Copy_Word_Op at 136:23
   %_source_val.I25.4 = bitcast i64 %_loc_16 to i64
   %_loc_.I25_2 = bitcast i64 %_source_val.I25.4 to i64

   ; #Call_Op at 136:14
   %_cur_td.I25.5 = bitcast i64* %_call25_Static_Link to %struct.TD*
   %_nested_types_arr_ptr.I25.5 = getelementptr %struct.TD, %struct.TD* %_cur_td.I25.5, i32 0, i32 35
   %_nested_types_arr.I25.5 = load %struct.TD**, %struct.TD*** %_nested_types_arr_ptr.I25.5
   %_nested_td_ptr_ptr.I25.5 = getelementptr %struct.TD*, %struct.TD** %_nested_types_arr.I25.5, i32 0
   %_nested_td.I25.5 = load %struct.TD*, %struct.TD** %_nested_td_ptr_ptr.I25.5
   %_call.I25.5_Static_Link = bitcast %struct.TD* %_nested_td.I25.5 to i64*
   call void @"PSL.Core.AA_Tree.Insert"(i64* %_loc_.I25_1, i64 %_loc_.I25_2, i64* %_Context, i64* %_call.I25.5_Static_Link)

   ; #Copy_Address_Op at 137:9
   %_source_val.I25.6 = bitcast i64* %_loc_15 to i64*
   %_loc_.I25_7 = bitcast i64* %_source_val.I25.6 to i64*

   ; #Copy_Word_Op at 137:9
   %_reg.I25.7_1 = bitcast i64* %_loc_.I25_7 to i64*
   %_source.I25.7 = getelementptr i64, i64* %_reg.I25.7_1, i64 0
   %_source_val.I25.7 = load i64, i64* %_source.I25.7
   %_loc_.I25_6 = bitcast i64 %_source_val.I25.7 to i64

   ; #Copy_Address_Op at 137:29
   %_source_val.I25.8 = bitcast i64* %_loc_15 to i64*
   %_loc_.I25_11 = bitcast i64* %_source_val.I25.8 to i64*

   ; #Copy_Word_Op at 137:29
   %_reg.I25.9_1 = bitcast i64* %_loc_.I25_11 to i64*
   %_source.I25.9 = getelementptr i64, i64* %_reg.I25.9_1, i64 0
   %_source_val.I25.9 = load i64, i64* %_source.I25.9
   %_loc_.I25_10 = bitcast i64 %_source_val.I25.9 to i64

   ; #Copy_Word_Op at 137:34
   %_reg.I25.10_1 = inttoptr i64 %_loc_.I25_10 to i64*
   %_source.I25.10 = getelementptr i64, i64* %_reg.I25.10_1, i64 1
   %_source_val.I25.10 = load i64, i64* %_source.I25.10
   %_loc_.I25_9 = bitcast i64 %_source_val.I25.10 to i64

   ; #Call_Op at 137:23
   %_cur_td.I25.11 = bitcast i64* %_call25_Static_Link to %struct.TD*
   %_nested_types_arr_ptr.I25.11 = getelementptr %struct.TD, %struct.TD* %_cur_td.I25.11, i32 0, i32 35
   %_nested_types_arr.I25.11 = load %struct.TD**, %struct.TD*** %_nested_types_arr_ptr.I25.11
   %_nested_td_ptr_ptr.I25.11 = getelementptr %struct.TD*, %struct.TD** %_nested_types_arr.I25.11, i32 0
   %_nested_td.I25.11 = load %struct.TD*, %struct.TD** %_nested_td_ptr_ptr.I25.11
   %_call.I25.11_Static_Link = bitcast %struct.TD* %_nested_td.I25.11 to i64*
   %_new_result.I25.11_0 = call i64 @"PSL.Core.AA_Tree.Count"(i64 %_loc_.I25_9, i64* %_Context, i64* %_call.I25.11_Static_Link)
   %_loc_.I25_5 = bitcast i64 %_new_result.I25.11_0 to i64

   ; #Copy_Word_Op at 137:14
   %_source_val.I25.12 = bitcast i64 %_loc_.I25_5 to i64
   %_reg.I25.12_2 = inttoptr i64 %_loc_.I25_6 to i64*
   %_dest.I25.12 = getelementptr i64, i64* %_reg.I25.12_2, i64 2
   store i64 %_source_val.I25.12, i64* %_dest.I25.12

   ; #Return_Op at 138:5


   br label %_lbl26

_lbl26:
   ; #Declare_Obj_Op at 234:13

   ; #Store_Null_Of_Same_Stg_Rgn_Op at 234:13
   %_cur_td27 = bitcast i64* %_Static_Link to %struct.TD*
   %_param_arr_ptr27 = getelementptr %struct.TD, %struct.TD* %_cur_td27, i32 0, i32 26
   %_param_arr27 = load %struct.ParamInfo*, %struct.ParamInfo** %_param_arr_ptr27
   %_formal_td_ptr_ptr27 = getelementptr %struct.ParamInfo, %struct.ParamInfo* %_param_arr27, i32 0, i32 1, i32 0
   %_formal_td27 = load %struct.TD*, %struct.TD** %_formal_td_ptr_ptr27
   %_desc27 = bitcast %struct.TD* %_formal_td27 to i64*
   %_source_ptr27 = bitcast i64* %_loc_1 to i64* 
   %_source27 = load i64, i64* %_source_ptr27
   %_td27 = bitcast i64* %_desc27 to %struct.TD*
   %_is_small_ptr27 = getelementptr %struct.TD, %struct.TD* %_td27, i32 0, i32 13
   %_is_small27 = load i8, i8* %_is_small_ptr27
   %_is_small_bool27 = trunc i8 %_is_small27 to i1
   br i1 %_is_small_bool27, label %_small_label27, label %_large_label27
   _small_label27:
   %_small_null_ptr27 = getelementptr %struct.TD, %struct.TD* %_td27, i32 0, i32 17
   %_small_null27 = load i64, i64* %_small_null_ptr27
   br label %_join_small_and_large27
   _large_label27:
   %_high_and_low_bits27 = and i64 %_source27, or (i64 shl (i64 1, i64 63), i64 1)
   %_is_special_bit27 = icmp eq i64 %_high_and_low_bits27, or (i64 shl (i64 1, i64 63), i64 1)
   br i1 %_is_special_bit27, label %_is_special_label27, label %_not_special_label27
   _is_special_label27:
   %_spcl_rgn_times2_27 = and i64 %_source27, 4294967295
   br label %_last_large_label27
   _not_special_label27:
   %_header_ptr27 = inttoptr i64 %_source27 to i64*
   %_hdr_of_src27 = load i64, i64* %_header_ptr27
   %_region_bits27 = and i64 %_hdr_of_src27, 4294901760
   %_normal_rgn_times2_27 = lshr i64 %_region_bits27, 15
   br label %_last_large_label27
   _last_large_label27:
   %_rgn_times2_27 = phi i64 [%_spcl_rgn_times2_27, %_is_special_label27], [%_normal_rgn_times2_27, %_not_special_label27]
   %_large_null27 = or i64 -144115188075855871, %_rgn_times2_27
   br label %_join_small_and_large27
   _join_small_and_large27:
   %_null27 = phi i64 [%_small_null27, %_small_label27],[%_large_null27, %_last_large_label27]
   %_loc_20 = bitcast i64 %_null27 to i64

   ; #Store_Address_Op at 234:21
   %_addr28 = bitcast i64* %_loc_1 to i64* 
   %_loc_21 = bitcast i64* %_addr28 to i64*

   ; #Call_Op at 234:21
   %_call29_Static_Link = getelementptr i64, i64* %_Static_Link, i64 0
   %_new_result29_0 = call i64 @"PSL.Containers.Ordered_Set.Remove_Any"(i64* %_loc_21, i64* %_Context, i64* %_call29_Static_Link, i64 %_loc_20)
   %_result_addr29_0 = bitcast i64* %_loc_19 to i64* 
   store i64 %_new_result29_0, i64* %_result_addr29_0

   ; #Not_Null_Op at 234:21
   %_arg_ptr30 = bitcast i64* %_loc_19 to i64* 
   %_arg30 = load i64, i64* %_arg_ptr30
   %_cur_td30 = bitcast i64* %_Static_Link to %struct.TD*
   %_param_arr_ptr30 = getelementptr %struct.TD, %struct.TD* %_cur_td30, i32 0, i32 26
   %_param_arr30 = load %struct.ParamInfo*, %struct.ParamInfo** %_param_arr_ptr30
   %_formal_td_ptr_ptr30 = getelementptr %struct.ParamInfo, %struct.ParamInfo* %_param_arr30, i32 0, i32 1, i32 0
   %_formal_td30 = load %struct.TD*, %struct.TD** %_formal_td_ptr_ptr30
   %_desc30 = bitcast %struct.TD* %_formal_td30 to i64*
   %_td30 = bitcast i64* %_desc30 to %struct.TD*
   %_is_small_ptr30 = getelementptr %struct.TD, %struct.TD* %_td30, i32 0, i32 13
   %_is_small30 = load i8, i8* %_is_small_ptr30
   %_is_small_bool30 = trunc i8 %_is_small30 to i1
   br i1 %_is_small_bool30, label %_is_small_lbl30, label %_is_large_lbl30
   _is_small_lbl30:
   %_small_null_ptr30 = getelementptr %struct.TD, %struct.TD* %_td30, i32 0, i32 17
   %_small_null30 = load i64, i64* %_small_null_ptr30
   %_small_result30 = icmp ne i64 %_arg30, %_small_null30
   br label %_join30
   _is_large_lbl30:
   %_val_no_reg30 = and i64 %_arg30, -4294967295
   %_large_result30 = icmp ne i64 %_val_no_reg30, -144115188075855871
   br label %_join30
   _join30:
   %_result_bit30 = phi i1 [%_small_result30, %_is_small_lbl30], [%_large_result30, %_is_large_lbl30]
   %_result_ext30 = zext i1 %_result_bit30 to i64
   %_loc_18 = bitcast i64 %_result_ext30 to i64

   ; #If_Op at 234:13
   %_if_source_val31 = bitcast i64 %_loc_18 to i64
   %_if_source_trunc31 = icmp eq i64 %_if_source_val31, 1
   br i1 %_if_source_trunc31, label %_lbl32, label %_lbl34

_lbl32:
   ; #Copy_Word_Op at 234:13
   %_source32 = bitcast i64* %_loc_19 to i64* 
   %_source_val32 = load i64, i64* %_source32
   %_dest32 = bitcast i64* %_loc_6 to i64* 
   store i64 %_source_val32, i64* %_dest32

   ; #Skip_Op at 234:9
   br label %_lbl12

_lbl34:
   ; #Return_Op at 241:5
   call void @_psc_finalize_stg_rgn(i64* %_Context, i64* %_Local_Area)
   ret void

}

define i64 @"PSL.Containers.Ordered_Set.$in$"(i64 %_formal_param_1, i64 %_formal_param_2, i64* %_Context, i64* %_Static_Link) {
   %_Local_Area = alloca i64, i64 4
   %_sl = ptrtoint i64* %_Static_Link to i64
   store i64 %_sl, i64* %_Local_Area
   call void @_psc_initialize_stg_rgn(i64* %_Context, i64* %_Local_Area)
   %_Master = alloca i64, i64 3
   %_ms = ptrtoint i64* %_Master to i64
   %_store_ms = getelementptr i64, i64* %_Local_Area, i64 3
   store i64 %_ms, i64* %_store_ms

   %_Param_Area = alloca i64
   %_print_param8 = alloca i64

   
   ; #Store_Local_Null_Op at 244:16
   %_cur_td1 = bitcast i64* %_Static_Link to %struct.TD*
   %_param_arr_ptr1 = getelementptr %struct.TD, %struct.TD* %_cur_td1, i32 0, i32 26
   %_param_arr1 = load %struct.ParamInfo*, %struct.ParamInfo** %_param_arr_ptr1
   %_formal_td_ptr_ptr1 = getelementptr %struct.ParamInfo, %struct.ParamInfo* %_param_arr1, i32 0, i32 1, i32 0
   %_formal_td1 = load %struct.TD*, %struct.TD** %_formal_td_ptr_ptr1
   %_desc1 = bitcast %struct.TD* %_formal_td1 to i64*
   %_td1 = bitcast i64* %_desc1 to %struct.TD*
   %_is_small_ptr1 = getelementptr %struct.TD, %struct.TD* %_td1, i32 0, i32 13
   %_is_small1 = load i8, i8* %_is_small_ptr1
   %_is_small_bool1 = trunc i8 %_is_small1 to i1
   %_small_null_ptr1 = getelementptr %struct.TD, %struct.TD* %_td1, i32 0, i32 17
   %_small_null1 = load i64, i64* %_small_null_ptr1
   %_ctx1 = bitcast i64* %_Context to %struct.ExecCtx*
   %_large_null_ptr1 = getelementptr %struct.ExecCtx, %struct.ExecCtx* %_ctx1, i32 0, i32 1
   %_large_null1 = load i64, i64* %_large_null_ptr1
   %_null1= select i1 %_is_small_bool1, i64 %_small_null1, i64 %_large_null1
   %_loc_3 = bitcast i64 %_null1 to i64

   ; #Copy_Word_Op at 244:28
   %_source_val2 = bitcast i64 %_formal_param_2 to i64
   %_loc_6 = bitcast i64 %_source_val2 to i64

   ; #Copy_Word_Op at 244:34
   %_reg3_1 = inttoptr i64 %_loc_6 to i64*
   %_source3 = getelementptr i64, i64* %_reg3_1, i64 1
   %_source_val3 = load i64, i64* %_source3
   %_loc_4 = bitcast i64 %_source_val3 to i64

   ; #Copy_Word_Op at 244:41
   %_source_val4 = bitcast i64 %_formal_param_1 to i64
   %_loc_5 = bitcast i64 %_source_val4 to i64

   ; #Call_Op at 244:16
   %_cur_td5 = bitcast i64* %_Static_Link to %struct.TD*
   %_nested_types_arr_ptr5 = getelementptr %struct.TD, %struct.TD* %_cur_td5, i32 0, i32 35
   %_nested_types_arr5 = load %struct.TD**, %struct.TD*** %_nested_types_arr_ptr5
   %_nested_td_ptr_ptr5 = getelementptr %struct.TD*, %struct.TD** %_nested_types_arr5, i32 0
   %_nested_td5 = load %struct.TD*, %struct.TD** %_nested_td_ptr_ptr5
   %_call5_Static_Link = bitcast %struct.TD* %_nested_td5 to i64*
   %_new_result5_0 = call i64 @"PSL.Core.AA_Tree.Overlapping"(i64 %_loc_4, i64 %_loc_5, i64* %_Context, i64* %_call5_Static_Link, i64 %_loc_3)
   %_loc_2 = bitcast i64 %_new_result5_0 to i64

   ; #Not_Null_Op at 244:16
   %_arg6 = bitcast i64 %_loc_2 to i64
   %_cur_td6 = bitcast i64* %_Static_Link to %struct.TD*
   %_param_arr_ptr6 = getelementptr %struct.TD, %struct.TD* %_cur_td6, i32 0, i32 26
   %_param_arr6 = load %struct.ParamInfo*, %struct.ParamInfo** %_param_arr_ptr6
   %_formal_td_ptr_ptr6 = getelementptr %struct.ParamInfo, %struct.ParamInfo* %_param_arr6, i32 0, i32 1, i32 0
   %_formal_td6 = load %struct.TD*, %struct.TD** %_formal_td_ptr_ptr6
   %_desc6 = bitcast %struct.TD* %_formal_td6 to i64*
   %_td6 = bitcast i64* %_desc6 to %struct.TD*
   %_is_small_ptr6 = getelementptr %struct.TD, %struct.TD* %_td6, i32 0, i32 13
   %_is_small6 = load i8, i8* %_is_small_ptr6
   %_is_small_bool6 = trunc i8 %_is_small6 to i1
   br i1 %_is_small_bool6, label %_is_small_lbl6, label %_is_large_lbl6
   _is_small_lbl6:
   %_small_null_ptr6 = getelementptr %struct.TD, %struct.TD* %_td6, i32 0, i32 17
   %_small_null6 = load i64, i64* %_small_null_ptr6
   %_small_result6 = icmp ne i64 %_arg6, %_small_null6
   br label %_join6
   _is_large_lbl6:
   %_val_no_reg6 = and i64 %_arg6, -4294967295
   %_large_result6 = icmp ne i64 %_val_no_reg6, -144115188075855871
   br label %_join6
   _join6:
   %_result_bit6 = phi i1 [%_small_result6, %_is_small_lbl6], [%_large_result6, %_is_large_lbl6]
   %_result_ext6 = zext i1 %_result_bit6 to i64
   %_loc_1 = bitcast i64 %_result_ext6 to i64

   ; #Copy_Word_Op at 244:9
   %_source_val7 = bitcast i64 %_loc_1 to i64
   %_dest7 = getelementptr i64, i64* %_Param_Area, i64 0
   store i64 %_source_val7, i64* %_dest7

   ; #Check_Not_Null_Op at 244:9
   %_arg_ptr8 = getelementptr i64, i64* %_Param_Area, i64 0
   %_arg8 = load i64, i64* %_arg_ptr8
   %_is_null8 = icmp eq i64 %_arg8, shl (i64 1, i64 63)
   br i1 %_is_null8, label %_fail8, label %_lbl9
   _fail8:
   %_str_ptr_ptr8 = load i64*, i64** @$Strings
   %_str_ptr8 = getelementptr i64, i64* %_str_ptr_ptr8, i64 24
   %_assert_str8 = load i64, i64* %_str_ptr8
   store i64 %_assert_str8, i64* %_print_param8
   call void @_psc_runtime_message(i64* %_Context, i64* %_print_param8, i64* null)

   br label %_lbl9

_lbl9:
   ; #Return_Op at 244:9
   call void @_psc_finalize_stg_rgn(i64* %_Context, i64* %_Local_Area)
   %_result_reg9 = load i64, i64* %_Param_Area
   ret i64 %_result_reg9

}

define i64 @"PSL.Containers.Ordered_Set.$=?$"(i64 %_formal_param_1, i64 %_formal_param_2, i64* %_Context, i64* %_Static_Link) {
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
   %_loc_2 = alloca i64
   %_loc_3 = alloca i64
   %_loc_5 = alloca i64
   %_loc_8 = alloca i64
   %_output.I18 = alloca i64
   %_print_param.I18.8 = alloca i64
   %_loc_20 = alloca i64
   %_output.I44 = alloca i64
   %_print_param.I44.4 = alloca i64
   %_print_param51 = alloca i64
   %_print_param55 = alloca i64
   %_output.I59 = alloca i64
   %_print_param.I59.4 = alloca i64
   %_print_param66 = alloca i64
   %_print_param70 = alloca i64

   
   ; #Declare_Obj_Op at 252:13

   ; #Store_Int_Lit_Op at 252:25
   %_dest2 = bitcast i64* %_loc_1 to i64* 
   store i64 0, i64* %_dest2

   ; #Declare_Obj_Op at 253:13

   ; #Store_Int_Lit_Op at 253:24
   %_dest4 = bitcast i64* %_loc_2 to i64* 
   store i64 0, i64* %_dest4

   ; #Declare_Obj_Op at 254:13

   ; #Store_Local_Null_Op at 254:13
   %_ctx6 = bitcast i64* %_Context to %struct.ExecCtx*
   %_large_null_ptr6 = getelementptr %struct.ExecCtx, %struct.ExecCtx* %_ctx6, i32 0, i32 1
   %_null6 = load i64, i64* %_large_null_ptr6
   %_dest_ptr6 = bitcast i64* %_loc_3 to i64* 
   store i64 %_null6, i64* %_dest_ptr6

   ; #Make_Copy_In_Stg_Rgn_Op at 254:21
   %_desc7 = getelementptr i64, i64* %_Static_Link, i64 0
   %_source7 = bitcast i64 %_formal_param_1 to i64
   %_existing_ptr7 = bitcast i64* %_loc_3 to i64* 
   %_existing_obj7 = load i64, i64* %_existing_ptr7
   %_result7 = call i64 @_psc_copy_object(i64* %_Context, i64* %_desc7, i64 %_source7, i64 %_existing_obj7)
   %_dest_ptr7 = bitcast i64* %_loc_3 to i64* 
   store i64 %_result7, i64* %_dest_ptr7

   ; #Declare_Obj_Op at 254:13

   ; #Store_Null_Of_Same_Stg_Rgn_Op at 254:13
   %_cur_td9 = bitcast i64* %_Static_Link to %struct.TD*
   %_param_arr_ptr9 = getelementptr %struct.TD, %struct.TD* %_cur_td9, i32 0, i32 26
   %_param_arr9 = load %struct.ParamInfo*, %struct.ParamInfo** %_param_arr_ptr9
   %_formal_td_ptr_ptr9 = getelementptr %struct.ParamInfo, %struct.ParamInfo* %_param_arr9, i32 0, i32 1, i32 0
   %_formal_td9 = load %struct.TD*, %struct.TD** %_formal_td_ptr_ptr9
   %_desc9 = bitcast %struct.TD* %_formal_td9 to i64*
   %_source_ptr9 = bitcast i64* %_loc_3 to i64* 
   %_source9 = load i64, i64* %_source_ptr9
   %_td9 = bitcast i64* %_desc9 to %struct.TD*
   %_is_small_ptr9 = getelementptr %struct.TD, %struct.TD* %_td9, i32 0, i32 13
   %_is_small9 = load i8, i8* %_is_small_ptr9
   %_is_small_bool9 = trunc i8 %_is_small9 to i1
   br i1 %_is_small_bool9, label %_small_label9, label %_large_label9
   _small_label9:
   %_small_null_ptr9 = getelementptr %struct.TD, %struct.TD* %_td9, i32 0, i32 17
   %_small_null9 = load i64, i64* %_small_null_ptr9
   br label %_join_small_and_large9
   _large_label9:
   %_high_and_low_bits9 = and i64 %_source9, or (i64 shl (i64 1, i64 63), i64 1)
   %_is_special_bit9 = icmp eq i64 %_high_and_low_bits9, or (i64 shl (i64 1, i64 63), i64 1)
   br i1 %_is_special_bit9, label %_is_special_label9, label %_not_special_label9
   _is_special_label9:
   %_spcl_rgn_times2_9 = and i64 %_source9, 4294967295
   br label %_last_large_label9
   _not_special_label9:
   %_header_ptr9 = inttoptr i64 %_source9 to i64*
   %_hdr_of_src9 = load i64, i64* %_header_ptr9
   %_region_bits9 = and i64 %_hdr_of_src9, 4294901760
   %_normal_rgn_times2_9 = lshr i64 %_region_bits9, 15
   br label %_last_large_label9
   _last_large_label9:
   %_rgn_times2_9 = phi i64 [%_spcl_rgn_times2_9, %_is_special_label9], [%_normal_rgn_times2_9, %_not_special_label9]
   %_large_null9 = or i64 -144115188075855871, %_rgn_times2_9
   br label %_join_small_and_large9
   _join_small_and_large9:
   %_null9 = phi i64 [%_small_null9, %_small_label9],[%_large_null9, %_last_large_label9]
   %_loc_6 = bitcast i64 %_null9 to i64

   ; #Store_Address_Op at 254:21
   %_addr10 = bitcast i64* %_loc_3 to i64* 
   %_loc_7 = bitcast i64* %_addr10 to i64*

   ; #Call_Op at 254:21
   %_call11_Static_Link = getelementptr i64, i64* %_Static_Link, i64 0
   %_new_result11_0 = call i64 @"PSL.Containers.Ordered_Set.Remove_Any"(i64* %_loc_7, i64* %_Context, i64* %_call11_Static_Link, i64 %_loc_6)
   %_result_addr11_0 = bitcast i64* %_loc_5 to i64* 
   store i64 %_new_result11_0, i64* %_result_addr11_0

   ; #Not_Null_Op at 254:21
   %_arg_ptr12 = bitcast i64* %_loc_5 to i64* 
   %_arg12 = load i64, i64* %_arg_ptr12
   %_cur_td12 = bitcast i64* %_Static_Link to %struct.TD*
   %_param_arr_ptr12 = getelementptr %struct.TD, %struct.TD* %_cur_td12, i32 0, i32 26
   %_param_arr12 = load %struct.ParamInfo*, %struct.ParamInfo** %_param_arr_ptr12
   %_formal_td_ptr_ptr12 = getelementptr %struct.ParamInfo, %struct.ParamInfo* %_param_arr12, i32 0, i32 1, i32 0
   %_formal_td12 = load %struct.TD*, %struct.TD** %_formal_td_ptr_ptr12
   %_desc12 = bitcast %struct.TD* %_formal_td12 to i64*
   %_td12 = bitcast i64* %_desc12 to %struct.TD*
   %_is_small_ptr12 = getelementptr %struct.TD, %struct.TD* %_td12, i32 0, i32 13
   %_is_small12 = load i8, i8* %_is_small_ptr12
   %_is_small_bool12 = trunc i8 %_is_small12 to i1
   br i1 %_is_small_bool12, label %_is_small_lbl12, label %_is_large_lbl12
   _is_small_lbl12:
   %_small_null_ptr12 = getelementptr %struct.TD, %struct.TD* %_td12, i32 0, i32 17
   %_small_null12 = load i64, i64* %_small_null_ptr12
   %_small_result12 = icmp ne i64 %_arg12, %_small_null12
   br label %_join12
   _is_large_lbl12:
   %_val_no_reg12 = and i64 %_arg12, -4294967295
   %_large_result12 = icmp ne i64 %_val_no_reg12, -144115188075855871
   br label %_join12
   _join12:
   %_result_bit12 = phi i1 [%_small_result12, %_is_small_lbl12], [%_large_result12, %_is_large_lbl12]
   %_result_ext12 = zext i1 %_result_bit12 to i64
   %_loc_4 = bitcast i64 %_result_ext12 to i64

   ; #If_Op at 254:13
   %_if_source_val13 = bitcast i64 %_loc_4 to i64
   %_if_source_trunc13 = icmp eq i64 %_if_source_val13, 1
   br i1 %_if_source_trunc13, label %_lbl14, label %_lbl36

_lbl14:
   ; #Declare_Obj_Op at 254:9

   ; #Copy_Word_Op at 254:9
   %_source15 = bitcast i64* %_loc_5 to i64* 
   %_source_val15 = load i64, i64* %_source15
   %_dest15 = bitcast i64* %_loc_8 to i64* 
   store i64 %_source_val15, i64* %_dest15

   br label %_lbl16

_lbl16:
   ; #Copy_Word_Op at 255:16
   %_source16 = bitcast i64* %_loc_8 to i64* 
   %_source_val16 = load i64, i64* %_source16
   %_loc_13 = bitcast i64 %_source_val16 to i64

   ; #Copy_Word_Op at 255:28
   %_source_val17 = bitcast i64 %_formal_param_2 to i64
   %_loc_14 = bitcast i64 %_source_val17 to i64

   ; #Call_Op at 255:21
   ; inlining call on "in"
   %_call18_Static_Link = getelementptr i64, i64* %_Static_Link, i64 0

   ; #Store_Local_Null_Op at 244:16
   %_cur_td.I18.1 = bitcast i64* %_call18_Static_Link to %struct.TD*
   %_param_arr_ptr.I18.1 = getelementptr %struct.TD, %struct.TD* %_cur_td.I18.1, i32 0, i32 26
   %_param_arr.I18.1 = load %struct.ParamInfo*, %struct.ParamInfo** %_param_arr_ptr.I18.1
   %_formal_td_ptr_ptr.I18.1 = getelementptr %struct.ParamInfo, %struct.ParamInfo* %_param_arr.I18.1, i32 0, i32 1, i32 0
   %_formal_td.I18.1 = load %struct.TD*, %struct.TD** %_formal_td_ptr_ptr.I18.1
   %_desc.I18.1 = bitcast %struct.TD* %_formal_td.I18.1 to i64*
   %_td.I18.1 = bitcast i64* %_desc.I18.1 to %struct.TD*
   %_is_small_ptr.I18.1 = getelementptr %struct.TD, %struct.TD* %_td.I18.1, i32 0, i32 13
   %_is_small.I18.1 = load i8, i8* %_is_small_ptr.I18.1
   %_is_small_bool.I18.1 = trunc i8 %_is_small.I18.1 to i1
   %_small_null_ptr.I18.1 = getelementptr %struct.TD, %struct.TD* %_td.I18.1, i32 0, i32 17
   %_small_null.I18.1 = load i64, i64* %_small_null_ptr.I18.1
   %_ctx.I18.1 = bitcast i64* %_Context to %struct.ExecCtx*
   %_large_null_ptr.I18.1 = getelementptr %struct.ExecCtx, %struct.ExecCtx* %_ctx.I18.1, i32 0, i32 1
   %_large_null.I18.1 = load i64, i64* %_large_null_ptr.I18.1
   %_null.I18.1= select i1 %_is_small_bool.I18.1, i64 %_small_null.I18.1, i64 %_large_null.I18.1
   %_loc_.I18_3 = bitcast i64 %_null.I18.1 to i64

   ; #Copy_Word_Op at 244:28
   %_source_val.I18.2 = bitcast i64 %_loc_14 to i64
   %_loc_.I18_6 = bitcast i64 %_source_val.I18.2 to i64

   ; #Copy_Word_Op at 244:34
   %_reg.I18.3_1 = inttoptr i64 %_loc_.I18_6 to i64*
   %_source.I18.3 = getelementptr i64, i64* %_reg.I18.3_1, i64 1
   %_source_val.I18.3 = load i64, i64* %_source.I18.3
   %_loc_.I18_4 = bitcast i64 %_source_val.I18.3 to i64

   ; #Copy_Word_Op at 244:41
   %_source_val.I18.4 = bitcast i64 %_loc_13 to i64
   %_loc_.I18_5 = bitcast i64 %_source_val.I18.4 to i64

   ; #Call_Op at 244:16
   %_cur_td.I18.5 = bitcast i64* %_call18_Static_Link to %struct.TD*
   %_nested_types_arr_ptr.I18.5 = getelementptr %struct.TD, %struct.TD* %_cur_td.I18.5, i32 0, i32 35
   %_nested_types_arr.I18.5 = load %struct.TD**, %struct.TD*** %_nested_types_arr_ptr.I18.5
   %_nested_td_ptr_ptr.I18.5 = getelementptr %struct.TD*, %struct.TD** %_nested_types_arr.I18.5, i32 0
   %_nested_td.I18.5 = load %struct.TD*, %struct.TD** %_nested_td_ptr_ptr.I18.5
   %_call.I18.5_Static_Link = bitcast %struct.TD* %_nested_td.I18.5 to i64*
   %_new_result.I18.5_0 = call i64 @"PSL.Core.AA_Tree.Overlapping"(i64 %_loc_.I18_4, i64 %_loc_.I18_5, i64* %_Context, i64* %_call.I18.5_Static_Link, i64 %_loc_.I18_3)
   %_loc_.I18_2 = bitcast i64 %_new_result.I18.5_0 to i64

   ; #Not_Null_Op at 244:16
   %_arg.I18.6 = bitcast i64 %_loc_.I18_2 to i64
   %_cur_td.I18.6 = bitcast i64* %_call18_Static_Link to %struct.TD*
   %_param_arr_ptr.I18.6 = getelementptr %struct.TD, %struct.TD* %_cur_td.I18.6, i32 0, i32 26
   %_param_arr.I18.6 = load %struct.ParamInfo*, %struct.ParamInfo** %_param_arr_ptr.I18.6
   %_formal_td_ptr_ptr.I18.6 = getelementptr %struct.ParamInfo, %struct.ParamInfo* %_param_arr.I18.6, i32 0, i32 1, i32 0
   %_formal_td.I18.6 = load %struct.TD*, %struct.TD** %_formal_td_ptr_ptr.I18.6
   %_desc.I18.6 = bitcast %struct.TD* %_formal_td.I18.6 to i64*
   %_td.I18.6 = bitcast i64* %_desc.I18.6 to %struct.TD*
   %_is_small_ptr.I18.6 = getelementptr %struct.TD, %struct.TD* %_td.I18.6, i32 0, i32 13
   %_is_small.I18.6 = load i8, i8* %_is_small_ptr.I18.6
   %_is_small_bool.I18.6 = trunc i8 %_is_small.I18.6 to i1
   br i1 %_is_small_bool.I18.6, label %_is_small_lbl.I18.6, label %_is_large_lbl.I18.6
   _is_small_lbl.I18.6:
   %_small_null_ptr.I18.6 = getelementptr %struct.TD, %struct.TD* %_td.I18.6, i32 0, i32 17
   %_small_null.I18.6 = load i64, i64* %_small_null_ptr.I18.6
   %_small_result.I18.6 = icmp ne i64 %_arg.I18.6, %_small_null.I18.6
   br label %_join.I18.6
   _is_large_lbl.I18.6:
   %_val_no_reg.I18.6 = and i64 %_arg.I18.6, -4294967295
   %_large_result.I18.6 = icmp ne i64 %_val_no_reg.I18.6, -144115188075855871
   br label %_join.I18.6
   _join.I18.6:
   %_result_bit.I18.6 = phi i1 [%_small_result.I18.6, %_is_small_lbl.I18.6], [%_large_result.I18.6, %_is_large_lbl.I18.6]
   %_result_ext.I18.6 = zext i1 %_result_bit.I18.6 to i64
   %_loc_.I18_1 = bitcast i64 %_result_ext.I18.6 to i64

   ; #Copy_Word_Op at 244:9
   %_source_val.I18.7 = bitcast i64 %_loc_.I18_1 to i64
   %_dest.I18.7 = bitcast i64* %_output.I18 to i64*
   store i64 %_source_val.I18.7, i64* %_dest.I18.7

   ; #Check_Not_Null_Op at 244:9
   %_arg_ptr.I18.8 = bitcast i64* %_output.I18 to i64*
   %_arg.I18.8 = load i64, i64* %_arg_ptr.I18.8
   %_is_null.I18.8 = icmp eq i64 %_arg.I18.8, shl (i64 1, i64 63)
   br i1 %_is_null.I18.8, label %_fail.I18.8, label %_lbl.I18_9
   _fail.I18.8:
   %_str_ptr_ptr.I18.8 = load i64*, i64** @$Strings
   %_str_ptr.I18.8 = getelementptr i64, i64* %_str_ptr_ptr.I18.8, i64 24
   %_assert_str.I18.8 = load i64, i64* %_str_ptr.I18.8
   store i64 %_assert_str.I18.8, i64* %_print_param.I18.8
   call void @_psc_runtime_message(i64* %_Context, i64* %_print_param.I18.8, i64* null)

   br label %_lbl.I18_9

_lbl.I18_9:
   ; #Return_Op at 244:9

   %_new_result18 = load i64, i64* %_output.I18
   %_loc_11 = bitcast i64 %_new_result18 to i64

   ; #Call_Op at 255:21
   %_n19 = bitcast i64 %_loc_11 to i64
   %_result19 = xor i64 1, %_n19
   %_loc_9 = bitcast i64 %_result19 to i64

   ; #If_Op at 255:21
   %_if_source_val20 = bitcast i64 %_loc_9 to i64
   %_if_source_trunc20 = icmp eq i64 %_if_source_val20, 1
   br i1 %_if_source_trunc20, label %_lbl21, label %_lbl25

_lbl21:
   ; #Store_Address_Op at 256:17
   %_addr21 = bitcast i64* %_loc_2 to i64* 
   %_loc_15 = bitcast i64* %_addr21 to i64*

   ; #Store_Int_Lit_Op at 256:28
   %_loc_16 = bitcast i64 1 to i64

   ; #Call_Op at 256:17
   %_left_ptr23 = bitcast i64* %_loc_15 to i64*
   %_left23 = load i64, i64* %_left_ptr23
   %_right23 = bitcast i64 %_loc_16 to i64
   %_result23 = add nsw i64 %_left23, %_right23
   store i64 %_result23, i64* %_left_ptr23

   ; #Skip_Op at 258:17
   br label %_lbl28

_lbl25:
   ; #Store_Address_Op at 258:17
   %_addr25 = bitcast i64* %_loc_1 to i64* 
   %_loc_17 = bitcast i64* %_addr25 to i64*

   ; #Store_Int_Lit_Op at 258:29
   %_loc_18 = bitcast i64 1 to i64

   ; #Call_Op at 258:17
   %_left_ptr27 = bitcast i64* %_loc_17 to i64*
   %_left27 = load i64, i64* %_left_ptr27
   %_right27 = bitcast i64 %_loc_18 to i64
   %_result27 = add nsw i64 %_left27, %_right27
   store i64 %_result27, i64* %_left_ptr27

   br label %_lbl28

_lbl28:
   ; #Declare_Obj_Op at 254:13

   ; #Store_Null_Of_Same_Stg_Rgn_Op at 254:13
   %_cur_td29 = bitcast i64* %_Static_Link to %struct.TD*
   %_param_arr_ptr29 = getelementptr %struct.TD, %struct.TD* %_cur_td29, i32 0, i32 26
   %_param_arr29 = load %struct.ParamInfo*, %struct.ParamInfo** %_param_arr_ptr29
   %_formal_td_ptr_ptr29 = getelementptr %struct.ParamInfo, %struct.ParamInfo* %_param_arr29, i32 0, i32 1, i32 0
   %_formal_td29 = load %struct.TD*, %struct.TD** %_formal_td_ptr_ptr29
   %_desc29 = bitcast %struct.TD* %_formal_td29 to i64*
   %_source_ptr29 = bitcast i64* %_loc_3 to i64* 
   %_source29 = load i64, i64* %_source_ptr29
   %_td29 = bitcast i64* %_desc29 to %struct.TD*
   %_is_small_ptr29 = getelementptr %struct.TD, %struct.TD* %_td29, i32 0, i32 13
   %_is_small29 = load i8, i8* %_is_small_ptr29
   %_is_small_bool29 = trunc i8 %_is_small29 to i1
   br i1 %_is_small_bool29, label %_small_label29, label %_large_label29
   _small_label29:
   %_small_null_ptr29 = getelementptr %struct.TD, %struct.TD* %_td29, i32 0, i32 17
   %_small_null29 = load i64, i64* %_small_null_ptr29
   br label %_join_small_and_large29
   _large_label29:
   %_high_and_low_bits29 = and i64 %_source29, or (i64 shl (i64 1, i64 63), i64 1)
   %_is_special_bit29 = icmp eq i64 %_high_and_low_bits29, or (i64 shl (i64 1, i64 63), i64 1)
   br i1 %_is_special_bit29, label %_is_special_label29, label %_not_special_label29
   _is_special_label29:
   %_spcl_rgn_times2_29 = and i64 %_source29, 4294967295
   br label %_last_large_label29
   _not_special_label29:
   %_header_ptr29 = inttoptr i64 %_source29 to i64*
   %_hdr_of_src29 = load i64, i64* %_header_ptr29
   %_region_bits29 = and i64 %_hdr_of_src29, 4294901760
   %_normal_rgn_times2_29 = lshr i64 %_region_bits29, 15
   br label %_last_large_label29
   _last_large_label29:
   %_rgn_times2_29 = phi i64 [%_spcl_rgn_times2_29, %_is_special_label29], [%_normal_rgn_times2_29, %_not_special_label29]
   %_large_null29 = or i64 -144115188075855871, %_rgn_times2_29
   br label %_join_small_and_large29
   _join_small_and_large29:
   %_null29 = phi i64 [%_small_null29, %_small_label29],[%_large_null29, %_last_large_label29]
   %_loc_21 = bitcast i64 %_null29 to i64

   ; #Store_Address_Op at 254:21
   %_addr30 = bitcast i64* %_loc_3 to i64* 
   %_loc_22 = bitcast i64* %_addr30 to i64*

   ; #Call_Op at 254:21
   %_call31_Static_Link = getelementptr i64, i64* %_Static_Link, i64 0
   %_new_result31_0 = call i64 @"PSL.Containers.Ordered_Set.Remove_Any"(i64* %_loc_22, i64* %_Context, i64* %_call31_Static_Link, i64 %_loc_21)
   %_result_addr31_0 = bitcast i64* %_loc_20 to i64* 
   store i64 %_new_result31_0, i64* %_result_addr31_0

   ; #Not_Null_Op at 254:21
   %_arg_ptr32 = bitcast i64* %_loc_20 to i64* 
   %_arg32 = load i64, i64* %_arg_ptr32
   %_cur_td32 = bitcast i64* %_Static_Link to %struct.TD*
   %_param_arr_ptr32 = getelementptr %struct.TD, %struct.TD* %_cur_td32, i32 0, i32 26
   %_param_arr32 = load %struct.ParamInfo*, %struct.ParamInfo** %_param_arr_ptr32
   %_formal_td_ptr_ptr32 = getelementptr %struct.ParamInfo, %struct.ParamInfo* %_param_arr32, i32 0, i32 1, i32 0
   %_formal_td32 = load %struct.TD*, %struct.TD** %_formal_td_ptr_ptr32
   %_desc32 = bitcast %struct.TD* %_formal_td32 to i64*
   %_td32 = bitcast i64* %_desc32 to %struct.TD*
   %_is_small_ptr32 = getelementptr %struct.TD, %struct.TD* %_td32, i32 0, i32 13
   %_is_small32 = load i8, i8* %_is_small_ptr32
   %_is_small_bool32 = trunc i8 %_is_small32 to i1
   br i1 %_is_small_bool32, label %_is_small_lbl32, label %_is_large_lbl32
   _is_small_lbl32:
   %_small_null_ptr32 = getelementptr %struct.TD, %struct.TD* %_td32, i32 0, i32 17
   %_small_null32 = load i64, i64* %_small_null_ptr32
   %_small_result32 = icmp ne i64 %_arg32, %_small_null32
   br label %_join32
   _is_large_lbl32:
   %_val_no_reg32 = and i64 %_arg32, -4294967295
   %_large_result32 = icmp ne i64 %_val_no_reg32, -144115188075855871
   br label %_join32
   _join32:
   %_result_bit32 = phi i1 [%_small_result32, %_is_small_lbl32], [%_large_result32, %_is_large_lbl32]
   %_result_ext32 = zext i1 %_result_bit32 to i64
   %_loc_19 = bitcast i64 %_result_ext32 to i64

   ; #If_Op at 254:13
   %_if_source_val33 = bitcast i64 %_loc_19 to i64
   %_if_source_trunc33 = icmp eq i64 %_if_source_val33, 1
   br i1 %_if_source_trunc33, label %_lbl34, label %_lbl36

_lbl34:
   ; #Copy_Word_Op at 254:13
   %_source34 = bitcast i64* %_loc_20 to i64* 
   %_source_val34 = load i64, i64* %_source34
   %_dest34 = bitcast i64* %_loc_8 to i64* 
   store i64 %_source_val34, i64* %_dest34

   ; #Skip_Op at 254:9
   br label %_lbl16

_lbl36:
   ; #Copy_Word_Op at 262:12
   %_source36 = bitcast i64* %_loc_2 to i64* 
   %_source_val36 = load i64, i64* %_source36
   %_loc_28 = bitcast i64 %_source_val36 to i64

   ; #Store_Int_Lit_Op at 262:22
   %_loc_29 = bitcast i64 0 to i64

   ; #Call_Op at 262:20
   ; =? + to-bool optimization
   %_left38 = bitcast i64 %_loc_28 to i64
   %_right38 = bitcast i64 %_loc_29 to i64
   %_result38 = icmp sgt i64 %_left38, %_right38
   br i1 %_result38, label %_lbl42, label %_lbl57

_lbl42:
   ; #Copy_Word_Op at 264:16
   %_source42 = bitcast i64* %_loc_1 to i64* 
   %_source_val42 = load i64, i64* %_source42
   %_loc_35 = bitcast i64 %_source_val42 to i64

   ; #Copy_Word_Op at 264:33
   %_source_val43 = bitcast i64 %_formal_param_2 to i64
   %_loc_38 = bitcast i64 %_source_val43 to i64

   ; #Call_Op at 264:27
   ; inlining call on Count
   %_call44_Static_Link = getelementptr i64, i64* %_Static_Link, i64 0

   ; #Copy_Word_Op at 283:16
   %_source_val.I44.1 = bitcast i64 %_loc_38 to i64
   %_loc_.I44_2 = bitcast i64 %_source_val.I44.1 to i64

   ; #Copy_Word_Op at 283:18
   %_reg.I44.2_1 = inttoptr i64 %_loc_.I44_2 to i64*
   %_source.I44.2 = getelementptr i64, i64* %_reg.I44.2_1, i64 2
   %_source_val.I44.2 = load i64, i64* %_source.I44.2
   %_loc_.I44_1 = bitcast i64 %_source_val.I44.2 to i64

   ; #Copy_Word_Op at 283:9
   %_source_val.I44.3 = bitcast i64 %_loc_.I44_1 to i64
   %_dest.I44.3 = bitcast i64* %_output.I44 to i64*
   store i64 %_source_val.I44.3, i64* %_dest.I44.3

   ; #Check_Not_Null_Op at 283:9
   %_arg_ptr.I44.4 = bitcast i64* %_output.I44 to i64*
   %_arg.I44.4 = load i64, i64* %_arg_ptr.I44.4
   %_is_null.I44.4 = icmp eq i64 %_arg.I44.4, shl (i64 1, i64 63)
   br i1 %_is_null.I44.4, label %_fail.I44.4, label %_lbl.I44_5
   _fail.I44.4:
   %_str_ptr_ptr.I44.4 = load i64*, i64** @$Strings
   %_str_ptr.I44.4 = getelementptr i64, i64* %_str_ptr_ptr.I44.4, i64 32
   %_assert_str.I44.4 = load i64, i64* %_str_ptr.I44.4
   store i64 %_assert_str.I44.4, i64* %_print_param.I44.4
   call void @_psc_runtime_message(i64* %_Context, i64* %_print_param.I44.4, i64* null)

   br label %_lbl.I44_5

_lbl.I44_5:
   ; #Return_Op at 283:9

   %_new_result44 = load i64, i64* %_output.I44
   %_loc_36 = bitcast i64 %_new_result44 to i64

   ; #Call_Op at 264:25
   ; =? + to-bool optimization
   %_left45 = bitcast i64 %_loc_35 to i64
   %_right45 = bitcast i64 %_loc_36 to i64
   %_result45 = icmp slt i64 %_left45, %_right45
   br i1 %_result45, label %_lbl49, label %_lbl53

_lbl49:
   ; #Copy_Word_Op at 265:24
   %_source49 = getelementptr i64, i64* @$Anon_Const_20_1, i64 0
   %_source_val49 = load i64, i64* %_source49
   %_loc_39 = bitcast i64 %_source_val49 to i64

   ; #Copy_Word_Op at 265:17
   %_source_val50 = bitcast i64 %_loc_39 to i64
   %_dest50 = getelementptr i64, i64* %_Param_Area, i64 0
   store i64 %_source_val50, i64* %_dest50

   ; #Check_Not_Null_Op at 265:17
   %_arg_ptr51 = getelementptr i64, i64* %_Param_Area, i64 0
   %_arg51 = load i64, i64* %_arg_ptr51
   %_is_null51 = icmp eq i64 %_arg51, shl (i64 1, i64 63)
   br i1 %_is_null51, label %_fail51, label %_lbl52
   _fail51:
   %_str_ptr_ptr51 = load i64*, i64** @$Strings
   %_str_ptr51 = getelementptr i64, i64* %_str_ptr_ptr51, i64 33
   %_assert_str51 = load i64, i64* %_str_ptr51
   store i64 %_assert_str51, i64* %_print_param51
   call void @_psc_runtime_message(i64* %_Context, i64* %_print_param51, i64* null)

   br label %_lbl52

_lbl52:
   ; #Return_Op at 265:17
   call void @_psc_finalize_stg_rgn(i64* %_Context, i64* %_Local_Area)
   %_result_reg52 = load i64, i64* %_Param_Area
   ret i64 %_result_reg52

_lbl53:
   ; #Copy_Word_Op at 268:24
   %_source53 = getelementptr i64, i64* @$Anon_Const_20_2, i64 0
   %_source_val53 = load i64, i64* %_source53
   %_loc_40 = bitcast i64 %_source_val53 to i64

   ; #Copy_Word_Op at 268:17
   %_source_val54 = bitcast i64 %_loc_40 to i64
   %_dest54 = getelementptr i64, i64* %_Param_Area, i64 0
   store i64 %_source_val54, i64* %_dest54

   ; #Check_Not_Null_Op at 268:17
   %_arg_ptr55 = getelementptr i64, i64* %_Param_Area, i64 0
   %_arg55 = load i64, i64* %_arg_ptr55
   %_is_null55 = icmp eq i64 %_arg55, shl (i64 1, i64 63)
   br i1 %_is_null55, label %_fail55, label %_lbl56
   _fail55:
   %_str_ptr_ptr55 = load i64*, i64** @$Strings
   %_str_ptr55 = getelementptr i64, i64* %_str_ptr_ptr55, i64 34
   %_assert_str55 = load i64, i64* %_str_ptr55
   store i64 %_assert_str55, i64* %_print_param55
   call void @_psc_runtime_message(i64* %_Context, i64* %_print_param55, i64* null)

   br label %_lbl56

_lbl56:
   ; #Return_Op at 268:17
   call void @_psc_finalize_stg_rgn(i64* %_Context, i64* %_Local_Area)
   %_result_reg56 = load i64, i64* %_Param_Area
   ret i64 %_result_reg56

_lbl57:
   ; #Copy_Word_Op at 272:16
   %_source57 = bitcast i64* %_loc_1 to i64* 
   %_source_val57 = load i64, i64* %_source57
   %_loc_46 = bitcast i64 %_source_val57 to i64

   ; #Copy_Word_Op at 272:33
   %_source_val58 = bitcast i64 %_formal_param_2 to i64
   %_loc_49 = bitcast i64 %_source_val58 to i64

   ; #Call_Op at 272:27
   ; inlining call on Count
   %_call59_Static_Link = getelementptr i64, i64* %_Static_Link, i64 0

   ; #Copy_Word_Op at 283:16
   %_source_val.I59.1 = bitcast i64 %_loc_49 to i64
   %_loc_.I59_2 = bitcast i64 %_source_val.I59.1 to i64

   ; #Copy_Word_Op at 283:18
   %_reg.I59.2_1 = inttoptr i64 %_loc_.I59_2 to i64*
   %_source.I59.2 = getelementptr i64, i64* %_reg.I59.2_1, i64 2
   %_source_val.I59.2 = load i64, i64* %_source.I59.2
   %_loc_.I59_1 = bitcast i64 %_source_val.I59.2 to i64

   ; #Copy_Word_Op at 283:9
   %_source_val.I59.3 = bitcast i64 %_loc_.I59_1 to i64
   %_dest.I59.3 = bitcast i64* %_output.I59 to i64*
   store i64 %_source_val.I59.3, i64* %_dest.I59.3

   ; #Check_Not_Null_Op at 283:9
   %_arg_ptr.I59.4 = bitcast i64* %_output.I59 to i64*
   %_arg.I59.4 = load i64, i64* %_arg_ptr.I59.4
   %_is_null.I59.4 = icmp eq i64 %_arg.I59.4, shl (i64 1, i64 63)
   br i1 %_is_null.I59.4, label %_fail.I59.4, label %_lbl.I59_5
   _fail.I59.4:
   %_str_ptr_ptr.I59.4 = load i64*, i64** @$Strings
   %_str_ptr.I59.4 = getelementptr i64, i64* %_str_ptr_ptr.I59.4, i64 32
   %_assert_str.I59.4 = load i64, i64* %_str_ptr.I59.4
   store i64 %_assert_str.I59.4, i64* %_print_param.I59.4
   call void @_psc_runtime_message(i64* %_Context, i64* %_print_param.I59.4, i64* null)

   br label %_lbl.I59_5

_lbl.I59_5:
   ; #Return_Op at 283:9

   %_new_result59 = load i64, i64* %_output.I59
   %_loc_47 = bitcast i64 %_new_result59 to i64

   ; #Call_Op at 272:25
   ; =? + to-bool optimization
   %_left60 = bitcast i64 %_loc_46 to i64
   %_right60 = bitcast i64 %_loc_47 to i64
   %_result60 = icmp slt i64 %_left60, %_right60
   br i1 %_result60, label %_lbl64, label %_lbl68

_lbl64:
   ; #Copy_Word_Op at 274:24
   %_source64 = getelementptr i64, i64* @$Anon_Const_20_3, i64 0
   %_source_val64 = load i64, i64* %_source64
   %_loc_50 = bitcast i64 %_source_val64 to i64

   ; #Copy_Word_Op at 274:17
   %_source_val65 = bitcast i64 %_loc_50 to i64
   %_dest65 = getelementptr i64, i64* %_Param_Area, i64 0
   store i64 %_source_val65, i64* %_dest65

   ; #Check_Not_Null_Op at 274:17
   %_arg_ptr66 = getelementptr i64, i64* %_Param_Area, i64 0
   %_arg66 = load i64, i64* %_arg_ptr66
   %_is_null66 = icmp eq i64 %_arg66, shl (i64 1, i64 63)
   br i1 %_is_null66, label %_fail66, label %_lbl67
   _fail66:
   %_str_ptr_ptr66 = load i64*, i64** @$Strings
   %_str_ptr66 = getelementptr i64, i64* %_str_ptr_ptr66, i64 35
   %_assert_str66 = load i64, i64* %_str_ptr66
   store i64 %_assert_str66, i64* %_print_param66
   call void @_psc_runtime_message(i64* %_Context, i64* %_print_param66, i64* null)

   br label %_lbl67

_lbl67:
   ; #Return_Op at 274:17
   call void @_psc_finalize_stg_rgn(i64* %_Context, i64* %_Local_Area)
   %_result_reg67 = load i64, i64* %_Param_Area
   ret i64 %_result_reg67

_lbl68:
   ; #Copy_Word_Op at 276:24
   %_source68 = getelementptr i64, i64* @$Anon_Const_20_4, i64 0
   %_source_val68 = load i64, i64* %_source68
   %_loc_51 = bitcast i64 %_source_val68 to i64

   ; #Copy_Word_Op at 276:17
   %_source_val69 = bitcast i64 %_loc_51 to i64
   %_dest69 = getelementptr i64, i64* %_Param_Area, i64 0
   store i64 %_source_val69, i64* %_dest69

   ; #Check_Not_Null_Op at 276:17
   %_arg_ptr70 = getelementptr i64, i64* %_Param_Area, i64 0
   %_arg70 = load i64, i64* %_arg_ptr70
   %_is_null70 = icmp eq i64 %_arg70, shl (i64 1, i64 63)
   br i1 %_is_null70, label %_fail70, label %_lbl71
   _fail70:
   %_str_ptr_ptr70 = load i64*, i64** @$Strings
   %_str_ptr70 = getelementptr i64, i64* %_str_ptr_ptr70, i64 36
   %_assert_str70 = load i64, i64* %_str_ptr70
   store i64 %_assert_str70, i64* %_print_param70
   call void @_psc_runtime_message(i64* %_Context, i64* %_print_param70, i64* null)

   br label %_lbl71

_lbl71:
   ; #Return_Op at 276:17
   call void @_psc_finalize_stg_rgn(i64* %_Context, i64* %_Local_Area)
   %_result_reg71 = load i64, i64* %_Param_Area
   ret i64 %_result_reg71

}

define i64 @"PSL.Containers.Ordered_Set.Count"(i64 %_formal_param_1, i64* %_Context, i64* %_Static_Link) {
   %_Local_Area = alloca i64, i64 4
   %_sl = ptrtoint i64* %_Static_Link to i64
   store i64 %_sl, i64* %_Local_Area

   %_Param_Area = alloca i64
   %_print_param4 = alloca i64

   
   ; #Copy_Word_Op at 283:16
   %_source_val1 = bitcast i64 %_formal_param_1 to i64
   %_loc_2 = bitcast i64 %_source_val1 to i64

   ; #Copy_Word_Op at 283:18
   %_reg2_1 = inttoptr i64 %_loc_2 to i64*
   %_source2 = getelementptr i64, i64* %_reg2_1, i64 2
   %_source_val2 = load i64, i64* %_source2
   %_loc_1 = bitcast i64 %_source_val2 to i64

   ; #Copy_Word_Op at 283:9
   %_source_val3 = bitcast i64 %_loc_1 to i64
   %_dest3 = getelementptr i64, i64* %_Param_Area, i64 0
   store i64 %_source_val3, i64* %_dest3

   ; #Check_Not_Null_Op at 283:9
   %_arg_ptr4 = getelementptr i64, i64* %_Param_Area, i64 0
   %_arg4 = load i64, i64* %_arg_ptr4
   %_is_null4 = icmp eq i64 %_arg4, shl (i64 1, i64 63)
   br i1 %_is_null4, label %_fail4, label %_lbl5
   _fail4:
   %_str_ptr_ptr4 = load i64*, i64** @$Strings
   %_str_ptr4 = getelementptr i64, i64* %_str_ptr_ptr4, i64 32
   %_assert_str4 = load i64, i64* %_str_ptr4
   store i64 %_assert_str4, i64* %_print_param4
   call void @_psc_runtime_message(i64* %_Context, i64* %_print_param4, i64* null)

   br label %_lbl5

_lbl5:
   ; #Return_Op at 283:9
   %_result_reg5 = load i64, i64* %_Param_Area
   ret i64 %_result_reg5

}

define i64 @"PSL.Containers.Ordered_Set.Is_Empty"(i64 %_formal_param_1, i64* %_Context, i64* %_Static_Link) {
   %_Local_Area = alloca i64, i64 4
   %_sl = ptrtoint i64* %_Static_Link to i64
   store i64 %_sl, i64* %_Local_Area

   %_Param_Area = alloca i64
   %_print_param8 = alloca i64

   
   ; #Copy_Word_Op at 287:16
   %_source_val1 = bitcast i64 %_formal_param_1 to i64
   %_loc_8 = bitcast i64 %_source_val1 to i64

   ; #Copy_Word_Op at 287:18
   %_reg2_1 = inttoptr i64 %_loc_8 to i64*
   %_source2 = getelementptr i64, i64* %_reg2_1, i64 2
   %_source_val2 = load i64, i64* %_source2
   %_loc_6 = bitcast i64 %_source_val2 to i64

   ; #Store_Int_Lit_Op at 287:27
   %_loc_7 = bitcast i64 0 to i64

   ; #Call_Op at 287:24
   ; =? + to-bool optimization
   %_left4 = bitcast i64 %_loc_6 to i64
   %_right4 = bitcast i64 %_loc_7 to i64
   %_result4 = icmp eq i64 %_left4, %_right4
   %_result4_zext = zext i1 %_result4 to i64
   %_loc_1 = bitcast i64 %_result4_zext to i64

   ; #Copy_Word_Op at 287:9
   %_source_val7 = bitcast i64 %_loc_1 to i64
   %_dest7 = getelementptr i64, i64* %_Param_Area, i64 0
   store i64 %_source_val7, i64* %_dest7

   ; #Check_Not_Null_Op at 287:9
   %_arg_ptr8 = getelementptr i64, i64* %_Param_Area, i64 0
   %_arg8 = load i64, i64* %_arg_ptr8
   %_is_null8 = icmp eq i64 %_arg8, shl (i64 1, i64 63)
   br i1 %_is_null8, label %_fail8, label %_lbl9
   _fail8:
   %_str_ptr_ptr8 = load i64*, i64** @$Strings
   %_str_ptr8 = getelementptr i64, i64* %_str_ptr_ptr8, i64 39
   %_assert_str8 = load i64, i64* %_str_ptr8
   store i64 %_assert_str8, i64* %_print_param8
   call void @_psc_runtime_message(i64* %_Context, i64* %_print_param8, i64* null)

   br label %_lbl9

_lbl9:
   ; #Return_Op at 287:9
   %_result_reg9 = load i64, i64* %_Param_Area
   ret i64 %_result_reg9

}

define i64 @"PSL.Containers.Ordered_Set.First"(i64 %_formal_param_1, i64* %_Context, i64* %_Static_Link, i64 %_inited_output) {
   %_Local_Area = alloca i64, i64 4
   %_sl = ptrtoint i64* %_Static_Link to i64
   store i64 %_sl, i64* %_Local_Area

   %_Param_Area = alloca i64

   store i64 %_inited_output, i64* %_Param_Area
   
   ; #Store_Null_Of_Same_Stg_Rgn_Op at 291:16
   %_cur_td1 = bitcast i64* %_Static_Link to %struct.TD*
   %_param_arr_ptr1 = getelementptr %struct.TD, %struct.TD* %_cur_td1, i32 0, i32 26
   %_param_arr1 = load %struct.ParamInfo*, %struct.ParamInfo** %_param_arr_ptr1
   %_formal_td_ptr_ptr1 = getelementptr %struct.ParamInfo, %struct.ParamInfo* %_param_arr1, i32 0, i32 1, i32 0
   %_formal_td1 = load %struct.TD*, %struct.TD** %_formal_td_ptr_ptr1
   %_desc1 = bitcast %struct.TD* %_formal_td1 to i64*
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

   ; #Copy_Word_Op at 291:22
   %_source_val2 = bitcast i64 %_formal_param_1 to i64
   %_loc_4 = bitcast i64 %_source_val2 to i64

   ; #Copy_Word_Op at 291:24
   %_reg3_1 = inttoptr i64 %_loc_4 to i64*
   %_source3 = getelementptr i64, i64* %_reg3_1, i64 1
   %_source_val3 = load i64, i64* %_source3
   %_loc_3 = bitcast i64 %_source_val3 to i64

   ; #Call_Op at 291:16
   %_cur_td4 = bitcast i64* %_Static_Link to %struct.TD*
   %_nested_types_arr_ptr4 = getelementptr %struct.TD, %struct.TD* %_cur_td4, i32 0, i32 35
   %_nested_types_arr4 = load %struct.TD**, %struct.TD*** %_nested_types_arr_ptr4
   %_nested_td_ptr_ptr4 = getelementptr %struct.TD*, %struct.TD** %_nested_types_arr4, i32 0
   %_nested_td4 = load %struct.TD*, %struct.TD** %_nested_td_ptr_ptr4
   %_call4_Static_Link = bitcast %struct.TD* %_nested_td4 to i64*
   %_new_result4_0 = call i64 @"PSL.Core.AA_Tree.First"(i64 %_loc_3, i64* %_Context, i64* %_call4_Static_Link, i64 %_loc_2)
   %_loc_1 = bitcast i64 %_new_result4_0 to i64

   ; #Copy_Word_Op at 291:9
   %_source_val5 = bitcast i64 %_loc_1 to i64
   %_dest5 = getelementptr i64, i64* %_Param_Area, i64 0
   store i64 %_source_val5, i64* %_dest5

   ; #Return_Op at 291:9
   %_result_reg6 = load i64, i64* %_Param_Area
   ret i64 %_result_reg6

}

define i64 @"PSL.Containers.Ordered_Set.Last"(i64 %_formal_param_1, i64* %_Context, i64* %_Static_Link, i64 %_inited_output) {
   %_Local_Area = alloca i64, i64 4
   %_sl = ptrtoint i64* %_Static_Link to i64
   store i64 %_sl, i64* %_Local_Area

   %_Param_Area = alloca i64

   store i64 %_inited_output, i64* %_Param_Area
   
   ; #Store_Null_Of_Same_Stg_Rgn_Op at 295:16
   %_cur_td1 = bitcast i64* %_Static_Link to %struct.TD*
   %_param_arr_ptr1 = getelementptr %struct.TD, %struct.TD* %_cur_td1, i32 0, i32 26
   %_param_arr1 = load %struct.ParamInfo*, %struct.ParamInfo** %_param_arr_ptr1
   %_formal_td_ptr_ptr1 = getelementptr %struct.ParamInfo, %struct.ParamInfo* %_param_arr1, i32 0, i32 1, i32 0
   %_formal_td1 = load %struct.TD*, %struct.TD** %_formal_td_ptr_ptr1
   %_desc1 = bitcast %struct.TD* %_formal_td1 to i64*
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

   ; #Copy_Word_Op at 295:21
   %_source_val2 = bitcast i64 %_formal_param_1 to i64
   %_loc_4 = bitcast i64 %_source_val2 to i64

   ; #Copy_Word_Op at 295:23
   %_reg3_1 = inttoptr i64 %_loc_4 to i64*
   %_source3 = getelementptr i64, i64* %_reg3_1, i64 1
   %_source_val3 = load i64, i64* %_source3
   %_loc_3 = bitcast i64 %_source_val3 to i64

   ; #Call_Op at 295:16
   %_cur_td4 = bitcast i64* %_Static_Link to %struct.TD*
   %_nested_types_arr_ptr4 = getelementptr %struct.TD, %struct.TD* %_cur_td4, i32 0, i32 35
   %_nested_types_arr4 = load %struct.TD**, %struct.TD*** %_nested_types_arr_ptr4
   %_nested_td_ptr_ptr4 = getelementptr %struct.TD*, %struct.TD** %_nested_types_arr4, i32 0
   %_nested_td4 = load %struct.TD*, %struct.TD** %_nested_td_ptr_ptr4
   %_call4_Static_Link = bitcast %struct.TD* %_nested_td4 to i64*
   %_new_result4_0 = call i64 @"PSL.Core.AA_Tree.Last"(i64 %_loc_3, i64* %_Context, i64* %_call4_Static_Link, i64 %_loc_2)
   %_loc_1 = bitcast i64 %_new_result4_0 to i64

   ; #Copy_Word_Op at 295:9
   %_source_val5 = bitcast i64 %_loc_1 to i64
   %_dest5 = getelementptr i64, i64* %_Param_Area, i64 0
   store i64 %_source_val5, i64* %_dest5

   ; #Return_Op at 295:9
   %_result_reg6 = load i64, i64* %_Param_Area
   ret i64 %_result_reg6

}

define i64 @"PSL.Containers.Ordered_Set.Any_Element"(i64 %_formal_param_1, i64* %_Context, i64* %_Static_Link, i64 %_inited_output) {
   %_Local_Area = alloca i64, i64 4
   %_sl = ptrtoint i64* %_Static_Link to i64
   store i64 %_sl, i64* %_Local_Area

   %_Param_Area = alloca i64
   %_output.I4 = alloca i64

   store i64 %_inited_output, i64* %_Param_Area
   
   ; #Store_Null_Of_Same_Stg_Rgn_Op at 299:16
   %_cur_td1 = bitcast i64* %_Static_Link to %struct.TD*
   %_param_arr_ptr1 = getelementptr %struct.TD, %struct.TD* %_cur_td1, i32 0, i32 26
   %_param_arr1 = load %struct.ParamInfo*, %struct.ParamInfo** %_param_arr_ptr1
   %_formal_td_ptr_ptr1 = getelementptr %struct.ParamInfo, %struct.ParamInfo* %_param_arr1, i32 0, i32 1, i32 0
   %_formal_td1 = load %struct.TD*, %struct.TD** %_formal_td_ptr_ptr1
   %_desc1 = bitcast %struct.TD* %_formal_td1 to i64*
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

   ; #Copy_Word_Op at 299:28
   %_source_val2 = bitcast i64 %_formal_param_1 to i64
   %_loc_4 = bitcast i64 %_source_val2 to i64

   ; #Copy_Word_Op at 299:30
   %_reg3_1 = inttoptr i64 %_loc_4 to i64*
   %_source3 = getelementptr i64, i64* %_reg3_1, i64 1
   %_source_val3 = load i64, i64* %_source3
   %_loc_3 = bitcast i64 %_source_val3 to i64

   ; #Call_Op at 299:16
   ; inlining call on Any_Element
   store i64 %_loc_2, i64* %_output.I4
   %_cur_td4 = bitcast i64* %_Static_Link to %struct.TD*
   %_nested_types_arr_ptr4 = getelementptr %struct.TD, %struct.TD* %_cur_td4, i32 0, i32 35
   %_nested_types_arr4 = load %struct.TD**, %struct.TD*** %_nested_types_arr_ptr4
   %_nested_td_ptr_ptr4 = getelementptr %struct.TD*, %struct.TD** %_nested_types_arr4, i32 0
   %_nested_td4 = load %struct.TD*, %struct.TD** %_nested_td_ptr_ptr4
   %_call4_Static_Link = bitcast %struct.TD* %_nested_td4 to i64*

   ; #Copy_Word_Op at 401:12
   %_source_val.I4.1 = bitcast i64 %_loc_3 to i64
   %_loc_.I4_2 = bitcast i64 %_source_val.I4.1 to i64

   ; #Is_Null_Op at 401:12
   %_arg.I4.2 = bitcast i64 %_loc_.I4_2 to i64
   %_val_no_reg.I4.2 = and i64 %_arg.I4.2, -4294967295
   %_result_bit.I4.2 = icmp eq i64 %_val_no_reg.I4.2, -144115188075855871
   %_result_ext.I4.2 = zext i1 %_result_bit.I4.2 to i64
   %_loc_.I4_1 = bitcast i64 %_result_ext.I4.2 to i64

   ; #If_Op at 401:12
   %_if_source_val.I4.3 = bitcast i64 %_loc_.I4_1 to i64
   %_if_source_trunc.I4.3 = icmp eq i64 %_if_source_val.I4.3, 1
   br i1 %_if_source_trunc.I4.3, label %_lbl.I4_4, label %_lbl.I4_7

_lbl.I4_4:
   ; #Store_Null_Of_Same_Stg_Rgn_Op at 402:20
   %_cur_td.I4.4 = bitcast i64* %_call4_Static_Link to %struct.TD*
   %_param_arr_ptr.I4.4 = getelementptr %struct.TD, %struct.TD* %_cur_td.I4.4, i32 0, i32 26
   %_param_arr.I4.4 = load %struct.ParamInfo*, %struct.ParamInfo** %_param_arr_ptr.I4.4
   %_formal_td_ptr_ptr.I4.4 = getelementptr %struct.ParamInfo, %struct.ParamInfo* %_param_arr.I4.4, i32 0, i32 1, i32 0
   %_formal_td.I4.4 = load %struct.TD*, %struct.TD** %_formal_td_ptr_ptr.I4.4
   %_desc.I4.4 = bitcast %struct.TD* %_formal_td.I4.4 to i64*
   %_source_ptr.I4.4 = bitcast i64* %_output.I4 to i64*
   %_source.I4.4 = load i64, i64* %_source_ptr.I4.4
   %_td.I4.4 = bitcast i64* %_desc.I4.4 to %struct.TD*
   %_is_small_ptr.I4.4 = getelementptr %struct.TD, %struct.TD* %_td.I4.4, i32 0, i32 13
   %_is_small.I4.4 = load i8, i8* %_is_small_ptr.I4.4
   %_is_small_bool.I4.4 = trunc i8 %_is_small.I4.4 to i1
   br i1 %_is_small_bool.I4.4, label %_small_label.I4.4, label %_large_label.I4.4
   _small_label.I4.4:
   %_small_null_ptr.I4.4 = getelementptr %struct.TD, %struct.TD* %_td.I4.4, i32 0, i32 17
   %_small_null.I4.4 = load i64, i64* %_small_null_ptr.I4.4
   br label %_join_small_and_large.I4.4
   _large_label.I4.4:
   %_high_and_low_bits.I4.4 = and i64 %_source.I4.4, or (i64 shl (i64 1, i64 63), i64 1)
   %_is_special_bit.I4.4 = icmp eq i64 %_high_and_low_bits.I4.4, or (i64 shl (i64 1, i64 63), i64 1)
   br i1 %_is_special_bit.I4.4, label %_is_special_label.I4.4, label %_not_special_label.I4.4
   _is_special_label.I4.4:
   %_spcl_rgn_times2_.I4.4 = and i64 %_source.I4.4, 4294967295
   br label %_last_large_label.I4.4
   _not_special_label.I4.4:
   %_header_ptr.I4.4 = inttoptr i64 %_source.I4.4 to i64*
   %_hdr_of_src.I4.4 = load i64, i64* %_header_ptr.I4.4
   %_region_bits.I4.4 = and i64 %_hdr_of_src.I4.4, 4294901760
   %_normal_rgn_times2_.I4.4 = lshr i64 %_region_bits.I4.4, 15
   br label %_last_large_label.I4.4
   _last_large_label.I4.4:
   %_rgn_times2_.I4.4 = phi i64 [%_spcl_rgn_times2_.I4.4, %_is_special_label.I4.4], [%_normal_rgn_times2_.I4.4, %_not_special_label.I4.4]
   %_large_null.I4.4 = or i64 -144115188075855871, %_rgn_times2_.I4.4
   br label %_join_small_and_large.I4.4
   _join_small_and_large.I4.4:
   %_null.I4.4 = phi i64 [%_small_null.I4.4, %_small_label.I4.4],[%_large_null.I4.4, %_last_large_label.I4.4]
   %_loc_.I4_3 = bitcast i64 %_null.I4.4 to i64

   ; #Copy_Word_Op at 402:13
   %_source_val.I4.5 = bitcast i64 %_loc_.I4_3 to i64
   %_dest.I4.5 = bitcast i64* %_output.I4 to i64*
   store i64 %_source_val.I4.5, i64* %_dest.I4.5

   ; #Return_Op at 402:13
   br label %_lbl.I4_10

_lbl.I4_7:
   ; #Copy_Word_Op at 404:16
   %_source_val.I4.7 = bitcast i64 %_loc_3 to i64
   %_loc_.I4_5 = bitcast i64 %_source_val.I4.7 to i64

   ; #Make_Copy_In_Stg_Rgn_Op at 404:18
   %_cur_td.I4.8 = bitcast i64* %_call4_Static_Link to %struct.TD*
   %_param_arr_ptr.I4.8 = getelementptr %struct.TD, %struct.TD* %_cur_td.I4.8, i32 0, i32 26
   %_param_arr.I4.8 = load %struct.ParamInfo*, %struct.ParamInfo** %_param_arr_ptr.I4.8
   %_formal_td_ptr_ptr.I4.8 = getelementptr %struct.ParamInfo, %struct.ParamInfo* %_param_arr.I4.8, i32 0, i32 1, i32 0
   %_formal_td.I4.8 = load %struct.TD*, %struct.TD** %_formal_td_ptr_ptr.I4.8
   %_desc.I4.8 = bitcast %struct.TD* %_formal_td.I4.8 to i64*
   %_reg.I4.8_2 = inttoptr i64 %_loc_.I4_5 to i64*
   %_source_ptr.I4.8 = getelementptr i64, i64* %_reg.I4.8_2, i64 1
   %_source.I4.8 = load i64, i64* %_source_ptr.I4.8
   %_existing_ptr.I4.8 = bitcast i64* %_output.I4 to i64*
   %_existing_obj.I4.8 = load i64, i64* %_existing_ptr.I4.8
   %_result.I4.8 = call i64 @_psc_copy_object(i64* %_Context, i64* %_desc.I4.8, i64 %_source.I4.8, i64 %_existing_obj.I4.8)
   %_loc_.I4_4 = bitcast i64 %_result.I4.8 to i64

   ; #Copy_Word_Op at 404:9
   %_source_val.I4.9 = bitcast i64 %_loc_.I4_4 to i64
   %_dest.I4.9 = bitcast i64* %_output.I4 to i64*
   store i64 %_source_val.I4.9, i64* %_dest.I4.9

   br label %_lbl.I4_10

_lbl.I4_10:
   ; #Return_Op at 404:9

   %_new_result4 = load i64, i64* %_output.I4
   %_loc_1 = bitcast i64 %_new_result4 to i64

   ; #Copy_Word_Op at 299:9
   %_source_val5 = bitcast i64 %_loc_1 to i64
   %_dest5 = getelementptr i64, i64* %_Param_Area, i64 0
   store i64 %_source_val5, i64* %_dest5

   ; #Return_Op at 299:9
   %_result_reg6 = load i64, i64* %_Param_Area
   ret i64 %_result_reg6

}

define i64 @"PSL.Containers.Ordered_Set.Next"(i64 %_formal_param_1, i64 %_formal_param_2, i64* %_Context, i64* %_Static_Link, i64 %_inited_output) {
   %_Local_Area = alloca i64, i64 4
   %_sl = ptrtoint i64* %_Static_Link to i64
   store i64 %_sl, i64* %_Local_Area

   %_Param_Area = alloca i64

   store i64 %_inited_output, i64* %_Param_Area
   
   ; #Store_Null_Of_Same_Stg_Rgn_Op at 304:16
   %_cur_td1 = bitcast i64* %_Static_Link to %struct.TD*
   %_param_arr_ptr1 = getelementptr %struct.TD, %struct.TD* %_cur_td1, i32 0, i32 26
   %_param_arr1 = load %struct.ParamInfo*, %struct.ParamInfo** %_param_arr_ptr1
   %_formal_td_ptr_ptr1 = getelementptr %struct.ParamInfo, %struct.ParamInfo* %_param_arr1, i32 0, i32 1, i32 0
   %_formal_td1 = load %struct.TD*, %struct.TD** %_formal_td_ptr_ptr1
   %_desc1 = bitcast %struct.TD* %_formal_td1 to i64*
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

   ; #Copy_Word_Op at 304:21
   %_source_val2 = bitcast i64 %_formal_param_1 to i64
   %_loc_5 = bitcast i64 %_source_val2 to i64

   ; #Copy_Word_Op at 304:23
   %_reg3_1 = inttoptr i64 %_loc_5 to i64*
   %_source3 = getelementptr i64, i64* %_reg3_1, i64 1
   %_source_val3 = load i64, i64* %_source3
   %_loc_3 = bitcast i64 %_source_val3 to i64

   ; #Copy_Word_Op at 304:30
   %_source_val4 = bitcast i64 %_formal_param_2 to i64
   %_loc_4 = bitcast i64 %_source_val4 to i64

   ; #Call_Op at 304:16
   %_cur_td5 = bitcast i64* %_Static_Link to %struct.TD*
   %_nested_types_arr_ptr5 = getelementptr %struct.TD, %struct.TD* %_cur_td5, i32 0, i32 35
   %_nested_types_arr5 = load %struct.TD**, %struct.TD*** %_nested_types_arr_ptr5
   %_nested_td_ptr_ptr5 = getelementptr %struct.TD*, %struct.TD** %_nested_types_arr5, i32 0
   %_nested_td5 = load %struct.TD*, %struct.TD** %_nested_td_ptr_ptr5
   %_call5_Static_Link = bitcast %struct.TD* %_nested_td5 to i64*
   %_new_result5_0 = call i64 @"PSL.Core.AA_Tree.Next"(i64 %_loc_3, i64 %_loc_4, i64* %_Context, i64* %_call5_Static_Link, i64 %_loc_2)
   %_loc_1 = bitcast i64 %_new_result5_0 to i64

   ; #Copy_Word_Op at 304:9
   %_source_val6 = bitcast i64 %_loc_1 to i64
   %_dest6 = getelementptr i64, i64* %_Param_Area, i64 0
   store i64 %_source_val6, i64* %_dest6

   ; #Return_Op at 304:9
   %_result_reg7 = load i64, i64* %_Param_Area
   ret i64 %_result_reg7

}

define i64 @"PSL.Containers.Ordered_Set.Prev"(i64 %_formal_param_1, i64 %_formal_param_2, i64* %_Context, i64* %_Static_Link, i64 %_inited_output) {
   %_Local_Area = alloca i64, i64 4
   %_sl = ptrtoint i64* %_Static_Link to i64
   store i64 %_sl, i64* %_Local_Area

   %_Param_Area = alloca i64

   store i64 %_inited_output, i64* %_Param_Area
   
   ; #Store_Null_Of_Same_Stg_Rgn_Op at 309:16
   %_cur_td1 = bitcast i64* %_Static_Link to %struct.TD*
   %_param_arr_ptr1 = getelementptr %struct.TD, %struct.TD* %_cur_td1, i32 0, i32 26
   %_param_arr1 = load %struct.ParamInfo*, %struct.ParamInfo** %_param_arr_ptr1
   %_formal_td_ptr_ptr1 = getelementptr %struct.ParamInfo, %struct.ParamInfo* %_param_arr1, i32 0, i32 1, i32 0
   %_formal_td1 = load %struct.TD*, %struct.TD** %_formal_td_ptr_ptr1
   %_desc1 = bitcast %struct.TD* %_formal_td1 to i64*
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

   ; #Copy_Word_Op at 309:21
   %_source_val2 = bitcast i64 %_formal_param_1 to i64
   %_loc_5 = bitcast i64 %_source_val2 to i64

   ; #Copy_Word_Op at 309:23
   %_reg3_1 = inttoptr i64 %_loc_5 to i64*
   %_source3 = getelementptr i64, i64* %_reg3_1, i64 1
   %_source_val3 = load i64, i64* %_source3
   %_loc_3 = bitcast i64 %_source_val3 to i64

   ; #Copy_Word_Op at 309:30
   %_source_val4 = bitcast i64 %_formal_param_2 to i64
   %_loc_4 = bitcast i64 %_source_val4 to i64

   ; #Call_Op at 309:16
   %_cur_td5 = bitcast i64* %_Static_Link to %struct.TD*
   %_nested_types_arr_ptr5 = getelementptr %struct.TD, %struct.TD* %_cur_td5, i32 0, i32 35
   %_nested_types_arr5 = load %struct.TD**, %struct.TD*** %_nested_types_arr_ptr5
   %_nested_td_ptr_ptr5 = getelementptr %struct.TD*, %struct.TD** %_nested_types_arr5, i32 0
   %_nested_td5 = load %struct.TD*, %struct.TD** %_nested_td_ptr_ptr5
   %_call5_Static_Link = bitcast %struct.TD* %_nested_td5 to i64*
   %_new_result5_0 = call i64 @"PSL.Core.AA_Tree.Prev"(i64 %_loc_3, i64 %_loc_4, i64* %_Context, i64* %_call5_Static_Link, i64 %_loc_2)
   %_loc_1 = bitcast i64 %_new_result5_0 to i64

   ; #Copy_Word_Op at 309:9
   %_source_val6 = bitcast i64 %_loc_1 to i64
   %_dest6 = getelementptr i64, i64* %_Param_Area, i64 0
   store i64 %_source_val6, i64* %_dest6

   ; #Return_Op at 309:9
   %_result_reg7 = load i64, i64* %_Param_Area
   ret i64 %_result_reg7

}

define i64 @"PSL.Containers.Ordered_Set.Min_No_Less"(i64 %_formal_param_1, i64 %_formal_param_2, i64* %_Context, i64* %_Static_Link, i64 %_inited_output) {
   %_Local_Area = alloca i64, i64 4
   %_sl = ptrtoint i64* %_Static_Link to i64
   store i64 %_sl, i64* %_Local_Area

   %_Param_Area = alloca i64

   store i64 %_inited_output, i64* %_Param_Area
   
   ; #Store_Null_Of_Same_Stg_Rgn_Op at 315:16
   %_cur_td1 = bitcast i64* %_Static_Link to %struct.TD*
   %_param_arr_ptr1 = getelementptr %struct.TD, %struct.TD* %_cur_td1, i32 0, i32 26
   %_param_arr1 = load %struct.ParamInfo*, %struct.ParamInfo** %_param_arr_ptr1
   %_formal_td_ptr_ptr1 = getelementptr %struct.ParamInfo, %struct.ParamInfo* %_param_arr1, i32 0, i32 1, i32 0
   %_formal_td1 = load %struct.TD*, %struct.TD** %_formal_td_ptr_ptr1
   %_desc1 = bitcast %struct.TD* %_formal_td1 to i64*
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

   ; #Copy_Word_Op at 315:28
   %_source_val2 = bitcast i64 %_formal_param_1 to i64
   %_loc_5 = bitcast i64 %_source_val2 to i64

   ; #Copy_Word_Op at 315:30
   %_reg3_1 = inttoptr i64 %_loc_5 to i64*
   %_source3 = getelementptr i64, i64* %_reg3_1, i64 1
   %_source_val3 = load i64, i64* %_source3
   %_loc_3 = bitcast i64 %_source_val3 to i64

   ; #Copy_Word_Op at 315:37
   %_source_val4 = bitcast i64 %_formal_param_2 to i64
   %_loc_4 = bitcast i64 %_source_val4 to i64

   ; #Call_Op at 315:16
   %_cur_td5 = bitcast i64* %_Static_Link to %struct.TD*
   %_nested_types_arr_ptr5 = getelementptr %struct.TD, %struct.TD* %_cur_td5, i32 0, i32 35
   %_nested_types_arr5 = load %struct.TD**, %struct.TD*** %_nested_types_arr_ptr5
   %_nested_td_ptr_ptr5 = getelementptr %struct.TD*, %struct.TD** %_nested_types_arr5, i32 0
   %_nested_td5 = load %struct.TD*, %struct.TD** %_nested_td_ptr_ptr5
   %_call5_Static_Link = bitcast %struct.TD* %_nested_td5 to i64*
   %_new_result5_0 = call i64 @"PSL.Core.AA_Tree.Min_No_Less"(i64 %_loc_3, i64 %_loc_4, i64* %_Context, i64* %_call5_Static_Link, i64 %_loc_2)
   %_loc_1 = bitcast i64 %_new_result5_0 to i64

   ; #Copy_Word_Op at 315:9
   %_source_val6 = bitcast i64 %_loc_1 to i64
   %_dest6 = getelementptr i64, i64* %_Param_Area, i64 0
   store i64 %_source_val6, i64* %_dest6

   ; #Return_Op at 315:9
   %_result_reg7 = load i64, i64* %_Param_Area
   ret i64 %_result_reg7

}

define i64 @"PSL.Containers.Ordered_Set.Max_No_Greater"(i64 %_formal_param_1, i64 %_formal_param_2, i64* %_Context, i64* %_Static_Link, i64 %_inited_output) {
   %_Local_Area = alloca i64, i64 4
   %_sl = ptrtoint i64* %_Static_Link to i64
   store i64 %_sl, i64* %_Local_Area

   %_Param_Area = alloca i64

   store i64 %_inited_output, i64* %_Param_Area
   
   ; #Store_Null_Of_Same_Stg_Rgn_Op at 321:16
   %_cur_td1 = bitcast i64* %_Static_Link to %struct.TD*
   %_param_arr_ptr1 = getelementptr %struct.TD, %struct.TD* %_cur_td1, i32 0, i32 26
   %_param_arr1 = load %struct.ParamInfo*, %struct.ParamInfo** %_param_arr_ptr1
   %_formal_td_ptr_ptr1 = getelementptr %struct.ParamInfo, %struct.ParamInfo* %_param_arr1, i32 0, i32 1, i32 0
   %_formal_td1 = load %struct.TD*, %struct.TD** %_formal_td_ptr_ptr1
   %_desc1 = bitcast %struct.TD* %_formal_td1 to i64*
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

   ; #Copy_Word_Op at 321:31
   %_source_val2 = bitcast i64 %_formal_param_1 to i64
   %_loc_5 = bitcast i64 %_source_val2 to i64

   ; #Copy_Word_Op at 321:33
   %_reg3_1 = inttoptr i64 %_loc_5 to i64*
   %_source3 = getelementptr i64, i64* %_reg3_1, i64 1
   %_source_val3 = load i64, i64* %_source3
   %_loc_3 = bitcast i64 %_source_val3 to i64

   ; #Copy_Word_Op at 321:40
   %_source_val4 = bitcast i64 %_formal_param_2 to i64
   %_loc_4 = bitcast i64 %_source_val4 to i64

   ; #Call_Op at 321:16
   %_cur_td5 = bitcast i64* %_Static_Link to %struct.TD*
   %_nested_types_arr_ptr5 = getelementptr %struct.TD, %struct.TD* %_cur_td5, i32 0, i32 35
   %_nested_types_arr5 = load %struct.TD**, %struct.TD*** %_nested_types_arr_ptr5
   %_nested_td_ptr_ptr5 = getelementptr %struct.TD*, %struct.TD** %_nested_types_arr5, i32 0
   %_nested_td5 = load %struct.TD*, %struct.TD** %_nested_td_ptr_ptr5
   %_call5_Static_Link = bitcast %struct.TD* %_nested_td5 to i64*
   %_new_result5_0 = call i64 @"PSL.Core.AA_Tree.Max_No_Greater"(i64 %_loc_3, i64 %_loc_4, i64* %_Context, i64* %_call5_Static_Link, i64 %_loc_2)
   %_loc_1 = bitcast i64 %_new_result5_0 to i64

   ; #Copy_Word_Op at 321:9
   %_source_val6 = bitcast i64 %_loc_1 to i64
   %_dest6 = getelementptr i64, i64* %_Param_Area, i64 0
   store i64 %_source_val6, i64* %_dest6

   ; #Return_Op at 321:9
   %_result_reg7 = load i64, i64* %_Param_Area
   ret i64 %_result_reg7

}

define i64 @"PSL.Containers.Ordered_Set.Remove_First"(i64* %_formal_param_1, i64* %_Context, i64* %_Static_Link, i64 %_inited_output) {
   %_Local_Area = alloca i64, i64 4
   %_sl = ptrtoint i64* %_Static_Link to i64
   store i64 %_sl, i64* %_Local_Area

   %_Param_Area = alloca i64

   store i64 %_inited_output, i64* %_Param_Area
   
   ; #Store_Null_Of_Same_Stg_Rgn_Op at 327:19
   %_cur_td1 = bitcast i64* %_Static_Link to %struct.TD*
   %_param_arr_ptr1 = getelementptr %struct.TD, %struct.TD* %_cur_td1, i32 0, i32 26
   %_param_arr1 = load %struct.ParamInfo*, %struct.ParamInfo** %_param_arr_ptr1
   %_formal_td_ptr_ptr1 = getelementptr %struct.ParamInfo, %struct.ParamInfo* %_param_arr1, i32 0, i32 1, i32 0
   %_formal_td1 = load %struct.TD*, %struct.TD** %_formal_td_ptr_ptr1
   %_desc1 = bitcast %struct.TD* %_formal_td1 to i64*
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

   ; #Copy_Address_Op at 327:32
   %_source_val2 = bitcast i64* %_formal_param_1 to i64*
   %_loc_5 = bitcast i64* %_source_val2 to i64*

   ; #Copy_Word_Op at 327:32
   %_reg3_1 = bitcast i64* %_loc_5 to i64*
   %_source3 = getelementptr i64, i64* %_reg3_1, i64 0
   %_source_val3 = load i64, i64* %_source3
   %_loc_4 = bitcast i64 %_source_val3 to i64

   ; #Store_Address_Op at 327:19
   %_reg4_1 = inttoptr i64 %_loc_4 to i64*
   %_addr4 = getelementptr i64, i64* %_reg4_1, i64 1
   %_loc_3 = bitcast i64* %_addr4 to i64*

   ; #Call_Op at 327:19
   %_cur_td5 = bitcast i64* %_Static_Link to %struct.TD*
   %_nested_types_arr_ptr5 = getelementptr %struct.TD, %struct.TD* %_cur_td5, i32 0, i32 35
   %_nested_types_arr5 = load %struct.TD**, %struct.TD*** %_nested_types_arr_ptr5
   %_nested_td_ptr_ptr5 = getelementptr %struct.TD*, %struct.TD** %_nested_types_arr5, i32 0
   %_nested_td5 = load %struct.TD*, %struct.TD** %_nested_td_ptr_ptr5
   %_call5_Static_Link = bitcast %struct.TD* %_nested_td5 to i64*
   %_new_result5_0 = call i64 @"PSL.Core.AA_Tree.Remove_First"(i64* %_loc_3, i64* %_Context, i64* %_call5_Static_Link, i64 %_loc_2)
   %_loc_1 = bitcast i64 %_new_result5_0 to i64

   ; #Assign_Word_Op at 327:9
   %_cur_td6 = bitcast i64* %_Static_Link to %struct.TD*
   %_param_arr_ptr6 = getelementptr %struct.TD, %struct.TD* %_cur_td6, i32 0, i32 26
   %_param_arr6 = load %struct.ParamInfo*, %struct.ParamInfo** %_param_arr_ptr6
   %_formal_td_ptr_ptr6 = getelementptr %struct.ParamInfo, %struct.ParamInfo* %_param_arr6, i32 0, i32 1, i32 0
   %_formal_td6 = load %struct.TD*, %struct.TD** %_formal_td_ptr_ptr6
   %_desc6 = bitcast %struct.TD* %_formal_td6 to i64*
   %_source6 = bitcast i64 %_loc_1 to i64
   %_dest_ptr6 = getelementptr i64, i64* %_Param_Area, i64 0
   call void @_psc_assign_word(i64* %_Context, i64* %_desc6, i64* %_dest_ptr6, i64 %_source6)

   ; #Copy_Word_Op at 328:12
   %_source7 = getelementptr i64, i64* %_Param_Area, i64 0
   %_source_val7 = load i64, i64* %_source7
   %_loc_7 = bitcast i64 %_source_val7 to i64

   ; #Not_Null_Op at 328:12
   %_arg8 = bitcast i64 %_loc_7 to i64
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
   br i1 %_is_small_bool8, label %_is_small_lbl8, label %_is_large_lbl8
   _is_small_lbl8:
   %_small_null_ptr8 = getelementptr %struct.TD, %struct.TD* %_td8, i32 0, i32 17
   %_small_null8 = load i64, i64* %_small_null_ptr8
   %_small_result8 = icmp ne i64 %_arg8, %_small_null8
   br label %_join8
   _is_large_lbl8:
   %_val_no_reg8 = and i64 %_arg8, -4294967295
   %_large_result8 = icmp ne i64 %_val_no_reg8, -144115188075855871
   br label %_join8
   _join8:
   %_result_bit8 = phi i1 [%_small_result8, %_is_small_lbl8], [%_large_result8, %_is_large_lbl8]
   %_result_ext8 = zext i1 %_result_bit8 to i64
   %_loc_6 = bitcast i64 %_result_ext8 to i64

   ; #If_Op at 328:12
   %_if_source_val9 = bitcast i64 %_loc_6 to i64
   %_if_source_trunc9 = icmp eq i64 %_if_source_val9, 1
   br i1 %_if_source_trunc9, label %_lbl10, label %_lbl15

_lbl10:
   ; #Copy_Address_Op at 329:12
   %_source_val10 = bitcast i64* %_formal_param_1 to i64*
   %_loc_11 = bitcast i64* %_source_val10 to i64*

   ; #Copy_Word_Op at 329:12
   %_reg11_1 = bitcast i64* %_loc_11 to i64*
   %_source11 = getelementptr i64, i64* %_reg11_1, i64 0
   %_source_val11 = load i64, i64* %_source11
   %_loc_10 = bitcast i64 %_source_val11 to i64

   ; #Store_Address_Op at 329:14
   %_reg12_1 = inttoptr i64 %_loc_10 to i64*
   %_addr12 = getelementptr i64, i64* %_reg12_1, i64 2
   %_loc_8 = bitcast i64* %_addr12 to i64*

   ; #Store_Int_Lit_Op at 329:23
   %_loc_9 = bitcast i64 1 to i64

   ; #Call_Op at 329:14
   %_left_ptr14 = bitcast i64* %_loc_8 to i64*
   %_left14 = load i64, i64* %_left_ptr14
   %_right14 = bitcast i64 %_loc_9 to i64
   %_result14 = sub nsw i64 %_left14, %_right14
   store i64 %_result14, i64* %_left_ptr14

   br label %_lbl15

_lbl15:
   ; #Return_Op at 331:5
   %_result_reg15 = load i64, i64* %_Param_Area
   ret i64 %_result_reg15

}

define i64 @"PSL.Containers.Ordered_Set.Remove_Last"(i64* %_formal_param_1, i64* %_Context, i64* %_Static_Link, i64 %_inited_output) {
   %_Local_Area = alloca i64, i64 4
   %_sl = ptrtoint i64* %_Static_Link to i64
   store i64 %_sl, i64* %_Local_Area

   %_Param_Area = alloca i64

   store i64 %_inited_output, i64* %_Param_Area
   
   ; #Store_Null_Of_Same_Stg_Rgn_Op at 336:19
   %_cur_td1 = bitcast i64* %_Static_Link to %struct.TD*
   %_param_arr_ptr1 = getelementptr %struct.TD, %struct.TD* %_cur_td1, i32 0, i32 26
   %_param_arr1 = load %struct.ParamInfo*, %struct.ParamInfo** %_param_arr_ptr1
   %_formal_td_ptr_ptr1 = getelementptr %struct.ParamInfo, %struct.ParamInfo* %_param_arr1, i32 0, i32 1, i32 0
   %_formal_td1 = load %struct.TD*, %struct.TD** %_formal_td_ptr_ptr1
   %_desc1 = bitcast %struct.TD* %_formal_td1 to i64*
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

   ; #Copy_Address_Op at 336:31
   %_source_val2 = bitcast i64* %_formal_param_1 to i64*
   %_loc_5 = bitcast i64* %_source_val2 to i64*

   ; #Copy_Word_Op at 336:31
   %_reg3_1 = bitcast i64* %_loc_5 to i64*
   %_source3 = getelementptr i64, i64* %_reg3_1, i64 0
   %_source_val3 = load i64, i64* %_source3
   %_loc_4 = bitcast i64 %_source_val3 to i64

   ; #Store_Address_Op at 336:19
   %_reg4_1 = inttoptr i64 %_loc_4 to i64*
   %_addr4 = getelementptr i64, i64* %_reg4_1, i64 1
   %_loc_3 = bitcast i64* %_addr4 to i64*

   ; #Call_Op at 336:19
   %_cur_td5 = bitcast i64* %_Static_Link to %struct.TD*
   %_nested_types_arr_ptr5 = getelementptr %struct.TD, %struct.TD* %_cur_td5, i32 0, i32 35
   %_nested_types_arr5 = load %struct.TD**, %struct.TD*** %_nested_types_arr_ptr5
   %_nested_td_ptr_ptr5 = getelementptr %struct.TD*, %struct.TD** %_nested_types_arr5, i32 0
   %_nested_td5 = load %struct.TD*, %struct.TD** %_nested_td_ptr_ptr5
   %_call5_Static_Link = bitcast %struct.TD* %_nested_td5 to i64*
   %_new_result5_0 = call i64 @"PSL.Core.AA_Tree.Remove_Last"(i64* %_loc_3, i64* %_Context, i64* %_call5_Static_Link, i64 %_loc_2)
   %_loc_1 = bitcast i64 %_new_result5_0 to i64

   ; #Assign_Word_Op at 336:9
   %_cur_td6 = bitcast i64* %_Static_Link to %struct.TD*
   %_param_arr_ptr6 = getelementptr %struct.TD, %struct.TD* %_cur_td6, i32 0, i32 26
   %_param_arr6 = load %struct.ParamInfo*, %struct.ParamInfo** %_param_arr_ptr6
   %_formal_td_ptr_ptr6 = getelementptr %struct.ParamInfo, %struct.ParamInfo* %_param_arr6, i32 0, i32 1, i32 0
   %_formal_td6 = load %struct.TD*, %struct.TD** %_formal_td_ptr_ptr6
   %_desc6 = bitcast %struct.TD* %_formal_td6 to i64*
   %_source6 = bitcast i64 %_loc_1 to i64
   %_dest_ptr6 = getelementptr i64, i64* %_Param_Area, i64 0
   call void @_psc_assign_word(i64* %_Context, i64* %_desc6, i64* %_dest_ptr6, i64 %_source6)

   ; #Copy_Word_Op at 337:12
   %_source7 = getelementptr i64, i64* %_Param_Area, i64 0
   %_source_val7 = load i64, i64* %_source7
   %_loc_7 = bitcast i64 %_source_val7 to i64

   ; #Not_Null_Op at 337:12
   %_arg8 = bitcast i64 %_loc_7 to i64
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
   br i1 %_is_small_bool8, label %_is_small_lbl8, label %_is_large_lbl8
   _is_small_lbl8:
   %_small_null_ptr8 = getelementptr %struct.TD, %struct.TD* %_td8, i32 0, i32 17
   %_small_null8 = load i64, i64* %_small_null_ptr8
   %_small_result8 = icmp ne i64 %_arg8, %_small_null8
   br label %_join8
   _is_large_lbl8:
   %_val_no_reg8 = and i64 %_arg8, -4294967295
   %_large_result8 = icmp ne i64 %_val_no_reg8, -144115188075855871
   br label %_join8
   _join8:
   %_result_bit8 = phi i1 [%_small_result8, %_is_small_lbl8], [%_large_result8, %_is_large_lbl8]
   %_result_ext8 = zext i1 %_result_bit8 to i64
   %_loc_6 = bitcast i64 %_result_ext8 to i64

   ; #If_Op at 337:12
   %_if_source_val9 = bitcast i64 %_loc_6 to i64
   %_if_source_trunc9 = icmp eq i64 %_if_source_val9, 1
   br i1 %_if_source_trunc9, label %_lbl10, label %_lbl15

_lbl10:
   ; #Copy_Address_Op at 338:12
   %_source_val10 = bitcast i64* %_formal_param_1 to i64*
   %_loc_11 = bitcast i64* %_source_val10 to i64*

   ; #Copy_Word_Op at 338:12
   %_reg11_1 = bitcast i64* %_loc_11 to i64*
   %_source11 = getelementptr i64, i64* %_reg11_1, i64 0
   %_source_val11 = load i64, i64* %_source11
   %_loc_10 = bitcast i64 %_source_val11 to i64

   ; #Store_Address_Op at 338:14
   %_reg12_1 = inttoptr i64 %_loc_10 to i64*
   %_addr12 = getelementptr i64, i64* %_reg12_1, i64 2
   %_loc_8 = bitcast i64* %_addr12 to i64*

   ; #Store_Int_Lit_Op at 338:23
   %_loc_9 = bitcast i64 1 to i64

   ; #Call_Op at 338:14
   %_left_ptr14 = bitcast i64* %_loc_8 to i64*
   %_left14 = load i64, i64* %_left_ptr14
   %_right14 = bitcast i64 %_loc_9 to i64
   %_result14 = sub nsw i64 %_left14, %_right14
   store i64 %_result14, i64* %_left_ptr14

   br label %_lbl15

_lbl15:
   ; #Return_Op at 340:5
   %_result_reg15 = load i64, i64* %_Param_Area
   ret i64 %_result_reg15

}

define i64 @"PSL.Containers.Ordered_Set.Remove_Any"(i64* %_formal_param_1, i64* %_Context, i64* %_Static_Link, i64 %_inited_output) {
   %_Local_Area = alloca i64, i64 4
   %_sl = ptrtoint i64* %_Static_Link to i64
   store i64 %_sl, i64* %_Local_Area

   %_Param_Area = alloca i64

   store i64 %_inited_output, i64* %_Param_Area
   
   ; #Store_Null_Of_Same_Stg_Rgn_Op at 344:19
   %_cur_td1 = bitcast i64* %_Static_Link to %struct.TD*
   %_param_arr_ptr1 = getelementptr %struct.TD, %struct.TD* %_cur_td1, i32 0, i32 26
   %_param_arr1 = load %struct.ParamInfo*, %struct.ParamInfo** %_param_arr_ptr1
   %_formal_td_ptr_ptr1 = getelementptr %struct.ParamInfo, %struct.ParamInfo* %_param_arr1, i32 0, i32 1, i32 0
   %_formal_td1 = load %struct.TD*, %struct.TD** %_formal_td_ptr_ptr1
   %_desc1 = bitcast %struct.TD* %_formal_td1 to i64*
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

   ; #Copy_Address_Op at 344:30
   %_source_val2 = bitcast i64* %_formal_param_1 to i64*
   %_loc_5 = bitcast i64* %_source_val2 to i64*

   ; #Copy_Word_Op at 344:30
   %_reg3_1 = bitcast i64* %_loc_5 to i64*
   %_source3 = getelementptr i64, i64* %_reg3_1, i64 0
   %_source_val3 = load i64, i64* %_source3
   %_loc_4 = bitcast i64 %_source_val3 to i64

   ; #Store_Address_Op at 344:19
   %_reg4_1 = inttoptr i64 %_loc_4 to i64*
   %_addr4 = getelementptr i64, i64* %_reg4_1, i64 1
   %_loc_3 = bitcast i64* %_addr4 to i64*

   ; #Call_Op at 344:19
   %_cur_td5 = bitcast i64* %_Static_Link to %struct.TD*
   %_nested_types_arr_ptr5 = getelementptr %struct.TD, %struct.TD* %_cur_td5, i32 0, i32 35
   %_nested_types_arr5 = load %struct.TD**, %struct.TD*** %_nested_types_arr_ptr5
   %_nested_td_ptr_ptr5 = getelementptr %struct.TD*, %struct.TD** %_nested_types_arr5, i32 0
   %_nested_td5 = load %struct.TD*, %struct.TD** %_nested_td_ptr_ptr5
   %_call5_Static_Link = bitcast %struct.TD* %_nested_td5 to i64*
   %_new_result5_0 = call i64 @"PSL.Core.AA_Tree.Remove_Any"(i64* %_loc_3, i64* %_Context, i64* %_call5_Static_Link, i64 %_loc_2)
   %_loc_1 = bitcast i64 %_new_result5_0 to i64

   ; #Assign_Word_Op at 344:9
   %_cur_td6 = bitcast i64* %_Static_Link to %struct.TD*
   %_param_arr_ptr6 = getelementptr %struct.TD, %struct.TD* %_cur_td6, i32 0, i32 26
   %_param_arr6 = load %struct.ParamInfo*, %struct.ParamInfo** %_param_arr_ptr6
   %_formal_td_ptr_ptr6 = getelementptr %struct.ParamInfo, %struct.ParamInfo* %_param_arr6, i32 0, i32 1, i32 0
   %_formal_td6 = load %struct.TD*, %struct.TD** %_formal_td_ptr_ptr6
   %_desc6 = bitcast %struct.TD* %_formal_td6 to i64*
   %_source6 = bitcast i64 %_loc_1 to i64
   %_dest_ptr6 = getelementptr i64, i64* %_Param_Area, i64 0
   call void @_psc_assign_word(i64* %_Context, i64* %_desc6, i64* %_dest_ptr6, i64 %_source6)

   ; #Copy_Word_Op at 345:12
   %_source7 = getelementptr i64, i64* %_Param_Area, i64 0
   %_source_val7 = load i64, i64* %_source7
   %_loc_7 = bitcast i64 %_source_val7 to i64

   ; #Not_Null_Op at 345:12
   %_arg8 = bitcast i64 %_loc_7 to i64
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
   br i1 %_is_small_bool8, label %_is_small_lbl8, label %_is_large_lbl8
   _is_small_lbl8:
   %_small_null_ptr8 = getelementptr %struct.TD, %struct.TD* %_td8, i32 0, i32 17
   %_small_null8 = load i64, i64* %_small_null_ptr8
   %_small_result8 = icmp ne i64 %_arg8, %_small_null8
   br label %_join8
   _is_large_lbl8:
   %_val_no_reg8 = and i64 %_arg8, -4294967295
   %_large_result8 = icmp ne i64 %_val_no_reg8, -144115188075855871
   br label %_join8
   _join8:
   %_result_bit8 = phi i1 [%_small_result8, %_is_small_lbl8], [%_large_result8, %_is_large_lbl8]
   %_result_ext8 = zext i1 %_result_bit8 to i64
   %_loc_6 = bitcast i64 %_result_ext8 to i64

   ; #If_Op at 345:12
   %_if_source_val9 = bitcast i64 %_loc_6 to i64
   %_if_source_trunc9 = icmp eq i64 %_if_source_val9, 1
   br i1 %_if_source_trunc9, label %_lbl10, label %_lbl15

_lbl10:
   ; #Copy_Address_Op at 346:12
   %_source_val10 = bitcast i64* %_formal_param_1 to i64*
   %_loc_11 = bitcast i64* %_source_val10 to i64*

   ; #Copy_Word_Op at 346:12
   %_reg11_1 = bitcast i64* %_loc_11 to i64*
   %_source11 = getelementptr i64, i64* %_reg11_1, i64 0
   %_source_val11 = load i64, i64* %_source11
   %_loc_10 = bitcast i64 %_source_val11 to i64

   ; #Store_Address_Op at 346:14
   %_reg12_1 = inttoptr i64 %_loc_10 to i64*
   %_addr12 = getelementptr i64, i64* %_reg12_1, i64 2
   %_loc_8 = bitcast i64* %_addr12 to i64*

   ; #Store_Int_Lit_Op at 346:23
   %_loc_9 = bitcast i64 1 to i64

   ; #Call_Op at 346:14
   %_left_ptr14 = bitcast i64* %_loc_8 to i64*
   %_left14 = load i64, i64* %_left_ptr14
   %_right14 = bitcast i64 %_loc_9 to i64
   %_result14 = sub nsw i64 %_left14, %_right14
   store i64 %_result14, i64* %_left_ptr14

   br label %_lbl15

_lbl15:
   ; #Return_Op at 348:5
   %_result_reg15 = load i64, i64* %_Param_Area
   ret i64 %_result_reg15

}

