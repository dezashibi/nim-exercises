import re, strutils
import parseutils

let pattern = re"([^\s]+)\s([^\s]+)\s(\d+)\s(\d+)"

echo("REGEX EXAMPLE")
var line = "en Nim_(programming_language) 1 70231"
var matches: array[4, string]
let start = find(line, pattern, matches)
doAssert start == 0
doAssert matches[0] == "en"
doassert matches[1] == "Nim_(programming_language)"
doAssert matches[2] == "1"
doAssert matches[3] == "70231"
echo(matches)
echo("Parsed successfully!")

echo("SPLIT EXAMPLE")
var matches2 = line.split()
doAssert matches2[0] == "en"
doassert matches2[1] == "Nim_(programming_language)"
doAssert matches2[2] == "1"
doAssert matches2[3] == "70231"
echo(matches2)
echo("Parsed successfully!")

echo("PARSEUTILS EXAMPLE")
var i = 0
var domainCode = ""
i.inc parseUntil(line, domainCode, {' '}, i)
i.inc
var pageTitle = ""
i.inc parseUntil(line, pageTitle, {' '}, i)
i.inc
var countViews = 0
i.inc parseInt(line, countViews, i)
i.inc
var totalSize = 0
i.inc parseInt(line, totalSize, i)
doAssert domainCode == "en"
doAssert pageTitle == "Nim_(programming_language)"
doAssert countViews == 1
doAssert totalSize == 70231
echo(domainCode)
echo(pageTitle)
echo(countViews)
echo(totalSize)
echo("Parsed successfully!")
