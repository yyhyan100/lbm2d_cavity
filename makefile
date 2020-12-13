FC=gfortran
lbm2d : vars.o init.o getfeq.o myio.o bc.o collision.o streaming.o main.o 
	${FC} -o $@ $^
%.o : %.f90
	${FC} -c $<