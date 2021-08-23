{-# LANGUAGE UnliftedDatatypes, StandaloneDeriving #-}
module Main where

import qualified Map.Lifted   as L
import qualified Map.Unlifted as U
import GHC.Types

data ABL = AL | BL deriving Show

type ABU :: UnliftedType
data ABU = AU | BU

deriving instance Show a => Show (L.List a)

liftABList :: U.List ABU -> L.List ABL
liftABList U.Nil = L.Nil
liftABList (U.Cons AU xs) = L.Cons AL (liftABList xs)
liftABList (U.Cons BU xs) = L.Cons BL (liftABList xs)

main :: IO ()
main = do
  print (L.map (\AL -> BL) (L.Cons AL (L.Cons AL L.Nil)))
  print (liftABList (U.map (\BU -> AU) (U.Cons BU (U.Cons BU U.Nil))))
