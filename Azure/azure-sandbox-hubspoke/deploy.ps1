$location = "westeurope"

$rgHub    = "rg-prod-hub"
$rgSpokes = "rg-prod-spokes"

Connect-AzAccount
Set-AzContext -Subscription "7943d477-6b73-4819-8500-f9576282c432"

# Resource Groups
New-AzResourceGroup -Name $rgHub -Location $location
New-AzResourceGroup -Name $rgSpokes -Location $location

# Hub deployment
New-AzResourceGroupDeployment `
  -Name "hub-deploy" `
  -ResourceGroupName $rgHub `
  -TemplateFile "./main.bicep" `
  -TemplateParameterObject @{
      location = $location
  }
