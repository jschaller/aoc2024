# Read Day 3 input
$dayInput = Get-Content .\aoc_3_input.txt

# Create Array List for storing valid mul() statements
$mulList = New-Object System.Collections.ArrayList

# Define regular expression for matching the syntax for mul() statements
$regex = "mul\((\d{1,3}),(\d{1,3})\)"

# Iterate through each line of input and find matching regex values, then store in Array List
foreach($line in $dayInput) {
    $regmatch = [regex]::Matches($line, $regex)
    foreach ($match in $regmatch) {
        $mulList.Add($match.Groups[0].Value)
    }
}

$sum = 0

# Remove non-number values from array item and multiply the two numbers together and add to sum 
foreach($entry in $mulList) {
    $modEntry = $entry.replace('mul(','')
    $modEntry= $modEntry.replace(')','')
    $sum = $sum + ([int]$modEntry.split(',')[0] * [int]$modEntry.split(',')[1])
}

# Output results
Write-Host "The sum is: $sum"
