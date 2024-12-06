# Read Day 3 input
$dayInput = Get-Content .\aoc_3_input.txt

#Read the input to a single line for the don't and do operations
$singleLineInput = ""
foreach($inputLine in $dayInput) {
    $singleLineInput = $singleLineInput + $inputLine
}

# Create Array List for storing valid mul() statements
$mulList = New-Object System.Collections.ArrayList

# Define regular expression for matching the syntax for mul() statements
$regex = "mul\((\d{1,3}),(\d{1,3})\)"

# Define regular expression for matching 'bad' mul() statements while 'don't()'
# is enabled until the 'do()' is called
$badText = "don\'t\(\)(.*?)do\(\)"

# Define regular expression for matching 'bad' statements after all the 
# 'don't().......do()' pairs have been removed. It finds the first instance of
# 'don't()' and matches everything after it (including it)
$badTextAgain = "don\'t\(\)(.*)"

# Replace statements between (and including) the don't and do pairs with empty strings
while($singleLineInput -match $badText) {
    $singleLineInput = $singleLineInput -replace $badText, ""
}

# Replace statements after the first don't is found with empty string
while($singleLineInput -match $badTextAgain) {
    $singleLineInput = $singleLineInput -replace $badTextAgain, ""
}

# Get valid mul() statements and add them to an Array List
$regmatch = [regex]::Matches($singleLineInput, $regex)
foreach ($match in $regmatch) {
    $mulList.Add($match.Groups[0].Value)
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
