## Language interoperability collection of proof of concepts

You need gcc and gfortran

Tested on: gcc/gfortran version 4.8.2 @ ubuntu

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

# todo
F77 linking with underscore, py_cffi, numba_py