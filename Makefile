PREFIX = /usr/local
DATADIR = /usr/share

poezii-in-cli: poezii-in-cli.sh
	cat poezii-in-cli.sh > $@

	chmod +x $@

clean:
	rm -f poezii-in-cli

install: poezii-in-cli
	./myinstaller.sh
	mkdir -p $(DESTDIR)$(PREFIX)/bin
	mkdir -p $(DESTDIR)$(DATADIR)/poezii-in-cli/data
	cp -r data/* $(DESTDIR)$(DATADIR)/poezii-in-cli/data
	cp -f poezii-in-cli $(DESTDIR)$(PREFIX)/bin
	chmod 755 $(DESTDIR)$(PREFIX)/bin/poezii-in-cli
	chmod -R 755 $(DESTDIR)$(DATADIR)/poezii-in-cli/data/*

uninstall:
	rm -f $(DESTDIR)$(PREFIX)/bin/poezii-in-cli
	rm -rf $(DESTDIR)$(DATADIR)/poezii-in-cli

.PHONY: test clean install uninstall
