## Language interoperability collection of proof of concepts

You need gcc, gfortran and python with numpy and scipy

Tested on: gcc/gfortran version 4.8.2, python 2.6. all from ubuntu repositories.

## c_call_f
C language calling a Fortran 90 function inside a module using the iso_c_binding 
intrinsic module.

## f_call_c
Fortran program calling a C function the iso_c_binding intrinsic module.

## f_call_py
Fortran calling a Python function through a C function, this proof of concept
uses numpy array and the memory is allocated in fortran. This is
interesting because numpy can use the contiguous memory allocated on fortran
without maneuvers on notation.

## py_call_f
Python calling Fortran using f2py (note: requires numpy/scipy). It would be nice
to build a f90 module and place the subroutine inside it, instead of making only
a subroutine file.

# todo
F77 linking with underscore to C, cffi, numba (python).
Maybe try with other languages like ruby, go and jvm-based langs.