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
$FODContent = "$OSDBuilderContent\IsoExtract\Windows 10 1809 FOD x64"
#   Comment out items that are not needed
$FODs = @(
    'Rsat.ActiveDirectory.DS-LDS.Tools~~~~0.0.1.0'
    'Rsat.BitLocker.Recovery.Tools~~~~0.0.1.0'
    'Rsat.CertificateServices.Tools~~~~0.0.1.0'
    'Rsat.DHCP.Tools~~~~0.0.1.0'
    'Rsat.Dns.Tools~~~~0.0.1.0'
    'Rsat.FailoverCluster.Management.Tools~~~~0.0.1.0'
    'Rsat.FileServices.Tools~~~~0.0.1.0'
    'Rsat.GroupPolicy.Management.Tools~~~~0.0.1.0'
    'Rsat.IPAM.Client.Tools~~~~0.0.1.0'
    'Rsat.LLDP.Tools~~~~0.0.1.0'
    'Rsat.NetworkController.Tools~~~~0.0.1.0'
    'Rsat.NetworkLoadBalancing.Tools~~~~0.0.1.0'
    'Rsat.RemoteAccess.Management.Tools~~~~0.0.1.0'
    'Rsat.RemoteDesktop.Services.Tools~~~~0.0.1.0'
    'Rsat.ServerManager.Tools~~~~0.0.1.0'
    'Rsat.Shielded.VM.Tools~~~~0.0.1.0'
    'Rsat.StorageReplica.Tools~~~~0.0.1.0'
    'Rsat.VolumeActivation.Tools~~~~0.0.1.0'
    'Rsat.WSUS.Tools~~~~0.0.1.0'
    'Rsat.StorageMigrationService.Management.Tools~~~~0.0.1.0'
    'Rsat.SystemInsights.Management.Tools~~~~0.0.1.0'
)

$CurrentLog = "$Info\logs\$((Get-Date).ToString('yyyy-MM-dd-HHmmss'))-FOD.log"
Write-Host "MountDirectory: $MountDirectory" -ForegroundColor DarkGray
Write-Host "FODContent: $FODContent" -ForegroundColor DarkGray
Write-Host "CurrentLog: $CurrentLog" -ForegroundColor DarkGray

foreach ($FOD in $FODs) {
    Write-Host "$FOD" -ForegroundColor DarkGray
    Add-WindowsCapability -Path "$MountDirectory" -Name "$FOD" -Source "$FODContent" -LogPath "$CurrentLog" | Out-Null
}