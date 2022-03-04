proc sum(x, y: int): int =
  result = x + y

proc sum(x, y: float): float =
  result = x + y

proc sum(x, y: string): string =
  result = x & " " & y

proc sum(x, y, z: string): string =
  result = x & y & z

echo sum(12, 10)
echo sum(1.5, 2.5)
echo sum("Hello", "world")
echo sum("Hello", " ", "World")

