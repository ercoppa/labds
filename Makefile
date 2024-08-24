all:
	@echo "Available targets: build-book clean-book"

build-book:
	jupyter-book build --config _config.jupyterbook.yml .
	python3 scripts/convert-all-to-slides.py
	rm -rf docs ; mkdir docs && cp -r _build/html/* docs
	python3 scripts/add-slide-button.py docs
	python3 scripts/copy-slides-to-book.py docs
	python3 scripts/fix-absolute-img-url.py
	rm -rf docs/dist; cp -a dist docs/
	cp -a dist/plugin docs/
	rm -rf docs/docs
	cp _config.jekyll.yml docs/_config.yml
	git add docs

clean-book:
	rm -rf _build || echo "nothing to clean"