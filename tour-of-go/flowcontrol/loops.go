package flowcontrol

import "fmt"

/*
	For -->

	* Go has only one looping construct, the for loop
	* The basic for loop has three components separated by semicolons
	* The init statement will often be a short variable declaration, and the variables declared there are visible only in the scope of the for statement
	* The loop will stop iterating once the boolean condition evaluates to false
	* Note: Unlike other languages like C, Java, or JavaScript there are no parentheses surrounding the three components of the for statement and the braces { } are always required
	* The init and post statements are optional

	For is Go's "while"	-->

	* At that point you can drop the semicolons: C's while is spelled for in Go

	Forever	-->

	* If you omit the loop condition it loops forever, so an infinite loop is compactly expressed
*/

func Loops() {
	fmt.Println()

	var sum, what, ever = 0, 1, 2

	for i := 0; i < 10; i++ {
		sum += i
	}

	for ; what < 1000; {
		what += what
	}

	for ever < 2000 {
		ever += ever
	}

	fmt.Println("Sum of first 10 natural numbers: ", sum)
	fmt.Println("Sum of what: ", what)
	fmt.Println("Sum of ever: ", ever)
}
