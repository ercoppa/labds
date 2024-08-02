## How to (re)generate HTML slide file for a notebook

Given a `.ipynb` file use:
- Generate once:
```
bash scripts/process.sh <file>.ipynb
```
- Watch changes and regenerate:
```
bash scripts/run.sh <file>.ipynb
```

Then open the related HTML file with your browser. There is no hot reload in the browser, hence, you have to manualy refresh the page to see the new changes.

## How to (re)generate the PDF file for a notebook

Given a `.ipynb` file use:
1. Generate HTML file (see above)
2. Open HTML with the browser
3. Add at the end of the URL: `?print-pdf`
4. Print the page

## Online version

This repository has a GitHub action publishing everything online at [https://ercoppa.github.io/labds/](https://ercoppa.github.io/labds/).

**TODO**: the GitHub action should fix the img path from local path to remote path.