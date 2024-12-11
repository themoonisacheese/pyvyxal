# Pyvxyal: run vyxal as a python module
[Vyxal](https://github.com/Vyxal/Vyxal) is a golfing language that compiles to the JVM and JS. this module leverages [pythonmonkey](https://github.com/Distributive-Network/PythonMonkey) to execute the JS version from python, without spawning additional processes and having to deal with stdio.

compatiblity should be 1:1 with the web version of vyxal.

## installing

dependencies:
```
node + npm ^12.0.0 (for install only, required by pythonmonkey to obtain modules from npm)
java ^17 (for install only, to compile vyxal to js)
git
sed
a linux distro shipping apt-get (required for pythonmonkey install :/)
```

clone this repo, then:
```
cd pyxvyal
source .venv/bin/activate
poetry install
./scripts/build.bash
```

## usage
```
from pyvyxal import Vyxal

Vyxal.execute("vyxal code", ["arg1", "arg2, "..."], "flags", printCallback, errCallback)
```
see tests/test.py for a working example

## Known issues:
- output is currently one token per line