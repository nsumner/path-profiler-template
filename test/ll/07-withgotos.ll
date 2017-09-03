; ModuleID = '<stdin>'
source_filename = "c/07-withgotos.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [6 x i8] c"True\0A\00", align 1
@.str.1 = private unnamed_addr constant [7 x i8] c"False\0A\00", align 1
@.str.2 = private unnamed_addr constant [7 x i8] c"Bacon\0A\00", align 1
@.str.3 = private unnamed_addr constant [10 x i8] c"Pancakes\0A\00", align 1
@.str.4 = private unnamed_addr constant [6 x i8] c"Finn\0A\00", align 1
@.str.5 = private unnamed_addr constant [6 x i8] c"Jake\0A\00", align 1
@.str.6 = private unnamed_addr constant [16 x i8] c"Lady Rainicorn\0A\00", align 1

; Function Attrs: nounwind uwtable
define void @profiled(i32, i32) #0 !dbg !6 {
  call void @llvm.dbg.value(metadata i32 %0, i64 0, metadata !10, metadata !11), !dbg !12
  call void @llvm.dbg.value(metadata i32 %1, i64 0, metadata !13, metadata !11), !dbg !14
  %3 = add nsw i32 %1, %0, !dbg !15
  %4 = srem i32 %3, 3, !dbg !17
  %5 = icmp ne i32 %4, 0, !dbg !17
  br i1 %5, label %8, label %6, !dbg !18

; <label>:6:                                      ; preds = %2
  %7 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str, i32 0, i32 0)), !dbg !19
  br label %26, !dbg !21

; <label>:8:                                      ; preds = %2
  %9 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.1, i32 0, i32 0)), !dbg !22
  br label %10

; <label>:10:                                     ; preds = %8
  %11 = srem i32 %0, 2, !dbg !24
  %12 = add nsw i32 %1, %11, !dbg !26
  %13 = icmp ne i32 %12, 0, !dbg !26
  br i1 %13, label %14, label %16, !dbg !27

; <label>:14:                                     ; preds = %10
  %15 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.2, i32 0, i32 0)), !dbg !28
  br label %18, !dbg !30

; <label>:16:                                     ; preds = %10
  %17 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.3, i32 0, i32 0)), !dbg !31
  br label %18

; <label>:18:                                     ; preds = %16, %14
  %19 = add nsw i32 %1, %0, !dbg !33
  %20 = srem i32 %19, 5, !dbg !35
  %21 = icmp ne i32 %20, 0, !dbg !35
  br i1 %21, label %22, label %24, !dbg !36

; <label>:22:                                     ; preds = %18
  %23 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.4, i32 0, i32 0)), !dbg !37
  br label %28, !dbg !39

; <label>:24:                                     ; preds = %18
  %25 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.5, i32 0, i32 0)), !dbg !40
  br label %26, !dbg !40

; <label>:26:                                     ; preds = %24, %6
  %27 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.6, i32 0, i32 0)), !dbg !42
  br label %28

; <label>:28:                                     ; preds = %26, %22
  ret void, !dbg !43
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @printf(i8*, ...) #2

; Function Attrs: nounwind uwtable
define i32 @main(i32, i8**) #0 !dbg !44 {
  call void @llvm.dbg.value(metadata i32 %0, i64 0, metadata !50, metadata !11), !dbg !51
  call void @llvm.dbg.value(metadata i8** %1, i64 0, metadata !52, metadata !11), !dbg !53
  call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !54, metadata !11), !dbg !56
  %3 = getelementptr inbounds i8*, i8** %1, i64 1, !dbg !57
  %4 = load i8*, i8** %3, align 8, !dbg !57
  %5 = call i32 @atoi(i8* %4) #4, !dbg !58
  call void @llvm.dbg.value(metadata i32 %5, i64 0, metadata !59, metadata !11), !dbg !60
  br label %6, !dbg !61

; <label>:6:                                      ; preds = %9, %2
  %.0 = phi i32 [ 0, %2 ], [ %10, %9 ]
  %7 = icmp slt i32 %.0, %5, !dbg !62
  br i1 %7, label %8, label %11, !dbg !65

; <label>:8:                                      ; preds = %6
  call void @profiled(i32 %0, i32 %.0), !dbg !66
  br label %9, !dbg !68

; <label>:9:                                      ; preds = %8
  %10 = add nsw i32 %.0, 1, !dbg !69
  call void @llvm.dbg.value(metadata i32 %10, i64 0, metadata !54, metadata !11), !dbg !56
  br label %6, !dbg !71, !llvm.loop !72

