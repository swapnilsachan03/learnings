package main

import (
	"tour-of-go/flowcontrol"
	"tour-of-go/introduction"
)

/* The order of the tutorial is the order in which the functions are called */

func main() {
	introduction.Introduction()
	introduction.Functions()
	introduction.Variables()
	introduction.Types()
	introduction.Constants()

	flowcontrol.Loops()
	flowcontrol.Conditionals()
	flowcontrol.Switch()
	flowcontrol.Defer()
}
