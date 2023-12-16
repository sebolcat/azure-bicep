@description('The name of the env. This must be dev, test or prod')
@allowed([
  'dev'
  'test'
  'prod'
])
param environmentName string = 'dev'

@description('Solution name for this project')
@minLength(5)
@maxLength(50)
param solutionName string = 'toyhr${uniqueString(resourceGroup().id)}'

@description('Number of app instance')
@minValue(1)
@maxValue(10)
param appServicePlanInstanceCount int = 1

@description('The app sku')
param appServicePlanSku object = {
  name: 'F1'
  tier: 'Free'
}

@description('The default location')
param location string = 'westus3'

@description('Service plan name. A combination of environment name and solution name')
var appServicePlanName = '${environmentName}-${solutionName}-plan'

@description('Service app name. A combination of environment name and solution name')
var appServiceAppName = '${environmentName}-${solutionName}-app'

resource appServicePlan 'Microsoft.Web/serverfarms@2022-03-01' = {
  name: appServicePlanName
  location: location
  sku: {
    name: appServicePlanSku.name
    tier: appServicePlanSku.tier
    capacity: appServicePlanInstanceCount
  }
}

resource appServiceApp 'Microsoft.Web/sites@2022-03-01' = {
  name: appServiceAppName
  location: location
  properties: {
    serverFarmId: appServicePlan.id
    httpsOnly: true
  }
}
