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

$highestTreeScore = 0
for ($i = 1; $i -lt ($inputs.Count - 1); $i++) {
    $row = $inputs[$i]
    $splitRow = $inputs[$i].ToCharArray()
    for ($j = 1; $j -lt ($splitRow.Count - 1); $j++) {
        $treeHeight = [int][string]$splitRow[$j]
        $a = 1
        while ([int][string]$row.Substring($j - $a, 1) -lt $treeHeight) {
            $a++
            if (($j - $a) -le 0) {
                break
            }
        }
        $b = 1
        while ([int][string]$row.Substring($j + $b, 1) -lt $treeHeight) {
            $b++
            if (($j + $b) -ge ($row.Length - 1)) {
                break
            }
        }
        $c = 1
        while ($columns[$j][$i - $c] -lt $treeHeight) {
            $c++
            if (($i - $c) -le 0) {
                break
            }
        }
        $d = 1
        while ($columns[$j][$i + $d] -lt $treeHeight) {
            $d++
            if (($i + $d) -ge $columns[$j].Count - 1) {
                break
            }
        }
        $highestTreeScore = ($highestTreeScore, ($a * $b * $c * $d) | Measure-Object -Maximum).Maximum
    }
}
$highestTreeScore