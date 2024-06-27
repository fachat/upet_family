
all:
	echo "Run 'make clone' to download all related repositories as subdirectories to this one"
	echo "Run 'make update' to update all cloned repositories"

clone:
	test -d roms || git clone https://github.com/fachat/upet_roms roms
	test -d fpga || git clone https://github.com/fachat/upet_fpga fpga
	test -d ultracpu || git clone https://github.com/fachat/csa_ultracpu ultracpu
	test -d micropet || git clone https://github.com/fachat/cbm_micropet micropet
	test -d ultipet || git clone https://github.com/fachat/cbm_ultipet ultipet
	test -d ultrabus || git clone https://github.com/fachat/csa_ultrabus ultrabus
	test -d wifi-option || git clone https://github.com/fachat/upet_wifi wifi-option
	test -d upet_software || git clone https://github.com/fachat/upet_software software
	for i in roms fpga ultracpu micropet ultipet ultrabus wifi-option software; do (cd $$i; make clone;) done

update:
	git pull
	for i in roms fpga ultracpu micropet ultipet ultrabus wifi-option software; do (cd $$i; make update;) done

