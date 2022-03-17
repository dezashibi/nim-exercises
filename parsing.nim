import strutils


var stringInteger = "100"
var stringFloat = "0.25"

var parsedInteger: int
var parsedFloat: float

parsedInteger = stringInteger.parseInt
parsedFloat = stringFloat.parseFloat

echo parsedInteger, ", ", parsedInteger.type
echo parsedFloat, ", ", parsedFloat.type

echo ("Type something: ")
let data = readLine(stdin)

echo data

echo ("Type something else:")
let data2 = stdin.readLine
echo data2

# more example
echo "First number: "
let number1 = stdin.readLine.parseInt
let number2 = stdin.readLine.parseInt

let sum = number1 + number2
echo "Sum of ", number1, " and ", number2, " is ", sum

