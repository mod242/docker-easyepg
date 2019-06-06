#!/bin/bash

chown -R abc:users /easyepg
chown -R abc:users /tmp

cd /easyepg || exit

s6-setuidgid abc /bin/bash /easyepg/epg.sh

chown -R abc:users /easyepg
chown -R abc:users /tmp

exit 0
