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


proc yes(question: string): bool =
  echo question, " (y/n)"

  while true:
    case stdin.readLine:
      of "y", "Y", "yes", "Yes":
        return true
      of "n", "N", "no", "No":
        return false
      else:
        echo "Please be clear: yes or no"

if yes("Should I delete all your important files?"):
  echo "I'm sorry man, I'm afraid I can't do that!"
else:
  echo "I think you know what the problem is just as well as I do."

