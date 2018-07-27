#!/bin/sh

RESOURCE_GROUP=$1
ServerNodeCount=$2
ServerVersion=$3
ServerUrl=$4
ServerUser=$5
ServerPassword=$6

echo $ServerUrl
echo $ServerUser
echo $ServerPassword

az group create --name $RESOURCE_GROUP --location westus --output table
az group deployment create --verbose --template-file mainTemplate.json \
--parameters @mainTemplateParameters.json \
serverNodeCount=${ServerNodeCount} \
serverVersion=${ServerVersion} \
serverUrl=${ServerUrl} \
serverUser=${ServerUser} \
serverPassword=${ServerPassword} \
--resource-group $RESOURCE_GROUP --output table
