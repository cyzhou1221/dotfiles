#!/bin/sh

port_http=7897

PROXY_HTTP="http://XXX.XX.XX.XX:${port_http}"

set_proxy(){
    export http_proxy="${PROXY_HTTP}"
    export HTTP_PROXY="${PROXY_HTTP}"

    export https_proxy="${PROXY_HTTP}"
    export HTTPS_proxy="${PROXY_HTTP}"
    
    git config --global http.proxy "${PROXY_SOCKS}"
    git config --global https.proxy "${PROXY_SOCKS}"

    echo "Proxy set"
}

unset_proxy(){
    unset http_proxy
    unset HTTP_PROXY
    unset https_proxy
    unset HTTPS_PROXY
    git config --global --unset http.proxy
    git config --global --unset https.proxy

    echo "Proxy unset"
}

test_setting(){
    curl google.com
}

if [ "$1" = "on" ]
then
    set_proxy

elif [ "$1" = "off" ]
then
    unset_proxy

elif [ "$1" = "test" ]
then
    test_setting
else
    echo "Unsupported arguments."
fi
