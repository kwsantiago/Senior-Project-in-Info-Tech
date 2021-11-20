$dest = "10.0.8.25"; # PLACE VALUE OF ENDPOINT HERE
$sleepTimer = 10 # Set How long the script will sleep for

while($true) {
    for($port = 1430; $port -lt 1440; $port++) {
        try {
        
            $socket = New-Object System.Net.Sockets.TCPClient;
            $status = $socket.ConnectAsync($dest, $port).Wait(1000);
            # Write-Output($status)

            if($status -eq $true) {
                Write-Output("Successully connected to port $port on destination $dest");
            }
            else {
                Write-Output("Failed to connect to port $port on destination $dest");
            }

            $socket.Close();
            $socket.Dispose();

        }
        catch {
            Write-Output($_);
            $socket.Close();
            $socket.Dispose();
        }
    }

    Start-Sleep -s $sleepTimer
}