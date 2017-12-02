#!/bin/sh
# vrsh: virtual reality shell
# licensed public domain / cc0

clear
while read cmd; do
    echo "$cmd" | bash > /tmp/vrsh
    
    height=$(wc -l /tmp/vrsh | cut -d ' ' -f 1)
    marginh=$(echo $height | awk '{print (66 - $1) / 2}')
    width=$(wc -L /tmp/vrsh | cut -d ' ' -f 1)
    marginw=$(echo $width | awk '{print (134 - $1) / 2}')
    
    clear
    
    for i in $(seq $marginh); do
        echo
    done
    
    while read line; do
        for i in $(seq $marginw); do
            echo -n ' '
        done
    
        printf '%-'$width's' "$line"
    
        for i in $(seq $marginw); do
            echo -n '  '
        done
    
        printf '%-'$width's' "$line"

        echo
    done < /tmp/vrsh
   
    for i in $(seq $marginw); do
        echo -n ' '
    done
    echo -n '$ '
done
