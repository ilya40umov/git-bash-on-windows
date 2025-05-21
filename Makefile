SHELL := bash.exe

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

.PHONY: copy-to-system

# Usage: make copy-to-system 
copy-to-system:
	cp .bashrc $$HOME/.bashrc
	cp .bash_aliases $$HOME/.bash_aliases
	cp .bash_profile $$HOME/.bash_profile
	cp .bash_completion $$HOME/.bash_completion
	cp .inputrc $$HOME/.inputrc
	cp .selected_editor $$HOME/.selected_editor
	cp .vimrc $$HOME/.vimrc
