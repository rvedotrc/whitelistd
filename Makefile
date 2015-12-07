default:
	-echo "Default target is bogus" ; exit 1

install:
	mkdir -p $(DESTDIR)/usr/lib/whitelistd
	for f in `ls bin` ; do install -m 755 bin/"$$f" $(DESTDIR)/usr/lib/whitelistd ; done

tarball:
	: $${VERSION:?}
	rsync -av --delete --exclude=.git $(PWD)/ $(PWD)/../whitelistd-$(VERSION)/
	cd .. ; tar -zcvf whitelistd-$(VERSION).tar.gz whitelistd-$(VERSION)

