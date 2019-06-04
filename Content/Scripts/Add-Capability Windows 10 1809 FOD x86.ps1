#======================================================================================
#   David Segura
#   http://osdeploy.com
#
#   OSDBuilder Script
#   Version 19.5.31
#
#   Requires IsoExtract Features on Demand in FODContent
#
#   https://docs.microsoft.com/en-us/windows-hardware/manufacture/desktop/features-on-demand-non-language-fod
#======================================================================================
$FODContent = "$OSDBuilderContent\IsoExtract\Windows 10 1809 FOD x86"
#   Comment out items that are not needed
$FODs = @(
    'Microsoft.Onecore.StorageManagement~~~~0.0.1.0'    #Windows Storage Management
    'Microsoft.Windows.StorageManagement~~~~0.0.1.0'    #Windows Storage Management
    'RasCMAK.Client~~~~0.0.1.0'                         #RAS Connection Manager Administration Kit (CMAK)
    'RIP.Listener~~~~0.0.1.0'                           #RIP Listener
    'ServerCore.AppCompatibility~~~~0.0.1.0'            #Server Core App Compatibility
    'SNMP.Client~~~~0.0.1.0'                            #Simple Network Management Protocol
    'WMI-SNMP-Provider.Client~~~~0.0.1.0'               #SNMP WMI Provider
)

$CurrentLog = "$Info\logs\$((Get-Date).ToString('yyyy-MM-dd-HHmmss'))-FOD.log"
Write-Host "MountDirectory: $MountDirectory" -ForegroundColor DarkGray
Write-Host "FODContent: $FODContent" -ForegroundColor DarkGray
Write-Host "CurrentLog: $CurrentLog" -ForegroundColor DarkGray

foreach ($FOD in $FODs) {
    Write-Host "$FOD" -ForegroundColor DarkGray
    Add-WindowsCapability -Path "$MountDirectory" -Name "$FOD" -Source "$FODContent" -LogPath "$CurrentLog" | Out-Null
}