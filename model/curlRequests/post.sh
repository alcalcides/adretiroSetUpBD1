#!/bin/bash

person=$1
uri=$2

echo "curl (...) $person (...) $uri"
function sendPostRequest() {
	curlResponse=$(
		curl \
			-d "@$person" \
			-H "Content-Type: application/json" \
			-X POST $uri
	)

	echo $curlResponse

}

postResponse=$(sendPostRequest $person $uri)
echo $postResponse 
echo "[$(date)] [$uri] [$postResponse]" >> ./log/post.log
