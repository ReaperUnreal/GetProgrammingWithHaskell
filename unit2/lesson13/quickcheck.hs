--QC13.1
--aList :: [[Char]]
aList = ["cat", "dog", "mouse"]

--QC13.2
--Because / isn't defined for all things that implement Num.


class Describable a where
  describe :: a -> String

data Icecream = Chocolate | Vanilla deriving (Show, Eq, Ord)

isVanillaBest = Vanilla > Chocolate
isChocolateBest = Chocolate > Vanilla

--Q13.1
--There doesn't seem to be any real difference between Word and Int. My guess is that Word is specifically the machine word size whereas Int is a minimum 32-bit integer.

--Q13.2
inc :: Int -> Int
inc x = x + 1
-- succ will throw an error when trying to go over a bound but inc will loop around to negative

--Q13.3
cycleSucc :: (Bounded a, Enum a, Eq a) => a -> a
cycleSucc x = if x == maxBound
              then minBound
              else succ x
