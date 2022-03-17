# source = https://nim-lang.org/docs/tut2.html#object-oriented-programming-properties

type
    Socket* = ref object of RootObj
        h: int # cannot be accessed from the outside of the module due to missing star

proc `host=`*(s: var Socket, value: int) {.inline.} =
    ## setter of host address
    s.h = value

proc host*(s: Socket): int {.inline.} =
    ## getter of host address
    s.h

var s: Socket
new s
s.host = 34 # same as 'host='(s, 34)

echo s.host


type
    Vector* = object
        x, y, z: float

proc `[]=`*(v: var Vector, i: int, value: float) =
    # setter
    case i
    of 0: v.x = value
    of 1: v.y = value
    of 2: v.z = value
    else: assert(false)

proc `[]`*(v: Vector, i: int): float =
    # getter
    case i
    of 0: result = v.x
    of 1: result = v.y
    of 2: result = v.z
    else: assert(false)

var myVector: Vector
myVector[0] = 12
myVector[1] = 10
myVector[2] = 0

echo myVector[0]
echo myVector
