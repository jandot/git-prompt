#!/bin/bash
GREEN="\033[1;32m"
YELLOW="\033[1;33m"
RED="\033[1;31m"
BLUE="\033[1;34m"
RST="\033[0m"

CURRENT_BRANCH=`git branch 2>/dev/null | grep '*' | head -n1`
CURRENT_BRANCH=${CURRENT_BRANCH:2}
if [ $CURRENT_BRANCH != "" ] ; then
  STATUS_LINES=`git status`
  colour=$GREEN
  
  if [[ "$STATUS_LINES" =~ "# Changed but not updated" ]] ; then
    colour=$RED
  elif [[ "$STATUS_LINES" =~ "# Changes to be committed" ]] ; then
    colour=$YELLOW
  elif [[ "$STATUS_LINES" =~ "# Untracked files" ]] ; then
    colour=$BLUE
  fi
  git_part=" "$colour"("${CURRENT_BRANCH}")"$RST
else
  git_part=''
fi
echo -e $git_part