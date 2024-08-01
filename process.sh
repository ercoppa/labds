#!/bin/bash


killall jupyter
jupyter nbconvert ${1} --to slides # --no-input # --post serve # ?print-pdf
sed -i -e 's/transition: "slide"/transition: "none", center: false/g' ${1%%.*}.slides.html
echo "Done"
# sleep 30
