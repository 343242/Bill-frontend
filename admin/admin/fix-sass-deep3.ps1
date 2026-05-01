$files = @(
    "src/components/common/BreadCrumbs.vue",
    "src/components/index/IndexAsideStatic.vue"
)

foreach ($file in $files) {
    if (Test-Path $file) {
        $content = Get-Content -Path $file -Encoding UTF8
        $newContent = $content -replace '& /deep/', '&::v-deep'
        Set-Content -Path $file -Value $newContent -Encoding UTF8
        Write-Host "Fixed: $file"
    } else {
        Write-Host "File not found: $file"
    }
}

Write-Host "\nTotal files fixed: $($files.Count)"