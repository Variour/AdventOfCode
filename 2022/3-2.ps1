$inputs = Get-Content ./3-input.txt

$alphabet = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
$alphabetArray = @()
foreach ($letter in [char[]]$alphabet) { $alphabetArray += $letter }

$score = 0
for ($i = 0; $i -le $inputs.Count - 3; $i += 3) {
    $i
    foreach ($letter in [char[]]$inputs[$i]) {
        "letter: $letter"
        if ([char[]]$inputs[$i + 1] -ccontains $letter) {
            "found in second"
            if ([char[]]$inputs[$i + 2] -ccontains $letter) {
                "found in third"
                $score += [array]::IndexOf($alphabetArray, $letter) + 1
                break
            }
        }
    }
}
$score