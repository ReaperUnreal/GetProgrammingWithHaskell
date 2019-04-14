doublePlusTwo x = doubleX + 2
    where doubleX = 2 * x


--Q2.1 Because only an if would imply that you can not return a value which is illegal.
--Q2.2

inc x = x + 1
double x = x * 2
square x = x * x

--Q2.3
weirdFunc n = if even n
              then n - 2
              else 3 * n + 1
