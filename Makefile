SHELL := /bin/bash

all:
	@echo "Available targets: install build-book clean-book"

build-book:
	rm -rf _build/html || echo "nothing to clean"
	. .venv/bin/activate; python scripts/gen-notebook-no-solution.py
	. .venv/bin/activate; jupyter-book build --config _config.jupyterbook.yml .
	. .venv/bin/activate; python3 scripts/convert-all-to-slides.py
	rm -rf docs ; mkdir docs && cp -r _build/html/* docs
	. .venv/bin/activate; python3 scripts/add-slide-button.py docs
	. .venv/bin/activate; python3 scripts/copy-slides-to-book.py docs
	. .venv/bin/activate; python3 scripts/fix-absolute-img-url.py
	rm -rf docs/dist; cp -a dist docs/
	cp -a dist/plugin docs/
	rm -rf docs/docs
	cp _config.jekyll.yml docs/_config.yml

publish:
	git add docs

clean-book:
	rm -rf _build || echo "nothing to clean"

install:
	python3 -m venv .venv
	pip install -r requirements.txt
	playwright install

docker-setup:
	@rm -rf venv || echo "nothing to clean"
	@rm -rf .cache ; mkdir .cache
	docker build -t labds/python:3.12.5 - < Dockerfile
	docker run --rm -ti -u `id -u`:`id -g` -v $(PWD):/home/user/labds -v $(PWD)/.cache:/home/user/.cache -w /home/user/labds labds/python:3.12.5 bash -c "make install"

docker:
	docker run --rm -ti \
		-u `id -u`:`id -g` \
		-v $(PWD):/home/user/labds \
		-v $(PWD)/.cache:/home/user/.cache \
		-w /home/user/labds \
		--ipc=host --cap-add=SYS_ADMIN \
		--name labds \
		labds/python:3.12.5 \
		bash

docker-build-book:
	docker run --rm -ti \
		-u `id -u`:`id -g` \
		-v $(PWD):/home/user/labds \
		-v $(PWD)/.cache:/home/user/.cache \
		-w /home/user/labds \
		--ipc=host --cap-add=SYS_ADMIN \
		--name labds \
		labds/python:3.12.5 \
		bash -c "make build-book"