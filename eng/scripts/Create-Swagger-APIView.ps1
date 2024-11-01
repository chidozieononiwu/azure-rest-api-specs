
<#
.DESCRIPTION


.PARAMETER ArtifactName
  Temporary directory for files being processed. Use $(Agent.TempDirectory) on DevOps

#>
param (
    [Parameter(Mandatory = $true)]
    [string]$ArtiFactsStagingDirectory,
    [Parameter(Mandatory = $true)]
    [string]$APIViewArtifactsDirectoryName
)

. "$PSScriptRoot/Logging-Functions.ps1"

$apiViewArtifactsDirectory = [System.IO.Path]::Combine($ArtiFactsStagingDirectory, $APIViewArtifactsDirectoryName)
$publishedFiles = Get-ChildItem -Path $apiViewArtifactsDirectory -Directory -ErrorAction SilentlyContinue

$publishedFiles | ForEach-Object {
  LogInfo $_.FullName
}
