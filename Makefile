all:
	jupyter-book build --config _config.jupyterbook.yml .
	rm -rf book ; mkdir book && cp -r _build/html/* book
	python3 scripts/add-slide-button.py book
	python3 scripts/copy-slides-to-book.py book
	rm -rf book/dist; cp -a dist book/
	rm -rf book/plugin; cp -a plugin book/
	git add book