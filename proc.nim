proc hello() =
  echo "Hello"

proc sum(x: int, y: int): int =
  return x + y

hello()

echo sum(12, 5)

proc multisum(numbers: varargs[int]): int =
  var result: int
  for n in numbers:
    result += n

  return result

echo multisum(12, 13, 1, 3, 5)

