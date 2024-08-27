## Everything from notebooks

The notebooks in this repo are:
- available in a public JupyterBook
- translated into slides (see later)

See: [https://ercoppa.github.io/labds/](https://ercoppa.github.io/labds)

## Dependencies

Install the deps:
```
make install
```

## Update the book

```
make build-book
```

## How to mark a notebook cell as a slide

1. Use VSCode
2. Install extension "Jupyter Slide Show"
3. Right click on a cell > Switch Slide Type > Slide

## How to (re)generate HTML slide file for a notebook

## Lazy approach

`make build-book` will automatically use a headless browser to generate a fresh copy of the slides. No need to anything.

## Manual approach (useful when writing the notebook)

Given a `.ipynb` file:
- Generate once:
```
bash scripts/process.sh <file>.ipynb
```
- Watch changes and regenerate:
```
bash scripts/run.sh <file>.ipynb
```

Then open the related HTML file with your browser. There is no hot reload in the browser, hence, you have to manually refresh the page to see the new changes.

## How to (re)generate the PDF file for a notebook

### Lazy approach

`make build-book` will automatically use a headless browser to generate a fresh copy in PDF of the slides. No need to anything.

### Manual approach

Given a `.ipynb` file:
1. Generate HTML file of the slides (see above)
2. Open HTML file with the browser
3. Add at the end of the URL: `?print-pdf`
4. Print the page

## Notebook containing exercises: generate a copy without solutions

1. Create a notebook with:
    - `-Solutions` in the name
    - (optional) ` [solutions]` in some slides (e.g., `Python Exercises [solutions]`).
2. Add the tag `solution` for each cell that contains/describes a piece of a solution. To easily add a cell tag, install in VSCode the extension "Jupyer Cell Tags" and then select a cell > Add Cell Tag.
3. When running `make build-book`, for each file matching conditions in (1):
    - a new file file will be created, replacing `-Solutions` with `-AUTOGEN` in the filename
    - ` [solutions]` will be removed from the content of the new notebook
    - cells with tag `solution` will be removed from the content of the new notebook

## Issues

- The slides are not compliant with LUISS guidelines wrt branding, e.g., using the suggested slide template, font, etc. I have made a hack to use the LUISS font but then disable it since the LUISS font is kind of inconsistent with respect to other fonts that we use (e.g., for code). 