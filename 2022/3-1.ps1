$inputs = Get-Content ./3-input.txt

$alphabet = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
$alphabetArray = @()
foreach ($letter in [char[]]$alphabet) { $alphabetArray += $letter }

$score = 0
:inputloop foreach ($inp in $inputs) {
    foreach ($letter in [char[]]$inp.Substring(0, $inp.length / 2)) {
        if ([char[]]$inp.Substring($inp.length / 2) -ccontains [string]$letter) {
            $score += [array]::IndexOf($alphabetArray, $letter) + 1
            continue inputloop
        }
    }
}
$score