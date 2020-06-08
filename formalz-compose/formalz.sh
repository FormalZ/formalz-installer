#!/usr/bin/env bash

COMPOSE_FILES="-f docker-compose.yml -f docker-compose.analytics.yml"

function usage() {
cat 1>&2 << EOF
  Usage: $0 [OPERATION | --help]

  Manage the formalz service.

  OPERATION one of the following:

    start:       Launch all containers by stages, waiting for dependencies
                 to become available.
    stop:        Gracefully stop all containers, so that no data is lost;
                 you can then inspect their data in ./data, or restart them.
    restart:     Stop (as above) and then start (as above).
    uninstall:   Install formalz.
    uninstall:   Remove containers and clean up ./data.
  --help    display this help and exit
EOF
}

# only for installs & uninstalls
function require_root() {
  if [[ $EUID -ne 0 ]]; then
    echo "need super-user (root) privileges to run this script; exiting" 1>&2
    exit 1
  fi
}        

# main entrypoint, called after defining all functions (see last line)
function main() {

    if [[ $# -eq 0 ]] ; then
        echo "  Usage: $0 [OPERATION | --help]"
        exit 1
    fi
    command=${1}
    shift
    case "$command" in
        "start")
            docker-compose ${COMPOSE_FILES} up -d
            ;;
        "stop")
            docker-compose ${COMPOSE_FILES} stop
            ;;
        "restart")
            docker-compose ${COMPOSE_FILES} restart
            ;;
        "install")
            require_root
            docker-compose ${COMPOSE_FILES} pull
            ;;
        "uninstall")
            require_root
            docker-compose ${COMPOSE_FILES} down -v
            rm -fr ./data/files/logs/*
            rm -fr ./data/files/framework/views/*
            rm -fr ./data/files/framework/cache/*
            rm -fr ./data/files/framework/testing/*
            rm -fr ./data/files/framework/sessions/*
            rm -fr ./data/files/app/public/*
            rm -fr ./data/mysql/*
            ;;
        "--help")
            help ;;
        *) echo \
            "  Usage: $0 [OPERATION | --help]" \
            && echo "   ('$1' is NOT a valid operation)'"
            exit 1;
            ;;
    esac
}

# entrypoint
main $@
exit 0