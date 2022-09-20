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
  , mapmap
  , (<<$>>)
  , mapmapFlipped
  , (<<#>>)
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

mapmap ∷ ∀ f g a b. Functor f ⇒ Functor g ⇒ (a → b) → f (g a) → f (g b)
mapmap = map <<< map

infixl 4 mapmap as <<$>>

mapmapFlipped ∷ ∀ f g a b. Functor f ⇒ Functor g ⇒ f (g a) → (a → b) → f (g b)
mapmapFlipped = flip mapmap

infixl 1 mapmapFlipped as <<#>>
