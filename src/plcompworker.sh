#!/bin/bash

set -e

export OPTION="help" modD="/lib/plcomp" OPTARG=()

while [[ "${#}" -gt 0 ]]; do
    case "${1}" in
        "--"[wW][oO][rR][kK][eE][rR]|"-"[wW])
            export OPTION="worker"
            shift
        ;;
        "--"[hH][eE][lL][pP][eE][rR]|"-"[hH])
            export OPTION="helper"
            shift
        ;;
        *)
            export OPTARG+=("${1}")
            shift
        ;;
    esac
done

case "${OPTION}" in
    "worker")
        # Check if there is any MOD file (Rule File)
        if [[ -f "${modD}/worker/${OPTARG[@]%%:*}" ]] ; then
            if [[ "${OPTARG[@]}" = *":"* ]] ; then
                bash "${modD}/worker/${OPTARG[@]%%:*}" "${OPTARG[@]#*:}"
            else
                bash "${modD}/worker/${OPTARG[@]%%:*}"
            fi
        else
            echo "${0##*/}: There is no worker found!"
            exit 1
        fi
    ;;
    "helper")
        # Check if there is any MOD file (Rule File)
        if [[ -f "${modD}/helper/${OPTARG[@]%%:*}" ]] ; then
            echo "${OPTARG[@]#*:}"
        else
            echo "${0##*/}: Reverse worker not found!"
            exit 1
        fi
    ;;
    "help")
        echo -e "Help text of ${0##*/}, there is <N> arguments:

"
    ;;
    *)
        echo "${0##*/}: There is no option like \"${OPTION}\"."
        exit 1
    ;;
esac