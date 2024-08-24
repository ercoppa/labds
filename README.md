## How to (re)generate HTML slide file for a notebook

Given a `.ipynb` file:
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

Given a `.ipynb` file:
1. Generate HTML file (see above)
2. Open HTML with the browser
3. Add at the end of the URL: `?print-pdf`
4. Print the page

## Online version

This repository has a GitHub action publishing everything online at [https://ercoppa.github.io/labds/](https://ercoppa.github.io/labds/):
- 00: [myFirstNotebook](https://ercoppa.github.io/labds/00/00-myFirstNotebook.slides.html)
- 01: [Python Basics](https://ercoppa.github.io/labds/01/01-Python-Basics.slides.html)
- 02: [Data Loading](https://ercoppa.github.io/labds/02/02-Data-Laoding.slides.html)
- 03: [Data Processing](https://ercoppa.github.io/labds/03/03-Data-Processing.slides.html)
- 03: [Data Visualization](https://ercoppa.github.io/labds/04/04-Data-Visualization.slides.html)

## Issues

- The slides are not compliant with LUISS guidelines wrt branding, e.g., using the suggested slide template, font, etc. I have made a hack to use the LUISS font but then disable it since the LUISS font is kind of inconsistent with respect to other fonts that we use (e.g., for code). 

## JypyterBook

The notebooks are available as a JypyterBook: [https://ercoppa.github.io/labds/](https://ercoppa.github.io/labds)