BASE=$(shell git remote -v | cut -f 2- | sed -e "s%fachat/.*%fachat%g" | uniq )

SUBS=roms fpga ultracpu micropet ultipet ultrabus wifi-option software keyboard emu

all:
	@echo "Run 'make clone' to download all related repositories as subdirectories to this one"
	@echo "Run 'make update' to update all cloned repositories"
	@echo "Using '$(BASE)' as base URL for cloning.

clone:
	test -d roms || git clone $(BASE)/upet_roms roms
	test -d fpga || git clone $(BASE)/upet_fpga fpga
	test -d ultracpu || git clone $(BASE)/csa_ultracpu ultracpu
	test -d micropet || git clone $(BASE)/cbm_micropet micropet
	test -d ultipet || git clone $(BASE)/cbm_ultipet ultipet
	test -d ultrabus || git clone $(BASE)/csa_ultrabus ultrabus
	test -d wifi-option || git clone $(BASE)/upet_wifi wifi-option
	test -d software || git clone $(BASE)/upet_software software
	test -d keyboard || git clone $(BASE)/cbm_keyboard keyboard
	test -d emu || git clone $(BASE)/xcbm emu
	for i in $(SUBS); do make -C $$i clone; done

update:
	git pull
	for i in $(SUBS); do make -C $$i update; done
