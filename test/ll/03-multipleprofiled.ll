; ModuleID = '<stdin>'
source_filename = "c/03-multipleprofiled.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [7 x i8] c"Truey\0A\00", align 1
@.str.1 = private unnamed_addr constant [8 x i8] c"Falsey\0A\00", align 1
@.str.2 = private unnamed_addr constant [6 x i8] c"Finn\0A\00", align 1
@.str.3 = private unnamed_addr constant [6 x i8] c"Jake\0A\00", align 1

; Function Attrs: nounwind uwtable
define void @profiled1(i32, i32) #0 !dbg !6 {
  call void @llvm.dbg.value(metadata i32 %0, i64 0, metadata !10, metadata !11), !dbg !12
  call void @llvm.dbg.value(metadata i32 %1, i64 0, metadata !13, metadata !11), !dbg !14
  %3 = add nsw i32 %1, %0, !dbg !15
  %4 = srem i32 %3, 3, !dbg !17
  %5 = icmp ne i32 %4, 0, !dbg !17
  br i1 %5, label %6, label %8, !dbg !18

; <label>:6:                                      ; preds = %2
  %7 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0)), !dbg !19
  br label %10, !dbg !21

; <label>:8:                                      ; preds = %2
  %9 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.1, i32 0, i32 0)), !dbg !22
  br label %10

; <label>:10:                                     ; preds = %8, %6
  ret void, !dbg !24
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @printf(i8*, ...) #2

; Function Attrs: nounwind uwtable
define void @profiled2(i32, i32) #0 !dbg !25 {
  call void @llvm.dbg.value(metadata i32 %0, i64 0, metadata !26, metadata !11), !dbg !27
  call void @llvm.dbg.value(metadata i32 %1, i64 0, metadata !28, metadata !11), !dbg !29
  %3 = add nsw i32 %1, %0, !dbg !30
  %4 = srem i32 %3, 3, !dbg !32
  %5 = icmp ne i32 %4, 0, !dbg !32
  br i1 %5, label %6, label %8, !dbg !33

; <label>:6:                                      ; preds = %2
  %7 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.2, i32 0, i32 0)), !dbg !34
  br label %10, !dbg !36

; <label>:8:                                      ; preds = %2
  %9 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.3, i32 0, i32 0)), !dbg !37
  br label %10

; <label>:10:                                     ; preds = %8, %6
  ret void, !dbg !39
}

; Function Attrs: nounwind uwtable
define i32 @main(i32, i8**) #0 !dbg !40 {
  call void @llvm.dbg.value(metadata i32 %0, i64 0, metadata !46, metadata !11), !dbg !47
  call void @llvm.dbg.value(metadata i8** %1, i64 0, metadata !48, metadata !11), !dbg !49
  call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !50, metadata !11), !dbg !52
  call void @llvm.dbg.value(metadata i32 100, i64 0, metadata !53, metadata !11), !dbg !54
  br label %3, !dbg !55

; <label>:3:                                      ; preds = %25, %2
  %.02 = phi i32 [ 0, %2 ], [ %26, %25 ]
  %4 = icmp ne i32 %.02, 100, !dbg !56
  br i1 %4, label %5, label %27, !dbg !59

; <label>:5:                                      ; preds = %3
  call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !60, metadata !11), !dbg !63
  %6 = getelementptr inbounds i8*, i8** %1, i64 1, !dbg !64
  %7 = load i8*, i8** %6, align 8, !dbg !64
  %8 = call i32 @atoi(i8* %7) #4, !dbg !65
  call void @llvm.dbg.value(metadata i32 %8, i64 0, metadata !66, metadata !11), !dbg !67
  br label %9, !dbg !68

; <label>:9:                                      ; preds = %12, %5
  %.01 = phi i32 [ 0, %5 ], [ %13, %12 ]
  %10 = icmp slt i32 %.01, %8, !dbg !69
  br i1 %10, label %11, label %14, !dbg !72

; <label>:11:                                     ; preds = %9
  call void @profiled1(i32 %0, i32 %.01), !dbg !73
  br label %12, !dbg !75

; <label>:12:                                     ; preds = %11
  %13 = add nsw i32 %.01, 1, !dbg !76
  call void @llvm.dbg.value(metadata i32 %13, i64 0, metadata !60, metadata !11), !dbg !63
  br label %9, !dbg !78, !llvm.loop !79

; <label>:14:                                     ; preds = %9
  call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !81, metadata !11), !dbg !83
  %15 = getelementptr inbounds i8*, i8** %1, i64 1, !dbg !84
  %16 = load i8*, i8** %15, align 8, !dbg !84
  %17 = call i32 @atoi(i8* %16) #4, !dbg !85
  %18 = sdiv i32 %17, 2, !dbg !86
  call void @llvm.dbg.value(metadata i32 %18, i64 0, metadata !87, metadata !11), !dbg !88
  br label %19, !dbg !89

