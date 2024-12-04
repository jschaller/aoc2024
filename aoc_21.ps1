Clear-Content .\increasingList.txt
Clear-Content .\decreasingList.txt
# Read in day input to Array List
$dayInput = New-Object System.Collections.ArrayList
Get-Content .\aoc_2_input.txt | % { $dayInput.Add($_)}

# Create increasing Array list
$increasingList = New-Object System.Collections.ArrayList
for($i = 0; $i -lt $dayInput.Count; $i++) {
    $increasingBool = $true
    $numLevels = $dayInput[$i].split(' ').count
    for($levelCount = 0; $levelCount -lt ($numLevels-1); $levelCount++) {
        if([int]$dayInput[$i].split(' ')[$levelCount] -lt [int]$dayInput[$i].split(' ')[$levelCount + 1]) {
            #do nothing
        } else {
            $increasingBool = $false
            break
        }
    }
    if($increasingBool) {
        $increasingList.Add($dayInput[$i])
    }
}

# Create decreasing Array List
$decreasingList = New-Object System.Collections.ArrayList
for($i = 0; $i -lt $dayInput.Count; $i++) {
    $decreasingBool = $true
    $numLevels = $dayInput[$i].split(' ').count
    for($levelCount = 0; $levelCount -lt ($numLevels-1); $levelCount++) {
        if([int]$dayInput[$i].split(' ')[$levelCount] -gt [int]$dayInput[$i].split(' ')[$levelCount + 1]) {
            #do nothing
        } else {
            $decreasingBool = $false
            break
        }
    }
    if($decreasingBool) {
        $decreasingList.Add($dayInput[$i])
    }
}

# Check increasing list levels differ only by 1-3 values and add to safe report count
$numSafeReports = 0
for($i = 0; $i -lt $increasingList.Count; $i++) {
    $safeReport = $true
    $numLevels = $increasingList[$i].split(' ').Count
    for($levelCount = 0; $levelCount -lt ($numLevels - 1); $levelCount++) {
        if(([math]::Abs([int]$increasingList[$i].split(' ')[$levelCount] - [int]$increasingList[$i].split(' ')[$levelCount+1]) -ge 1) -and ([math]::Abs([int]$increasingList[$i].split(' ')[$levelCount] - [int]$increasingList[$i].split(' ')[$levelCount+1]) -le 3)) {
            # do nothing
        } else {
            $safeReport = $false
            break
        }
    }
    if($safeReport) {
        $numSafeReports++
    }
}

# Check decreasing list levels differ only by 1-3 values and add to safe report count
for($i = 0; $i -lt $decreasingList.Count; $i++) {
    $safeReport = $true
    $numLevels = $decreasingList[$i].split(' ').Count
    for($levelCount = 0; $levelCount -lt ($numLevels - 1); $levelCount++) {
        if(([math]::Abs($decreasingList[$i].split(' ')[$levelCount] - $decreasingList[$i].split(' ')[$levelCount+1]) -ge 1) -and ([math]::Abs($decreasingList[$i].split(' ')[$levelCount] - $decreasingList[$i].split(' ')[$levelCount+1]) -le 3)) {
            # do nothing
        } else {
            $safeReport = $false
            break
        }
    }
    if($safeReport) {
        $numSafeReports++
    }
}

# Print output
Write-Host "Number of Safe Reports: $numSafeReports"
