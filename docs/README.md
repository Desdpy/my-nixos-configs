# My Dots

## My NixOS Installation

### Preperation
Set keyboard layout
```
sudo loadkeys de-latin1
```

### Prepare ssh
Set a password for the nixos user.
```
passwd
```
\
Check the ip of the system.
```
ifconfig
```
\
ssh into the system.
```
ssh nixos@<ip>
```

### Partitioning

You can see every drive that is connected:
```
lsblk
```
\
The next step is not necessary, but recommendet for security reasons. 
We are overwriting the used drives with random data. This has to be done with every drive that should be used. This will also delete everything that is on the drives beyond recovery.
```
sudo dd if=/dev/urandom of=/dev/<name-of-drive> bs=4096 status=progress
```
\
Now we are getting the disko file to setup the partitions from github (make sure that you are connected with the internet):
```
curl -OL https://raw.githubusercontent.com/Desdpy/my-nixos-configs/main/setup/disko.nix
```
\
Make adjustments to the file, like adjusting the drive name:
```
nano disko.nix
```
\
Now we are using this file to setup our partitions:
```
sudo nix --experimental-features "nix-command flakes" run github:nix-community/disko -- --mode disko ./disko.nix
```
We can see the result if we check the drives again with `lsblk`

### Nix installation

We have to generate our nix hardware-configuration file because this will be different on every system.
```
sudo nixos-generate-config --root /mnt
```
\
Now we have to replace the automaticaly created configuration.nix file with our own.
```
cd /mnt/etc/nixos/
sudo curl -OL https://raw.githubusercontent.com/Desdpy/my-nixos-configs/main/setup/configuration.nix
```
\
Set a username and hostname that will be used in the later configuration:
```
sudo nano configuration.nix
```
\
Trigger the installation and reboot the system.
```
sudo nixos-install
```
\
Reboot the system. This might have to be done on the device and not over ssh.
```
reboot
```
\
Login as the root user.
Now you can change the user password of the user that is created on the configuration.nix.
```
passwd <username>
```
\
Log out the root user.
```
logout
```
\
Login as the user now.

### Setup git
ssh into it. You might have to remove it from the known hosts from the system you are sshing from.
```
ssh <username>@<ip>
```
\
Add your git name and email imperatively first. It will be declarative as soon as the config files get cloned.
```
git config --global user.name "<name(Desdpy)>"
git config --global user.email "<email(github.com.passerby609@passfwd.com)>"
```
\
Generate an ssh key in the default location.
```
ssh-keygen
```
\
Got to the public ssh key.
```
cd .ssh/
cat id_ed25519.pub
```
\
Add the ssh key to your github account with a browser.

\
Clone the dotfiles and nix configs.
```
cd
git clone git@github.com:Desdpy/my-nixos-configs.git nix
```
\
Copy the hardware-configuration.nix file that was generated for this system into the .nixconfigs directory
```
mkdir ~/nix/nixos/00-hosts/<host-name>/
cp /etc/nixos/hardware-configuration.nix ~/nix/nixos/00-hosts/<host-name>/
cd nix/
git add *
```
\
Rebuild the system with the flake.
```
sudo nixos-rebuild switch --flake .
```
\
Temporarily preinstall Home-Manager.
```
nix-shell -p home-manager
```
\
Run home manager.
```
home-manager switch --flake .
```
\
Remove .gitconfig from ~
```
rm ~/.gitconfig
```
