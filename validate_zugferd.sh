#!/bin/bash

mustang_version="2.14.2"
mustang_jar="Mustang-CLI.jar"

if [ ! -f "$mustang_jar" ]; then
	wget -O "$mustang_jar" "https://github.com/ZUGFeRD/mustangproject/releases/download/core-$mustang_version/Mustang-CLI-$mustang_version.jar"
fi

for f in "$@"
do
	java -Xmx1G -Dfile.encoding=UTF-8 -jar "$mustang_jar" --no-notices --action validate --source "$f"
	
done
