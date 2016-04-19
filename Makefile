# Do you like tech trees?
# Do you have make on your system?
# Just type 'make' and we'll build you one!

PROJ_NAME = $(shell basename `pwd`)

TREE_SRC := FASA.yml OMSK.yml RN_Proton.yml RN_R7.yml RN_Salyut.yml RN_Skylab.yml RN_Soviet_Probes.yml RN_Soyuz.yml RN_US_Probes.yml RN_US_Rockets.yml RN_Zenit.yml SpaceFactory.yml WernhersOldStuff.yml
TREE := GameData/SpaceRace/Tree.cfg
VERSION := $(shell git describe --tags)

ZIPFILE := $(PROJ_NAME)-$(VERSION).zip

all: $(TREE)

clean:
	rm -rf $(TREE) $(ZIPFILE)

release: $(ZIPFILE)

$(TREE): $(TREE_SRC)
	yml2mm $(TREE_SRC) > $(TREE)

$(ZIPFILE): $(TREE)
	zip -r $(ZIPFILE) README.md LICENSE.md GameData
