# using dbatools for running commands, see here: https://github.com/chocolatey/choco/issues/640
Import-Module -Name 'DbaTools' -DisableNameChecking

$SrcTemplatesFolder = "$PSScriptRoot/../content"

Write-Verbose -Message "Getting destination template folder location"
# $DstTemplatesFolder = (Invoke-Sqlcmd2 -ServerInstance $env:COMPUTERNAME -Query $Query).TemplateLocation
$DstTemplatesFolder = "$env:Temp/templates"
Write-Verbose -Message "Source template folder: $SrcTemplatesFolder"
Write-Verbose -Message "Destination template folder: $DstTemplatesFolder"

if (Test-Path -Path $DstTemplatesFolder) {
    Write-Verbose -Message "Starting file copy"
    robocopy $SrcTemplatesFolder $DstTemplatesFolder /R:3 /W:5 /E /NP
    if ($LASTEXITCODE -gt 7) {
        exit 1
    }
}
else {
    throw 'Destination folder does not exist'
    exit 1
}
exit 0
