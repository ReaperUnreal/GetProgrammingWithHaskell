type FirstName = String
type LastName = String
type MiddleName = String
data Name = Name FirstName LastName
          | NameWithMiddle FirstName MiddleName LastName
showName :: Name -> String
showName (Name f l) = f ++ " " ++ l
showName (NameWithMiddle f m l ) = f ++ " " ++ m ++ " " ++ l

type Age = Int
type Height = Int
type Weight = Int
type PatientName = (String,String)

firstName :: PatientName -> String
firstName patient = fst patient

lastName :: PatientName -> String
lastName patient = snd patient

data Sex = Male | Female

sexInitial :: Sex -> Char
sexInitial Male = 'M'
sexInitial Female = 'F'

showSex :: Sex -> String
showSex Male = "Male"
showSex Female = "Female"

data RhType = Pos | Neg
showRh :: RhType -> String
showRh Pos = "+"
showRh Neg = "-"
data ABOType = A | B | AB | O
showABO :: ABOType -> String
showABO A = "A"
showABO B = "B"
showABO AB = "AB"
showABO O = "O"
data BloodType = BloodType ABOType RhType
showBloodType :: BloodType -> String
showBloodType (BloodType abo rh) = showABO abo ++ showRh rh

data Patient = Patient Name Sex Age Height Weight BloodType

johnDoe :: Patient
johnDoe = Patient (Name "John" "Doe") Male 30 74 200 (BloodType AB Pos)

--QC12.1
patientInfoV2 :: PatientName -> Age -> Height -> String
patientInfoV2 (fname,lname) age height = name ++ " " ++ ageHeight
  where name = lname ++ ", " ++ fname
        ageHeight = "(" ++ show age ++ "yrs. " ++ show height ++ "in.)"

--QC12.2
jes :: Patient
jes = Patient (NameWithMiddle "Jane" "Elizabeth" "Smith") Female 28 70 170 (BloodType O Neg)

data Patient2 = Patient2 {
  name :: Name,
  sex :: Sex,
  age :: Int,
  height :: Int,
  weight :: Int,
  bloodType :: BloodType
}

jackieSmith :: Patient2
jackieSmith = Patient2 {
  name = Name "Jackie" "Smith",
  age = 43,
  sex = Female,
  height = 62,
  weight = 115,
  bloodType = BloodType O Neg
}

jackieUpdated = jackieSmith { age = 44 }

--QC12.3
jackieName = showName $ name jackieSmith


--Q12.1
canDonateBT :: BloodType -> BloodType -> Bool
canDonateBT (BloodType O _) _ = True
canDonateBT _ (BloodType AB _) = True
canDonateBT (BloodType A _) (BloodType A _) = True
canDonateBT (BloodType B _) (BloodType B _) = True
canDonateBT _ _ = False

canDonateTo2 :: Patient2 -> Patient2 -> Bool
canDonateTo2 p1 p2 = canDonateBT (bloodType p1) (bloodType p2)

canDonateTo :: Patient -> Patient -> Bool
canDonateTo (Patient _ _ _ _ _ bt1) (Patient _ _ _ _ _ bt2) = canDonateBT bt1 bt2

--Q12.2
patientSummary :: Patient2 -> String
patientSummary patient = "****************\nPatient Name: " ++ showName (name patient) ++ "\nSex: " ++ showSex (sex patient) ++ "\nAge: " ++ show (age patient) ++ "Height: " ++ show (height patient) ++ " in.\nWeight: " ++ show (weight patient) ++ " lbs.\nBlood Type: " ++ showBloodType (bloodType patient) ++ "\n****************\n"
