#!/bin/bash
##
## Remove a file or directory by macOS Finder application
## Copyright (c) 2018 SATOH Fumiyasu @ OSS Technology Corp., Japan
##
## License: GNU General Public License version 3
##

set -u

if [[ $# -ne 1 ]]; then
  echo "Usage: $0 TARGET"
  exit 1
fi

path2abs() {
  if [[ $1 != /* ]]; then
    printf '%s' "$PWD/$1"
  else
    printf '%s' "$1"
  fi
}

target=$(path2abs "$1"); shift

/usr/bin/osascript - "$target" <<'EOF'
on run argv
  set targetPath to POSIX file (item 1 of argv)
  with timeout of 0 seconds
    tell application "Finder"
      #activate
      if kind of (info for targetPath) is "folder" then
	delete (files of folder targetPath)
      end if
      delete targetPath
    end tell
  end timeout
end run
EOF
