#!/bin/bash

for server in $(cat input/serversSubscribed.config); do

    if [[ ${server:0:1} == "#" ]]; then
        length=$(expr ${#server} - 1)
        echo "==> skipped ${server:1:length}"
        continue
    else
        for user in $(ls input/peopleToInsert/); do
            if [[ $user == "forExample.json" ]]; then
                continue;
            fi

            echo "$server"
            echo "$user"
            userpath="./input/peopleToInsert/$user"
            ./model/curlRequests/post.sh $userpath $server/contributors
            echo ""
        done
    fi
done
