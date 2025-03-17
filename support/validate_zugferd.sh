#!/bin/bash

mustang_version="2.16.3"
mustang_jar="Mustang-CLI_$mustang_version.jar"

# add scriptdir as a variable to also check support/ for the jar as it's the case on CI pipeline runs
scriptdir=$(realpath "$0")
scriptdir="${scriptdir%/*}"

if [ ! -f "$mustang_jar" ]; then
	if [ -f "$scriptdir/$mustang_jar" ]; then
		mustang_jar="$scriptdir/$mustang_jar"
	else
		wget -O "$mustang_jar" "https://github.com/ZUGFeRD/mustangproject/releases/download/core-$mustang_version/Mustang-CLI-$mustang_version.jar"
	fi
fi

validate_zugferd () {
	for f in "$@"
	do
		if [[ -f "$f" ]]; then
			java -Xmx1G -Dfile.encoding=UTF-8 -jar "$mustang_jar" --no-notices --action validate --source  "$f"
		fi
	done
}

for file in "$@"
do
	# search corresponding xml or pdf file
	for variant in "$file" "$file.pdf" "$file.xmpl" "${file}_zugferd.xml"; do
		validate_zugferd "$variant"
	done
done
