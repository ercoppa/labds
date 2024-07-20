#!/bin/bash

# ?print-pdf

ls ${1} | entr -r bash -c "killall jupyter ; jupyter nbconvert ${1} --to slides" # --post serve
