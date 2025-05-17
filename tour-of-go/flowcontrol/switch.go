package flowcontrol

import (
	"fmt"
	"runtime"
	"time"
)

/*
	Switch	-->

	* A switch statement is a shorter way to write a sequence of if - else statements. It runs the first case whose value is equal to the condition expression.
	* Go's switch is like the one in C, C++, Java, JavaScript, and PHP, except that Go only runs the selected case, not all the cases that follow. The break statement is provided automatically in Go.
	* Another important difference is that Go's switch cases need not be constants, and the values involved need not be integers.
	* Switch cases evaluate cases from top to bottom, stopping when a case succeeds

	Switch with no condition -->

	* Switch without a condition is the same as switch true
	* This construct can be a clean way to write long if-then-else chains
*/

func Switch() {
	fmt.Println()

	fmt.Print("Go runs on ")

	switch os := runtime.GOOS; os {
	case "darwin":
		fmt.Println("macOS.")
	case "linux":
		fmt.Println("Linux.")
	default:
		fmt.Printf("%s.\n", os)
	}

	fmt.Printf("When's Saturday? ")
	today := time.Now().Weekday()

	switch time.Saturday {
	case today + 0:
		fmt.Println("Today.")
	case today + 1:
		fmt.Println("Tomorrow.")
	case today + 2:
		fmt.Println("In two days.")
	default:
		fmt.Println("Too far away.")
	}

	t := time.Now()

	switch {
	case t.Hour() < 12:
		fmt.Println("Good morning!")
	case t.Hour() < 17:
		fmt.Println("Good afternoon.")
	default:
		fmt.Println("Good evening.")
	}
}
