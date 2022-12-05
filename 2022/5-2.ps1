$inputs = Get-Content ./5-input.txt

#find empty line
$i = 0
while ($inputs[$i] -ne "") {
    $i++
}

#initialize stacks
$stacks = @{}
foreach ($column in $inputs[$i - 1].split('   ').Trim()) {
    $stacks[$column] = New-Object System.Collections.Stack
}

#add initial content to stacks  
for ($j = $i - 2; $j -gt -1; $j--) {
    $rowContainers = $inputs[$j].replace('    ', ' [empty]')
    $rowContainers = $rowContainers.split(' ')
    for ($k = 0; $k -lt $rowContainers.Count; $k++) {
        if ($rowContainers[$k] -ne "[empty]") {
            $stacks[[string]($k + 1)].Push($rowContainers[$k])
        }
    }
}

$i++
for ($i; $i -lt $inputs.Count; $i++) {
    $action = $inputs[$i].split(' ')
    $tempStack = New-Object System.Collections.Stack
    for ($j = 0; $j -lt $action[1]; $j++) {
        $tempStack.Push($stacks[[string]$action[3]].Pop())
    }
    while ($tempStack.count -gt 0) {
        $stacks[[string]$action[5]].Push($tempStack.Pop())
    }
}

$outputString = ""
for ($i = 0; $i -lt $stacks.Count; $i++) {
    $outputString += [string]$stacks[[string]($i + 1)].Pop()
}
$outputString