import Data.List

data Tree a = Leaf
             | Node a (Tree a) (Tree a)
             deriving (Show, Eq)

singleton :: a -> Tree a
singleton x = Node x Leaf Leaf

treeInsert :: (Ord a) => a -> Tree a -> Tree a
treeInsert x Leaf = singleton x
treeInsert x (Node a left right)
    | x == a = Node x left right
    | x < a  = Node a (treeInsert x left) right
    | x > a  = Node a left (treeInsert x right)

type Bit = Int

bin2int :: [Bit] -> Int
bin2int =  foldr (\x y -> x + 2*y) 0

int2bin :: Int -> [Bit]
int2bin n | n < 2     = [n]
          | otherwise = n `mod` 2 : int2bin (n `div` 2)




