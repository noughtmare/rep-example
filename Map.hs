{-# LANGUAGE DataKinds, StandaloneKindSignatures, UnliftedDatatypes #-}
module Map where

import Prelude hiding (map)
import Lev
import GHC.Types

type List :: TYPE (BoxedRep Lev) -> TYPE (BoxedRep Lev)
data List a = Nil | Cons a (List a)

map :: (a -> b) -> List a -> List b
map _ Nil = Nil
map f (Cons x xs) = Cons (f x) (map f xs)
