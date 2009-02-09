SCRIPTS=$(wildcard *.sh)

default:
	@echo "Run 'sudo make install'"

install:
	for script in $(SCRIPTS) ; do echo "### Running $$script" ; ./$$script ; done
