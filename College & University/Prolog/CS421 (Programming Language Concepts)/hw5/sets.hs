{- 
Module        :  sets.hs
Description   :  A Set Data Type in Haskell
Project Name  :  hw5
Class         :  CS421 (Spring)
Date Modified :  5/7/2022
Author        :  Kong Jimmy Vang
-}

{- A Set that is of polymorphic type a. 
It is described by a predicate function which determines if an element occurs in the set. -}
type Set a = (a -> Bool)

{- Returns a new Set of type a. -}
newSet :: (a -> Bool) -> Set a
newSet set = set

{- This function takes a characteristic function f and returns a set such that 
each value x (of appropriate type) is in the set only when f(x) is True. -}
predicateToSet :: (a -> Bool) -> (Set a)
predicateToSet = newSet

{- This function takes two sets, with characteristic functions f and g, and 
returns a set such that each value x (of appropriate type) is in the set 
only when f(x) or g(x) is True. -}
setUnion :: Set a -> Set a -> Set a
setUnion set1 set2 = newSet (\x -> set1 x || set2 x)

{- This function takes two sets, with characteristic functions f and g, and 
returns a set such that each value x (of appropriate type) is in the set 
just when both f(x) and g(x) are true. -}
setIntersection :: Set a -> Set a -> Set a
setIntersection set1 set2 = newSet (\x -> set1 x && set2 x)

{- This function tells whether the second argument is a member of the first argument. -}
setIsMember :: Set a -> a -> Bool
setIsMember set x = set x

{- This function returns a set that contains everything (of the appropriate type) 
not in the original set. -}
setComplement :: Set a -> Set a
setComplement set = newSet (\x -> not (set x))
