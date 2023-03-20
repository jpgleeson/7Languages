i := 1
previous_value := 0
placeholder := 0

current_iteration := 0

Fibonacci := Object clone
Fibonacci fib := method(number_of_iterations, while(current_iteration < number_of_iterations, i println; placeholder = previous_value; i = i + previous_value; previous_value = i - placeholder; current_iteration = current_iteration + 1; i))
Fibonacci fib(10)

