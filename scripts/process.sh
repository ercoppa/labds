#!/bin/bash



killall jupyter

# see: 
# https://nbconvert.readthedocs.io/en/latest/config_options.html

jupyter nbconvert ${1} --to slides \
    --SlidesExporter.reveal_url_prefix=".." \
    --SlidesExporter.reveal_theme="luiss" \
    --SlidesExporter.reveal_number="c/t" \
    --SlidesExporter.reveal_transition="none" \
    --SlidesExporter.reveal_width=1280 \
    --SlidesExporter.reveal_height=700 

# --no-input # --post serve # ?print-pdf

# fix: top vertical alignment
sed -i -e 's/controls: true/controls: true, center: false/g' ${1%%.*}.slides.html

# fix: luiss font
# sed -i -e 's/jp-content-font-family: system-ui/jp-content-font-family: LUISS, system-ui/g' ${1%%.*}.slides.html

# fix: luiss font size
# sed -i -e 's/jp-content-font-size1: 20px/jp-content-font-size1: 28px/g' ${1%%.*}.slides.html

echo "Done"
