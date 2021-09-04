#!/bin/bash

FWD=`dirname "$0"`
FN=`basename "$0"`
PWD=`pwd`
CWD="$PWD/$FWD/"

echo "Running $FN in $FWD from $PWD"

$CWD/scripts/ldf.sh $CWD/scripts/ldf.sh $CWD/arch/ldf.sh 
$CWD/scripts/ldf.sh $CWD/scripts/ldf.sh $CWD/nvim/ldf.sh
$CWD/scripts/ldf.sh $CWD/scripts/ldf.sh $CWD/zsh/ldf.sh

# https://unix.stackexchange.com/a/210656
if [ "$(grep -Ei 'arch|manjaro' /etc/*release)" ]; then
  echo "Hi Arch Based user"
  $FWD/arch/install.sh
elif [ "$(grep -Ei 'debian|buntu|mint' /etc/*release)" ]; then
  echo  "Hi Debian Base user"
else 
  echo "Hi, who are you?"
fi

$FWD/scripts/nodejs.sh
$FWD/scripts/golang.sh
$FWD/nvim/install.sh
$FWD/bash/install.sh
$FWD/zsh/install.sh

echo "Done runninig $FN in $FWD from $PWD"
