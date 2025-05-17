package main

import (
	"tour-of-go/flowcontrol"
	"tour-of-go/introduction"
	"tour-of-go/moretypes"
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

	moretypes.Pointers()
	moretypes.Structs()
	moretypes.Arrays()
	moretypes.Slices()
	moretypes.MoreSlices()
	moretypes.Range()
	moretypes.Maps()
	moretypes.MoreFunctions()
}
