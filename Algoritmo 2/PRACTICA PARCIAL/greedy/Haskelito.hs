-- Ejercicio 2
darCambio :: Int -> [(Int,Int)] -> [Int]
darCambio 0 xs = []
darCambio c [] = []
darCambio c ((x,y):xs) | x > 0 && c >= y = y : darCambio (c-y) ( ((x-1),y) :xs)
		       | otherwise = darCambio c xs

