# Do you like tech trees?
# Do you have make on your system?
# Just type 'make' and we'll build you one!

PROJ_NAME = $(shell basename `pwd`)

TREE_SRC := RP-0.yml SpaceFactory.yml WernhersOldStuff.yml OMSK.yml
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
