all: f_mod.so

f_mod.so: f_mod.f90
	f2py -c -m f_mod $<

clean:
	rm -fr *.so *.o *.mod