<#
.SYNOPSIS
    Recursively scans files in the current directory, excludes certain directories and files,
    and outputs the contents to a file named output.txt.
.DESCRIPTION
    This script searches through all files in the current directory and its subdirectories,
    excluding node_modules, svelte-version, .next, .git directories, and specific files.
    It then outputs each file's path and contents to output.txt.
#>

# Define output file path
$outputFile = ".\output.txt"

# Get all files recursively, excluding specified directories and files
$files = Get-ChildItem -Path . -Recurse -Force -File | 
    Where-Object {
        $_.FullName -notmatch '\\node_modules\\|\\svelte-version\\|\\.next\\|\\.git\\' -and
        $_.Name -notin @('.gitignore', 'package-lock.json', 'output.txt')
    }

# Process each file and write to output
foreach ($file in $files) {
    try {
        $content = Get-Content -LiteralPath $file.FullName -Raw -ErrorAction Stop
        "`n`n===== $($file.FullName) =====`n" + $content | Out-File -FilePath $outputFile -Encoding utf8 -Append
    } 
    catch {
        "`n`n===== $($file.FullName) =====`n[ERROR READING FILE: $($_.Exception.Message)]" | Out-File -FilePath $outputFile -Encoding utf8 -Append
    }
}

Write-Host "File contents have been written to $outputFile"