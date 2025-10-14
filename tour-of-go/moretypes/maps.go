package moretypes

import "fmt"

/*
	Maps -->

	* A map maps keys to values
	* The zero value of a map is nil. A nil map has no keys, nor can keys be added
	* The make function returns a map of the given type, initialized and ready for use

	Map literals -->

	* Map literals are like struct literals, but the keys are required
	* If the top-level type is just a type name, you can omit it from the elements of the literal

	Mutating Maps -->

	* Insert or update an element in map m: m[key] = elem
	* Retrieve an element: elem = m[key]
	* Delete an element: delete(m, key)
	* Test that a key is present with a two-value assignment: elem, ok = m[key]
	* If key is in m, ok is true. If not, ok is false.
	* If key is not in the map, then elem is the zero value for the map's element type.
	* Note: If elem or ok have not yet been declared you could use a short declaration form: elem, ok := m[key]
*/

type Coord struct {
	Lat, Long float64
}

var m map[string]Coord

var n = map[string]Coord{
	"Bell Labs": Coord{
		40.68433, -74.39967,
	},
	"Google": Coord{
		37.42202, -122.08408,
	},
}

var o = map[string]Coord{
	"Bell Labs": { 40.68433, -74.39967 },
	"Google": { 37.42202, -122.08408 },
}

func Maps() {
	fmt.Println()

	m = make(map[string]Coord)
	m["Bell Labs"] = Coord{
		40.68433, -74.39967,
	}
	fmt.Println(m["Bell Labs"])

	fmt.Println(n)
	fmt.Println(o)
	fmt.Println()

	mp := make(map[string]int)

	mp["Answer"] = 42
	fmt.Println("The value:", mp["Answer"])

	mp["Answer"] = 48
	fmt.Println("The value:", mp["Answer"])

	delete(mp, "Answer")
	fmt.Println("The value:", mp["Answer"])

	v, ok := mp["Answer"]
	fmt.Println("The value:", v, "Present?", ok)
}
