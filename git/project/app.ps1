#Variable date
<#
Author: Marcos Silvestrini
Date: 14/02/2023
Description: App writing in powershell language
#>

#Get Services
Get-CimInstance -ClassName Win32_Service | Format-List

#Get Proccess
Get-CimInstance -ClassName Win32_Process | Format-List
