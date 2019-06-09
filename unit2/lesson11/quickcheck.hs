x :: Int
x = 2

y :: Integer
y = 2

--QC11.1
halve :: Int->Int
halve x = div x 2

--QC11.2
printDouble :: Int -> String
printDouble x = show (x * 2)

--QC11.3
--Int->String->String->(Int,String,String)
--String->String->(Int,String,String)
--String->(Int,String,String)
--(Int,String,String)

--QC11.4
--Because we may want to map to a different type than the one in the original array, like the 'show' function.

--Q11.1
--filter :: (a -> Bool) -> [a] -> [a]
--map :: (a -> b) -> [a] -> [b]
--The main different is that the resultant array is of the original type and not the mapped-to type.

--Q11.2
-- head :: [a] -> a
-- Because head does not return a list type it can't return an empty list unless 'a' is an array type.

--Q11.3
myFoldl :: (b->a->b)->b->[a]->b
myFoldl f init [] = init
myFoldl f init (x:xs) = myFoldl f newInit xs
  where newInit = f init x
