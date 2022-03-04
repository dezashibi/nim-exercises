
# anonymous tuple
var someTuple = (10, 10.55, true, "Hello")
echo someTuple

# typed tuple
var anotherTuple: (string, int) = ("John", 22)
echo anotherTuple

# named tuple
var namedTuple: tuple[name: string, age: int] = ("Adam", 25)
echo namedTuple

namedTuple.name = "Peter"
echo namedTuple

var emptyTuple: tuple[name: string, age: int]
echo emptyTuple

type
  customTuple = tuple
    name: string
    age: int

var navid: customTuple = ("Navid", 34)
echo navid

var people: array[2, customTuple]
people[0] = navid
people[1] = ("James", 50)
echo people

var peopleSeq: seq[customTuple]
peopleSeq.add navid
peopleSeq.add ("James", 50)
peopleSeq.add ("George", 1200)

echo peopleSeq

