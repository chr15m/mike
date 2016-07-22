ITS=$(wildcard tracks/*.it)
DIRS := $(ITS:.it=)
TXT := $(ITS:.it=/info.txt)

all: $(DIRS) $(TXT) blockhead

.PHONY: clean

%/info.txt: %.it
	it2pd $< --info --stems $(patsubst %/info.txt,%,$@) > $@

%: %.it
	mkdir -p $@

clean:
	rm -rf $(DIRS)

blockhead:
	git clone https://github.com/chr15m/blockhead.git

