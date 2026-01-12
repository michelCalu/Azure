param(
    [string]$ResourceGroupName = "rg-test-git",
    [string]$Location = "francecentral"
)

Connect-AzAccount

New-AzResourceGroup `
  -Name $ResourceGroupName `
  -Location $Location

New-AzResourceGroupDeployment `
  -ResourceGroupName $ResourceGroupName `
  -TemplateFile "../bicep/main.bicep" `
  -TemplateParameterFile "../parameters/sandbox.parameters.json"
 