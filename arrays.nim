var
  # full method of defining an array
  a: array[3, int] = [1, 2, 5]

  # without type hint
  b = [1, 2, 3]
  
  # this is an empty arary with 7 members
  d: array[7, string]

echo a
echo b
echo d

for i in a:
  stdout.write i
  stdout.write "\n"

for i in a.low..a.high:
  echo a[i]


