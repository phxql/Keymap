#!/bin/bash

set -euo pipefail

case `grep -F "dev-de" /usr/share/X11/xkb/symbols/us >/dev/null; echo $?` in
  0)
    echo "Already installed!"
    ;;
  1)
	echo "Creating backup ..."
	cp /usr/share/X11/xkb/symbols/us /usr/share/X11/xkb/symbols/us.bak	
	
	echo "Installing dev-de ..."
	cat us.dev-de >> /usr/share/X11/xkb/symbols/us
		
	echo "Done. Please restart X."
    ;;
  *)
    echo "Something went wrong :("
    ;;
esac
