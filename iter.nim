for e in 1..10:
  echo e


for e in countup(1, 10): 
  echo e

for e in countup(10, 1):
  echo e

iterator cUp(x, y: int): int =
  var a = x
  while a <= y:
    yield a
    inc a

for e in cUp(1, 5):
  echo e


for i in [1,2,3]:
  echo i

for i in items([2,3,4]):
  echo i

for x, y in [ [1,3,5], [2,4,6] ]:
  echo x
  echo y

