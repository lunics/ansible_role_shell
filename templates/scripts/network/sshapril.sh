#!/usr/bin/env bash

ssh -i ~/.ssh/chapril -J april@fip.chapril.org root@grof.cluster.chapril.org 'GIT_AUTHOR_NAME="lunics" GIT_AUTHOR_EMAIL="nicolasery@lunics.fr"'
# ssh -J april@fip.chapril.org root@xmpp.cluster.chapril.org 'GIT_AUTHOR_NAME="lunics" GIT_AUTHOR_EMAIL="nicolasery@lunics.fr"'
