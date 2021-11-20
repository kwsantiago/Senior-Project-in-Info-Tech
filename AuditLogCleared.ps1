$sleepTimer = 3600;

while($true) {

Clear-Eventlog -Log Security;

Start-Sleep -s $sleepTimer;

}