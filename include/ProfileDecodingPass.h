
#ifndef PROFILEDECODINGPASS_H
#define PROFILEDECODINGPASS_H


#include "llvm/Analysis/LoopInfo.h"
#include "llvm/ADT/StringRef.h"
#include "llvm/IR/Module.h"
#include "llvm/Pass.h"

#include "PathEncodingPass.h"

namespace pathprofiling {


struct ProfileDecodingPass : public llvm::ModulePass {

  static char ID;

  const llvm::StringRef infilename;
  const llvm::StringRef outfilename;

  const size_t numberToReturn;

  ProfileDecodingPass(llvm::StringRef infilename,
                      llvm::StringRef outfilename,
                      size_t numberToReturn)
    : llvm::ModulePass{ID},
      infilename{infilename},
      outfilename{outfilename},
      numberToReturn{numberToReturn}
      { }

  void
  getAnalysisUsage(llvm::AnalysisUsage& au) const override {
    au.addRequired<llvm::LoopInfoWrapperPass>();
    au.addRequired<PathEncodingPass>();
  }

  bool runOnModule(llvm::Module& m) override;

  std::vector<llvm::BasicBlock*>
  decode(llvm::Function* function, uint64_t pathID);
};


}  // namespace pathprofiling


#endif

