.PHONY: all src include
all: src include

src:
	$(MAKE) -C $@

SRC_PATH = src
DIST_PATH = dist/include

ifeq ($(UNAME_S),Darwin)
	SOURCES = $(shell find $(SRC_PATH) -name '*.cpp' | sort -k 1nr | cut -f2-)
else
	SOURCES = $(shell find $(SRC_PATH) -name '*.cpp' -printf '%T@\t%p\n' \
						| sort -k 1nr | cut -f2-)
endif

include:
	rm -rf $(DIST_PATH)
	rm -rf inc_temp
	mkdir -p $(DIST_PATH)
	find src -name '*.h' | cpio -pdm inc_temp
	mv inc_temp/src $(DIST_PATH)/noise
	rm -rf inc_temp