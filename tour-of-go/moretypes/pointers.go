package moretypes

import "fmt"

/*
	Pointers -->

	* Go has pointers. A pointer holds the memory address of a value.
	* The type *T is a pointer to a T value. Its zero value is nil.
		var p *int
	* The & operator generates a pointer to its operand

	i := 42
	p = &i

	* The * operator denotes the pointer's underlying value. This is known as "dereferencing" or "indirecting"
	* Unlike C, Go has no pointer arithmetic.
*/

func Pointers() {
	fmt.Println()

	i, j := 42, 2701

	p := &i
	fmt.Println(*p)
	*p = 21
	fmt.Println(i)

	p = &j
	*p = *p / 37
	fmt.Println(j)
}
