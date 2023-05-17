#!/bin/sh

try_until_success() {
    local cmd="$@"
    while true; do
        if $cmd; then
            echo "-[[[$cmd]]]- successfully executed!"
            break
        fi
        sleep 1
    done
}

# Because komodod will attach to terminal, run this first as a background task in a loop
# that will run this command every second until the successful komodod initialization.
try_until_success komodo-cli importprivkey $PRIVKEY "" true $(komodo-cli getblockcount) &

komodod -printtoconsole -pubkey=$PUBKEY
