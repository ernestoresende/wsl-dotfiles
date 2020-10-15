
# This should be executed in PowerShell with administrator previleges.

# Bridges WSL and Windows proxy in order for Android Device Bridge to work as a server outlet to anything being built
# in WSL with the --emulator flag. The ADB server shoulb be running on Windows on build time.

iex "netsh interface portproxy delete v4tov4 listenport=8081 listenaddress=127.0.0.1"
$WSL_CLIENT = bash.exe -c "ifconfig eth0 | grep 'inet '"
$WSL_CLIENT -match '\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}'
$WSL_CLIENT = $matches[0]
iex "netsh interface portproxy add v4tov4 listenport=8081 
listenaddress=127.0.0.1 connectport=8081 connectaddress=$WSL_CLIENT"

# After redirecting, run adb on PowerShell and keep it running during development

# adb kill-server
# adb -a -P 5037 nodaemon server
