//NIC Params
param vmNicName string
param vmNicLocation string = 'eastus'
param ipconfigName string = 'IPConfig'
param parentsubnetid string

@allowed([
  'Dynamic'
  'Static'
])
param ipAllocatMethod string = 'Dynamic'


resource vmNic 'Microsoft.Network/networkInterfaces@2021-05-01' = {
  name: vmNicName
  location: vmNicLocation
  properties: {
    ipConfigurations: [
      {
        name: ipconfigName
        properties: {
          subnet: {
            id: parentsubnetid
          }
          privateIPAllocationMethod: ipAllocatMethod
        }
      }
    ]
  }
}

output nicid string = vmNic.id
