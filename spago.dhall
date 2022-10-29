{ name = "purescript-custom-prelude"
, dependencies = [ "debug", "either", "maybe", "prelude", "strings", "tuples" ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs" ]
}
