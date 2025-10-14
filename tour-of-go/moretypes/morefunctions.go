package moretypes

import (
	"fmt"
	"math"
)

/*
	Function values -->

	* Functions are values too. They can be passed around just like other values
	* Function values may be used as function arguments and return values

	Function closures -->

	* Go functions may be closures. A closure is a function value that references variables from outside its body. The function may access and assign to the referenced variables; in this sense the function is "bound" to the variables
	* For example, the adder function returns a closure. Each closure is bound to its own sum variable
*/

func compute(fn func(float64, float64) float64) float64 {
	return fn(3, 4)
}

func adder() func(int) int {
	sum := 0
	return func(x int) int {
		sum += x
		return sum
	}
}

func MoreFunctions() {
	fmt.Println()

	hypot := func(x, y float64) float64 {
		return math.Sqrt(x*x + y*y)
	}
	fmt.Println(hypot(5, 12))

	fmt.Println(compute(hypot))
	fmt.Println(compute(math.Pow))
	fmt.Println()

	pos, neg := adder(), adder()
	for i := range 10 {
		fmt.Println(
			pos(i),
			neg(-2*i),
		)
	}
}
