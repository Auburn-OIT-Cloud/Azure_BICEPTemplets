/*
When this BICEP file is deployed, it will created a template that users can select deploy and fill in information. Save this file to a 
location of your choosing and then follow the synax below:


New-AzTemplateSpec `
-ResourceGroupName 'CAW_RG_Bicep_Deployed_WVD' `
-Name NewWVDSetup `
-Location eastus `
-DisplayName 'New WVD Setup' `
-Description "This template spec creates a WVD Host Pool, Application Group, and Workspace." `
-Version '1.0' `
-TemplateFile .\bicep_mainbuild_wvd_template_spec.bicep

This should run automatically when this is pushed to Github
*/

targetScope='subscription'

//Resource group deployment parameters
@description('This is the name of the new or current WVD Resource Group.')
param resourceGroupName string

@description('Choose the location of the Resource Group and WVD setup.')
@allowed([
  'eastus'
  'eastus2'
])
param resourceGroupLocation string

//WVD deployment parameters
@description('This will be the name of the New App group')
param appgroupname string

@description('This is the friendly name of the new App Group')
param appgroupfriendlyname string

@description('Host Pool name')
param hostpoolname string
@description('Friendly hostpool name')
param hostpoolfriendlyname string

@description('WorkspaceName')
param workspacename string
@description('Friendly Workspace Name')
param workspacefriendlyname string


//////////////////////////////NO need to edit below this point/////////////////////////////////////
resource newRG 'Microsoft.Resources/resourceGroups@2021-01-01' = {
  name: resourceGroupName
  location: resourceGroupLocation
}


module wvdfrommod '../Modules/bicep_wvd_module.bicep' = {
  scope: resourceGroup(newRG.name)
  name: 'wvdsetup'  
  params: {
    appgroupfriendlyname: appgroupname
    appgroupname: appgroupfriendlyname
    hostpoolfriendlyname: hostpoolfriendlyname
    hostpoolname: hostpoolname
    workspacefriendlyname: workspacefriendlyname
    workspaceName: workspacename
  }
}
