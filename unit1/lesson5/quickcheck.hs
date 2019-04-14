ifEven f x = if even x
             then f x
             else x
genIfXEven x = (\f -> ifEven f x)

getRequestURL host apiKey resource id = host ++ "/" ++ resource ++ "/" ++ id ++ "?token=" ++ apiKey 

genHostRequestBuilder host = (\apiKey resource id -> getRequestURL host apiKey resource id)
exampleUrlBuilder = genHostRequestBuilder "http://example.com"

genAPIRequestBuilder hostBuilder apiKey = (\resource id -> hostBuilder apiKey resource id)
myExampleUrlBuilder = genAPIRequestBuilder exampleUrlBuilder "1337h4sk3ll"

genAPIRequestBuilder2 hostBuilder apiKey resource = (\id -> hostBuilder apiKey resource id)
myExampleBookUrlBuilder = genAPIRequestBuilder2 exampleUrlBuilder "1337h4sk3ll" "book"

myExampleBookUrlBuilder2 = getRequestURL "http://example.com" "1337h4sk3ll" "book"

flipBinaryArgs binaryFunction = (\x y -> binaryFunction y x)
subtract2 = flipBinaryArgs (-) 2


--Q5.1
ifEvenInc = ifEven (\x -> x + 1)
ifEvenDouble = ifEven (\x -> x * 2)
ifEvenSquare = ifEven (\x -> x^2)

--Q5.2
binaryPartialApplication binaryFunction x = (\y -> binaryFunction x y)
