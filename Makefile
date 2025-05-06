SHELL := bash

.PHONY: help

# Usage: make help
help:
	@cat Makefile | grep "^# Usage:"

.PHONY: copy-from-system

# Usage: make copy-from-system 
copy-from-system:
	cp ~/.bashrc .
	cp ~/.bash_aliases .
	cp ~/.bash_profile .
	cp ~/.bash_completion .
	cp ~/.inputrc .
	cp ~/.selected_editor .
	cp ~/.vimrc .
