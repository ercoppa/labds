import sys
import glob
import os

for filename in glob.glob('book/_sources/*/*.ipynb'):
    print("Processing", filename)
    data = open(filename).read()
    d = os.path.basename(os.path.dirname(filename))
    data = data.replace('(img/', '(https://ercoppa.github.io/labds/book/' + d + '/img/')
    data = data.replace('"img/', '"https://ercoppa.github.io/labds/book/' + d + '/img/')
    open(filename, 'w').write(data)