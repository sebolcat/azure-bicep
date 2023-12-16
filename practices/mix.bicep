resource storageAccount 'Microsoft.Storage/storageAccounts@2023-01-01' = {
  name: 'adjfjaoeifoeifo'
  location: 'australiasoutheast'
  sku: {
    name: 
  }
  kind: 
}

// NOT best practice when defining a unique name
param appServiceAppName string = 'toy-product-launch-1'

resource appServiceApp 'Microsoft.Web/sites@2023-01-01' = {
  name: appServiceAppName
  location: 'westus3'
  properties: {

  }
}

// Define a variable
var appServiceAppName2 = 'toy-product-launch-2'
resource appServiceApp2 'Microsoft.Web/sites@2023-01-01' = {
  name: appServiceAppName2
  location: 
}

// Expression
param location string = resourceGroup().location
param storageAccountName string = 'toylaunch${uniqueString(resourceGroup().id)}'


// Supporting non-production environments
@allowed([
  'nonprod'
  'prod'
])
param environmentType string

var storageAccountSkuName = (environmentType == 'prod') ? 'Standard_GRS' : 'Standard_LRS'
var appServicePlanSkuName = (environmentType == 'prod') ? 'P2v3' : 'F1'
