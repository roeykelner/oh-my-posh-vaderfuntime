# oh-my-posh --init --shell pwsh --config C:\Users\roeyk\git_reps\dotfiles-public\.config\powershell\takuya.omp.json | Invoke-Expression
oh-my-posh init pwsh --config C:\Users\roeyk\AppData\Local\Programs\oh-my-posh\themes\takuya_roey.omp.json | Invoke-Expression
Import-Module -Name Terminal-Icons
Set-Alias -Name ll -Value Get-ChildItem
Set-Alias -Name vim -Value nvim
Set-Alias -Name vi -Value nvim
Function gotogit {Set-Location -Path ~\git_reps}
Function profconf {code $PROFILE}

Function lrt {Get-ChildItem | 
	sort LastWriteTime}
Set-Alias themes Get-PoshThemes


# PSReadLine
Set-PSReadLineOption -EditMode Windows
Set-PSReadLineOption -BellStyle None
Set-PSReadLineKeyHandler -Chord 'Ctrl+d' -Function DeleteChar
Set-PSReadLineKeyHandler -Chord 'Ctrl+Alt+f' -ScriptBlock { fzf -e }
Set-PSReadLineKeyHandler -Key Tab -Function Complete
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle ListView
Set-PSReadLineOption -Colors @{
  # Command            = 'Magenta'
  # Number             = 'DarkGray'
  # Member             = 'DarkGray'
  # Operator           = 'DarkGray'
  # Type               = 'DarkGray'
  # Variable           = 'DarkGreen'
  Parameter          = '#6FA0A4'
  # ContinuationPrompt = 'DarkGray'
  # Default            = 'DarkGray'
}

# Fzf
Import-Module PSFzf
Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+f' -PSReadlineChordReverseHistory 'Ctrl+r'

# # Utilities
# Function which ($command) {
#   Get-Command -Name $command -ErrorAction SilentlyContinue |
#     Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue }

# Import the Chocolatey Profile that contains the necessary code to enable
# tab-completions to function for `choco`.
# Be aware that if you are missing these lines from your profile, tab completion
# for `choco` will not function.
# See https://ch0.co/tab-completion for details.
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}

Clear-Host

