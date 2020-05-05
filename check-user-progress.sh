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

  echo "Description: This script shows progress information of one user"
  echo ""
  echo "Usage: $0 [user_number]"
  echo ""
  echo "Example: $0 3"
  echo "Possible values for environment:"
  echo "  -h | --help   Prints usage information"
  exit 1
}

red=`tput setaf 1`
green=`tput setaf 2`
reset=`tput sgr0`

# Step 2: Parser Input Parameters
while [ $# -gt 0 ]
do
  case $1 in
    -h | --help )   usage_info
                    ;;
    *[!0-9]*)       usage_info
                    ;;
    * )             workspace_user=$1
  esac
  shift
done

echo "Checking progress of user$workspace_user"


# Step 6: Deploying Your First Container Image
echo "Checking step 6: Deploying Your First Container Image"
app_name=parksmap

# Check DC
oc get dc $app_name -n user${workspace_user} &>/dev/null 
if [ $? -eq 0 ]; then
    echo "Step 6: ${green}DeploymentConfig $app_name is present${reset}"
else
    echo "Step 6: ${red}DeploymentConfig $app_name is missing${reset}"
fi

# Check SVC
oc get svc $app_name -n user${workspace_user} &>/dev/null 
if [ $? -eq 0 ]; then
    echo "Step 6: ${green}Service $app_name is present${reset}"
else
    echo "Step 6: ${red}Service $app_name is missing${reset}"
fi


# Step 7: Scaling and Self Healing
echo "Checking step 7: Scaling and Self Healing"
app_name=parksmap













# get_pods_output=$(oc get pods -n user${workspace_user} | grep $app_name | grep -v deploy | grep Running | wc -l)
# get_svcs_output=$(oc get svc -n user${workspace_user}  | grep $app_name | wc -l)

# if [ $get_pods_output -lt 1 ]; then 
#   echo -e "Step 6: ${red}$get_pods_output out of $USERS logged in${reset}"
# else 
#   echo -e "Step 6: ${green}All the users are logged in!${reset}"
# fi

