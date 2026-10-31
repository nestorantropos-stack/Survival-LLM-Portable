# Descarga la version oficial de Survival LLM para Windows, comprueba su SHA-256 y la deja en .\programa.
# El motor de IA (Ollama) y el modelo los descarga despues la propia app, dentro de .\datos.
$ErrorActionPreference = 'Stop'
$ProgressPreference = 'SilentlyContinue'

$Version = '0.4.1'
$Url     = "https://github.com/anonnerdfrenzy/survival-llm/releases/download/v$Version/Survival-LLM-windows.zip"
$Sha256  = '3472ce6b4ed13e63b1693622b98078e8a4c01f824326546fb5f7eaa103f9265d'

$Base = $PSScriptRoot
$Zip  = Join-Path $Base 'survival-llm-descarga.zip'
$Tmp  = Join-Path $Base 'programa.partial'
$Dest = Join-Path $Base 'programa'

Write-Host "Descargando Survival LLM $Version (unos 27 MB)..."
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
Invoke-WebRequest -Uri $Url -OutFile $Zip -UseBasicParsing

$got = (Get-FileHash -Algorithm SHA256 $Zip).Hash.ToLower()
if ($got -ne $Sha256) {
    Remove-Item $Zip -Force
    Write-Error "La descarga no coincide con la version oficial (SHA-256 $got). No se instala nada."
}

Write-Host 'Descomprimiendo...'
if (Test-Path $Tmp) { Remove-Item $Tmp -Recurse -Force }
Expand-Archive -Path $Zip -DestinationPath $Tmp
if (Test-Path $Dest) { Remove-Item $Dest -Recurse -Force }
Move-Item (Join-Path $Tmp 'Survival LLM') $Dest
Remove-Item $Tmp -Recurse -Force
Remove-Item $Zip -Force
Write-Host 'Listo.'
