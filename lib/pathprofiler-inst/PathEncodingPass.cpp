

#include "llvm/ADT/PostOrderIterator.h"
#include "llvm/IR/BasicBlock.h"
#include "llvm/IR/CFG.h"
#include "llvm/IR/Instructions.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/Support/GraphWriter.h"

#include "PathEncodingPass.h"

#include <algorithm>
#include <vector>


using namespace llvm;
using namespace pathprofiling;


namespace pathprofiling {
  char PathEncodingPass::ID = 0;
}


bool
PathEncodingPass::runOnModule(Module& module) {
  // Add your solution here.
  return false;
}


void
PathEncodingPass::encode(llvm::Function& function) {
  // You may want to write this function as part of your solution
}
