# Custom Purescript Prelude

Exported by default:

- `Data.Maybe`
- `Data.Either`
- `Debug`

Additionally exported:

- `(<|)` == `apply`
- `(|>)` == `applyFlipped`
- `pass` == `pure unit`
- `unwords ∷ Array String → String`
- `unlines ∷ Array String → String`
- `guarded ∷ ∀ a f. Alternative f ⇒ (a → Boolean) → a → f a`
