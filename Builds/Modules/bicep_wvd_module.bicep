param location string

param hostpoolname string
param hostpooltype string = 'pooled'
param hostpoolfriendlyname string
param loadbalancertype string = 'BreadthFirst'

param appgroupname string
param appgrouppreferredtype string = 'Desktop'
param appgrouptype string = 'Desktop'
param appgroupfriendlyname string

param workspaceName string
param workspacefriendlyname string 

resource hostpool 'Microsoft.DesktopVirtualization/hostPools@2021-09-03-preview' = {
  name: hostpoolname
  location: location
  properties: {
    friendlyName: hostpoolfriendlyname
    hostPoolType: hostpooltype
    loadBalancerType: loadbalancertype
    preferredAppGroupType: appgrouppreferredtype

  }
}

resource appgroup 'Microsoft.DesktopVirtualization/applicationGroups@2021-09-03-preview' = {
  name: appgroupname
  location: location
  properties: {
    friendlyName: appgroupfriendlyname
    applicationGroupType: appgrouptype
    hostPoolArmPath: hostpool.id
  }
}

resource workspace 'Microsoft.DesktopVirtualization/workspaces@2021-09-03-preview' = {
  name: workspaceName
  location: location
  properties: {
    friendlyName: workspacefriendlyname
    applicationGroupReferences: [
      appgroup.id
    ]
    }
}
output workspaceid string = workspace.id
