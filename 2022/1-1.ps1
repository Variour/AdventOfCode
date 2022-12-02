$inputs = Get-Content ./1-input.txt

$highest = 0
$current = 0
foreach ($inp in $inputs) {
    if ("" -eq $inp) {
        if ($current -gt $highest) {
            $highest = $current
        }   
        $current = 0
    }
    else {
        $current += $inp
    }
}

$highest