$inputs = Get-Content ./9-input.txt

$headPosition = [PSCustomObject]@{
    X = 0
    Y = 0
}
$tailPosition = [PSCustomObject]@{
    X = 0
    Y = 0
}
$tailPositions = @()
$tailPositions += $tailPosition
foreach ($inp in $inputs) {
    $direction = $inp.Split(" ")[0]
    $count = $inp.Split(" ")[1]
    for ($i = 0; $i -lt $count; $i++) {
        switch ($direction) {
            "U" { $headPosition.Y++ }
            "D" { $headPosition.Y-- }
            "L" { $headPosition.X-- }
            "R" { $headPosition.X++ }
        }
        $xDelta = $tailPosition.X - $headPosition.X
        $yDelta = $tailPosition.Y - $headPosition.Y

        $xMove = $false
        $yMove = $false
        if ([Math]::Abs($xDelta) -eq 2) {
            $xDelta -lt 0 ? $tailPosition.X++ : $tailPosition.X-- | Out-Null
            $xMove = $true
            if ([Math]::Abs($yDelta) -eq 1) {
                $yDelta -lt 0 ? $tailPosition.Y++ : $tailPosition.Y-- | Out-Null
                $yMove = $true
            }
        }
        if ([Math]::Abs($yDelta) -eq 2 -and (-not $yMove)) {
            $yDelta -lt 0 ? $tailPosition.Y++ : $tailPosition.Y-- | Out-Null
            if ([Math]::Abs($xDelta) -eq 1 -and (-not $xMove)) {
                $xDelta -lt 0 ? $tailPosition.X++ : $tailPosition.X-- | Out-Null
            }
        }

        $tailPositions += [System.Management.Automation.PSSerializer]::Deserialize([System.Management.Automation.PSSerializer]::Serialize($tailPosition))
    }
}
($tailPositions | Select-Object -Unique -Property X,Y).Count