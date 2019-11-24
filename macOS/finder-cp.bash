#!/bin/bash
##
## Copy a file or directory by macOS Finder application
## Copyright (c) 2018 SATOH Fumiyasu @ OSS Technology Corp., Japan
##
## License: GNU General Public License version 3
##

set -u

if [[ $# -ne 2 ]]; then
  echo "Usage: $0 SRC DST"
  exit 1
fi

path2abs() {
  if [[ $1 != /* ]]; then
    printf '%s' "$PWD/$1"
  else
    printf '%s' "$1"
  fi
}

src=$(path2abs "$1"); shift
dst=$(path2abs "$1"); shift

/usr/bin/osascript - "$src" "$dst" <<'EOF'
on run argv
  set srcPath to POSIX file (item 1 of argv)
  set dstDir to POSIX file (item 2 of argv)
  with timeout of 0 seconds
    tell application "Finder"
      #activate
      duplicate srcPath to folder dstDir
    end tell
  end timeout
end run
EOF
