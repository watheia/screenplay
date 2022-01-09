.PHONY: docs

SHELL := /bin/bash
PATH := ./node_modules/.bin:$(HOME)/bin:$(PATH)


# bit:
#   yarn install
# 	npm install --global @teambit/bvm
# 	bvm install latest
# 	bit config set analytics_reporting false
# 	bit init --harmony

docs:
	@echo "---> Calculating source graph, this may take a few minutes..."
	yarn depcruise --output-type dot --output-to docs/depgraph.dot
	cat docs/depgraph.dot | dot -T svg > docs/depgraph.svg.tmp
	mv docs/depgraph.svg.tmp docs/depgraph.svg

