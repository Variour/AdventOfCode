$inputs = Get-Content ./1-input.txt

$largerMeasurements = 0
for ($i = 1; $i -lt $inputs.Count; $i++) {
    if ([int]$inputs[$i] -gt [int]$inputs[$i - 1]) {
        $largerMeasurements++
    }
}
$largerMeasurements