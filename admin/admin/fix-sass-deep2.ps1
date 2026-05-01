$files = Get-ChildItem -Path "src/views" -Recurse -Include "*.vue" | Select-String -Pattern "/deep/" | Select-Object -Unique Path

foreach ($file in $files) {
    $content = Get-Content -Path $file.Path -Encoding UTF8
    $newContent = $content -replace '& /deep/', '&::v-deep'
    $newContent = $newContent -replace '\.tables /deep/', '.tables::v-deep'
    Set-Content -Path $file.Path -Value $newContent -Encoding UTF8
    Write-Host "Fixed: $($file.Path)"
}

Write-Host "\nTotal files fixed: $($files.Count)"