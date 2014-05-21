#include <stdio.h>
#include <stdlib.h>

void function_alloc_in_fortran(float **array);
void test_alloc_in_c(int *n1, double **a1, int *n2, double **a2);
void run_test_a();
void run_test_b();

int main(void) {

   run_test_a();
   run_test_b();

   return 0;
}

void run_test_a()
{
   float *array;
   function_alloc_in_fortran(&array);

   printf ("Values are: %f %f\n", array [0], array [1]);    
}

void run_test_b()
{
    int i;
	double *a1;
	double *a2;
	int n1 = 3;
	int n2 = 4;

	a1 = malloc(sizeof(double)*n1);
	a2 = malloc(sizeof(double)*n2);

	function_alloc_in_c(&n1, (double **) &a1, &n2, (double **) &a2);

	for (i = 0; i < n1; i++) {
		printf("a1: %f\n", a1[i]);
	}

	for (i = 0; i < n2; i++) {
		printf("a2: %f\n", a2[i]);
	}
}
