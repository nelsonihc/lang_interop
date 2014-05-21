F90 = gfortran
CC = gcc

all : c_call_f

OBJS = fortran_driver.o function.o

clean:
	rm -rf $(OBJS) *.mod c_call_f

function.o: function.f90
	$(F90) $(F_FLAGS) -c $< -g

fortran_driver.o: fortran_driver.c
	$(CC) $(C_FLAGS) -c $< -g

c_call_f: $(OBJS)
	$(F90) $(C_FLAGS) -o c_call_f $(OBJS)
