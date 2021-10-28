#!/bin/sh

usage() {
    echo "$(basename $0) -t [prod|staging]"
    echo ""
    echo "-t = test dry run"
    echo ""
    exit 1
}

unset DRY_RUN
while getopts 't' o
do
    case "$o" in
        t)
            DRY_RUN="--dry-run"
            ;;
        *)
            usage
            ;;
    esac
done
shift $(expr $OPTIND - 1)

case "$1" in
    prod|staging)
        STAGE=$1
        ;;
    *)
        usage
        ;;
esac

NAME="podinfo-$STAGE"

gitops app add \
    --app-config-url git@github.com:steveww/gitops \
    --url git@github.com:steveww/podinfo-deploy \
    --path $STAGE \
    --name $NAME \
    $DRY_RUN

