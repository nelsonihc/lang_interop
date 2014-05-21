#include <stdio.h>

void sum_matrix_in_c(int *n, float **p_input_a, float **p_input_b, float **p_result);
float dot_product_in_c(int *n, float **p_input_a, float **p_input_b);
float *get_element(int i, int j, int n, float *fortran_array);

void sum_matrix_in_c(int *n, float **p_input_a, float **p_input_b, float **p_result)
{
    int i,j;
    float *input_a = *p_input_a;
    float *input_b = *p_input_b;
    float *result = *p_result;

    for (i=0; i<*n; i++) { 
      for (j=0; j<*n; j++) {
           *get_element(i, j, *n, result) = *get_element(i, j, *n, input_a) + *get_element(i, j, *n, input_b);
       }
    }
}

float *get_element(int i, int j, int n, float *fortran_array) 
{
    return fortran_array+((n*j)+i);
}

float dot_product_in_c(int *n, float **p_input_a, float **p_input_b) 
{
    int i;
    float dot;
    float *input_a = *p_input_a;
    float *input_b = *p_input_b;

    dot = 0.0;

    printf("calculating dot product of size: %d\n", *n);
    
    printf("input_a: [ ");
    for (i=0; i<*n; i++) { 
        printf("%f ", *(input_a+i));
    }
    printf("].\n");
    
    printf("input_b: [ ");
    for (i=0; i<*n; i++) { 
        printf("%f ", *(input_a+i));
    }
    printf("].\n");
    
    for (i=0; i<*n; i++) { 
      dot = dot + *(input_a+i) * *(input_b+i);
    }
    return dot;
}
