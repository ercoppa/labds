#!/bin/bash

ls ${1} | entr -rn bash process.sh ${1}
