$inputs = Get-Content ./10-input.txt

$cyclesToRun = 240
$output = ""
$x = 1
$currentCommand = 0
$cache = $null
for ($cycle = 1; $cycle -le $cyclesToRun; $cycle++) {
    if (($x - 1)..($x + 1) -contains (($cycle - 1) % 40)) {
        $output += "#"
    }
    else {
        $output += "."
    }
    if (-not ($cycle % 40)) {
        $output += "`n"
    }
    if ($cache) {
        $x += $value
        $cache = $null
        $currentCommand++
    }
    else {
        if ($inputs[$currentCommand]) {
            $command = $inputs[$currentCommand].Split(" ")[0]
            switch ($command) {
                "addx" {
                    $cache = $command
                    $value = [int]$inputs[$currentCommand].Split(" ")[1]
                }
                default {
                    $currentCommand++
                }
            }
        }
    }
}
$output