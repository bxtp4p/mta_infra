#/bin/bash
az login  --service-principal -u $u -p $p --tenant $tenant

export resource_group_name=broyal_ci$CIRCLE_BUILD_NUM
export location=eastus
export storage_account_name=broyalmta

az group create --name $resource_group_name --location $location

search="{{storageAccountKey}}"

sed -i "" "s/${search}/${storageAccountKey}/g" azuredeploy.parameters.json
cat azuredeploy.parameters.json

#cleanup
az group delete --name $resource_group_name