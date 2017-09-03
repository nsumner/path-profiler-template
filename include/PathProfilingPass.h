
#ifndef PATHPROFILINGPASS_H
#define PATHPROFILINGPASS_H


#include "llvm/IR/Dominators.h"
#include "llvm/IR/Module.h"
#include "llvm/Pass.h"

#include "PathEncodingPass.h"

namespace pathprofiling {


struct PathProfilingPass : public llvm::ModulePass {

  static char ID;

  PathProfilingPass()
    : llvm::ModulePass(ID)
      { }

  void
  getAnalysisUsage(llvm::AnalysisUsage& au) const override {
    au.addRequired<llvm::DominatorTreeWrapperPass>();
    au.addRequired<llvm::LoopInfoWrapperPass>();
    au.addRequired<PathEncodingPass>();
  }

  bool runOnModule(llvm::Module& m) override;

  void instrument(llvm::Module& m, llvm::Function& function, uint64_t loopID);
};


}  // namespace pathprofiling


#endif

