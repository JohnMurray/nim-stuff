import std/strformat

proc greeting*(who: string): string =
    fmt"Hello, {who}"