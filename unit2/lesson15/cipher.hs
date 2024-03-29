data FourLetterAlphabet = L1 | L2 | L3 | L4 deriving (Show, Enum, Bounded)

rotN :: (Bounded a, Enum a) => Int -> a -> a
rotN n c = toEnum rotation
  where halfAlphabet = n `div` 2
        offset = fromEnum c + halfAlphabet
        rotation = offset `mod` n

largestCharNumber :: Int
largestCharNumber = fromEnum (maxBound :: Char)

rotChar :: Char -> Char
rotChar charToEncrypt = rotN sizeOfAlphabet charToEncrypt
  where sizeOfAlphabet = 1 + fromEnum (maxBound :: Char)

message ::[FourLetterAlphabet]
message = [L1,L3,L4,L1,L1,L2]

fourLetterEncoder :: [FourLetterAlphabet] -> [FourLetterAlphabet]
fourLetterEncoder vals = map rot4l vals
  where alphaSize = 1 + fromEnum (maxBound :: FourLetterAlphabet)
        rot4l = rotN alphaSize

rotNdecoder :: (Bounded a, Enum a) => Int -> a -> a
rotNdecoder n c = toEnum rotation
  where halfN = n `div` 2
        offset = if even n
                 then fromEnum c + halfN
                 else 1 + fromEnum c + halfN
        rotation = offset `mod` n

rotEncoder :: String -> String
rotEncoder text = map rotChar text
  where alphaSize = 1 + fromEnum (maxBound :: Char)
        rotChar = rotN alphaSize

rotDecoder :: String -> String
rotDecoder text = map rotCharDecoder text
  where alphaSize = 1 + fromEnum (maxBound :: Char)
        rotCharDecoder = rotNdecoder alphaSize





xorBool :: Bool -> Bool -> Bool
xorBool a b = (a || b) && (not (a && b))

xorPair :: (Bool, Bool) -> Bool
xorPair (a,b) = xorBool a b

xor :: [Bool] -> [Bool] -> [Bool]
xor list1 list2 = map xorPair (zip list1 list2)

type Bits = [Bool]

intToBits' :: Int -> Bits
intToBits' 0 = [False]
intToBits' 1 = [True]
intToBits' n = if (remainder == 0)
               then False : intToBits' nextVal
               else True : intToBits' nextVal
  where remainder = n `mod` 2
        nextVal = n `div` 2

maxBits :: Int
maxBits = length (intToBits' maxBound)

intToBits :: Int -> Bits
intToBits n = leadingFalses ++ reversedBits
  where reversedBits = reverse $ intToBits' n
        missingBits = maxBits - (length reversedBits)
        leadingFalses = take missingBits (cycle [False])

charToBits :: Char -> Bits
charToBits c = intToBits $ fromEnum c

bitsToInt :: Bits -> Int
bitsToInt bits = sum (map (\x -> 2^(snd x)) trueLocations)
  where size = length bits
        indices = [size-1, size-2 .. 0]
        trueLocations = filter (\x -> fst x == True) (zip bits indices)

bitsToChar :: Bits -> Char
bitsToChar b = toEnum $ bitsToInt b

myPad :: String
myPad = "Shhhhhhhhhhhhhh"

myPlainText :: String
myPlainText = "Haskell"

applyOTP' :: String -> String -> [Bits]
applyOTP' pad plaintext = map (\pair -> xor (fst pair) (snd pair)) (zip padBits plaintextBits)
  where padBits = map charToBits pad
        plaintextBits = map charToBits plaintext

applyOTP :: String -> String -> String
applyOTP pad plaintext = map bitsToChar bitList
  where bitList = applyOTP' pad plaintext

encoderDecoder :: String -> String
encoderDecoder = applyOTP myPad




class Cipher a where
  encode :: a -> String -> String
  decode :: a -> String -> String

data Rot = Rot

instance Cipher Rot where
  encode Rot text = rotEncoder text
  decode Rot text = rotDecoder text

data OneTimePad = OTP String

instance Cipher OneTimePad where
  encode (OTP pad) text = applyOTP pad text
  decode (OTP pad) text = applyOTP pad text

myOTP :: OneTimePad
myOTP = OTP (cycle [minBound .. maxBound])

prng :: Int -> Int -> Int -> Int -> Int
prng a b maxNumber seed = (a * seed + b) `mod` maxNumber

examplePRNG :: Int -> Int
examplePRNG = prng 1337 7 100

data StreamPad = Stream (Int -> Int)

myStream :: StreamPad
myStream = Stream examplePRNG

createPRNGList' :: (Int -> Int) -> Int -> Int -> [Int]
createPRNGList' _ 0 _ = []
createPRNGList' prng n prev = nextVal:(createPRNGList' prng (n - 1) nextVal)
  where nextVal = prng prev

createPRNGList :: (Int -> Int) -> Int -> [Int]
createPRNGList prng n = createPRNGList' prng n 0

createInfinitePRNG :: (Int -> Int) -> [Int]
createInfinitePRNG prng = iterate prng 0

createStreamOTP :: (Int -> Int) -> Int -> String
createStreamOTP prng n = map toEnum $ createPRNGList prng n

createInfiniteStreamOTP :: (Int -> Int) -> String
createInfiniteStreamOTP prng = map toEnum $ createInfinitePRNG prng

instance Cipher StreamPad where
  encode (Stream prng) text = applyOTP (createInfiniteStreamOTP prng) text
  decode (Stream prng) text = applyOTP (createInfiniteStreamOTP prng) text
