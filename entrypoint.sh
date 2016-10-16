#!/bin/sh

# /**********************/
# /*                    */
# /*       SETUP        */
# /*                    */
# /**********************/

# check for tsdns settings
if [ -f $TS_INJECTS/tsdns_settings.ini ]; then
  ln -s $TS_INJECTS/tsdns_settings.ini $TS_HOME/tsdns_settings.ini
else
  echo 'please provide tsdns_settings.ini'
  exit 1
fi

chown -R $TS_USER. $TS_HOME $TS_INJECTS

sudo -i PWD=$TS_HOME -u $TS_USER $TS_HOME/tsdnsserver
