
#include <cstdint>
#include <cstdio>


extern "C" {


// This macro allows us to prefix strings so that they are less likely to
// conflict with existing symbol names in the examined programs.
// e.g. EPP(entry) yields PaThPrOfIlInG_entry
#define EPP(X)  PaThPrOfIlInG_ ## X



// Implement your instrumentation functions here. You will probably need at
// least one function to log completed paths and one function to save the
// results to a file. You may wish to have others.



}

