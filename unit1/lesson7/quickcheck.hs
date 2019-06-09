--QC7.1
-- Washing hands
-- 1. If hands are clean then dry hands.
-- 2. Wet hands.
-- 3. Soap hands.
-- 4. Rinse hands.

myGCD a b = if remainder == 0
            then b
            else myGCD b remainder
  where remainder = a `mod` b

myHead (x:xs) = x
myHead [] = error "No head for empty list"

--Q7.1
myTail (_:xs) = xs
myTail [] = error "No tail for empty list"

--Q7.2
myGCD2 a 0 = a
myGCD2 a b = myGCD2 b $ mod a b
