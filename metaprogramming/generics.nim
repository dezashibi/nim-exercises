proc myMax[T](a, b: T): T =
    if a < b:
        return b
    else:
        return a

doAssert myMax(5, 10) == 10
doAssert myMax(31.3, 1.234124) == 31.3
doAssert myMax[float](5, 10.5) == 10.5
# doAssert myMax(5'i32, 10.5) == 10.5 # failure

type
    Container[T] = object
        empty: bool
        value: T

proc initContainer[T](): Container[T] =
    result.empty = true

var myBox = initContainer[string]()
echo myBox.empty

proc myMax2[T: int | float](a, b: T): T =
    if a < b:
        return b
    else:
        return a

echo myMax2(10, 2)
# echo myMax2("Hello", "World") # this is a problem should not be used like this

type
    Number = int | float | uint

proc isPositive(x: Number): bool =
    return x > 0

echo isPositive(12)
echo isPositive(-12)
