# The 'max' variable designates the maximum amount of times the loop should be iterated through.
$max = 5
# The 'count' variable is meant to count how many times the loop has been iterated.
$count = 0
# The 'URI' variable is an array of different URIs that will be randomly selected to invoke a web request to.
$URI = 
'https://www.google.com/',
'https://www.facebook.com/',
'https://twitter.com/',
'https://www.bing.com/',
'https://www.slack.com/',
'https://github.com/',
'https://msn.com',
'https://ebay.com',
'https://wikipedia.org',
'8.8.8.8'

[Net.ServicePointManager]::SecurityProtocol = "tls12, tls11, tls"


$URICount = $URI.Count - 1
Write-Output "URI count is $URICount"
Write-Output "Before loop, this loop is scheduled to run $max times."

# So far, this while loop runs on a counter variable, we may be able to change this to state "while(true)" to ensure constant network activity.
# Likely not a safe loop method without a try-catch statement, but I'm unsure as to what that could look like at this time.
while($count -ne $max) {
Write-Output "Loop started"
$URISelected = Get-Random -Minimum 0 -Maximum $URICount
Invoke-WebRequest -UseBasicParsing -Uri $URI[$URISelected]

$count += 1
Write-Output "Current Loop iteration: $count"
Write-Output "The URI fetched was $($URI[$URISelected]), as the URI selected was $URISelected."

# Initialize a sleep counter to randomize how often web requests are made.
$sleepCounter = Get-Random -Minimum 5 -Maximum 10

Write-Output "Sleeping for $sleepCounter seconds."

Start-Sleep -s $sleepCounter
}