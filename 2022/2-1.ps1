$inputs = Get-Content ./2-input.txt

$resultPoints = @{
    A = @{
        X = 3
        Y = 6
        Z = 0
    }
    B = @{
        X = 0
        Y = 3
        Z = 6
    }
    C = @{
        X = 6
        Y = 0
        Z = 3
    }
}
$selectionPoints = @{
    X = 1
    Y = 2
    Z = 3
}
$points = 0
foreach ($inp in $inputs) {
    $splitInput = $inp.split(" ")
    $points += $resultPoints[$splitInput[0]][$splitInput[1]]
    $points += $selectionPoints[$splitInput[1]]
}
$points