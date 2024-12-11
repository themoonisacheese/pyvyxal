import pythonmonkey as pm
from pathlib import Path

Vyxal = pm.require("./vyxal.js").Vyxal

_dictpath = Path(__file__).parent

with open(_dictpath / 'LongDictionary.txt', 'r') as ld:
    Vyxal.setLongDict(ld.read())
with open(_dictpath / 'ShortDictionary.txt', 'r') as sd:
    Vyxal.setShortDict(sd.read())

if __name__ == "__main__":
    print(Vyxal.getVersion())
#Vyxal.execute(code, inputs, flags, sendFn, errorFn)