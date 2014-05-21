module fortran_module

	use, intrinsic :: iso_c_binding	

	implicit none

	integer, parameter :: dp = KIND(1.d0)

	contains

	subroutine function_alloc_in_fortran(c_array_ptr) bind (c, name="function_alloc_in_fortran")
	   type (c_ptr), intent (out) :: c_array_ptr
	   real (c_float), allocatable, dimension (:), target, save :: fort_array

	   allocate(fort_array(1:2))
	   fort_array = [2.5, 4.4]
	   c_array_ptr = c_loc(fort_array)
	end subroutine

	subroutine function_alloc_in_c(n1, p_a1, n2, p_a2) bind (c, name="function_alloc_in_c")
        integer(c_int32_t), intent(in) :: n1
		type (c_ptr), intent(in)       :: p_a1
		
        integer(c_int32_t), intent(in) :: n2
		type (c_ptr), intent(in)       :: p_a2
		
		real (c_double), pointer, dimension(:) :: a1
		real (c_double), pointer, dimension(:) :: a2
		
		integer :: i

		call c_f_pointer(p_a1, a1, [10])
		call c_f_pointer(p_a2, a2, [20])

        do i = 1, n1
		    a1(i) = i
		end do

		do i = 1, n2
		    a2(i) = i
		end do
	end subroutine

end module
