# Configures git:
printf "%s\n" "Configuring git..." 
printf "%s\n" "Write your git username:" 
read USER
DEFAULT_EMAIL="$USER@users.noreply.github.com"
read -p "Write your git email [Press enter to accept the private email $DEFAULT_EMAIL]: " EMAIL
EMAIL="${EMAIL:-${DEFAULT_EMAIL}}"

printf "%s\n" "Configuring global user name and email..."
git config --global user.name "$USER"
git config --global user.email "$EMAIL"

printf "%s\n" "Configuring global aliases..."
git config --global alias.ci commit
git config --global alias.st status

printf "%s\n" "Adding git credentials..."
printf "%s\n" "Configuring git ssh access..."
ssh-keygen -t rsa -b 4096 -C "$EMAIL"
printf "%s\n" "This is your public key. To activate it in github, go to settings, SHH and GPG keys, New SSH key, and enter the following key:"
cat ~/.ssh/id_rsa.pub
