# Why use this?
Because setting up a WSL development environment is kind of a pain in the ass. I want to make it less of a pain in the ass.

## Necessary boilerplate
### 1. Install WSL
- Turn on "Virtual Machine Platform" and "Windows Subsystem for Linux" on Windows Features.
- Set the default version to WSL2: `wsl --set-default-version 2`
- Download a distro from the Windows Store.
- Since you're there, grab Windows Terminal as well.
- Run the disto, set the user, update the distro, all that boring shit.

### 2. Install Android Studio on Windows side
- Download it from [here](https://developer.android.com/studio).
- Set the environment variables in "Edit System Environment Variables".

``` powershell
# Add a user scoped varibale with the value:
%ANDROID_HOME%C:\Users\<myuser>\AppData\Local\Android\Sdk

# Under PATH -> Edit, add the new entries:
%ANDROID_HOME%\platform-tools
%ANDROID_HOME%\tools
```

### 3. Configure the environment on WSL:

- Basic shit:

``` bash
# Make bash less horrible and forget about zsh:

bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)"

# NVM, Node, NPM
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.2/install.sh | bash

# Add to .bashrc if needed:
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

# Yarn
npm install -g yarn

# Make yarn global
export PATH="$(yarn global bin):$PATH"
``` 

- An automatic Git configuration script can be found on `git-config`. Give your user the right permissions to run it with `chmod +x scriptname.sh` and run it to easilly setup Git and spit a new SSH key for that WSL instance.

### 4. Android Studio on WSL side
- Download [here](https://developer.android.com/studio).
- Unzip the linux binary under an `Android` directory on the home path.
- Set the environment variables on `.bashrc`:

``` bash
export JAVA_HOME="/usr/lib/jvm/java-8-openjdk-amd64/jre"

export ANDROID_HOME=$HOME/Android
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/cmdline-tools/tools:$PATH
export PATH=$PATH:$ANDROID_HOME/cmdline-tools/tools/bin:$PATH
export PATH=$PATH:$ANDROID_HOME/platform-tools:$PATH

export WSL_HOST=$(tail -1 /etc/resolv.conf | cut -d' ' -f2)

# Uncomment this whenever you need to use ADB on Windows side to run Android applications on AVD's.
# export ADB_SERVER_SOCKET=tcp:$WSL_HOST:5037
```

- In Powershell with adm permissions:

``` powershell
iex "netsh interface portproxy delete v4tov4 listenport=8081 listenaddress=127.0.0.1";
$WSL_CLIENT = bash.exe -c "ifconfig eth0 | grep 'inet '";
$WSL_CLIENT -match '\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}';
$WSL_CLIENT = $matches[0];
iex "netsh interface portproxy add v4tov4 listenport=8081 listenaddress=127.0.0.1 connectport=8081 connectaddress=$WSL_CLIENT"
```

- With the AVD Manager or a device connected to the Windows side ADB, you can run either on Powershell:

``` powershell
adb kill-server
adb -a -P 5037 nodaemon server
```

or on Bash itself:

``` bash
adb.exe kill-server
adb.exe -a -P 5037 nodaemon server
```

Keep it running... All build processes from Ionic or React Native for example will now run on the emulator/device using the Windows side ADB.

When you're using Expo for mobile development/trying to redirect WSL's NIC to the Windows's host IP, try using the `start.bat` script located in `/win/wsl_host` directory of this repo.

