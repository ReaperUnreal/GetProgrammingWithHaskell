simple x = x
longList = [1..]
stillLongList = simple longList

backwardsInfinity = reverse [1..]

paExample1 = (!!) "dog"
paExample2 = ("dog" !!)
paExample3 = (!! 2)

--Q6.1
repeat2 n = cycle [n]

--Q6.2
subseq a b xs = take (b - a) $ drop a xs

--Q6.3
inFirstHalf x xs = elem x $ take halfLength xs
  where halfLength = div (length xs) 2
