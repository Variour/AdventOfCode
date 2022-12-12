$inputs = Get-Content ./8-input.txt

$columns = 0..($inputs.Count - 1)
for ($i = 0; $i -lt $inputs.Count; $i++) {
    $columns[$i] = 0..$($inputs[0].Length - 1)
}
for ($y = 0; $y -lt $inputs.Count; $y++) {
    for ($x = 0; $x -lt $inputs[$y].Length; $x++) {
        $columns[$x][$y] = [int]$inputs[$y].Substring($x, 1)
    }
}

$visibleTrees = ($inputs.Count * 2) + ($inputs[0].Length * 2) - 4
for ($i = 1; $i -lt ($inputs.Count - 1); $i++) {
    $row = $inputs[$i]
    $splitRow = $inputs[$i].ToCharArray()
    for ($j = 1; $j -lt ($splitRow.Count - 1); $j++) {
        $treeHeight = [int][string]$splitRow[$j]
        if (([int[]][string[]][char[]]$row.Substring(0, $j) | Measure-Object -Maximum).Maximum -lt $treeHeight) {
            $visibleTrees++
            continue
        }
        if (([int[]][string[]][char[]]$row.Substring($j + 1) | Measure-Object -Maximum).Maximum -lt $treeHeight) {
            $visibleTrees++
            continue
        }
        if ((($columns[$j][0..($i - 1)] | Measure-Object -Maximum).Maximum) -lt $treeHeight) {
            $visibleTrees++
            continue
        }
        if ((($columns[$j][($i + 1)..($splitRow.Count - 1)] | Measure-Object -Maximum).Maximum) -lt $treeHeight) {
            $visibleTrees++
            continue
        }
    }
}
$visibleTrees