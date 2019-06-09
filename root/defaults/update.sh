#!/bin/bash
cd /easyepg
rm -rf easyepg 2> /dev/null
git clone https://github.com/sunsettrack4/easyepg
	if [ -e easyepg/update.sh ]
	then
		/bin/bash easyepg/update.sh
		rm -rf easyepg 2> /dev/null
		exit 0
	else
		rm -rf easyepg 2> /dev/null
		printf "\r[ ERROR ]  Missing script: update.sh\n"
	fi
