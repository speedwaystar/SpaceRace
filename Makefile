# Do you like tech trees?
# Do you have make on your system?
# Just type 'make' and we'll build you one!

# PROJ_NAME = $(shell basename `pwd`)
PROJ_NAME = RN_US_Rockets

TREE_SRC := Tree.yml
TREE := GameData/$(PROJ_NAME)/Tree.cfg
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
