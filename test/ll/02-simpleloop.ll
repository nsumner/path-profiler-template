; ModuleID = '<stdin>'
source_filename = "c/02-simpleloop.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [7 x i8] c"Truey\0A\00", align 1
@.str.1 = private unnamed_addr constant [8 x i8] c"Falsey\0A\00", align 1

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
  ret void, !dbg !24
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @printf(i8*, ...) #2

; Function Attrs: nounwind uwtable
define i32 @main(i32, i8**) #0 !dbg !25 {
  call void @llvm.dbg.value(metadata i32 %0, i64 0, metadata !31, metadata !11), !dbg !32
  call void @llvm.dbg.value(metadata i8** %1, i64 0, metadata !33, metadata !11), !dbg !34
  call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !35, metadata !11), !dbg !37
  %3 = getelementptr inbounds i8*, i8** %1, i64 1, !dbg !38
  %4 = load i8*, i8** %3, align 8, !dbg !38
  %5 = call i32 @atoi(i8* %4) #4, !dbg !39
  call void @llvm.dbg.value(metadata i32 %5, i64 0, metadata !40, metadata !11), !dbg !41
  br label %6, !dbg !42

; <label>:6:                                      ; preds = %9, %2
  %.0 = phi i32 [ 0, %2 ], [ %10, %9 ]
  %7 = icmp slt i32 %.0, %5, !dbg !43
  br i1 %7, label %8, label %11, !dbg !46

; <label>:8:                                      ; preds = %6
  call void @profiled(i32 %0, i32 %.0), !dbg !47
  br label %9, !dbg !49

; <label>:9:                                      ; preds = %8
  %10 = add nsw i32 %.0, 1, !dbg !50
  call void @llvm.dbg.value(metadata i32 %10, i64 0, metadata !35, metadata !11), !dbg !37
  br label %6, !dbg !52, !llvm.loop !53

; <label>:11:                                     ; preds = %6
  ret i32 0, !dbg !55
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
!1 = !DIFile(filename: "c/02-simpleloop.c", directory: "/home/nick/teaching/886/pathprofiler/test")
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
!24 = !DILocation(line: 13, column: 1, scope: !6)
!25 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 17, type: !26, isLocal: false, isDefinition: true, scopeLine: 17, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!26 = !DISubroutineType(types: !27)
!27 = !{!9, !9, !28}
!28 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !29, size: 64, align: 64)
!29 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !30, size: 64, align: 64)
!30 = !DIBasicType(name: "char", size: 8, align: 8, encoding: DW_ATE_signed_char)
!31 = !DILocalVariable(name: "argc", arg: 1, scope: !25, file: !1, line: 17, type: !9)
!32 = !DILocation(line: 17, column: 10, scope: !25)
!33 = !DILocalVariable(name: "argv", arg: 2, scope: !25, file: !1, line: 17, type: !28)
!34 = !DILocation(line: 17, column: 23, scope: !25)
!35 = !DILocalVariable(name: "i", scope: !36, file: !1, line: 18, type: !9)
!36 = distinct !DILexicalBlock(scope: !25, file: !1, line: 18, column: 3)
!37 = !DILocation(line: 18, column: 12, scope: !36)
!38 = !DILocation(line: 18, column: 28, scope: !36)
!39 = !DILocation(line: 18, column: 23, scope: !36)
!40 = !DILocalVariable(name: "e", scope: !36, file: !1, line: 18, type: !9)
!41 = !DILocation(line: 18, column: 19, scope: !36)
!42 = !DILocation(line: 18, column: 8, scope: !36)
!43 = !DILocation(line: 18, column: 40, scope: !44)
!44 = !DILexicalBlockFile(scope: !45, file: !1, discriminator: 1)
!45 = distinct !DILexicalBlock(scope: !36, file: !1, line: 18, column: 3)
!46 = !DILocation(line: 18, column: 3, scope: !44)
!47 = !DILocation(line: 19, column: 5, scope: !48)
!48 = distinct !DILexicalBlock(scope: !45, file: !1, line: 18, column: 50)
!49 = !DILocation(line: 20, column: 3, scope: !48)
!50 = !DILocation(line: 18, column: 45, scope: !51)
!51 = !DILexicalBlockFile(scope: !45, file: !1, discriminator: 2)
!52 = !DILocation(line: 18, column: 3, scope: !51)
!53 = distinct !{!53, !54}
!54 = !DILocation(line: 18, column: 3, scope: !25)
!55 = !DILocation(line: 21, column: 3, scope: !25)
