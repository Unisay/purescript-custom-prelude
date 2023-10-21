{ name = "purescript-custom-prelude"
, dependencies =
  [ "control"
  , "debug"
  , "either"
  , "maybe"
  , "partial"
  , "prelude"
  , "strings"
  , "tuples"
  ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs" ]
}
