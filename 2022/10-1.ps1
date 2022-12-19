$inputs = Get-Content ./10-input.txt

$cyclesToRun = 220
$relevantCycles = @(
    20,
    60,
    100,
    140,
    180,
    220
)
$signalStrength = 0

$x = 1
$cycle = 0
$currentCommand = 0
$cache = $null
for ($cycle = 1; $cycle -le $cyclesToRun; $cycle++) {
    if ($relevantCycles -contains $cycle) {
        $cycle * $x
        $signalStrength += $cycle * $x
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
$signalStrength