#!/bin/sh

echo '================================================================================'
echo 'Type math expression like 2.84+1.02 and hit "Enter" or Ctrl+c to exit'
echo '----------------  Arifmetic functions  -----------------------------------------
 atan2(0,-1)   Return Pi number
 atan2(y, x)   Return the arctangent of y/x in radians.
 cos(expr)     Return the cosine of expr, which is in radians.
 exp(expr)     The exponential function.
 int(expr)     Truncate to integer.
 log(expr)     The natural logarithm function.
 rand()        Return a random number N, between zero and one, such that 0 ≤ N < 1.
 sin(expr)     Return the sine of expr, which is in radians.
 sqrt(expr)    Return the square root of expr.
 srand([expr]) Use  expr  as  the new seed for the random number generator.
               If no expr is provided, use the time of day.

To exit press Enter
--------------------------------------------------------------------------------'
while echo -n '=> '; do
  read mathExpression;
  case "$mathExpression" in
    '') echo ''; echo 'Bye...'; echo ''; exit ;;
     *) gawk 'BEGIN{print '"${mathExpression}"'}' ;;
  esac
done
