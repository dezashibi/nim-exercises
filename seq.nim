# Type section of "var" for quicker assignment
var
  # declaration and initialization
  arrayA: array[3, int] = [1, 2, 3] # array
  seqA: seq[int] = @[1, 2, 3] # sequence - no size required

  # initialization
  arrayB = [1,2,3] #array
  seqB = @[1,2,3] #sequence

  # declaration
  arrayD: array[7, string]
  seqD: seq[string]

echo seqA
echo seqB
echo seqD

for e in seqA:
  echo e

seqA.add 1000
echo seqA
seqA.del 2
echo seqA

var i = 0
while i < 10:
  echo i
  inc i



