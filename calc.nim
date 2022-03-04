import strutils

var input: string
var num1: float
var num2: float
var result: float

while true:
  echo "Choose your action: Addition, Subtraction, Multiplication, Division, Exit"
  input = stdin.readLine
  case input:
    of "Exit":
      break

    of "Addition":
      stdout.write "First number: "
      num1 = stdin.readLine.parseFloat
      stdout.write "Second number: "
      num2 = stdin.readLine.parseFloat

      result = num1 + num2
      echo result

    of "Subtraction":
      stdout.write "First number: "
      num1 = stdin.readLine.parseFloat
      stdout.write "Second number: "
      num2 = stdin.readLine.parseFloat

      result = num1 - num2
      echo result

    of "Multiplication":
      stdout.write "First number: "
      num1 = stdin.readLine.parseFloat
      stdout.write "Second number: "
      num2 = stdin.readLine.parseFloat

      result = num1 * num2
      echo result

    of "Division":
      stdout.write "First number: "
      num1 = stdin.readLine.parseFloat
      stdout.write "Second number: "
      num2 = stdin.readLine.parseFloat

      result = num1 / num2
      echo result

