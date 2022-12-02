$inputs = Get-Content ./1-input.txt

$totals = @()
$current = 0
foreach ($inp in $inputs) {
    if ("" -eq $inp) {
        $totals += $current
        $current = 0
    }
    else {
        $current += $inp
    }
}

($totals | Sort-Object -Descending | Select-Object -First 3 | Measure-Object -Sum).Sum