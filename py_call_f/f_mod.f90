subroutine my_function(n, input_a, input_b, output)
    integer, intent(in)   :: n
    real,    intent(in)   :: input_a(n)
    real,    intent(in)   :: input_b(n)
    real,    intent(out)  :: output(n)
    
    output = input_a + input_b
end subroutine
