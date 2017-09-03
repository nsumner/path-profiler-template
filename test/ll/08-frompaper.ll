; ModuleID = '<stdin>'
source_filename = "c/08-frompaper.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [8 x i8] c"%d%d%d\0A\00", align 1
@.str.1 = private unnamed_addr constant [42 x i8] c"How happy is the blameless vestal's lot!\0A\00", align 1
@.str.2 = private unnamed_addr constant [44 x i8] c"The world forgetting, by the world forgot.\0A\00", align 1
@.str.3 = private unnamed_addr constant [40 x i8] c"Eternal sunshine of the spotless mind!\0A\00", align 1
@.str.4 = private unnamed_addr constant [48 x i8] c"Each pray'r accepted, and each wish resign'd;\0A\0A\00", align 1

; Function Attrs: nounwind uwtable
define void @profiled(i32) #0 !dbg !6 {
  call void @llvm.dbg.value(metadata i32 %0, i64 0, metadata !10, metadata !11), !dbg !12
  %2 = and i32 %0, 1, !dbg !13
  %3 = and i32 %0, 2, !dbg !14
  %4 = and i32 %0, 4, !dbg !15
  %5 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str, i32 0, i32 0), i32 %2, i32 %3, i32 %4), !dbg !16
  %6 = and i32 %0, 1, !dbg !17
  %7 = icmp ne i32 %6, 0, !dbg !17
  br i1 %7, label %11, label %8, !dbg !19

; <label>:8:                                      ; preds = %1
  %9 = and i32 %0, 2, !dbg !20
  %10 = icmp ne i32 %9, 0, !dbg !20
  br i1 %10, label %11, label %13, !dbg !22

; <label>:11:                                     ; preds = %8, %1
  %12 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([42 x i8], [42 x i8]* @.str.1, i32 0, i32 0)), !dbg !23
  br label %13, !dbg !25

; <label>:13:                                     ; preds = %11, %8
  %14 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([44 x i8], [44 x i8]* @.str.2, i32 0, i32 0)), !dbg !26
  %15 = and i32 %0, 4, !dbg !27
  %16 = icmp ne i32 %15, 0, !dbg !27
  br i1 %16, label %17, label %19, !dbg !29

; <label>:17:                                     ; preds = %13
  %18 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([40 x i8], [40 x i8]* @.str.3, i32 0, i32 0)), !dbg !30
  br label %19, !dbg !32

; <label>:19:                                     ; preds = %17, %13
  %20 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([48 x i8], [48 x i8]* @.str.4, i32 0, i32 0)), !dbg !33
  ret void, !dbg !34
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @printf(i8*, ...) #2

; Function Attrs: nounwind uwtable
define i32 @main(i32, i8**) #0 !dbg !35 {
  call void @llvm.dbg.value(metadata i32 %0, i64 0, metadata !41, metadata !11), !dbg !42
  call void @llvm.dbg.value(metadata i8** %1, i64 0, metadata !43, metadata !11), !dbg !44
  call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !45, metadata !11), !dbg !47
  br label %3, !dbg !48

; <label>:3:                                      ; preds = %6, %2
  %.0 = phi i32 [ 0, %2 ], [ %7, %6 ]
  %4 = icmp slt i32 %.0, 100, !dbg !49
  br i1 %4, label %5, label %8, !dbg !52

; <label>:5:                                      ; preds = %3
  call void @profiled(i32 %.0), !dbg !53
  br label %6, !dbg !55

; <label>:6:                                      ; preds = %5
  %7 = add nsw i32 %.0, 1, !dbg !56
  call void @llvm.dbg.value(metadata i32 %7, i64 0, metadata !45, metadata !11), !dbg !47
  br label %3, !dbg !58, !llvm.loop !59

