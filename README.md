This is a template for a project applying some simple static analysis
together with dynamic analysis to extract information about program
behavior. It involves instrumenting an LLVM module to produce a new program
that collects path frequency information for acyclic functions.

Building with CMake
==============================================
1. Create a new directory for building.

        mkdir pathprofilerbuild

2. Change into the new directory.

        cd pathprofilerbuild

3. Run CMake with the path to the LLVM source.

        cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=True \
            -DLLVM_DIR=</path/to/LLVM/build>/lib/cmake/llvm/ ../path-profiler-template

4. Run make inside the build directory:

        make

This produces a path profiler tool called `bin/pathprofiler` and supporting
libraries in `lib/`.

Note, building with a tool like ninja can be done by adding `-G Ninja` to
the cmake invocation and running ninja instead of make.

Running
==============================================

First suppose that you have a program compiled to bitcode:

    clang -g -c -emit-llvm -S ../path-profiler-template/test/c/03-multipleprofiled.c -o example.ll

Running the path profiler:

    bin/pathprofiler example.ll -o example
    ./example

When you have successfully completed the exercise, running an instrumented
program like `./example` in the above example should produce a file called
`path-profile-results` in the current directory. Running the path profiler
as follows then analyzes the results:

    bin/pathprofiler example.ll -p path-profile-results

Again, when you have successfully completed the exercise, this produces
another file in the current directory called `top-five-paths.csv`. This file
contains the five most frequently executed paths, with each line formatted
as follows:

    <# Occurrences>, <Function Name> (, <File Name>, <Line #>)+

