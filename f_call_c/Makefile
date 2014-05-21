CC = gcc 
F90 = gfortran 
CFLAGS = -Wall 

OBJS = function.o c_driver.o

all: f_call_c 

f_call_c : c_driver.o $(OBJS) 
	$(F90) -o f_call_c $(OBJS) -lstdc++

function.o : function.c
	$(CC) $(CFLAGS) -c $<

c_driver.o : c_driver.f90
	$(F90) -c $<

clean :
	rm -rf $(OBJS) f_call_c
