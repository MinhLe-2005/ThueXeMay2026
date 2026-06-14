$jsonPath = "C:\Users\Le Quang Minh\.gemini\antigravity\brain\68e0171a-aeed-4a68-a646-90fa76103a6f\.system_generated\logs\transcript.jsonl"
Get-Content $jsonPath | ForEach-Object {
    if ($_ -match 'multi_replace_file_content' -and $_ -match '\[diff_block_start\]') {
        $obj = $_ | ConvertFrom-Json
        if ($obj.content -ne $null) {
            $lines = $obj.content -split "
"
            $lines | Where-Object { $_.StartsWith("-") } | Set-Content "deleted_lines.txt"
        }
    }
}
(Get-Content "deleted_lines.txt").Count
