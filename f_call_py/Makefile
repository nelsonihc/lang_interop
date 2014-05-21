F90=gfortran
CC=gcc
PYTHON_LIB=$(shell pkg-config --cflags --libs python2)

OBJS = python_driver.o c_driver.o

all: f_call_py

python_driver.o: python_driver.c
	$(CC) $(PYTHON_LIB) -c $<

c_driver.o: c_driver.f90
	$(F90) -c $<

f_call_py : $(OBJS) 
	$(F90) -o $@ $(OBJS) $(PYTHON_LIB)

clean:
	rm -fr $(OBJS) *.pyc f_call_py