; <label>:19:                                     ; preds = %22, %14
  %.0 = phi i32 [ 0, %14 ], [ %23, %22 ]
  %20 = icmp slt i32 %.0, %18, !dbg !90
  br i1 %20, label %21, label %24, !dbg !93

; <label>:21:                                     ; preds = %19
  call void @profiled2(i32 %0, i32 %.0), !dbg !94
  br label %22, !dbg !96

; <label>:22:                                     ; preds = %21
  %23 = add nsw i32 %.0, 1, !dbg !97
  call void @llvm.dbg.value(metadata i32 %23, i64 0, metadata !81, metadata !11), !dbg !83
  br label %19, !dbg !99, !llvm.loop !100

; <label>:24:                                     ; preds = %19
  br label %25, !dbg !102

; <label>:25:                                     ; preds = %24
  %26 = add nsw i32 %.02, 1, !dbg !103
  call void @llvm.dbg.value(metadata i32 %26, i64 0, metadata !50, metadata !11), !dbg !52
  br label %3, !dbg !105, !llvm.loop !106

; <label>:27:                                     ; preds = %3
  ret i32 0, !dbg !108
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
!1 = !DIFile(filename: "c/03-multipleprofiled.c", directory: "/home/nick/teaching/886/pathprofiler/test")
!2 = !{}
!3 = !{i32 2, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{!"clang version 3.9.0 (tags/RELEASE_390/final)"}
!6 = distinct !DISubprogram(name: "profiled1", scope: !1, file: !1, line: 7, type: !7, isLocal: false, isDefinition: true, scopeLine: 7, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!7 = !DISubroutineType(types: !8)
!8 = !{null, !9, !9}
!9 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!10 = !DILocalVariable(name: "argc", arg: 1, scope: !6, file: !1, line: 7, type: !9)
!11 = !DIExpression()
!12 = !DILocation(line: 7, column: 15, scope: !6)
!13 = !DILocalVariable(name: "i", arg: 2, scope: !6, file: !1, line: 7, type: !9)
!14 = !DILocation(line: 7, column: 25, scope: !6)
!15 = !DILocation(line: 8, column: 10, scope: !16)
!16 = distinct !DILexicalBlock(scope: !6, file: !1, line: 8, column: 7)
!17 = !DILocation(line: 8, column: 18, scope: !16)
!18 = !DILocation(line: 8, column: 7, scope: !6)
!19 = !DILocation(line: 9, column: 5, scope: !20)
!20 = distinct !DILexicalBlock(scope: !16, file: !1, line: 8, column: 23)
!21 = !DILocation(line: 10, column: 3, scope: !20)
!22 = !DILocation(line: 11, column: 5, scope: !23)
!23 = distinct !DILexicalBlock(scope: !16, file: !1, line: 10, column: 10)
!24 = !DILocation(line: 13, column: 1, scope: !6)
!25 = distinct !DISubprogram(name: "profiled2", scope: !1, file: !1, line: 17, type: !7, isLocal: false, isDefinition: true, scopeLine: 17, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!26 = !DILocalVariable(name: "argc", arg: 1, scope: !25, file: !1, line: 17, type: !9)
!27 = !DILocation(line: 17, column: 15, scope: !25)
!28 = !DILocalVariable(name: "i", arg: 2, scope: !25, file: !1, line: 17, type: !9)
!29 = !DILocation(line: 17, column: 25, scope: !25)
!30 = !DILocation(line: 18, column: 10, scope: !31)
!31 = distinct !DILexicalBlock(scope: !25, file: !1, line: 18, column: 7)
!32 = !DILocation(line: 18, column: 18, scope: !31)
!33 = !DILocation(line: 18, column: 7, scope: !25)
!34 = !DILocation(line: 19, column: 5, scope: !35)
!35 = distinct !DILexicalBlock(scope: !31, file: !1, line: 18, column: 23)
!36 = !DILocation(line: 20, column: 3, scope: !35)
!37 = !DILocation(line: 21, column: 5, scope: !38)
!38 = distinct !DILexicalBlock(scope: !31, file: !1, line: 20, column: 10)
!39 = !DILocation(line: 23, column: 1, scope: !25)
!40 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 27, type: !41, isLocal: false, isDefinition: true, scopeLine: 27, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!41 = !DISubroutineType(types: !42)
!42 = !{!9, !9, !43}
!43 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !44, size: 64, align: 64)
!44 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !45, size: 64, align: 64)
!45 = !DIBasicType(name: "char", size: 8, align: 8, encoding: DW_ATE_signed_char)
!46 = !DILocalVariable(name: "argc", arg: 1, scope: !40, file: !1, line: 27, type: !9)
!47 = !DILocation(line: 27, column: 10, scope: !40)
!48 = !DILocalVariable(name: "argv", arg: 2, scope: !40, file: !1, line: 27, type: !43)
!49 = !DILocation(line: 27, column: 23, scope: !40)
!50 = !DILocalVariable(name: "j", scope: !51, file: !1, line: 28, type: !9)
!51 = distinct !DILexicalBlock(scope: !40, file: !1, line: 28, column: 3)
!52 = !DILocation(line: 28, column: 12, scope: !51)
!53 = !DILocalVariable(name: "e", scope: !51, file: !1, line: 28, type: !9)
!54 = !DILocation(line: 28, column: 19, scope: !51)
!55 = !DILocation(line: 28, column: 8, scope: !51)
!56 = !DILocation(line: 28, column: 30, scope: !57)
!57 = !DILexicalBlockFile(scope: !58, file: !1, discriminator: 1)
!58 = distinct !DILexicalBlock(scope: !51, file: !1, line: 28, column: 3)
!59 = !DILocation(line: 28, column: 3, scope: !57)
!60 = !DILocalVariable(name: "i", scope: !61, file: !1, line: 29, type: !9)
!61 = distinct !DILexicalBlock(scope: !62, file: !1, line: 29, column: 5)
!62 = distinct !DILexicalBlock(scope: !58, file: !1, line: 28, column: 41)
!63 = !DILocation(line: 29, column: 14, scope: !61)
!64 = !DILocation(line: 29, column: 30, scope: !61)
!65 = !DILocation(line: 29, column: 25, scope: !61)
!66 = !DILocalVariable(name: "e", scope: !61, file: !1, line: 29, type: !9)
!67 = !DILocation(line: 29, column: 21, scope: !61)
!68 = !DILocation(line: 29, column: 10, scope: !61)
!69 = !DILocation(line: 29, column: 42, scope: !70)
!70 = !DILexicalBlockFile(scope: !71, file: !1, discriminator: 1)
!71 = distinct !DILexicalBlock(scope: !61, file: !1, line: 29, column: 5)
!72 = !DILocation(line: 29, column: 5, scope: !70)
!73 = !DILocation(line: 30, column: 7, scope: !74)
!74 = distinct !DILexicalBlock(scope: !71, file: !1, line: 29, column: 52)
!75 = !DILocation(line: 31, column: 5, scope: !74)
!76 = !DILocation(line: 29, column: 47, scope: !77)
!77 = !DILexicalBlockFile(scope: !71, file: !1, discriminator: 2)
!78 = !DILocation(line: 29, column: 5, scope: !77)
!79 = distinct !{!79, !80}
!80 = !DILocation(line: 29, column: 5, scope: !62)
!81 = !DILocalVariable(name: "i", scope: !82, file: !1, line: 32, type: !9)
!82 = distinct !DILexicalBlock(scope: !62, file: !1, line: 32, column: 5)
!83 = !DILocation(line: 32, column: 14, scope: !82)
!84 = !DILocation(line: 32, column: 30, scope: !82)
!85 = !DILocation(line: 32, column: 25, scope: !82)
!86 = !DILocation(line: 32, column: 38, scope: !82)
!87 = !DILocalVariable(name: "e", scope: !82, file: !1, line: 32, type: !9)
!88 = !DILocation(line: 32, column: 21, scope: !82)
!89 = !DILocation(line: 32, column: 10, scope: !82)
!90 = !DILocation(line: 32, column: 44, scope: !91)
!91 = !DILexicalBlockFile(scope: !92, file: !1, discriminator: 1)
!92 = distinct !DILexicalBlock(scope: !82, file: !1, line: 32, column: 5)
!93 = !DILocation(line: 32, column: 5, scope: !91)
!94 = !DILocation(line: 33, column: 7, scope: !95)
!95 = distinct !DILexicalBlock(scope: !92, file: !1, line: 32, column: 54)
!96 = !DILocation(line: 34, column: 5, scope: !95)
!97 = !DILocation(line: 32, column: 49, scope: !98)
!98 = !DILexicalBlockFile(scope: !92, file: !1, discriminator: 2)
!99 = !DILocation(line: 32, column: 5, scope: !98)
!100 = distinct !{!100, !101}
!101 = !DILocation(line: 32, column: 5, scope: !62)
!102 = !DILocation(line: 35, column: 3, scope: !62)
!103 = !DILocation(line: 28, column: 36, scope: !104)
!104 = !DILexicalBlockFile(scope: !58, file: !1, discriminator: 2)
!105 = !DILocation(line: 28, column: 3, scope: !104)
!106 = distinct !{!106, !107}
!107 = !DILocation(line: 28, column: 3, scope: !40)
!108 = !DILocation(line: 36, column: 3, scope: !40)
