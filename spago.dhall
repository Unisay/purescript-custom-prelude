{ name = "purescript-custom-prelude"
, dependencies = [ "debug", "either", "maybe", "prelude", "strings" ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs" ]
}
