$inputs = Get-Content ./7-input.txt

$currentPath = ""
$folders = @{}
foreach ($inp in $inputs) {
    $splitInput = $inp.split(" ")
    switch ($splitInput[0]) {
        "$" { 
            if ($splitInput[1] -eq "cd") {
                if ($splitInput[2].StartsWith("/")) {
                    $currentPath = $splitInput[2]
                }
                elseif ($splitInput[2] -eq "..") {
                    $currentPath = $currentPath.substring(0, $currentPath.Length - 1)
                    $currentPath = $currentPath.substring(0, $currentPath.LastIndexOf("/") + 1)
                }
                else {
                    $currentPath = $currentPath + $splitInput[2] + "/"
                }
                if ($folders.Keys -notcontains $currentPath) {
                    $folders[$currentPath] = 0
                }
            }
        }
        "dir" {}
        default {
            $keys = @()
            $keys += $folders.Keys
            foreach ($folder in $keys) {
                if ($currentPath.StartsWith($folder)) {
                    $folders[$folder] = $folders[$folder] + $splitInput[0]
                }
            }

        }
    }
}
$totalSpace = 70000000
$spaceNeeded = 30000000
$spaceToFreeUp = $spaceNeeded - ($totalSpace - $folders["/"])
$folders.Values | Where-Object { $_ -ge $spaceToFreeUp } | Sort-Object | Select-Object -First 1 