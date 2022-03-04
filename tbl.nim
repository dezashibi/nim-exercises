import tables

var ioTable = {"output": stdout, "input": stdin}.toTable

#[
ioTable["output"].write "Some text"
let data = ioTable["input"].readLine
echo data
]#

var roman = {'M': 1000, 'D': 500, 'C': 100, 'L': 50, 'X': 10, 'V': 5, 'I': 1}.toOrderedTable

for r in roman.pairs:
  echo r


