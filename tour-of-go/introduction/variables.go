package introduction

import "fmt"

/*
	Variables -->

	* The var statement declares a list of variables; as in function argument lists, the type is last
	* A var statement can be at package or function level. We see both in this example

	Vairables with intializers -->

	* A var declaration can include initializers, one per variable
	* If an initializer is present, the type can be omitted; the variable will take the type of the initializer

	Short variable declarations -->

	* Inside a function, the := short assignment statement can be used in place of a var declaration with implicit type
	* Outside a function, every statement begins with a keyword (var, func, and so on) and so the := construct is not available
*/

var c, python, java bool
var x, y, z int = 1, 2, 3

func Variables() {
	var i int
	var j, k, l = true, false, "no!"

	lol := "lol xd"

	fmt.Println(i, c, python, java)
	fmt.Println(x, y, z)
	fmt.Println(j, k, l)
	fmt.Println(lol)

	fmt.Println()
}
