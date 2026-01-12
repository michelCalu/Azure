param location string

module hub './modules/hub-vnet.bicep' = {
  name: 'hub-network'
  params: {
    location: location
  }
}





module spokes './modules/spoke-network.bicep' = {
  name: 'spokes'
  dependsOn: [ hub ]
  params: {
    location: location
    hubVnetId: hub.outputs.vnetId
  }
}
