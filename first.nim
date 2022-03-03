import strformat

type
    Person = object
        name: string
        age: Natural # Ensures the age is positive

let people = [
    Person(name: "John", age: 45),
    Person(name: "Kate", age: 30)
]

for person in people:
    # Type-safe strting interpolation
    # evaluated at cimpile time.
    echo(fmt"{person.name} is {person.age} years old")


echo "\n------------------------------------------"
