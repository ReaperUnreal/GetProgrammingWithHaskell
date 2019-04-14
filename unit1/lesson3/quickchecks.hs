doubleDoubleOld x = dubs * 2
    where dubs = x * 2

doubleDouble x = (\doubled -> doubled * 2) (x * 2)

overwriteOld x = let x = 2
               in
                let x = 3
                in
                 let x = 4
                 in
                  x

overwrite x = (\x ->
             (\x ->
              (\x -> x) 4
             ) 3
            ) 2


--Q3.1
sumSquareOrSquareSum x y = (\x y ->
                            (\first second -> if first > second
                                              then first
                                              else second) (x^2 + y^2) ((x+y)^2)
                           ) x y

--Q3.2
counter x = (\x ->
                (\x -> x) (x + 1)
            ) (x + 1)

counterBad x = let x = x + 1
               in 
                let x = x + 1
                in
                 x
