package main

import (
	"tour-of-go/constants"
	"tour-of-go/functions"
	"tour-of-go/introduction"
	"tour-of-go/types"
	"tour-of-go/variables"
)

/* The order of the tutorial is the order in which the functions are called */

func main() {
	introduction.Introduction()
	functions.Example()
	variables.Variables()
	types.Types()
	constants.Constants()
}
