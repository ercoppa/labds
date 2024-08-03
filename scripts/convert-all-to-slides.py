import sys
import glob
import os

for filename in glob.glob('*/*.ipynb'):
    print("Processing", filename)
    os.system('bash scripts/process.sh ' + filename)