{-# LANGUAGE DataKinds #-}
module Unlifted where

import GHC.Types (Levity (Unlifted))

type Lev = Unlifted
