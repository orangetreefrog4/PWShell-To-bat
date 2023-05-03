#   LICENSE:
#
#   This is a piece of software in oranetreefrog4's PWShell Toolset on GitHub at: https://github.com/orangetreefrog4
#   Copyright (C) 2023  Liam Owen/orangetreefrog4
#
#   This program is free software: you can redistribute it and/or modify
#   it under the terms of the GNU General Public License as published by
#   the Free Software Foundation, either version 3 of the License, or
#   (at your option) any later version.
#
#   This program is distributed in the hope that it will be useful,
#   but WITHOUT ANY WARRANTY; without even the implied warranty of
#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#   GNU General Public License for more details.
#
#   You should have received a copy of the GNU General Public License
#   along with this program.  If not, see <https://www.gnu.org/licenses/>.
clear
Write-Output -InputObject "This software is part of orangereefrog4's PWShell Toolset
Copyright (C) 2023  Liam Owen/orangetreefrog4
This program comes with ABSOLUTELY NO WARRANTY; for details type `show w'.
This is free software, and you are welcome to redistribute it
under certain conditions; type `show c' for details."
Start-Sleep -Seconds 1
clear
Write-Output -InputObject "Welcome to orangetreefrog4's PWShell to BAT converter!"
Start-Sleep -Seconds 2
clear
Start-Sleep -Milliseconds 500
$pathtofile = Read-Host -Prompt "Path to File (e.g. ",$HOME,", D:\)(Don't include target filename).
"
clear
$filenameinput = Read-Host -Prompt "Filename of target file (include extension).
"
clear
function Convert-PowerShellToBatch
{
param
(
[Parameter(Mandatory,ValueFromPipeline,ValueFromPipelineByPropertyName)]
[string]
[Alias("FullName")]
$Path
)
process
{
$encoded = [Convert]::ToBase64String([System.Text.Encoding]::Unicode.GetBytes((Get-Content -Path $Path -Raw -Encoding UTF8)))
$newPath = [Io.Path]::ChangeExtension($Path, ".bat")
"@echo off`npowershell.exe -NoExit -encodedCommand $encoded" | Set-Content -Path $newPath -Encoding Ascii
}
}
Get-ChildItem -Path $pathtofile -Name $filenameinput |
Convert-PowerShellToBatch
Write-Output -InputObject "Done!"
Start-Sleep -Seconds 1
Write-Output -InputObject "Please support me by starring my project on GitHub at: https://github.com/orangetreefrog4/PWShell-To-bat/.
  _______
 /       \
| |     | |
|         |
|  └−−−┘  |
 \_______/"