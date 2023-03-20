i := 1
previous_value := 0
placeholder := 0

current_iteration := 0

Fibonacci := Object clone
Fibonacci fib := method(number_of_iterations, while(current_iteration < number_of_iterations, i println; placeholder = previous_value; i = i + previous_value; previous_value = i - placeholder; current_iteration = current_iteration + 1; i))
Fibonacci fib(40)


dimension1 := list(1, 2, 3, 4, 5, 6)
dimension2 := list(2, 3, 4, 5, 6, 7)
dimension3 := list(3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13)
list_of_lists := list(dimension1, dimension2, dimension3)

list_of_lists sum_multidimensional_array := method( sum_total := 0; foreach(line, current_increment := line sum; sum_total = sum_total + current_increment); sum_total println )
list_of_lists sum_multidimensional_array
