#!/bin/bash

cd /easyepg || exit

chown -R abc:users /easyepg

/bin/bash /easyepg/epg.sh

chown -R abc:users /easyepg

exit 0
