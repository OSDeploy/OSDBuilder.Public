#   David Segura
#   http://osdeploy.com
#
#   OSDBuilder Script
#   Get-Variables.ps1
#	Version 19.3.15
#
#   Displays Variables and Prompts for Enter
#   Useful for Debugging
#======================================================================================
Get-Variable | Select-Object -Property Name, Value | Format-Table
[void](Read-Host 'Press Enter to continue')