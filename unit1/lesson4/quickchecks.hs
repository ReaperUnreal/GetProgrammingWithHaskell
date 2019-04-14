import Data.List

ifEven myFunction n = if even n
                      then myFunction n
                      else n

inc n = n + 1
double n = n * 2
square n = n * n

ifEvenInc n = ifEven inc n
ifEvenDouble n = ifEven double n
ifEvenSquare n = ifEven square n
ifEvenCube n = ifEven (\x -> x * x * x) n

names = [("Ian", "Curtis"),
         ("Bernard", "Sumner"),
         ("Peter", "Hook"),
         ("Stephen", "Morris"),
         ("John", "Hook")]

compareFirstNames name1 name2 = if firstName1 > firstName2
                               then GT
                               else if firstName1 < firstName2
                                    then LT
                                    else EQ
    where firstName1 = fst name1
          firstName2 = fst name2

compareLastNames name1 name2 = if lastName1 > lastName2
                               then GT
                               else if lastName1 < lastName2
                                    then LT
                                    else compareFirstNames name1 name2
    where lastName1 = snd name1
          lastName2 = snd name2


--Q4.1
compareLastNames2 name1 name2 = if compareResult == EQ
                                then compare firstName1 firstName2
                                else compareResult
    where firstName1 = fst name1
          firstName2 = fst name2
          lastName1 = snd name1
          lastName2 = snd name2
          compareResult = compare lastName1 lastName2


--Q4.2
sfOffice name = if lastName < "L"
                then nameText
                     ++ " - PO Box 1234 - San Francisco, CA, 94111"
                else nameText
                     ++ " - PO Box 1010 - San Francisco, CA, 94109"
    where lastName = snd name
          nameText = (fst name) ++ " " ++ (snd name)

nyOffice name = nameText ++ ": PO Box 789 - New York, NY, 10013"
    where nameText = (fst name) ++ " " ++ (snd name)

renoOffice name = nameText ++ " - PO Box 456 - Reno, NV, 89523"
    where nameText = snd name

dcOffice name = nameText ++ " - PO Box 1600 - Washington, DC, 20500"
    where nameText = (fst name) ++ " " ++ (snd name) ++ " Esq."

getLocationFunction location = case location of
    "ny" -> nyOffice
    "sf" -> sfOffice
    "reno" -> renoOffice
    "dc" -> dcOffice
    _ -> (\name -> (fst name) ++ " " ++ (snd name))

addressLetter name location = locationFunction name
    where locationFunction = getLocationFunction location
