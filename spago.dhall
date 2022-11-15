{ name = "purescript-custom-prelude"
, dependencies =
  [ "control", "debug", "either", "maybe", "prelude", "strings", "tuples" ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs" ]
}
