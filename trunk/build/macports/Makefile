SCRIPTS=$(wildcard p0/*.sh) $(wildcard p1/*.sh) $(wildcard p2/*.sh)

default:
	@echo "Run 'sudo make install'"

install:
	for script in $(SCRIPTS) ; do echo "### Running $$script" ; ./$$script ; done
