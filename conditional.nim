if 10 > 5:
  echo "10 is larger than 5"
else:
  echo "10 is not larger than 5"

var a = 0

case a:
  of 0:
    echo "a is 0"
  of 1:
    echo "a is 1"
  of 2:
    echo "a is 2"
  else:
    echo "a's value is unknown"

echo "Enter your name:"
let input = stdin.readLine

case input:
  of "Navid":
    echo "I know you Navid ;)"
  of "James":
    echo "Hetfield is that you?"
  of "Ali":
    echo "Eeeee Alieeee"
  else:
    echo "Sorry I don't know you"

for i in 0..10:
  echo i
