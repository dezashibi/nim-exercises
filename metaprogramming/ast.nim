import macros

type
    NodeKind = enum
        Literal, Operator

    Node = ref object
        case kind: NodeKind
        of Literal:
            value: int
        of Operator:
            left, right: Node
            operator: char

proc newLiteralNode(value: int): Node =
    result = Node(
        kind: Literal,
        value: value
    )

var root = Node(
    kind: Operator,
    operator: '*',
    left: newLiteralNode(5),
    right: Node(
        kind: Operator,
        operator: '+',
        left: newLiteralNode(5),
        right: newLiteralNode(10),
    )
)

dumpTree:
    5 * (5 + 10)
