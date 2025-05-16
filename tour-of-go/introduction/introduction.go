package introduction

import (
	"fmt"
	"math"
	"math/rand"
)

/*
	Packages -->

	* Every Go program is made up of packages
	* Programs start running in package main
	* This program is using the packages with import paths "fmt" and "math/rand"
	* By convention, the package name is the same as the last element of the import path. For instance, the "math/rand" package comprises files that begin with the statement package rand

	Imports -->

	* This code groups the imports into a parenthesized, "factored" import statement
	* You can also write multiple import statements, like:
		import "fmt"
		import "math"
	* But it is good style to use the factored import statement

	Exports / exported names -->

	* In Go, a name is exported if it begins with a capital letter. For example, Pizza is an exported name, as is Pi, which is exported from the math package
	* pizza and pi do not start with a capital letter, so they are not exported
	* When importing a package, you can refer only to its exported names. Any "unexported" names are not accessible from outside the package
	* For example, math.pi will throw an error, while math.Pi will work perfectly fine
*/

func Introduction() {
	fmt.Println()

	fmt.Println("My favorite number is", rand.Intn(10))
	fmt.Printf("Now you have %g problems.\n", math.Sqrt(7))
	fmt.Println(math.Pi)

	fmt.Println()
}
