bin_targets=foocal genstats weather tzdate fortune
sbin_targets=

all:

install: $(addprefix /usr/local/bin/,$(bin_targets)) $(addprefix /usr/local/sbin/,$(sbin_targets))

/usr/local/bin/%: %
	install -o 0 -g 0 -m 755 $< $@

/usr/local/sbin/%: %
	install -o 0 -g 0 -m 755 $< $@
