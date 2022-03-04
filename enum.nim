type
  Direction = enum
    east, north, west, south

echo east
echo north
echo west
echo south

echo Direction.east
# ...

var direction: Direction
echo direction

direction = south
echo direction

direction = east.succ
echo direction


