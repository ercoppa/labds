all:
	jupyter-book build --config _config.jupyterbook.yml .
	cp -r _build/html/* book/
