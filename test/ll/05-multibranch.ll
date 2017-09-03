; ModuleID = '<stdin>'
source_filename = "c/05-multibranch.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [7 x i8] c"Truey\0A\00", align 1
@.str.1 = private unnamed_addr constant [8 x i8] c"Falsey\0A\00", align 1
@.str.2 = private unnamed_addr constant [6 x i8] c"Finn\0A\00", align 1
@.str.3 = private unnamed_addr constant [6 x i8] c"Jake\0A\00", align 1

; Function Attrs: nounwind uwtable
define void @profiled(i32, i32) #0 !dbg !6 {
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
  %11 = add nsw i32 %1, %0, !dbg !24
  %12 = srem i32 %11, 5, !dbg !26
  %13 = icmp ne i32 %12, 0, !dbg !26
  br i1 %13, label %14, label %16, !dbg !27

; <label>:14:                                     ; preds = %10
  %15 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.2, i32 0, i32 0)), !dbg !28
  br label %18, !dbg !30

; <label>:16:                                     ; preds = %10
  %17 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.3, i32 0, i32 0)), !dbg !31
  br label %18

; <label>:18:                                     ; preds = %16, %14
  ret void, !dbg !33
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @printf(i8*, ...) #2

; Function Attrs: nounwind uwtable
define i32 @main(i32, i8**) #0 !dbg !34 {
  call void @llvm.dbg.value(metadata i32 %0, i64 0, metadata !40, metadata !11), !dbg !41
  call void @llvm.dbg.value(metadata i8** %1, i64 0, metadata !42, metadata !11), !dbg !43
  call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !44, metadata !11), !dbg !46
  call void @llvm.dbg.value(metadata i32 100, i64 0, metadata !47, metadata !11), !dbg !48
  br label %3, !dbg !49

; <label>:3:                                      ; preds = %15, %2
  %.01 = phi i32 [ 0, %2 ], [ %16, %15 ]
  %4 = icmp ne i32 %.01, 100, !dbg !50
  br i1 %4, label %5, label %17, !dbg !53

; <label>:5:                                      ; preds = %3
  call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !54, metadata !11), !dbg !57
  %6 = getelementptr inbounds i8*, i8** %1, i64 1, !dbg !58
  %7 = load i8*, i8** %6, align 8, !dbg !58
  %8 = call i32 @atoi(i8* %7) #4, !dbg !59
  call void @llvm.dbg.value(metadata i32 %8, i64 0, metadata !60, metadata !11), !dbg !61
  br label %9, !dbg !62

; <label>:9:                                      ; preds = %12, %5
  %.0 = phi i32 [ 0, %5 ], [ %13, %12 ]
  %10 = icmp slt i32 %.0, %8, !dbg !63
  br i1 %10, label %11, label %14, !dbg !66

; <label>:11:                                     ; preds = %9
  call void @profiled(i32 %0, i32 %.0), !dbg !67
  br label %12, !dbg !69

; <label>:12:                                     ; preds = %11
  %13 = add nsw i32 %.0, 1, !dbg !70
  call void @llvm.dbg.value(metadata i32 %13, i64 0, metadata !54, metadata !11), !dbg !57
  br label %9, !dbg !72, !llvm.loop !73

; <label>:14:                                     ; preds = %9
  br label %15, !dbg !75

; <label>:15:                                     ; preds = %14
  %16 = add nsw i32 %.01, 1, !dbg !76
  call void @llvm.dbg.value(metadata i32 %16, i64 0, metadata !44, metadata !11), !dbg !46
  br label %3, !dbg !78, !llvm.loop !79

