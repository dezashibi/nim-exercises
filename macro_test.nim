import macros
# dumpTree:
#   var a = "Test"

macro `:=`(name, value: untyped): untyped =
  result = newVarStmt(name, value)
  echo result.repr

a := 0

echo a

macro choiceChecker(statement: untyped): untyped =
  var
    branches: seq[(NimNode, NimNode)] #Condition, Body
    elseBody: NimNode                 #Else code
  for cond in statement:
    #Based off the dumpTree, we know this is the else body.
    let ifBody = cond.findChild(it.kind == nnkStmtList)
    if cond.kind == nnkInfix:
      cond.del 3 #Removes Stmtlist
      branches.add((cond, ifBody))
    elif cond.kind == nnkCall and $cond[0] == "_":
      #Based off the dumpTree, we know this is the else body.
      elseBody = ifBody

  result = newIfStmt(branches) #Generates if stmt
  result.add newNimNode(nnkElse).add(elseBody) #Appends else body
  echo result.repr

dumpTree:
  choiceChecker:
    11 == 13: echo "Test"
    12 == 14: echo "Huh"
    _: echo "duh"

choiceChecker:
  11 == 13: echo "Test"
  12 == 14: echo "Huh"
  _: echo "duh"
