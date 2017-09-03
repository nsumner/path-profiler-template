; ModuleID = '<stdin>'
source_filename = "c/04-fullybiased.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [7 x i8] c"Truey\0A\00", align 1
@.str.1 = private unnamed_addr constant [8 x i8] c"Falsey\0A\00", align 1

; Function Attrs: nounwind uwtable
define void @profiled(i32) #0 !dbg !6 {
  call void @llvm.dbg.value(metadata i32 %0, i64 0, metadata !10, metadata !11), !dbg !12
  %2 = srem i32 %0, 2, !dbg !13
  %3 = icmp ne i32 %2, 0, !dbg !13
  br i1 %3, label %4, label %6, !dbg !15

; <label>:4:                                      ; preds = %1
  %5 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0)), !dbg !16
  br label %8, !dbg !18

; <label>:6:                                      ; preds = %1
  %7 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.1, i32 0, i32 0)), !dbg !19
  br label %8

; <label>:8:                                      ; preds = %6, %4
  ret void, !dbg !21
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @printf(i8*, ...) #2

; Function Attrs: nounwind uwtable
define i32 @main(i32, i8**) #0 !dbg !22 {
  call void @llvm.dbg.value(metadata i32 %0, i64 0, metadata !28, metadata !11), !dbg !29
  call void @llvm.dbg.value(metadata i8** %1, i64 0, metadata !30, metadata !11), !dbg !31
  call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !32, metadata !11), !dbg !34
  %3 = getelementptr inbounds i8*, i8** %1, i64 1, !dbg !35
  %4 = load i8*, i8** %3, align 8, !dbg !35
  %5 = call i32 @atoi(i8* %4) #4, !dbg !36
  call void @llvm.dbg.value(metadata i32 %5, i64 0, metadata !37, metadata !11), !dbg !38
  br label %6, !dbg !39

; <label>:6:                                      ; preds = %9, %2
  %.0 = phi i32 [ 0, %2 ], [ %10, %9 ]
  %7 = icmp slt i32 %.0, %5, !dbg !40
  br i1 %7, label %8, label %11, !dbg !43

; <label>:8:                                      ; preds = %6
  call void @profiled(i32 %0), !dbg !44
  br label %9, !dbg !46

; <label>:9:                                      ; preds = %8
  %10 = add nsw i32 %.0, 1, !dbg !47
  call void @llvm.dbg.value(metadata i32 %10, i64 0, metadata !32, metadata !11), !dbg !34
  br label %6, !dbg !49, !llvm.loop !50

; <label>:11:                                     ; preds = %6
  ret i32 0, !dbg !52
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
!1 = !DIFile(filename: "c/04-fullybiased.c", directory: "/home/nick/teaching/886/pathprofiler/test")
!2 = !{}
!3 = !{i32 2, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{!"clang version 3.9.0 (tags/RELEASE_390/final)"}
!6 = distinct !DISubprogram(name: "profiled", scope: !1, file: !1, line: 7, type: !7, isLocal: false, isDefinition: true, scopeLine: 7, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!7 = !DISubroutineType(types: !8)
!8 = !{null, !9}
!9 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!10 = !DILocalVariable(name: "argc", arg: 1, scope: !6, file: !1, line: 7, type: !9)
!11 = !DIExpression()
!12 = !DILocation(line: 7, column: 14, scope: !6)
!13 = !DILocation(line: 8, column: 12, scope: !14)
!14 = distinct !DILexicalBlock(scope: !6, file: !1, line: 8, column: 7)
!15 = !DILocation(line: 8, column: 7, scope: !6)
!16 = !DILocation(line: 9, column: 5, scope: !17)
!17 = distinct !DILexicalBlock(scope: !14, file: !1, line: 8, column: 17)
!18 = !DILocation(line: 10, column: 3, scope: !17)
!19 = !DILocation(line: 11, column: 5, scope: !20)
!20 = distinct !DILexicalBlock(scope: !14, file: !1, line: 10, column: 10)
!21 = !DILocation(line: 13, column: 1, scope: !6)
!22 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 17, type: !23, isLocal: false, isDefinition: true, scopeLine: 17, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!23 = !DISubroutineType(types: !24)
!24 = !{!9, !9, !25}
!25 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !26, size: 64, align: 64)
!26 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !27, size: 64, align: 64)
!27 = !DIBasicType(name: "char", size: 8, align: 8, encoding: DW_ATE_signed_char)
!28 = !DILocalVariable(name: "argc", arg: 1, scope: !22, file: !1, line: 17, type: !9)
!29 = !DILocation(line: 17, column: 10, scope: !22)
!30 = !DILocalVariable(name: "argv", arg: 2, scope: !22, file: !1, line: 17, type: !25)
!31 = !DILocation(line: 17, column: 23, scope: !22)
!32 = !DILocalVariable(name: "i", scope: !33, file: !1, line: 18, type: !9)
!33 = distinct !DILexicalBlock(scope: !22, file: !1, line: 18, column: 3)
!34 = !DILocation(line: 18, column: 12, scope: !33)
!35 = !DILocation(line: 18, column: 28, scope: !33)
!36 = !DILocation(line: 18, column: 23, scope: !33)
!37 = !DILocalVariable(name: "e", scope: !33, file: !1, line: 18, type: !9)
!38 = !DILocation(line: 18, column: 19, scope: !33)
!39 = !DILocation(line: 18, column: 8, scope: !33)
!40 = !DILocation(line: 18, column: 40, scope: !41)
!41 = !DILexicalBlockFile(scope: !42, file: !1, discriminator: 1)
!42 = distinct !DILexicalBlock(scope: !33, file: !1, line: 18, column: 3)
!43 = !DILocation(line: 18, column: 3, scope: !41)
!44 = !DILocation(line: 19, column: 5, scope: !45)
!45 = distinct !DILexicalBlock(scope: !42, file: !1, line: 18, column: 50)
!46 = !DILocation(line: 20, column: 3, scope: !45)
!47 = !DILocation(line: 18, column: 45, scope: !48)
!48 = !DILexicalBlockFile(scope: !42, file: !1, discriminator: 2)
!49 = !DILocation(line: 18, column: 3, scope: !48)
!50 = distinct !{!50, !51}
!51 = !DILocation(line: 18, column: 3, scope: !22)
!52 = !DILocation(line: 21, column: 3, scope: !22)
