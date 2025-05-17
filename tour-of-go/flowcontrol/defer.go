package flowcontrol

import "fmt"

/*
	Defer -->

	* A defer statement defers the execution of a function until the surrounding function returns
	* The deferred call's arguments are evaluated immediately, but the function call is not executed until the surrounding function returns

	Stacking defers	-->

	* Deferred function calls are pushed onto a stack. When a function returns, its deferred calls are executed in last-in-first-out order
*/

func Defer() {
	fmt.Println()

	defer fmt.Println("function call")
	fmt.Print("the above function is a deferred ")

	fmt.Println("\ncounting")

	for i := range 10 {
		defer fmt.Println(i)
	}

	fmt.Println("done")
}
