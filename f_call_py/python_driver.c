#define NPY_NO_DEPRECATED_API NPY_1_7_API_VERSION

#include <Python.h>
#include <numpy/arrayobject.h>
#include <numpy/ndarrayobject.h>
#include <numpy/noprefix.h>

void 
init_numpy() 
{ 
  import_array(); 
} 

int c_function(int *n, float **mat)
{
  PyObject *pModule  = NULL;
  PyObject *pFunc = NULL;
  PyObject *pArg = NULL;
  PyObject *pRet = NULL;
  PyObject *pName = NULL;

  size_t size = *n;
  npy_intp *dim;
  int i, j;

  dim = (npy_intp *) malloc(sizeof(npy_intp)*(size));

  for (i=0; i < size; i++) dim[i] = size;

  Py_Initialize();

  if (!Py_IsInitialized())
  {
    fprintf(stderr, "nao foi possivel inicializar o python!\n");
    return -1;
  }

  init_numpy(); 

  PyObject* pMat = PyArray_NewFromDescr(
     &PyArray_Type, PyArray_DescrFromType(NPY_FLOAT), 
     2, dim, NULL, (void *) *mat, NPY_ARRAY_INOUT_FARRAY, NULL);

  Py_INCREF(pMat);

  pName = PyString_FromString("function");
  pModule = PyImport_Import(pName);

  pFunc = PyObject_GetAttrString(pModule, "py_function");

  if(!PyCallable_Check(pFunc))
  {
    printf("func not callable!\n");
    return -1;
  }

  pArg = PyTuple_New (2);
  PyTuple_SetItem(pArg, 0, (PyObject *) PyInt_FromLong(size));
  PyTuple_SetItem(pArg, 1, pMat);

  pRet = PyObject_CallObject(pFunc, pArg);

  printf("py ret: %s\n", PyString_AsString(pRet));

  Py_DECREF (pMat);
  Py_DECREF (pName);
  Py_DECREF (pModule);
  Py_DECREF (pFunc);
  Py_DECREF (pArg);
  Py_DECREF (pRet);

  Py_Finalize();

  return 0;
}