; <label>:11:                                     ; preds = %6
  ret i32 0, !dbg !74
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
!1 = !DIFile(filename: "c/07-withgotos.c", directory: "/home/nick/teaching/886/pathprofiler/test")
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
!15 = !DILocation(line: 8, column: 12, scope: !16)
!16 = distinct !DILexicalBlock(scope: !6, file: !1, line: 8, column: 7)
!17 = !DILocation(line: 8, column: 20, scope: !16)
!18 = !DILocation(line: 8, column: 7, scope: !6)
!19 = !DILocation(line: 9, column: 5, scope: !20)
!20 = distinct !DILexicalBlock(scope: !16, file: !1, line: 8, column: 26)
!21 = !DILocation(line: 10, column: 5, scope: !20)
!22 = !DILocation(line: 12, column: 5, scope: !23)
!23 = distinct !DILexicalBlock(scope: !16, file: !1, line: 11, column: 10)
!24 = !DILocation(line: 15, column: 16, scope: !25)
!25 = distinct !DILexicalBlock(scope: !6, file: !1, line: 15, column: 7)
!26 = !DILocation(line: 15, column: 9, scope: !25)
!27 = !DILocation(line: 15, column: 7, scope: !6)
!28 = !DILocation(line: 16, column: 5, scope: !29)
!29 = distinct !DILexicalBlock(scope: !25, file: !1, line: 15, column: 21)
!30 = !DILocation(line: 17, column: 3, scope: !29)
!31 = !DILocation(line: 18, column: 5, scope: !32)
!32 = distinct !DILexicalBlock(scope: !25, file: !1, line: 17, column: 10)
!33 = !DILocation(line: 21, column: 10, scope: !34)
!34 = distinct !DILexicalBlock(scope: !6, file: !1, line: 21, column: 7)
!35 = !DILocation(line: 21, column: 18, scope: !34)
!36 = !DILocation(line: 21, column: 7, scope: !6)
!37 = !DILocation(line: 22, column: 5, scope: !38)
!38 = distinct !DILexicalBlock(scope: !34, file: !1, line: 21, column: 23)
!39 = !DILocation(line: 23, column: 3, scope: !38)
!40 = !DILocation(line: 24, column: 5, scope: !41)
!41 = distinct !DILexicalBlock(scope: !34, file: !1, line: 23, column: 10)
!42 = !DILocation(line: 26, column: 5, scope: !41)
!43 = !DILocation(line: 28, column: 1, scope: !6)
!44 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 32, type: !45, isLocal: false, isDefinition: true, scopeLine: 32, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!45 = !DISubroutineType(types: !46)
!46 = !{!9, !9, !47}
!47 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !48, size: 64, align: 64)
!48 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !49, size: 64, align: 64)
!49 = !DIBasicType(name: "char", size: 8, align: 8, encoding: DW_ATE_signed_char)
!50 = !DILocalVariable(name: "argc", arg: 1, scope: !44, file: !1, line: 32, type: !9)
!51 = !DILocation(line: 32, column: 10, scope: !44)
!52 = !DILocalVariable(name: "argv", arg: 2, scope: !44, file: !1, line: 32, type: !47)
!53 = !DILocation(line: 32, column: 23, scope: !44)
!54 = !DILocalVariable(name: "i", scope: !55, file: !1, line: 33, type: !9)
!55 = distinct !DILexicalBlock(scope: !44, file: !1, line: 33, column: 3)
!56 = !DILocation(line: 33, column: 12, scope: !55)
!57 = !DILocation(line: 33, column: 28, scope: !55)
!58 = !DILocation(line: 33, column: 23, scope: !55)
!59 = !DILocalVariable(name: "e", scope: !55, file: !1, line: 33, type: !9)
!60 = !DILocation(line: 33, column: 19, scope: !55)
!61 = !DILocation(line: 33, column: 8, scope: !55)
!62 = !DILocation(line: 33, column: 40, scope: !63)
!63 = !DILexicalBlockFile(scope: !64, file: !1, discriminator: 1)
!64 = distinct !DILexicalBlock(scope: !55, file: !1, line: 33, column: 3)
!65 = !DILocation(line: 33, column: 3, scope: !63)
!66 = !DILocation(line: 34, column: 5, scope: !67)
!67 = distinct !DILexicalBlock(scope: !64, file: !1, line: 33, column: 50)
!68 = !DILocation(line: 35, column: 3, scope: !67)
!69 = !DILocation(line: 33, column: 45, scope: !70)
!70 = !DILexicalBlockFile(scope: !64, file: !1, discriminator: 2)
!71 = !DILocation(line: 33, column: 3, scope: !70)
!72 = distinct !{!72, !73}
!73 = !DILocation(line: 33, column: 3, scope: !44)
!74 = !DILocation(line: 36, column: 3, scope: !44)
