#!/bin/sh

port install emacs +atsui +carbon
-e /opt/local/bin/emacs || ln -s /Applications/MacPorts/Emacs.app/Contents/MacOS/Emacs /opt/local/bin/emacs
