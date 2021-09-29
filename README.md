# nim-stuff

[![Passing Tests](https://github.com/JohnMurray/nim-stuff/actions/workflows/test.yaml/badge.svg)](https://github.com/JohnMurray/nim-stuff/actions/workflows/test.yaml)

A basic starter-template for working with Nim in VSCode's container environments. Ships with:

  + Nim `1.4.8`
  + Nimble (latest stable)
  + A basic project configuration
    + Nimble configuration with a basic test task
    + `src/` and `tests/` directory that can be exercised out of the box
  + Basic GitHub workflow for testing
  + Basic standard tooling (gcc, git, curl, zsh, etc)

To be added soon
  + [ ] Nimble publish support
  + [ ] Doc generation (for gh-pages)

To get started:

  + Copy this template & clone it
  + Open with VSCode (inside the dev-container)
  + Run `nimble test` to make sure things are working
  + Enjoy!
