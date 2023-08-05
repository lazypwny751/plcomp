PREFIX := "/usr"
SRCDIR := $(PREFIX)/share/plcomp

define setup
	mkdir -p $(SRCDIR) $(SRCDIR)/lib $(SRCDIR)/rule /lib/plcomp
	cp -r mod/worker mod/helper /lib/plcomp
	install -m 755 src/plcompworker.sh $(SRCDIR)
	install -m 755 src/plcomp.pl $(SRCDIR)
	install -m 755 src/plcompc.pl $(SRCDIR)
	ln -s $(SRCDIR)/plcompc.pl /usr/bin/plcompc
	install -m 755 plcomp.service /lib/systemd/system/plcomp.service
endef

define remove
	rm -rf $(SRCDIR) /lib/systemd/system/plcomp.service /usr/bin/plcompc /lib/plcomp
endef

install:
	@$(setup)
	@echo "installed.."

uninstall:
	@$(remove)
	@echo "uninstalled.."

reinstall:
	@$(remove)
	@$(setup)
	@echo "reinstalled.."

.PHONY: install uninstall reinstall