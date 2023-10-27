$epic_uri=$args[0]
$process_name=$args[1]

Start-Process $epic_uri
Start-Sleep -seconds 5

$process = Get-Process $process_name
$process.WaitForExit()