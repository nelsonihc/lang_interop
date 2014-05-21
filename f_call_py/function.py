#!/usr/bin/env python
# -*- coding: utf-8 -*-

import numpy as np

def py_function(n, a):
    print (np.shape(a))
    print (a)
    print (n)
    print type(n)
    print type(a)
    np.copyto(np.transpose(a), a)
    print (a)
    return "done"

if __name__ == "__main__":
    py_function(2, np.array([[1, 2], [3, 4]]))