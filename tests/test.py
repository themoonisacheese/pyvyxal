from pathlib import Path
import sys
sys.path.append(str(Path(__file__).parent.parent))




from pyvyxal import Vyxal
print(Vyxal.getVersion())

Vyxal.execute("ɾ×+", ["5","2","0"], "", print, print)