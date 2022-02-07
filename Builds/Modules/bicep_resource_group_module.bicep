targetScope='subscription'

@description('This is the name of the new or current WVD Resource Group.')
param resourceGroupName string

@description('Choose the location of the Resource Group and WVD setup.')
@allowed([
  'eastus'
  'eastus2'
])
param resourceGroupLocation string

resource newRG 'Microsoft.Resources/resourceGroups@2021-01-01' = {
  name: resourceGroupName
  location: resourceGroupLocation
}
