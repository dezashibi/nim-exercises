import strformat, strutils, macros

template check*(exp: untyped, failureMsg: string = "failed", indent: uint = 0): void =
  let indentationStr = repeat(' ', indent)
  let expStr: string = astToStr(exp)
  var msg: string
  if not exp:
    if msg.isEmptyOrWhitespace():
      msg = indentationStr & expStr & " .. " & failureMsg
  else:
    msg = indentationStr & expStr & " .. passed"

  echo(msg)


# template suite*(exprs: untyped): void =
#   for i in 0..< exprs.len:
#     echo("expr: " & exprs[i])

macro suite*(name: string, exprs: untyped): typed =
  var output = newStmtList()
  let equline = newCall("repeat", newStrLitNode("="), newIntLitNode(50))
  let writeEquline = newCall("echo", equline)
  add(output, writeEquline, newCall("echo", name))
  add(output, writeEquline)

  for i in 0..<exprs.len:
    var exp = exprs[i]
    let expKind = exp.kind
    case expKind
    of nnkCall:
      case exp[0].kind
      of nnkIdent:
        let identName = $exp[0].ident
        if identName == "check":
          var checkWithIndent = exp
          checkWithIndent.add(newStrLitNode(""))
          checkWithIndent.add(newIntLitNode(1))
          add(output, checkWithIndent)
      else:
        add(output, exp)
    else:
      discard

  return output

when isMainModule:
  check(3==1+2)
  check(3+2==5)

  suite "Arith":
    check(1+2==3)
    check(3+2==5)

  suite "Strs":
    check("HELLO".toLowerAscii() == "hello")
    check("".isEmptyOrWhitespace() == true)

