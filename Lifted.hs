{-# LANGUAGE DataKinds #-}
module Lifted where

import GHC.Types (Levity (Lifted))

type Lev = Lifted
