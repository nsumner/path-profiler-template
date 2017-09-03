; ModuleID = '<stdin>'
source_filename = "c/06-nestedbranches.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [6 x i8] c"True\0A\00", align 1
@.str.1 = private unnamed_addr constant [8 x i8] c"Truish\0A\00", align 1
@.str.2 = private unnamed_addr constant [7 x i8] c"False\0A\00", align 1
@.str.3 = private unnamed_addr constant [6 x i8] c"Finn\0A\00", align 1
@.str.4 = private unnamed_addr constant [6 x i8] c"Jake\0A\00", align 1

; Function Attrs: nounwind uwtable
define void @profiled(i32, i32) #0 !dbg !6 {
  call void @llvm.dbg.value(metadata i32 %0, i64 0, metadata !10, metadata !11), !dbg !12
  call void @llvm.dbg.value(metadata i32 %1, i64 0, metadata !13, metadata !11), !dbg !14
  %3 = add nsw i32 %1, %0, !dbg !15
  %4 = srem i32 %3, 3, !dbg !17
  %5 = icmp ne i32 %4, 0, !dbg !17
  br i1 %5, label %6, label %15, !dbg !18

; <label>:6:                                      ; preds = %2
  %7 = add nsw i32 %1, %0, !dbg !19
  %8 = srem i32 %7, 6, !dbg !22
  %9 = icmp ne i32 %8, 0, !dbg !22
  br i1 %9, label %10, label %12, !dbg !23

; <label>:10:                                     ; preds = %6
  %11 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str, i32 0, i32 0)), !dbg !24
  br label %14, !dbg !26

; <label>:12:                                     ; preds = %6
  %13 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.1, i32 0, i32 0)), !dbg !27
  br label %14

; <label>:14:                                     ; preds = %12, %10
  br label %17, !dbg !29

; <label>:15:                                     ; preds = %2
  %16 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.2, i32 0, i32 0)), !dbg !30
  br label %17

; <label>:17:                                     ; preds = %15, %14
  %18 = add nsw i32 %1, %0, !dbg !32
  %19 = srem i32 %18, 5, !dbg !34
  %20 = icmp ne i32 %19, 0, !dbg !34
  br i1 %20, label %21, label %23, !dbg !35

; <label>:21:                                     ; preds = %17
  %22 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.3, i32 0, i32 0)), !dbg !36
  br label %25, !dbg !38

; <label>:23:                                     ; preds = %17
  %24 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.4, i32 0, i32 0)), !dbg !39
  br label %25

; <label>:25:                                     ; preds = %23, %21
  ret void, !dbg !41
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @printf(i8*, ...) #2

; Function Attrs: nounwind uwtable
define i32 @main(i32, i8**) #0 !dbg !42 {
  call void @llvm.dbg.value(metadata i32 %0, i64 0, metadata !48, metadata !11), !dbg !49
  call void @llvm.dbg.value(metadata i8** %1, i64 0, metadata !50, metadata !11), !dbg !51
  call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !52, metadata !11), !dbg !54
  call void @llvm.dbg.value(metadata i32 100, i64 0, metadata !55, metadata !11), !dbg !56
  br label %3, !dbg !57

; <label>:3:                                      ; preds = %15, %2
  %.01 = phi i32 [ 0, %2 ], [ %16, %15 ]
  %4 = icmp ne i32 %.01, 100, !dbg !58
  br i1 %4, label %5, label %17, !dbg !61

; <label>:5:                                      ; preds = %3
  call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !62, metadata !11), !dbg !65
  %6 = getelementptr inbounds i8*, i8** %1, i64 1, !dbg !66
  %7 = load i8*, i8** %6, align 8, !dbg !66
  %8 = call i32 @atoi(i8* %7) #4, !dbg !67
  call void @llvm.dbg.value(metadata i32 %8, i64 0, metadata !68, metadata !11), !dbg !69
  br label %9, !dbg !70

