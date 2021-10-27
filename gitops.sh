#!/bin/sh

case "$1" in
    prod|staging)
        STAGE=$1
        ;;
    *)
        echo "stage required as first arg [prod|staging]"
        exit 1
        ;;
esac

NAME="podinfo-$STAGE"

gitops app add \
    --url git@github.com:steveww/podinfo-deploy \
    --path $STAGE \
    --name $NAME \
    --dry-run

