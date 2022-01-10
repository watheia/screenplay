.PHONY: docs setup

SHELL := /bin/bash
PATH := ./node_modules/.bin:$(HOME)/bin:$(PATH)

setup:
	@echo "---> Running system update..."
	sudo apt-get update && \
  	sudo apt-get upgrade -y

	@echo "---> Installing graphviz..."
	sudo apt-get install graphviz -y

	@echo "---> Installing cypress dependencies..."
	sudo apt-get install -y libgtk2.0-0 libgtk-3-0 libgbm-dev libnotify-dev libgconf-2-4 libnss3 libxss1 libasound2 libxtst6 xauth xvfb
	
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

