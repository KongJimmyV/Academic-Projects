{- 
Module        :  haskell.hs
Description   :  Haskell Functions
Project Name  :  hw4 (Haskell Functions)
Class         :  CS421 (Spring)
Date Modified :  4/17/2022 
Author        :  Kong Jimmy Vang
-}

{- Partitions a given list xs into lists of length n 
and returns these partitions as a list.
If n is non-positive, it is treated as the value 1.
-}
partition :: [a] -> Int -> [[a]]
partition [] _ = []
partition xs n = 
    if n > 0 then take n xs : partition (drop n xs) n
    else take 1 xs : partition (drop 1 xs) 1

{- Takes a value x and a list of items having the same type as x.
Returns the number of times x occurs in xs.
-}
count :: (Eq a) => a -> [a] -> Int
count _ [] = 0
count x (y:xs) = if x == y then 1 + count x xs else count x xs

{- Takes a value x and a list of items having the same type as x.
Removes all occurrences of x from xs and returns the resulting list.
-}
removeAll :: (Eq a) => a -> [a] -> [a]
removeAll x xs = [y | y <- xs, x /= y]

{- [Helper Method for counts]
Returns the length of a given list.
-}
myLength :: [a] -> Int
myLength xs = foldr (\x -> (+) 1) 0 xs

{- Takes a list of items xs and generates a counting of the elements in xs. 
The returned object is a list of tuples. 
Each element of the returned object is a tuple of length two containing an 
element x of xs and an integer denoting the number of occurrences of x in xs. 
The order of the elements in the computed list is not specified.
-}
counts :: (Eq a) => [a] -> [(a,Int)]
counts [] = []
counts (x:xs) = (x, 1 + myLength (filter (x ==) xs)) : counts (filter (x /=) xs)
