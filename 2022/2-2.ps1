$inputs = Get-Content ./2-input.txt

$pointLookUp = @{
    A = @{
        X = 3
        Y = 4
        Z = 8
    }
    B = @{
        X = 1
        Y = 5
        Z = 9
    }
    C = @{
        X = 2
        Y = 6
        Z = 7
    }
}
$points = 0
foreach ($inp in $inputs) {
    $splitInput = $inp.split(" ")
    $points += $pointLookUp[$splitInput[0]][$splitInput[1]]
}
$points