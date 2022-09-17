module Custom.Prelude
  ( module Prelude
  , module Data.Maybe
  , module Data.Either
  , module Debug
  , pass
  , unwords
  , unlines
  , (|>)
  , (<|)
  ) where

import Prelude

import Data.Either (Either(..), either, hush, note)
import Data.Function as Function
import Data.Maybe (Maybe(..), fromMaybe, maybe)
import Data.String as String
import Debug
  ( class DebugWarning
  , spy
  , spyWith
  , trace
  , traceM
  , traceTime
  )

pass ∷ ∀ f. Applicative f ⇒ f Unit
pass = pure unit

unwords ∷ Array String → String
unwords = String.joinWith " "

unlines ∷ Array String → String
unlines = String.joinWith "\n"

infixr 0 Function.apply as <|

infixl 1 Function.applyFlipped as |>
