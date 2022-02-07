//CAW_Bicep_Testing
param RGName string = 'CAW_Bicep_Testing'

@allowed([
  'OIT_Network_ExpressRoute_TestDev_RG/default_subnet'
])
param vnetsubnet string
param location string = 'eastus'

//VM params
@minLength(1)
@maxLength(15)
param vmName string

@allowed([
  'Basic_A0'
  'Basic_A1'
  'Basic_A2'
  'Basic_A3'
  'Basic_A4'
  'Standard_A0'
  'Standard_A1'
  'Standard_A10'
  'Standard_A11'
  'Standard_A1_v2'
  'Standard_A2'
  'Standard_A2_v2'
  'Standard_A2m_v2'
  'Standard_A3'
  'Standard_A4'
  'Standard_A4_v2'
  'Standard_A4m_v2'
  'Standard_A5'
  'Standard_A6'
  'Standard_A7'
  'Standard_A8'
  'Standard_A8_v2'
  'Standard_A8m_v2'
  'Standard_A9'
  'Standard_B1ms'
  'Standard_B1s'
  'Standard_B2ms'
  'Standard_B2s'
  'Standard_B4ms'
  'Standard_B8ms'
  'Standard_D1'
  'Standard_D11'
  'Standard_D11_v2'
  'Standard_D12'
  'Standard_D12_v2'
  'Standard_D13'
  'Standard_D13_v2'
  'Standard_D14'
  'Standard_D14_v2'
  'Standard_D15_v2'
  'Standard_D16_v3'
  'Standard_D16s_v3'
  'Standard_D1_v2'
  'Standard_D2'
  'Standard_D2_v2'
  'Standard_D2_v3'
  'Standard_D2s_v3'
  'Standard_D3'
  'Standard_D32_v3'
  'Standard_D32s_v3'
  'Standard_D3_v2'
  'Standard_D4'
  'Standard_D4_v2'
  'Standard_D4_v3'
  'Standard_D4s_v3'
  'Standard_D5_v2'
  'Standard_D64_v3'
  'Standard_D64s_v3'
  'Standard_D8_v3'
  'Standard_D8s_v3'
  'Standard_DS1'
  'Standard_DS11'
  'Standard_DS11_v2'
  'Standard_DS12'
  'Standard_DS12_v2'
  'Standard_DS13'
  'Standard_DS13-2_v2'
  'Standard_DS13-4_v2'
  'Standard_DS13_v2'
  'Standard_DS14'
  'Standard_DS14-4_v2'
  'Standard_DS14-8_v2'
  'Standard_DS14_v2'
  'Standard_DS15_v2'
  'Standard_DS1_v2'
  'Standard_DS2'
  'Standard_DS2_v2'
  'Standard_DS3'
  'Standard_DS3_v2'
  'Standard_DS4'
  'Standard_DS4_v2'
  'Standard_DS5_v2'
  'Standard_E16_v3'
  'Standard_E16s_v3'
  'Standard_E2_v3'
  'Standard_E2s_v3'
  'Standard_E32-16_v3'
  'Standard_E32-8s_v3'
  'Standard_E32_v3'
  'Standard_E32s_v3'
  'Standard_E4_v3'
  'Standard_E4s_v3'
  'Standard_E64-16s_v3'
  'Standard_E64-32s_v3'
  'Standard_E64_v3'
  'Standard_E64s_v3'
  'Standard_E8_v3'
  'Standard_E8s_v3'
  'Standard_F1'
  'Standard_F16'
  'Standard_F16s'
  'Standard_F16s_v2'
  'Standard_F1s'
  'Standard_F2'
  'Standard_F2s'
  'Standard_F2s_v2'
  'Standard_F32s_v2'
  'Standard_F4'
  'Standard_F4s'
  'Standard_F4s_v2'
  'Standard_F64s_v2'
  'Standard_F72s_v2'
  'Standard_F8'
  'Standard_F8s'
  'Standard_F8s_v2'
  'Standard_G1'
  'Standard_G2'
  'Standard_G3'
  'Standard_G4'
  'Standard_G5'
  'Standard_GS1'
  'Standard_GS2'
  'Standard_GS3'
  'Standard_GS4'
  'Standard_GS4-4'
  'Standard_GS4-8'
  'Standard_GS5'
  'Standard_GS5-16'
  'Standard_GS5-8'
  'Standard_H16'
  'Standard_H16m'
  'Standard_H16mr'
  'Standard_H16r'
  'Standard_H8'
  'Standard_H8m'
  'Standard_L16s'
  'Standard_L32s'
  'Standard_L4s'
  'Standard_L8s'
  'Standard_M128-32ms'
  'Standard_M128-64ms'
  'Standard_M128ms'
  'Standard_M128s'
  'Standard_M64-16ms'
  'Standard_M64-32ms'
  'Standard_M64ms'
  'Standard_M64s'
  'Standard_NC12'
  'Standard_NC12s_v2'
  'Standard_NC12s_v3'
  'Standard_NC24'
  'Standard_NC24r'
  'Standard_NC24rs_v2'
  'Standard_NC24rs_v3'
  'Standard_NC24s_v2'
  'Standard_NC24s_v3'
  'Standard_NC6'
  'Standard_NC6s_v2'
  'Standard_NC6s_v3'
  'Standard_ND12s'
  'Standard_ND24rs'
  'Standard_ND24s'
  'Standard_ND6s'
  'Standard_NV12'
  'Standard_NV24'
  'Standard_NV6'
])
param vmSize string

