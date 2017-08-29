alternate :: a -> [a] -> [[a]]
alternate y [] = [[y]]
alternate y (x:xs) = (y:x:xs) : [x:zs | zs <- alternate y xs]

permutations :: [a] -> [[a]]
permutations [] = [[]]
permutations (x:xs) = concat [alternate x ys | ys <- permutations xs]

subjoints :: [a] -> [[a]]
subjoints [] = [[]]
subjoints (x:xs) = [(x:zs) |zs <- sub] ++ sub where sub = subjoints xs

editDistance :: Eq a => [a] -> [a] -> Int
editDistance s [] = length s
editDistance [] t = length t
editDistance (s:ss) (t:ts) = minimum [ (if s == t then 0 else 1) + editDistance ss ts,
                                       1 + editDistance ss (t:ts),
                                       1 + editDistance (s:ss) ts ]


