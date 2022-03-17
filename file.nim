import strutils

# let f = open("test.txt")
# files should be opened using var
var f: File
if f.open("test.txt"):
  echo "File opened"
else:
  echo "Bad txt file"
  system.quit 1

let data = f.readLine
echo data

f.close

f = open("test.txt", fmWrite)
f.write("12345")
f.close

f = open("test2.txt", fmWrite)
f.write("this file is new and this text is added to it")
f.close

f = open("test3.txt", fmWrite)
f.write("""
This is first line
This is second line
END!!!
""")
f.close


f = open("test3.txt", fmRead)
var line = f.readLine
echo line
line = f.readLine
echo line
line = f.readLine
echo line

f.close

f = open("test3.txt", fmRead)
var allLines = f.readAll
echo allLines

let lines = allLines.split("\n")
echo lines
var i: int = 1
for line in lines:
  echo $i & " - " & line
  inc i

f.close


