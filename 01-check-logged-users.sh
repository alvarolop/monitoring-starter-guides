#!/bin/bash
#
# ============================================================
# Alvaro Lopez Medina
#
# Created-------: 20200504
# ============================================================
# Description--: 
#
# ============================================================
#
# ============================================================
# Pre Steps---:
# chmod 774 *.sh
# ============================================================
#
#
#
# EOH

# Define functions
function usage_info(){

  echo "Description: This script shows users that already logged in"
  echo ""
  echo "Usage: $0 [#_of_users]"
  echo ""
  echo "Example: $0 3"
  echo "Possible values for environment:"
  echo "  -h | --help   Prints usage information"
  exit 1
}

red=`tput setaf 1`
green=`tput setaf 2`
reset=`tput sgr0`


# Step 1: Parser Input Parameters
while [ $# -gt 0 ]
do
  case $1 in
    -h | --help )   usage_info
                    ;;
    *[!0-9]*)       usage_info
                    ;;
    * )             USERS=$1
  esac
  shift
done

# MAIN

users_output=$(oc get users)
my_var=`echo "$users_output" | wc -l`

echo "$users_output"
if [ $((my_var-2)) -lt $USERS ]; then 
  echo -e "${red}$((my_var-2)) out of $USERS logged in${reset}"
else 
  echo -e "${green}All the users are logged in!${reset}"
fi


