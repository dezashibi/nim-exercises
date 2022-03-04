if 10 > 0:
  var a = 1
elif 0 == 0:
  var b = 0
else:
  var c = 10

# those variables won't be available outside of scopes of their blocks

when 10 > 0:
  var a = 20

echo a
# in here using when the variables will be available
