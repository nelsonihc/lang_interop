program driver

  use :: iso_c_binding, only : c_float, c_int32_t, c_null_char, c_loc

  implicit none

  interface
    subroutine c_function(n, mat) bind(c)
      use iso_c_binding 
      integer(c_int32_t)               :: n
      type (c_ptr), intent(in), target :: mat
    end subroutine
  end interface

  real(c_float), allocatable, target :: mat(:,:)

  integer :: n, dim, i, j

  print *, "initializing fortran.."
  n = 3

  allocate(mat(3,3))

  mat(1,1) = 1.1
  mat(2,1) = 2.1
  mat(3,1) = 3.1

  mat(1,2) = 1.2
  mat(2,2) = 2.2
  mat(3,2) = 3.2

  mat(1,3) = 1.3
  mat(2,3) = 2.3
  mat(3,3) = 3.3

  do i = 1, 3
      print *, mat(i,1), mat(i,2), mat(i,3)
  end do

  print *, "calling c.."
  
  call c_function(3, c_loc(mat))

  do i = 1, 3
      print *, mat(i,1), mat(i,2), mat(i,3)
  end do


end program