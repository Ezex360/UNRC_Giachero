alternate :: [[a]] -> a -> [[a]]
alternate [] x = [[x]]
alternate [[x]] y = [y:[x]]
alternate (x:xs) y = [y:x] ++ alternate xs y

binaryK :: Int -> [[Int]]
binaryK 0 = [[]]
binaryK 1 = [[0],[1]]
binaryK n = alternate (binaryK (n-1)) 1 ++ alternate (binaryK (n-1)) 0

allBinaryK :: Int -> [[Int]]
allBinaryK 0 = [[]]
allBinaryK n = binaryK n ++ allBinaryK (n-1)

subs :: [a] -> [[a]]
subs [] = [[]]
subs (x:xs) = [x:ys | ys <- aux] ++ aux
				where aux = subs xs

eqListas :: (Eq a) => [a] -> [a] -> Bool
eqListas [] [] = True
eqListas [] ys = False
eqListas xs [] = False
eqListas (x:xs) (y:ys) | x == y = True && eqListas xs ys
					   | x /= y = False

eliminarRep :: Eq a => [[a]] -> [[a]]
eliminarRep [] = [[]]
eliminarRep [x] = [x]
eliminarRep (x:xs) | aux == True = eliminarRep xs
				   | aux == False = x: eliminarRep xs
					where aux = or (map (eqListas x) xs)

interleve :: [a] -> a -> [[a]]
interleve [] x  = [[x]]
interleve (x:xs) y = (y:x:xs) : [x:zs | zs <- interleve xs y]

permutations :: [a] -> [[a]]
permutations [] = [[]]
permutations (x:xs) = concat [interleve ys x | ys <- permutations xs]

merge :: (Ord a) => [a] -> [a] -> [a]
merge [] [] = []
merge [] ys = ys
merge xs [] = xs
merge (x:xs) (y:ys) | x <= y = x: merge (xs) (y:ys)
		    		| otherwise = y: merge (x:xs) (ys)

mergeSort :: (Ord a) => [a] -> [a]
mergeSort [] = []
mergeSort [x] = [x]
mergeSort xs = merge (mergeSort prim) (mergeSort sec)
		where prim = take (div (length xs) 2) xs
		      sec = drop (div (length xs) 2) xs

