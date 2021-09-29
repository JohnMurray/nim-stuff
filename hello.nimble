# Package

version       = "0.1.0"
author        = "Your Name <you AT your.domain>"
description   = "description description description"
license       = "GNU AGPL v3.0"
srcDir        = "src"


# Dependencies

requires "nim >= 1.4.8"


# Tests

task test, "run tests":
    exec "nim c -p:. -r tests/hello_test.nim"