; <label>:9:                                      ; preds = %12, %5
  %.0 = phi i32 [ 0, %5 ], [ %13, %12 ]
  %10 = icmp slt i32 %.0, %8, !dbg !71
  br i1 %10, label %11, label %14, !dbg !74

; <label>:11:                                     ; preds = %9
  call void @profiled(i32 %0, i32 %.0), !dbg !75
  br label %12, !dbg !77

; <label>:12:                                     ; preds = %11
  %13 = add nsw i32 %.0, 1, !dbg !78
  call void @llvm.dbg.value(metadata i32 %13, i64 0, metadata !62, metadata !11), !dbg !65
  br label %9, !dbg !80, !llvm.loop !81

; <label>:14:                                     ; preds = %9
  br label %15, !dbg !83

; <label>:15:                                     ; preds = %14
  %16 = add nsw i32 %.01, 1, !dbg !84
  call void @llvm.dbg.value(metadata i32 %16, i64 0, metadata !52, metadata !11), !dbg !54
  br label %3, !dbg !86, !llvm.loop !87

; <label>:17:                                     ; preds = %3
  ret i32 0, !dbg !89
}

; Function Attrs: nounwind readonly
declare i32 @atoi(i8*) #3

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata, metadata) #1

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readonly "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind readonly }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4}
!llvm.ident = !{!5}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (tags/RELEASE_390/final)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2)
!1 = !DIFile(filename: "c/06-nestedbranches.c", directory: "/home/nick/teaching/886/pathprofiler/test")
!2 = !{}
!3 = !{i32 2, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{!"clang version 3.9.0 (tags/RELEASE_390/final)"}
!6 = distinct !DISubprogram(name: "profiled", scope: !1, file: !1, line: 7, type: !7, isLocal: false, isDefinition: true, scopeLine: 7, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!7 = !DISubroutineType(types: !8)
!8 = !{null, !9, !9}
!9 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!10 = !DILocalVariable(name: "argc", arg: 1, scope: !6, file: !1, line: 7, type: !9)
!11 = !DIExpression()
!12 = !DILocation(line: 7, column: 14, scope: !6)
!13 = !DILocalVariable(name: "i", arg: 2, scope: !6, file: !1, line: 7, type: !9)
!14 = !DILocation(line: 7, column: 24, scope: !6)
!15 = !DILocation(line: 8, column: 10, scope: !16)
!16 = distinct !DILexicalBlock(scope: !6, file: !1, line: 8, column: 7)
!17 = !DILocation(line: 8, column: 18, scope: !16)
!18 = !DILocation(line: 8, column: 7, scope: !6)
!19 = !DILocation(line: 9, column: 12, scope: !20)
!20 = distinct !DILexicalBlock(scope: !21, file: !1, line: 9, column: 9)
!21 = distinct !DILexicalBlock(scope: !16, file: !1, line: 8, column: 23)
!22 = !DILocation(line: 9, column: 20, scope: !20)
!23 = !DILocation(line: 9, column: 9, scope: !21)
!24 = !DILocation(line: 10, column: 7, scope: !25)
!25 = distinct !DILexicalBlock(scope: !20, file: !1, line: 9, column: 25)
!26 = !DILocation(line: 11, column: 5, scope: !25)
!27 = !DILocation(line: 12, column: 7, scope: !28)
!28 = distinct !DILexicalBlock(scope: !20, file: !1, line: 11, column: 12)
!29 = !DILocation(line: 14, column: 3, scope: !21)
!30 = !DILocation(line: 15, column: 5, scope: !31)
!31 = distinct !DILexicalBlock(scope: !16, file: !1, line: 14, column: 10)
!32 = !DILocation(line: 17, column: 10, scope: !33)
!33 = distinct !DILexicalBlock(scope: !6, file: !1, line: 17, column: 7)
!34 = !DILocation(line: 17, column: 18, scope: !33)
!35 = !DILocation(line: 17, column: 7, scope: !6)
!36 = !DILocation(line: 18, column: 5, scope: !37)
!37 = distinct !DILexicalBlock(scope: !33, file: !1, line: 17, column: 23)
!38 = !DILocation(line: 19, column: 3, scope: !37)
!39 = !DILocation(line: 20, column: 5, scope: !40)
!40 = distinct !DILexicalBlock(scope: !33, file: !1, line: 19, column: 10)
!41 = !DILocation(line: 22, column: 1, scope: !6)
!42 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 26, type: !43, isLocal: false, isDefinition: true, scopeLine: 26, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!43 = !DISubroutineType(types: !44)
!44 = !{!9, !9, !45}
!45 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !46, size: 64, align: 64)
!46 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !47, size: 64, align: 64)
!47 = !DIBasicType(name: "char", size: 8, align: 8, encoding: DW_ATE_signed_char)
!48 = !DILocalVariable(name: "argc", arg: 1, scope: !42, file: !1, line: 26, type: !9)
!49 = !DILocation(line: 26, column: 10, scope: !42)
!50 = !DILocalVariable(name: "argv", arg: 2, scope: !42, file: !1, line: 26, type: !45)
!51 = !DILocation(line: 26, column: 23, scope: !42)
!52 = !DILocalVariable(name: "j", scope: !53, file: !1, line: 27, type: !9)
!53 = distinct !DILexicalBlock(scope: !42, file: !1, line: 27, column: 3)
!54 = !DILocation(line: 27, column: 12, scope: !53)
!55 = !DILocalVariable(name: "e", scope: !53, file: !1, line: 27, type: !9)
!56 = !DILocation(line: 27, column: 19, scope: !53)
!57 = !DILocation(line: 27, column: 8, scope: !53)
!58 = !DILocation(line: 27, column: 30, scope: !59)
!59 = !DILexicalBlockFile(scope: !60, file: !1, discriminator: 1)
!60 = distinct !DILexicalBlock(scope: !53, file: !1, line: 27, column: 3)
!61 = !DILocation(line: 27, column: 3, scope: !59)
!62 = !DILocalVariable(name: "i", scope: !63, file: !1, line: 28, type: !9)
!63 = distinct !DILexicalBlock(scope: !64, file: !1, line: 28, column: 5)
!64 = distinct !DILexicalBlock(scope: !60, file: !1, line: 27, column: 41)
!65 = !DILocation(line: 28, column: 14, scope: !63)
!66 = !DILocation(line: 28, column: 30, scope: !63)
!67 = !DILocation(line: 28, column: 25, scope: !63)
!68 = !DILocalVariable(name: "e", scope: !63, file: !1, line: 28, type: !9)
!69 = !DILocation(line: 28, column: 21, scope: !63)
!70 = !DILocation(line: 28, column: 10, scope: !63)
!71 = !DILocation(line: 28, column: 42, scope: !72)
!72 = !DILexicalBlockFile(scope: !73, file: !1, discriminator: 1)
!73 = distinct !DILexicalBlock(scope: !63, file: !1, line: 28, column: 5)
!74 = !DILocation(line: 28, column: 5, scope: !72)
!75 = !DILocation(line: 29, column: 7, scope: !76)
!76 = distinct !DILexicalBlock(scope: !73, file: !1, line: 28, column: 52)
!77 = !DILocation(line: 30, column: 5, scope: !76)
!78 = !DILocation(line: 28, column: 47, scope: !79)
!79 = !DILexicalBlockFile(scope: !73, file: !1, discriminator: 2)
!80 = !DILocation(line: 28, column: 5, scope: !79)
!81 = distinct !{!81, !82}
!82 = !DILocation(line: 28, column: 5, scope: !64)
!83 = !DILocation(line: 31, column: 3, scope: !64)
!84 = !DILocation(line: 27, column: 36, scope: !85)
!85 = !DILexicalBlockFile(scope: !60, file: !1, discriminator: 2)
!86 = !DILocation(line: 27, column: 3, scope: !85)
!87 = distinct !{!87, !88}
!88 = !DILocation(line: 27, column: 3, scope: !42)
!89 = !DILocation(line: 32, column: 3, scope: !42)
