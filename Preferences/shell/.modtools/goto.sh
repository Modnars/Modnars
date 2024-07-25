#!/usr/bin/sh

GOTO_PROMPT_WORKSPACE="workspace"
GOTO_WORKSPACE="/data/home/modnarshen/project/go/uasvr-go"
GOTO_PROMPT_ASSETS="assets"
GOTO_ASSETS="/data/home/modnarshen/project/go/uasvr-go-assets"
GOTO_PROMPT_CONF="conf"
GOTO_CONF="/data/home/modnarshen/project/go/uasvr-go-assets"

GOTO_DESTINATION=${1-${PROMPT_WORKSPACE}}

if [ ${GOTO_DESTINATION} == ${GOTO_PROMPT_WORKSPACE} ]; then
    cd ${GOTO_WORKSPACE}
elif [ ${GOTO_DESTINATION} == ${GOTO_PROMPT_ASSETS} ]; then
    cd ${GOTO_ASSETS}
elif [ ${GOTO_DESTINATION} == ${GOTO_PROMPT_CONF} ]; then
    cd ${GOTO_CONF}
fi
