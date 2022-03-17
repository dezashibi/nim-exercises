import os
template repeat5(statements: untyped) =
    for i in 0..<5:
        statements

repeat5:
    echo("Hello Templates!!!")
    sleep(1000)

template repeat(count: int, statements: untyped) =
    for i in 0..<count:
        statements

repeat 5:
    echo("Hello Templates!!!")
    sleep(1000)
