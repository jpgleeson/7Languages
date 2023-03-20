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