#!/bin/bash

# cd ; 
# wget https://li.nux.ro/download/nux/dextop/el7/x86_64/html2text-1.3.2a-14.el7.nux.x86_64.rpm --no-check-certificate
# sudo rpm -Uvh html2text-1.3.2a-14.el7.nux.x86_64.rpm

baseurl=$(echo http://15.207.109.98:8081/repository) ;
repo=$(curl http://15.207.109.98:8081/service/rest/repository/browse/ekams/ | html2text | tail -n1 | cut -b 1-5) ;
groupid=$(curl http://15.207.109.98:8081/service/rest/repository/browse/ekams/ | html2text | tail -n1 | cut -b 1-5) ;
artifactid=$(curl http://15.207.109.98:8081/service/rest/repository/browse/ekams/ekams/ | html2text | tail -n1 | cut -b 1-9) ;
snapshotversion=$(curl http://15.207.109.98:8081/service/rest/repository/browse/ekams/ekams/ekams-web/ | html2text | grep -v metadata | tail -n1 | cut -b 1-10) ;
snapshotid=$(curl http://15.207.109.98:8081/service/rest/repository/browse/ekams/ekams/ekams-web/1-SNAPSHOT/ | html2text | grep -v metadata | tail -n1 | cut -b 1-24) ;

url=$(echo $baseurl/$repo/$groupid/$artifactid/$snapshotversion/$artifactid-$snapshotid.war)

echo admin | sudo -S wget -o  $1/ekams.war $url