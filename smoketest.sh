#!/bin/bash

./ScriptCat.sh
./ScriptCat.sh version
./ScriptCat.sh dummy
./ScriptCat.sh none
./ScriptCat.sh bin_dummy none
./ScriptCat.sh bin_dummy dummy arg1 arg2
./ScriptCat.sh plugin_dummy none
./ScriptCat.sh plugin_dummy dummy none
./ScriptCat.sh plugin_dummy dummy dummy arg1 arg2
./ScriptCat.sh core dummy

