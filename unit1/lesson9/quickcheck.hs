import Data.Char

--QC9.1
remove _ [] = []
remove test (x:xs) = if test x
                     then remove test xs
                     else x:remove test xs
remove2 test = filter (not . test)

--QC9.2
myProduct xs = foldl (*) 1 xs

--Q9.1
myElem x xs = (>0) $ length $ filter (==x) xs

--Q9.2
isPalindrome str = simpleStr == reverse simpleStr
  where simpleStr = map toUpper $ filter isAlpha str

--Q9.3
harmonic n = foldl (+) 0 $ map (1/) [1..n]
