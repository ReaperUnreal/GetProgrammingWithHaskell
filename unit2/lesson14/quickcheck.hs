--QC14.4
--data SixSidedDie = S1 | S2 | S3 | S4 | S5 | S6 deriving (Eq, Ord)

--QC14.1
--instance Show SixSidedDie where
--  show S1 = "I"
--  show S2 = "II"
--  show S3 = "III"
--  show S4 = "IV"
--  show S5 = "V"
--  show S6 = "VI"

--QC14.2
--The minimum complete definition is just properFraction :: Integral b => a -> (b, a)

--QC14.3
--  compare S4 S4 = EQ
--  compare S4 _ = GT
--  compare _ S4 = LT

--Q14.1
--This question makes no sense.

--Q14.2
class (Enum a, Show a) => Die a where
  addDie :: a -> a -> a

data FiveSidedDie = S1 | S2 | S3 | S4 | S5 deriving (Enum)

instance Show FiveSidedDie where
  show S1 = "1"
  show S2 = "2"
  show S3 = "3"
  show S4 = "4"
  show S5 = "5"

instance Die FiveSidedDie where
  addDie S1 S1 = S2
  addDie S1 S2 = S3
  addDie S1 S3 = S4
  addDie S2 S1 = S3
  addDie S2 S2 = S4
  addDie S2 S3 = S4
  addDie S3 S1 = S4
  addDie _ _ = S5
