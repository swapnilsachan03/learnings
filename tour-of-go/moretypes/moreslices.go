package moretypes

import (
	"fmt"
	"strings"
)

/*
	Slices of slices -->

	* Slices can contain any type, including other slices.

	Appending to a slice -->

	* It is common to append new elements to a slice, and so Go provides a built-in append function: func append(s []T, vs ...T) []T
	* The first parameter s of append is a slice of type T, and the rest are T values to append to the slice.
	* The resulting value of append is a slice containing all the elements of the original slice plus the provided values.
	* If the backing array of s is too small to fit all the given values a bigger array will be allocated. The returned slice will point to the newly allocated array.
*/

func MoreSlices() {
	board := [][]string{
		[]string{"_", "_", "_"},
		[]string{"_", "_", "_"},
		[]string{"_", "_", "_"},
	}

	board[0][0] = "X"
	board[2][2] = "O"
	board[1][2] = "X"
	board[1][0] = "O"
	board[0][2] = "X"

	for i := range len(board) {
		fmt.Printf("%s\n", strings.Join(board[i], " "))
	}

	fmt.Println()

	var s []int
	printSlice(s)

	s = append(s, 0)
	printSlice(s)

	s = append(s, 1)
	printSlice(s)

	s = append(s, 2, 3, 4)
	printSlice(s)
}