param adminUsername string
@secure()
param adminPassword string

@allowed([
  'TestDev_Network_ExpRoute_RG'
])
param VNetRGName string

@allowed([
  'Empty'
  'Attach'
  'FromImage'
])
param diskCreateOption string = 'FromImage'

@allowed([
  'Standard_LRS'
])
param diskStorType string
param numberofvms int
param seqstartnumber int = 1
var configurationScriptWVD = 'Add-WVDHostToHostpoolSpringV2.ps1'
param assetLocation string = 'https://github.com/Auburn-OIT-Cloud/Azure_BICEPTemplets/blob/8ea0a8a414a60401f36ab9537f6f624a4279c1d2/Builds/PowerShell_Scripts/'
@secure()
param registrationKey string

module rg '../Modules/bicep_resource_group_module.bicep' = {
  scope: subscription()
  name: RGName
  params: {
    resourceGroupLocation: location
    resourceGroupName: RGName
  }
}

resource vnetsubnetparent 'Microsoft.Network/virtualNetworks/subnets@2021-05-01' existing = {
  name: vnetsubnet
  scope: resourceGroup(VNetRGName)
}


resource virtualMachine 'Microsoft.Compute/virtualMachines@2021-07-01' = [for i in range(0, numberofvms): {
  name: '${vmName}-${(i+seqstartnumber)}'
  location: location
  properties: {
    hardwareProfile: {
      vmSize: vmSize
    }
    osProfile: {
      computerName: '${vmName}-${(i+seqstartnumber)}'
      adminUsername: adminUsername
      adminPassword: adminPassword
    }
    storageProfile: {
      imageReference: {
        publisher: 'MicrosoftWindowsDesktop'
        offer: 'Windows-10'
        sku: '21h1-ent'
        version: 'latest'
      }
      osDisk: {
        createOption: diskCreateOption
        managedDisk: {
          storageAccountType: diskStorType
        }
      }
    }
    networkProfile: {
      networkInterfaces: [
        {
          id: nic[i].outputs.nicid
        }
      ]
    } 
    }
}]

module nic '../Modules/bicep_nic_build_module.bicep' = [for i in range(0,numberofvms): {
  name: 'Build_NIC-${i+seqstartnumber}'
  scope: resourceGroup(RGName)
  params: {
    parentsubnetid: vnetsubnetparent.id
    vmNicName: '${vmName}-NIC-${i+seqstartnumber}'
  }
}]

resource wvdext 'Microsoft.Compute/virtualMachines/extensions@2021-07-01' = [for i in range(0, numberofvms): {
  name: '${virtualMachine[i].name}/wvd'
  location: location
  properties: {
    publisher: 'Microsoft.Compute'
    type: 'CustomScriptExtension'
    typeHandlerVersion: '1.8'
    autoUpgradeMinorVersion: true
    settings: {
      fileUris: [
        '${assetLocation}${configurationScriptWVD}'
      ]
    }
    protectedSettings: {
      commandtoExecute: 'powershell.exe -ExecutionPolicy Unrestricted -File ${configurationScriptWVD} ${registrationKey} >> ${configurationScriptWVD}.log 2>&1'
    }
  }
}]