; <label>:17:                                     ; preds = %3
  ret i32 0, !dbg !81
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
!1 = !DIFile(filename: "c/05-multibranch.c", directory: "/home/nick/teaching/886/pathprofiler/test")
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
!19 = !DILocation(line: 9, column: 5, scope: !20)
!20 = distinct !DILexicalBlock(scope: !16, file: !1, line: 8, column: 23)
!21 = !DILocation(line: 10, column: 3, scope: !20)
!22 = !DILocation(line: 11, column: 5, scope: !23)
!23 = distinct !DILexicalBlock(scope: !16, file: !1, line: 10, column: 10)
!24 = !DILocation(line: 13, column: 10, scope: !25)
!25 = distinct !DILexicalBlock(scope: !6, file: !1, line: 13, column: 7)
!26 = !DILocation(line: 13, column: 18, scope: !25)
!27 = !DILocation(line: 13, column: 7, scope: !6)
!28 = !DILocation(line: 14, column: 5, scope: !29)
!29 = distinct !DILexicalBlock(scope: !25, file: !1, line: 13, column: 23)
!30 = !DILocation(line: 15, column: 3, scope: !29)
!31 = !DILocation(line: 16, column: 5, scope: !32)
!32 = distinct !DILexicalBlock(scope: !25, file: !1, line: 15, column: 10)
!33 = !DILocation(line: 18, column: 1, scope: !6)
!34 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 22, type: !35, isLocal: false, isDefinition: true, scopeLine: 22, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!35 = !DISubroutineType(types: !36)
!36 = !{!9, !9, !37}
!37 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !38, size: 64, align: 64)
!38 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !39, size: 64, align: 64)
!39 = !DIBasicType(name: "char", size: 8, align: 8, encoding: DW_ATE_signed_char)
!40 = !DILocalVariable(name: "argc", arg: 1, scope: !34, file: !1, line: 22, type: !9)
!41 = !DILocation(line: 22, column: 10, scope: !34)
!42 = !DILocalVariable(name: "argv", arg: 2, scope: !34, file: !1, line: 22, type: !37)
!43 = !DILocation(line: 22, column: 23, scope: !34)
!44 = !DILocalVariable(name: "j", scope: !45, file: !1, line: 23, type: !9)
!45 = distinct !DILexicalBlock(scope: !34, file: !1, line: 23, column: 3)
!46 = !DILocation(line: 23, column: 12, scope: !45)
!47 = !DILocalVariable(name: "e", scope: !45, file: !1, line: 23, type: !9)
!48 = !DILocation(line: 23, column: 19, scope: !45)
!49 = !DILocation(line: 23, column: 8, scope: !45)
!50 = !DILocation(line: 23, column: 30, scope: !51)
!51 = !DILexicalBlockFile(scope: !52, file: !1, discriminator: 1)
!52 = distinct !DILexicalBlock(scope: !45, file: !1, line: 23, column: 3)
!53 = !DILocation(line: 23, column: 3, scope: !51)
!54 = !DILocalVariable(name: "i", scope: !55, file: !1, line: 24, type: !9)
!55 = distinct !DILexicalBlock(scope: !56, file: !1, line: 24, column: 5)
!56 = distinct !DILexicalBlock(scope: !52, file: !1, line: 23, column: 41)
!57 = !DILocation(line: 24, column: 14, scope: !55)
!58 = !DILocation(line: 24, column: 30, scope: !55)
!59 = !DILocation(line: 24, column: 25, scope: !55)
!60 = !DILocalVariable(name: "e", scope: !55, file: !1, line: 24, type: !9)
!61 = !DILocation(line: 24, column: 21, scope: !55)
!62 = !DILocation(line: 24, column: 10, scope: !55)
!63 = !DILocation(line: 24, column: 42, scope: !64)
!64 = !DILexicalBlockFile(scope: !65, file: !1, discriminator: 1)
!65 = distinct !DILexicalBlock(scope: !55, file: !1, line: 24, column: 5)
!66 = !DILocation(line: 24, column: 5, scope: !64)
!67 = !DILocation(line: 25, column: 7, scope: !68)
!68 = distinct !DILexicalBlock(scope: !65, file: !1, line: 24, column: 52)
!69 = !DILocation(line: 26, column: 5, scope: !68)
!70 = !DILocation(line: 24, column: 47, scope: !71)
!71 = !DILexicalBlockFile(scope: !65, file: !1, discriminator: 2)
!72 = !DILocation(line: 24, column: 5, scope: !71)
!73 = distinct !{!73, !74}
!74 = !DILocation(line: 24, column: 5, scope: !56)
!75 = !DILocation(line: 27, column: 3, scope: !56)
!76 = !DILocation(line: 23, column: 36, scope: !77)
!77 = !DILexicalBlockFile(scope: !52, file: !1, discriminator: 2)
!78 = !DILocation(line: 23, column: 3, scope: !77)
!79 = distinct !{!79, !80}
!80 = !DILocation(line: 23, column: 3, scope: !34)
!81 = !DILocation(line: 28, column: 3, scope: !34)
