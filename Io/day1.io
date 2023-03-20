Vehicle := Object clone
Vehicle description := "A thing that moves you."

Car := Vehicle clone
Car description

method("A sample method" println)

Car drive := method("Vroom" println)

Car drive

ferrari := Car clone
ferrari drive

ford := Car clone
ford drive = method("Put Put Put" println)
ford drive

cars := list(ferrari, ford)
number_of_cars := cars size
number_of_cars println

for (i, 0, number_of_cars - 1, cars at(i) drive)