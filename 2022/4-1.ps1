$inputs = Get-Content ./4-input.txt

$overlaps = 0
foreach ($inp in $inputs) {
    $splitPairing = $inp.split(",")
    $splitFirstPair = $splitPairing[0].split("-")
    $splitSecondPair = $splitPairing[1].split("-")
    if (([int]$splitFirstPair[0] -ge [int]$splitSecondPair[0] -and [int]$splitFirstPair[1] -le [int]$splitSecondPair[1]) -or
        ([int]$splitSecondPair[0] -ge [int]$splitFirstPair[0] -and [int]$splitSecondPair[1] -le [int]$splitFirstPair[1])) {
        $overlaps++
        $inp
        [array]::IndexOf($inputs, $inp)
    }
}
$overlaps