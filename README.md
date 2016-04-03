# CmusMediaKeys for OSX

## Description

Yes, there's already a plugin for that. But for some reason npm was giving me a hard time, so I decided I would code my own in Swift. It is fairly basic and only handles previous, play, and next keys. Careful though, it does not take care of iTunes showing up by default everytime you press play. I'll let you deal with that yourself.

## Installation

Running `make install` will build the project, copy `cmusmediakeysd` to `/usr/local/bin`, and copy the job definition to `~/Library/LaunchAgents`. It will then run automatically on start up.
