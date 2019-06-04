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
$FODContent = "$OSDBuilderContent\IsoExtract\Windows 10 1903 FOD x64"
#   Comment out items that are not needed
$FODs = @(
    'Rsat.ActiveDirectory.DS-LDS.Tools~~1.0'
    'Rsat.BitLocker.Recovery.Tools~~1.0'
    'Rsat.CertificateServices.Tools~~1.0'
    'Rsat.DHCP.Tools~~1.0'
    'Rsat.Dns.Tools~~1.0'
    'Rsat.FailoverCluster.Management.Tools~~1.0'
    'Rsat.FileServices.Tools~~1.0'
    'Rsat.GroupPolicy.Management.Tools~~1.0'
    'Rsat.IPAM.Client.Tools~~1.0'
    'Rsat.LLDP.Tools~~1.0'
    'Rsat.NetworkController.Tools~~1.0'
    'Rsat.NetworkLoadBalancing.Tools~~1.0'
    'Rsat.RemoteAccess.Management.Tools~~1.0'
    'Rsat.RemoteDesktop.Services.Tools~~1.0'
    'Rsat.ServerManager.Tools~~1.0'
    'Rsat.Shielded.VM.Tools~~1.0'
    'Rsat.StorageReplica.Tools~~1.0'
    'Rsat.VolumeActivation.Tools~~1.0'
    'Rsat.WSUS.Tools~~1.0'
    'Rsat.StorageMigrationService.Management.Tools~~1.0'
    'Rsat.SystemInsights.Management.Tools~~1.0'
)

$CurrentLog = "$Info\logs\$((Get-Date).ToString('yyyy-MM-dd-HHmmss'))-FOD.log"
Write-Host "MountDirectory: $MountDirectory" -ForegroundColor DarkGray
Write-Host "FODContent: $FODContent" -ForegroundColor DarkGray
Write-Host "CurrentLog: $CurrentLog" -ForegroundColor DarkGray

foreach ($FOD in $FODs) {
    Write-Host "$FOD" -ForegroundColor DarkGray
    Add-WindowsCapability -Path "$MountDirectory" -Name "$FOD" -Source "$FODContent" -LogPath "$CurrentLog" | Out-Null
}