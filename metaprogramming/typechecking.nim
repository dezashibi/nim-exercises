import macros

type
    Person = object
        name: string
        age: int

static: # runs at compile time
    for sym in getType(Person)[2]:
        echo(sym.strVal)
