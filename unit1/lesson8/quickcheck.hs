myTake 0 _ = []
myTake _ [] = []
myTake n (x:xs) = x:remainder
  where remainder = myTake (n - 1) xs

myDrop 0 xs = xs
myDrop _ [] = []
myDrop n (x:xs) = myDrop (n - 1) xs

--QC8.1
myLength [] = 0
myLength (x:xs) = 1 + myLength xs

myCycle (x:xs) = x:myCycle (xs++[x])

ackermann 0 n = n + 1
ackermann m 0 = ackermann (m-1) 1
ackermann m n = ackermann (m-1) (ackermann m (n-1))

collatz 1 = 1
collatz n = if even n
            then 1 + collatz (div n 2)
            else 1 + collatz (n * 3 + 1)

--Q8.1
myReverse [] = []
myReverse (x:xs) = (reverse xs) ++ [x]

--Q8.2
fib 0 = 0
fib 1 = 1
fib n = fib (n-1) + fib (n-2)

fastFib n1 _ 0 = n1
fastFib _ n2 1 = n2
fastFib n1 n2 counter = fastFib n2 (n1 + n2) (counter - 1)
