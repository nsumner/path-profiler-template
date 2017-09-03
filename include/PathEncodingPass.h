
#ifndef PATHENCODINGPASS_H
#define PATHENCODINGPASS_H


#include "llvm/Analysis/LoopInfo.h"
#include "llvm/ADT/DenseMap.h"
#include "llvm/IR/BasicBlock.h"
#include "llvm/IR/Module.h"
#include "llvm/Pass.h"


namespace pathprofiling {


struct PathEncodingPass : public llvm::ModulePass {
  using Edge = std::pair<llvm::BasicBlock*, llvm::BasicBlock*>;

  static char ID;

  llvm::DenseMap<llvm::BasicBlock*, uint64_t> numPaths;
  llvm::DenseMap<Edge, uint64_t> edges;

  PathEncodingPass()
    : llvm::ModulePass(ID)
      { }

  void
  getAnalysisUsage(llvm::AnalysisUsage& au) const override {
    au.addRequired<llvm::LoopInfoWrapperPass>();
    au.setPreservesAll();
  }

  bool runOnModule(llvm::Module& m) override;

  void encode(llvm::Function& function);
};


}  // namespace pathprofiling


#endif