; <label>:8:                                      ; preds = %3
  ret i32 0, !dbg !61
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata, metadata) #1

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4}
!llvm.ident = !{!5}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (tags/RELEASE_390/final)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2)
!1 = !DIFile(filename: "c/08-frompaper.c", directory: "/home/nick/teaching/886/pathprofiler/test")
!2 = !{}
!3 = !{i32 2, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{!"clang version 3.9.0 (tags/RELEASE_390/final)"}
!6 = distinct !DISubprogram(name: "profiled", scope: !1, file: !1, line: 4, type: !7, isLocal: false, isDefinition: true, scopeLine: 4, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!7 = !DISubroutineType(types: !8)
!8 = !{null, !9}
!9 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!10 = !DILocalVariable(name: "i", arg: 1, scope: !6, file: !1, line: 4, type: !9)
!11 = !DIExpression()
!12 = !DILocation(line: 4, column: 14, scope: !6)
!13 = !DILocation(line: 5, column: 23, scope: !6)
!14 = !DILocation(line: 5, column: 28, scope: !6)
!15 = !DILocation(line: 5, column: 33, scope: !6)
!16 = !DILocation(line: 5, column: 3, scope: !6)
!17 = !DILocation(line: 6, column: 9, scope: !18)
!18 = distinct !DILexicalBlock(scope: !6, file: !1, line: 6, column: 7)
!19 = !DILocation(line: 6, column: 13, scope: !18)
!20 = !DILocation(line: 6, column: 18, scope: !21)
!21 = !DILexicalBlockFile(scope: !18, file: !1, discriminator: 1)
!22 = !DILocation(line: 6, column: 7, scope: !21)
!23 = !DILocation(line: 7, column: 5, scope: !24)
!24 = distinct !DILexicalBlock(scope: !18, file: !1, line: 6, column: 23)
!25 = !DILocation(line: 8, column: 3, scope: !24)
!26 = !DILocation(line: 9, column: 3, scope: !6)
!27 = !DILocation(line: 10, column: 9, scope: !28)
!28 = distinct !DILexicalBlock(scope: !6, file: !1, line: 10, column: 7)
!29 = !DILocation(line: 10, column: 7, scope: !6)
!30 = !DILocation(line: 11, column: 5, scope: !31)
!31 = distinct !DILexicalBlock(scope: !28, file: !1, line: 10, column: 14)
!32 = !DILocation(line: 12, column: 3, scope: !31)
!33 = !DILocation(line: 13, column: 3, scope: !6)
!34 = !DILocation(line: 14, column: 1, scope: !6)
!35 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 18, type: !36, isLocal: false, isDefinition: true, scopeLine: 18, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!36 = !DISubroutineType(types: !37)
!37 = !{!9, !9, !38}
!38 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !39, size: 64, align: 64)
!39 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !40, size: 64, align: 64)
!40 = !DIBasicType(name: "char", size: 8, align: 8, encoding: DW_ATE_signed_char)
!41 = !DILocalVariable(name: "argc", arg: 1, scope: !35, file: !1, line: 18, type: !9)
!42 = !DILocation(line: 18, column: 10, scope: !35)
!43 = !DILocalVariable(name: "argv", arg: 2, scope: !35, file: !1, line: 18, type: !38)
!44 = !DILocation(line: 18, column: 23, scope: !35)
!45 = !DILocalVariable(name: "i", scope: !46, file: !1, line: 19, type: !9)
!46 = distinct !DILexicalBlock(scope: !35, file: !1, line: 19, column: 3)
!47 = !DILocation(line: 19, column: 12, scope: !46)
!48 = !DILocation(line: 19, column: 8, scope: !46)
!49 = !DILocation(line: 19, column: 21, scope: !50)
!50 = !DILexicalBlockFile(scope: !51, file: !1, discriminator: 1)
!51 = distinct !DILexicalBlock(scope: !46, file: !1, line: 19, column: 3)
!52 = !DILocation(line: 19, column: 3, scope: !50)
!53 = !DILocation(line: 20, column: 5, scope: !54)
!54 = distinct !DILexicalBlock(scope: !51, file: !1, line: 19, column: 33)
!55 = !DILocation(line: 21, column: 3, scope: !54)
!56 = !DILocation(line: 19, column: 28, scope: !57)
!57 = !DILexicalBlockFile(scope: !51, file: !1, discriminator: 2)
!58 = !DILocation(line: 19, column: 3, scope: !57)
!59 = distinct !{!59, !60}
!60 = !DILocation(line: 19, column: 3, scope: !35)
!61 = !DILocation(line: 22, column: 3, scope: !35)
