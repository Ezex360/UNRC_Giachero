-- Trabajo practico N1 - AlgoritmosII - Ejercicio 1
-- Integrantes
-- Alvarez Nestor     38731561
-- Gardiola Joaquin   38418091
-- Giachero Ezequiel  39737931

import Data.Maybe

--Definicion de automata finito deterministico
type DFA st = ([st], [Char], (st,Char)->st, st, st->Bool)
type Custom st = ((st, [((st,Char),st)]), [st])
data MaybeCustom st = NotFounded | Automata (Custom st) deriving (Show,Eq)

-- Metodo principal
-- Dada una cota superior de estados, un alfa beto y un conjunto de cadenas que 
-- el automata deberia reconocer y otro que no, muestra el minimo automata que cumpla estos
-- requisitos en caso de que exista
mein :: Int -> [Char] -> [String] -> [String] -> String
mein k sigma pos neg = meinAux 0 (k-1) sigma pos neg

-- Funcion auxiliar del metodo mein
meinAux :: Int -> Int -> [Char] -> [String] -> [String] -> String
meinAux n k sigma pos neg | k < 0 = error "La cantidad de estados debe ser positiva"
                          | n > k = "No se encontro un automata con esas caracteristicas"
                          | principal [0..n] sigma pos neg == NotFounded = meinAux (n+1) k sigma pos neg
                          | otherwise = show(principal [0..n] sigma pos neg)

-- A partir de un alfabeto, un conjunto de estados, y cadenas que el automata deberia reconocer
-- y que no, devuelve el Custom que lo cumple o NotFound en caso de no hacerlo.             
principal :: Eq st => [st] -> [Char] -> [String] -> [String] -> MaybeCustom st
principal qs sigma pos neg = findCustom (dfaCustom qs (generate sigma qs)) (allDfa qs sigma) pos neg

-- Devuelve la posicion del primer DFA que reconoce pos y no neg
firstDfa :: Eq st => Int -> [DFA st] -> [String] -> [String] -> Int
firstDfa n [] pos neg = -1
firstDfa n (x:xs) pos neg | checkDFA x pos neg = n
                          | otherwise = firstDfa (n+1) xs pos neg

-- Encuentra el custom equivalente al DFA que cumple con todos los requisitos
-- Si no lo encuentra devulve NotFounded
findCustom ::  Eq st => [Custom st] -> [DFA st] -> [String] -> [String] -> MaybeCustom st
findCustom xs ys pos neg | (firstDfa (0) ys pos neg) /= (-1) = Automata (xs!!(firstDfa (0) ys pos neg))
                  | otherwise = NotFounded

-- Comprueba si un DFA reconoce todas las cadenas pos y no las cadenas neg
checkDFA :: DFA st -> [String] -> [String] -> Bool
checkDFA auto pos neg = and (map (evalDFA auto) pos) && 
                        not(or (map (evalDFA auto) neg))

-- Evalua un DFA
evalDFA :: DFA st -> String -> Bool
evalDFA (qs, sigma, delta, s, inF) w = 
  inF (deltaStar s w) 
  where deltaStar q [] = q
        deltaStar q (a:w) = deltaStar (delta (q,a)) w

-- Genera una lista de transiciones completa y funcional
generate :: Eq st => [Char] -> [st] -> [[((st,Char),st)]]
generate sigma qs = eliminarRep 
                    (filter (\s -> (length qs * length sigma) == (length s))
                    (filter (isFunction) (generateAll sigma qs)))
                    
-- Dada una lista de estados y un alfabeto Genera todos los DFAs posibles
allDfa :: Eq st => [st] -> [Char] -> [DFA st]
allDfa qs sigma = map (dfaFromA qs sigma) (dfaCustom qs (generate sigma qs))

-- Genera un Custom a partir de una lista de transiciones
dfaCustom :: Eq st => [st] -> [[((st,Char),st)]] -> [Custom st]
dfaCustom [] _ = error "No hay estados"
dfaCustom [x] ys = [((x, y),[x]) | y <- ys]  
dfaCustom (x:xs) ys = [((x, y),z) | y <- ys, z <- subjoints (x:xs), z /= []] ++ dfaCustom xs ys  

-- Genera un DFA a partir de un Custom
dfaFromA :: Eq st => [st] -> [Char] -> Custom st -> DFA st
dfaFromA qs sigma ((qi, trans), qfs) = (qs, sigma, (funFromTuples trans), qi, (`elem` qfs))

--Retorna a que estado debe realizarse la transicion a partir del estado actual y el valor.
funFromTuples :: (Eq a) => [(a,b)] -> a -> b
funFromTuples ts x = fromJust (lookup x ts) 

--Genera todos los posibles subconjuntos de las transiciones
generateAll :: [Char] -> [st] -> [[((st,Char),st)]] 
generateAll sigma qs = subjoints (generateTrans sigma qs)

--Genera todas las transiciones hasta el estado K
generateTrans :: [Char] -> [st] -> [((st,Char),st)] 
generateTrans sigma qs = [((qs0,v),qs1) | qs0 <- qs, qs1 <- qs, v <- sigma]

--OTRAS FUNCIONES
--Elimina repetidos en una Lista de Listas
eliminarRep :: Eq a => [a] -> [a]
eliminarRep [] = []
eliminarRep [x] = [x]
eliminarRep (x:xs) | elem x xs = eliminarRep xs
                   | otherwise = x: eliminarRep xs

--Crea todos los subconjuntos
subjoints :: [a] -> [[a]]
subjoints [] = [[]]
subjoints (x:xs) = [x:ys | ys <- aux] ++ aux
        where aux = subjoints xs

-- Comprueba si una relacion es una funcion
isFunction :: (Eq a,Eq b) => [(a,b)] -> Bool
isFunction [] = False
isFunction [x] = True
isFunction (x:xs) = isFunctionAux (x:xs) && isFunction xs

-- Comprueba si el primer elemento es una funcion respecto a los demas
isFunctionAux :: (Eq a,Eq b) => [(a,b)] -> Bool
isFunctionAux [] = False
isFunctionAux [x] = True
isFunctionAux ((a,b):(x,y):xs) | a == x && b /=y = False
                               | otherwise = isFunctionAux ((a,b):xs)                              
