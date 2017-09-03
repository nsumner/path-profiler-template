

#include "llvm/IR/BasicBlock.h"
#include "llvm/IR/DebugInfo.h"
#include "llvm/IR/Instruction.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/Support/FileSystem.h"

#include <unordered_map>

#include "ProfileDecodingPass.h"


using namespace llvm;
using namespace pathprofiling;


namespace pathprofiling {
char ProfileDecodingPass::ID = 0;
}


// Given a sequence of basic blocks composing a path, this function prints
// out the filename and line numbers associated with that path in CSV format.
void
printPath(llvm::raw_ostream& out, std::vector<llvm::BasicBlock*>& blocks) {
  unsigned line = 0;
  llvm::StringRef file;
  for (auto* bb : blocks) {
    for (auto& instruction : *bb) {
      llvm::DILocation* loc = instruction.getDebugLoc();
      if (loc && (loc->getLine() != line || loc->getFilename() != file)) {
        line = loc->getLine();
        file = loc->getFilename();
        out << ", " << file.str() << ", " << line;
      }
    }
  }
}


bool
ProfileDecodingPass::runOnModule(Module &module) {
  // Implement your solution here.
  return false;
}


std::vector<llvm::BasicBlock*>
ProfileDecodingPass::decode(llvm::Function* function, uint64_t pathID) {
  std::vector<llvm::BasicBlock*> sequence;
  // You may want to implement and use this function as a part of your
  // solution.
  return sequence;
}

