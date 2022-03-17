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
