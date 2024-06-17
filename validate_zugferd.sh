#!/bin/bash

mustang_jar="Mustang-CLI-2.11.0.jar"

if [ ! -f "$mustang_jar" ]; then
	wget https://github.com/ZUGFeRD/mustangproject/releases/download/core-2.11.0/Mustang-CLI-2.11.0.jar
fi

for f in "$@"
do
	java -Xmx1G -Dfile.encoding=UTF-8 -jar $mustang_jar --no-notices --action validate --source $f
done
