VERSION = 1.1.1

INSTALL = install

.PHONY: all install
all: utils/vercmp
install: all
	$(INSTALL) -d '$(DESTDIR)/usr/share'
	rsync -rlpt bundled-mods/ '$(DESTDIR)/usr/share/flasher'
	$(INSTALL) -d '$(DESTDIR)/usr/sbin'
	$(INSTALL) -p src/flasher '$(DESTDIR)/usr/sbin'
	$(INSTALL) -p src/flash-image '$(DESTDIR)/usr/sbin'
	$(INSTALL) -p src/led-updating '$(DESTDIR)/usr/sbin'
	$(INSTALL) -p utils/vercmp '$(DESTDIR)/usr/sbin'
	$(INSTALL) -d '$(DESTDIR)/etc/init.d'
	$(INSTALL) -p src/initscript '$(DESTDIR)/etc/init.d/S60flashcast-flasher'
	cat src/bashrc >> '$(DESTDIR)/root/.bashrc'
	echo '$(VERSION)' > '$(DESTDIR)/etc/flasher-version'
