$inputs = Get-Content ./6-input.txt

$inputArray = $inputs.ToCharArray()
for ($i = 13; $i -lt $inputArray.Count; $i++) {
    if (-not (($inputs.Substring($i - 13, 14).ToCharArray() | Group-Object -NoElement | Select-Object -ExpandProperty Count) -gt 1)) {
        ($i + 1)
        break
    }
}