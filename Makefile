BIN=build/Release/CmusMediaKeys
INSTALL_DIR=/usr/local/bin
CLINAME=cmusmediakeysd
LAUNCHDDIR=~/Library/LaunchAgents

SRCFILES=CmusMediaKeys/MediaApplication.swift CmusMediaKeys/main.swift CmusMediaKeys/CmusDelegate.swift CmusMediaKeys/CmusController.swift
LAUNCHDFILE=cmusmediakeysd.plist

default: build

build: $(BIN)

$(BIN): $(SRCFILES)
	xcodebuild

install: $(BIN) $(LAUNCHDFILE)
	cp "$(BIN)" "$(INSTALL_DIR)/$(CLINAME)"
	cp $(LAUNCHDFILE) $(LAUNCHDDIR)

clean:
	rm -rf build
