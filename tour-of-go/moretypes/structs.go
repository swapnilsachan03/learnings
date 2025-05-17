package moretypes

import "fmt"

/*
	Structs -->

	* A struct is a collection of fields
	* Struct fields can be accessed using a dot (.) operator

	Pointers to structs	-->

	* Struct fields can be accessed through a struct pointer
	* To access the field X of a struct when we have the struct pointer p we could write (*p).X. However, that notation is cumbersome, so the language permits us instead to write just p.X, without the explicit dereference

	Struct Literals	-->

	* A struct literal denotes a newly allocated struct value by listing the values of its fields
	* You can list just a subset of fields by using the Name: syntax (And the order of named fields is irrelevant)
	* The special prefix & returns a pointer to the struct value
*/

type Vertex struct {
	X int
	Y int
}

type Point struct {
	X, Y int
}

var (
	v1 = Point{1, 2}
	v2 = Point{X: 1}
	v3 = Point{}
	p1 = &Point{1, 2} 	// has type *Point
)

func Structs() {
	fmt.Println()

	a := Vertex{1, 2}
	fmt.Println("Vertex a: ", a)

	a.X = 4
	fmt.Println("x: ", a.X, "\ty: ", a.Y)

	p := &a
	p.Y = 1e9		// same as (*p).Y = 1e9

	fmt.Println("x: ", a.X, "\ty: ", a.Y)

	fmt.Println(v1, p1, v2, v3)
}
