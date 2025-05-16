package introduction

import "fmt"

/*
	Functions	-->

	* A function can take zero or more arguments
	* Notice that the type comes after the variable name
	* When two or more consecutive named function parameters share a type, you can omit the type from all but the last
	* For example, (x int, y int) can be shortened to (x, y int)

	Return values / multiple results -->

	* A function can return any number of results, including none, for example the swap function returns two strings
	* The return type comes after the parameter list
	* The return statement can be used without arguments to return the named return values. In this case, it returns the current values of x and y

	Named return values -->

	* Go's return values may be named. If so, they are treated as variables defined at the top of the function
	* These names should be used to document the meaning of the return values
	* A return statement without arguments returns the named return values. This is known as a "naked" return
	* Naked return statements should be used only in short functions, as with the example shown here. They can harm readability in longer functions
*/

func add(x int, y int) int {
	return x + y
}

func swap(x, y string) (string, string) {
	return y, x
}

func split(sum int) (x, y int) {
	x = sum * 4 / 9
	y = sum - x
	return
}

func Functions() {
	fmt.Println(add(42, 13))

	a, b := swap("hello", "world")
	fmt.Println(a, b)

	fmt.Println(split(17))

	fmt.Println()
}
