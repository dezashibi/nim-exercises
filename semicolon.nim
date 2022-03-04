# computes fac(4) at compile time:
const fac4 = (var x = 1; for i in 1..4: x *= i; x)

echo fac4
#[
With parenthesis and semicolons (;) you can use statements where only an expression is allowed
#]#
