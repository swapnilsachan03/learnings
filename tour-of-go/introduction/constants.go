package introduction

import "fmt"

/*
	Constants -->

	* Constants are declared like variables, but with the const keyword
	* Constants can be character, string, boolean, or numeric values
	* Constants cannot be declared using the := syntax

	Numeric Constants -->

	* Numeric constants are high-precision values
	* An untyped constant takes the type needed by its context
	* Try printing needInt(Big) too (an int can store at maximum a 64-bit integer, and sometimes less)
*/

const Pi = 3.14

const (
	Big = 1 << 100
	Small = Big >> 99
)

func needInt(x int) int { return x*10 + 1 }
func needFloat(x float64) float64 {
	return x * 0.1
}

func Constants() {
	const World = "world!"
	fmt.Println("Hello", World)
	fmt.Println("Happy", Pi, "Day")

	const Truth = true
	fmt.Println("Go rules?", Truth)

	fmt.Println(needInt(Small))
	fmt.Println(needFloat(Small))
	fmt.Println(needFloat(Big))
}
