$dayInput = Get-Content .\aoc_4_input.txt

# Get number of rows and columns in input
$numCols = $dayInput[0].ToCharArray().Count
$numRows = $dayInput.Count

$count = 0

# Get all matches horizontally forward
foreach($row in $dayInput) {
    $count = $count + (Select-String -InputObject $row -Pattern "XMAS" -AllMatches).Matches.Count

}

# Get all matches horizontally backward
foreach($row in $dayInput) {
    $count = $count + (Select-String -InputObject $row -Pattern "SAMX" -AllMatches).Matches.Count

}

# Get all matches vertically looking above
for($i = 0; $i -lt $numRows; $i++) {
    if($i -lt 2) {
        # Break iteration because there aren't enough rows above to spell 'XMAS'
        continue
    } else {
        $charArray = $dayInput[$i].ToCharArray()
        for($j = 0; $j -lt $numCols; $j++) {
            if($charArray[$j] -eq 'X') {
                if($dayInput[$i-1].ToCharArray()[$j] -eq 'M') {
                    if($dayInput[$i-2].ToCharArray()[$j] -eq 'A') {
                        if($dayInput[$i-3].ToCharArray()[$j] -eq 'S') {
                            $count++
                        }
                    }
                }
            }
        }
    }
}

# Get all matches vertically looking below
for($i = 0; $i -lt ($numRows-3); $i++) {
    if($i -gt 136) {
        # Break iteration because there aren't enough rows below to spell 'XMAS'
        continue
    } else {
        $charArray = $dayInput[$i].ToCharArray()
        for($j = 0; $j -lt $numCols; $j++) {
            if($charArray[$j] -eq 'X') {
                if($dayInput[$i+1].ToCharArray()[$j] -eq 'M') {
                    if($dayInput[$i+2].ToCharArray()[$j] -eq 'A') {
                        if($dayInput[$i+3].ToCharArray()[$j] -eq 'S') {
                            $count++
                        }
                    }
                }
            }
        }
    }
}

# Get all matches diagonally (forward slash style looking above)
for($i = 0; $i -lt $numRows; $i++) {
    if($i -lt 2) {
        # Break iteration because there aren't enough rows above to spell 'XMAS'
        continue
    } else {
        $charArray = $dayInput[$i].ToCharArray()
        for($j = 0; $j -lt $numCols; $j++) {
            if(($charArray[$j] -eq 'X') -and ($j -lt ($numCols-3))) {
                if($dayInput[$i-1].ToCharArray()[$j+1] -eq 'M') {
                    if($dayInput[$i-2].ToCharArray()[$j+2] -eq 'A') {
                        if($dayInput[$i-3].ToCharArray()[$j+3] -eq 'S') {
                            $count++
                        }
                    }
                }
            }
        }
    }
}

# Get all matches diagonally (forward slash style looking below)
for($i = 0; $i -lt ($numRows-3); $i++) {
    if($i -gt ($numCols-3)) {
        # Break iteration because there aren't enough rows above to spell 'XMAS'
        continue
    } else {
        $charArray = $dayInput[$i].ToCharArray()
        for($j = 0; $j -lt $numCols; $j++) {
            if(($charArray[$j] -eq 'X') -and ($j -gt 2)) {
                if($dayInput[$i+1].ToCharArray()[$j-1] -eq 'M') {
                    if($dayInput[$i+2].ToCharArray()[$j-2] -eq 'A') {
                        if($dayInput[$i+3].ToCharArray()[$j-3] -eq 'S') {
                            $count++
                        }
                    }
                }
            }
        }
    }
}

# Get all matches diagonally (back slash style looking above)
for($i = 0; $i -lt $numRows; $i++) {
    if($i -lt 2) {
        # Break iteration because there aren't enough rows above to spell 'XMAS'
        continue
    } else {
        $charArray = $dayInput[$i].ToCharArray()
        for($j = 0; $j -lt $numCols; $j++) {
            if(($charArray[$j] -eq 'X') -and ($j -gt 2)) {
                if($dayInput[$i-1].ToCharArray()[$j-1] -eq 'M') {
                    if($dayInput[$i-2].ToCharArray()[$j-2] -eq 'A') {
                        if($dayInput[$i-3].ToCharArray()[$j-3] -eq 'S') {
                            $count++
                        }
                    }
                }
            }
        }
    }
}

# Get all matches diagonally (back slash style looking below)
for($i = 0; $i -lt ($numRows-3); $i++) {
    if($i -gt ($numCols-3)) {
        # Break iteration because there aren't enough rows above to spell 'XMAS'
        continue
    } else {
        $charArray = $dayInput[$i].ToCharArray()
        for($j = 0; $j -lt $numCols; $j++) {
            if(($charArray[$j] -eq 'X') -and ($j -lt ($numCols-3))) {
                if($dayInput[$i+1].ToCharArray()[$j+1] -eq 'M') {
                    if($dayInput[$i+2].ToCharArray()[$j+2] -eq 'A') {
                        if($dayInput[$i+3].ToCharArray()[$j+3] -eq 'S') {
                            $count++
                        }
                    }
                }
            }
        }
    }
}

# Output the total count
Write-Host "The total count is: $count"
