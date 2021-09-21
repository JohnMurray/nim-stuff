import unittest

import hello

test "can greet":
    check greeting("bob") == "Hello, bob"