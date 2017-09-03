# This makefile can help you to build test inputs for your deadlocker tool
# and check its results. If you wish to compute results using your tool as
# well, you must define the DEADLOCKER variable below to contain the path
# to your compiled deadlocker binary. If you wish to compile your own tests,
# set the paths for CLANG and OPT, as well.
#
# To build LLVM assembly files from C source files:
#   make llvmasm
#
# To analyze the inputs using your tool:
#   make analyze
#
# To remove previous output & intermediate files:
#   make clean
#

LLVM_DIR     := /usr/shared/CMPT/wsumner/llvm/bin/
PATHPROFILER := ../../pathprofilerbuild/bin/pathprofiler
CLANG        := $(LLVM_DIR)clang
OPT          := $(LLVM_DIR)opt
RM           := /bin/rm
CAT          := /bin/cat
SOURCE_FILES := $(sort $(wildcard c/*.c))
ASM_FILES    := $(addprefix ll/,$(notdir $(SOURCE_FILES:.c=.ll)))
CSV_FILES    := $(addprefix csv/,$(notdir $(ASM_FILES:.ll=.csv)))
BINARIES     := $(addprefix bin/,$(notdir $(ASM_FILES:.ll=)))


llvmasm: $(ASM_FILES)
analyze: $(CSV_FILES)
bin: $(BINARIES)
all: $(llvmasm)


ll/%.ll: c/%.c
	$(CLANG) -g -O0 -emit-llvm -S $< -o - | $(OPT) -mem2reg -S -o $@

csv/%.csv: ll/%.ll bin/%
	$(RM) -f path-profile-results
	@echo '******** Profiling ********'
	-$(word 2,$^) 10 1 2 3 > /dev/null
	@echo '******** Analyzing ********'
	-$(PATHPROFILER) $< -p path-profile-results
	-mv top-five-paths.csv $@
	-$(CAT) $@

bin/%: ll/%.ll
	@echo '******** Instrumenting ********'
	-$(PATHPROFILER) $< -o $@

clean:
	$(RM) -f $(BINARIES) $(CSV_FILES) path-profile-results

veryclean: clean
	$(RM) -f $(ASM_FILES)

