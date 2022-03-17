import math

type
    ShapeKind = enum
        Circle, Square
    Shape = object
        color: string
        case kind: ShapeKind
        of Circle:
            radius: float
        of Square:
            length: float


let redCircle = Shape(color: "red", kind: Circle, radius: 9)
let blueSquare = Shape(color: "blue", kind: Square, length: 10)

let myShapes = @[redCircle, blueSquare]
echo myShapes

func calcArea(shape: Shape): float =
    case shape.kind:
    of Circle:
        result = PI*shape.radius*shape.radius
    of Square:
        result = shape.length*shape.length

echo redCircle.calcArea
echo blueSquare.calcArea

func `==`(shape1, shape2: Shape): bool =
    if shape1.kind != shape2.kind or shape1.color != shape2.color: return false
    case shape1.kind:
    of Circle: result = shape1.radius == shape2.radius
    of Square: result = shape1.length == shape2.length


echo redCircle == blueSquare
