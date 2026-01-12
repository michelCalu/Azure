param location string
param hubVnetId string

var spokes = [
  {
    name: 'vnet-prod-spoke1'
    address: '10.110.0.0/16'
  }
  {
    name: 'vnet-prod-spoke2'
    address: '10.120.0.0/16'
  }
]

resource spokeVnets 'Microsoft.Network/virtualNetworks@2023-05-01' = [for s in spokes: {
  name: s.name
  location: location
  properties: {
    addressSpace: {
      addressPrefixes: [ s.address ]
    }
  }
}]

resource peeringToHub 'Microsoft.Network/virtualNetworks/virtualNetworkPeerings@2023-05-01' = [for (s, i) in spokes: {
  name: '${spokeVnets[i].name}/to-hub'
  properties: {
    remoteVirtualNetwork: {
      id: hubVnetId
    }
    allowForwardedTraffic: true
    allowGatewayTransit: false
  }
}]
