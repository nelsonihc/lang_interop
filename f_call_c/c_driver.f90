program driver

    use :: iso_c_binding, only : c_float, c_int32_t, c_null_char
    
    implicit none
    
    interface
        function dot_product_in_c(n, input_a, input_b) bind(c)
              use iso_c_binding
              real(c_float) :: dot_product_in_c
              integer(c_int32_t) :: n
              real(c_float) :: input_a(:)
              real(c_float) :: input_b(:)
        end function
    
        subroutine sum_matrix_in_c(n, input_a, input_b, result) bind(c)
              use iso_c_binding 
              integer(c_int32_t) :: n
              real(c_float) :: input_a(:,:)
              real(c_float) :: input_b(:,:)
              real(c_float) :: result(:,:)
        end subroutine
    end interface
    
    call test_dot_product
    call test_sum_matrix_in_c
    
    stop
    
    contains
    
    subroutine test_dot_product
        integer, parameter :: n = 3
        real :: input_a(n)
        real :: input_b(n)
        integer :: i
        real    :: dot
        
        input_a = (/1, 2, 3/)
        input_b = (/2, 2, 2/)
        
        dot = dot_product_in_c(n, input_a, input_b)
        
        print *, "input_a: ", input_a
        print *, "input_b: ", input_b
        print *, "result :", dot
    end subroutine
    
    subroutine test_sum_matrix_in_c
        integer, parameter :: n = 3
        real :: input_a(n,n)
        real :: input_b(n,n)
        real :: result(n,n)
        
        input_a(1,:) = (/ 1,  1,  1/)
        input_a(2,:) = (/ 2,  2,  2/)
        input_a(3,:) = (/ 3,  3,  3/)
        
        input_b(1,:) = (/-1, -2, -3/)
        input_b(2,:) = (/-1,  2, -3/)
        input_b(3,:) = (/-1, -2, -3/)
        
        print *, "this is a:"
        print *, input_a(1,:)
        print *, input_a(2,:)
        print *, input_a(3,:)
        
        print *, "this is b:"
        print *, input_b(1,:)
        print *, input_b(2,:)
        print *, input_b(3,:)
        
        call sum_matrix_in_c(n, input_a, input_b, result)
        
        print *, "this sum is:"
        print *, result(1,:)
        print *, result(2,:)
        print *, result(3,:)

    end subroutine

end program
