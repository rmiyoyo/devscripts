```powershell
Get-ChildItem -Path . -Recurse -Force -File |
Where-Object {
    $_.FullName -notmatch '\\node_modules\\|\\svelte-version\\|\\.next\\|\\.git\\' -and
    $_.Name -notin @('.gitignore', 'package-lock.json', 'output.txt')
} | ForEach-Object { 
    try {
        "`n`n===== $($_.FullName) =====`n" + (Get-Content -LiteralPath $_.FullName -Raw -ErrorAction Stop)
    } catch {
        "`n`n===== $($_.FullName) =====`n[ERROR READING FILE: $($_.Exception.Message)]"
    }
} | Out-File -FilePath .\output.txt -Encoding utf8
```