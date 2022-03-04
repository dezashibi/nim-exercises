type
  NormalPerson = object
    name: string
    age: int

# inheritance
type
  Person = object of RootObj
    name: string
    age: int
  
  Student = object of Person
    id: int

var navid = Person(name: "Navid", age: 34)
var john = Student(name: "John", age: 14, id: 1)

echo navid
echo john

