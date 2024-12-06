<#
Examples of X-Mas crosses:

 Ex1    Ex2     Ex3    Ex4
---------------------------
M.M  |  M.S  |  S.S  |  S.M
.A.  |  .A.  |  .A.  |  .A.
S.S  |  M.S  |  M.M  |  S.M

#>

$dayInput = Get-Content .\aoc_4_input.txt

# Get number of rows and columns in input
$numCols = $dayInput[0].ToCharArray().Count
$numRows = $dayInput.Count

$count = 0

# Find Ex1 cases
for($i = 0; $i -lt $numRows; $i++) {
    if(($i -lt 1) -or ($i -gt ($numRows-2))) {
        # Break iteration as there isn't enough rows to form an X
        continue
    } else {
        $charArray = $dayInput[$i].ToCharArray()
        for($j = 0; $j -lt $numCols; $j++) {
            if(($charArray[$j] -eq 'A') -and ($j -lt ($numCols-1)) -and ($j -gt 0)) {
                if(
                    ($dayInput[$i-1].ToCharArray()[$j-1] -eq 'M') -and
                    ($dayInput[$i-1].ToCharArray()[$j+1] -eq 'M') -and
                    ($dayInput[$i+1].ToCharArray()[$j-1] -eq 'S') -and
                    ($dayInput[$i+1].ToCharArray()[$j+1] -eq 'S')
                    ) {
                        $count++
                    }
            }
        }
    }
}

# Find Ex2 cases
for($i = 0; $i -lt $numRows; $i++) {
    if(($i -lt 1) -or ($i -gt ($numRows-2))) {
        # Break iteration as there isn't enough rows to form an X
        continue
    } else {
        $charArray = $dayInput[$i].ToCharArray()
        for($j = 0; $j -lt $numCols; $j++) {
            if(($charArray[$j] -eq 'A') -and ($j -lt ($numCols-1) -and ($j -gt 0))) {
                if(
                    ($dayInput[$i-1].ToCharArray()[$j-1] -eq 'M') -and
                    ($dayInput[$i-1].ToCharArray()[$j+1] -eq 'S') -and
                    ($dayInput[$i+1].ToCharArray()[$j-1] -eq 'M') -and
                    ($dayInput[$i+1].ToCharArray()[$j+1] -eq 'S')
                    ) {
                        $count++
                    }
            }
        }
    }
}

# Find Ex3 cases
for($i = 0; $i -lt $numRows; $i++) {
    if(($i -lt 1) -or ($i -gt ($numRows-2))) {
        # Break iteration as there isn't enough rows to form an X
        continue
    } else {
        $charArray = $dayInput[$i].ToCharArray()
        for($j = 0; $j -lt $numCols; $j++) {
            if(($charArray[$j] -eq 'A') -and ($j -lt ($numCols-1) -and ($j -gt 0))) {
                if(
                    ($dayInput[$i-1].ToCharArray()[$j-1] -eq 'S') -and
                    ($dayInput[$i-1].ToCharArray()[$j+1] -eq 'S') -and
                    ($dayInput[$i+1].ToCharArray()[$j-1] -eq 'M') -and
                    ($dayInput[$i+1].ToCharArray()[$j+1] -eq 'M')
                    ) {
                        $count++
                    }
            }
        }
    }
}

# Find Ex4 cases
for($i = 0; $i -lt $numRows; $i++) {
    if(($i -lt 1) -or ($i -gt ($numRows-2))) {
        # Break iteration as there isn't enough rows to form an X
        continue
    } else {
        $charArray = $dayInput[$i].ToCharArray()
        for($j = 0; $j -lt $numCols; $j++) {
            if(($charArray[$j] -eq 'A') -and ($j -lt ($numCols-1) -and ($j -gt 0))) {
                if(
                    ($dayInput[$i-1].ToCharArray()[$j-1] -eq 'S') -and
                    ($dayInput[$i-1].ToCharArray()[$j+1] -eq 'M') -and
                    ($dayInput[$i+1].ToCharArray()[$j-1] -eq 'S') -and
                    ($dayInput[$i+1].ToCharArray()[$j+1] -eq 'M')
                    ) {
                        $count++
                    }
            }
        }
    }
}

# Output the total count
Write-Host "The total count is: $count"
