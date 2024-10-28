# Define directory paths.
docker_dir="/docker"
log_dir="/var/log"
bash_script_dir="$HOME/.bash-script"
downloads_dir="$HOME/Downloads"

##### Global

##### Docker:
##### Description:
# alias start-docker="sudo systemctl start docker.service"
# alias stop-dockerm="sudo systemctl stop docker.service"
alias status-docker="systemctl status docker.service"
alias restart-docker="sudo systemctl restart docker.service"

##### Fail2ban:
##### Description:
# alias start-fail2ban="sudo systemctl start fail2ban.service"
# alias stop-fail2ban="sudo systemctl stop fail2ban.service"
alias status-fail2ban="systemctl status fail2ban.service"
alias restart-fail2ban="sudo systemctl restart fail2ban.service"
alias status-jail-jellyfin="sudo fail2ban-client status jellyfin"
alias status-jail-sshd="sudo fail2ban-client status sshd"

##### HAProxy:
##### Description:
# alias start-haproxy="sudo systemctl start haproxy.service"
# alias stop-haproxy="sudo systemctl stop haproxy.service"
alias status-haproxy="systemctl status haproxy.service"
alias restart-haproxy="sudo systemctl restart haproxy.service"
alias haproxy-config="sudo nano /etc/haproxy/haproxy.cfg"
alias haproxy-f="sudo haproxy -f /etc/haproxy/haproxy.cfg"

##### Uncomplicated Firewall:
##### Description:
# alias start-ufw="sudo systemctl start ufw.service"
# alias stop-ufw="sudo systemctl stop ufw.service"
alias status-ufw="systemctl status ufw.service"
alias restart-ufw="sudo systemctl restart ufw.service"

# alias ufw-enable="sudo ufw enable"
# alias ufw-disable="sudo ufw disable"
alias status-ufw-v="sudo ufw status verbose"
alias status-ufw-n="sudo ufw status numbered"

##### UniFi Network Application:
##### Description:
# alias start-unifi="sudo systemctl start unifi.service"
# alias stop-unifi="sudo systemctl stop unifi.service"
alias status-unifi="systemctl status unifi.service"
alias restart-unifi="sudo systemctl restart unifi.service"

##### Bash:
##### Description:
alias rm-bash_history="rm $HOME/.bash_history"

##### Boxes:
##### Description:
alias boxes-export="virsh dumpxml"
alias boxes-import="virsh define --file"
alias boxes-ls="virsh -c qemu:///session list --all"

##### Change Directory:
##### Description:
alias ..="cd .."
alias cdbash="cd $bash_script_dir"
alias cddocker="cd $docker_dir/"
alias cddownloads="cd $downloads_dir"
alias cdlog="cd $log_dir"
alias cdssh="cd $HOME/.ssh"
alias cdssl="cd $HOME/ssl"
alias cdtrash="cd $HOME/.local/share/Trash/files/"
alias cdversioning="cd $HOME/.versioning"

##### Chmod:
##### Description:
alias mx="sudo chmod a+x --preserve-root --changes"
alias mx-="sudo chmod a-x --preserve-root --changes"
alias 000="sudo chmod --preserve-root --changes 000"
alias 600="sudo chmod --preserve-root --changes 600"
alias 644="sudo chmod --preserve-root --changes 644"
alias 664="sudo chmod --preserve-root --changes 664"
alias 666="sudo chmod --preserve-root --changes 666"
alias 700="sudo chmod --preserve-root --changes 700"
alias 744="sudo chmod --preserve-root --changes 744"
alias 755="sudo chmod --preserve-root --changes 755"

##### Cat:
##### Description:
alias cat="clear && cat --show-tabs --show-nonprinting"
alias cat-n="clear && cat --number --show-tabs --show-nonprinting"

##### Clear the Terminal Screen:
##### Description:
alias c="clear"

##### Copy:
##### Description:
alias cp="cp --recursive --preserve=all --verbose"

##### Console setup:
##### Description:
alias console-setup="sudo dpkg-reconfigure console-setup"

##### DF:
##### Description:
alias df="df --human-readable --output=source,size,used,avail,pcent,target"
alias df-t="df --type=ext4"

##### Diff:
##### Description:
alias diff="diff --color=auto"

##### Dig:
##### Description:
alias dig="dig +dnssec +fail"
alias dig+="dig +dnssec +fail +short"

##### Dir:
##### Description:
alias dir="dir --color=auto"
alias vdir="vdir --color=auto"

##### Find:
##### Description:
alias f="clear && find . | grep "

##### Go
##### Description:
alias go-telemetry-off="go telemetry off"

##### Grep:
##### Description:
alias grep="grep --color=auto"
alias egrep="egrep --color=auto"
alias fgrep="fgrep --color=auto"

##### ifconfig.co:
##### Description:
alias ifconfigco="curl -s ifconfig.co/json"

##### Lnav:
##### Description:
alias lnav="sudo lnav"

##### Locate:
##### Description:
alias update-locate="sudo updatedb"

##### Logs:
##### Description:
alias logs="sudo lnav $log_dir/"

##### ls:
##### Description:
alias l="clear && ls --almost-all -C --ignore="lost+found""
alias ll="clear && ls --almost-all -C --no-group -l --ignore="lost+found""
alias ls="clear && ls --color=auto --human-readable --sort="extension" --ignore="lost+found""

##### Machine ID:
##### Description:
alias machine-id="hostnamectl | grep \"Machine ID\""

##### Message of the Day:
##### Description:
alias motd="sudo run-parts /etc/update-motd.d"

##### Netstat:
##### Description:
alias net="clear && sudo netstat --all --extend --tcp --udp --numeric --programs --verbose"

##### Network management:
##### Description:
alias IP="clear && ip --color=auto addr"

##### Move:
##### Description:
alias mv="mv --no-clobber --verbose"

##### OpenSSL:
##### Description:
alias hash-md5="openssl passwd -1"
alias hash-sha256="openssl passwd -5"
alias hash-sha512="openssl passwd -6"
alias hash-apr1="openssl passwd -apr1"
alias hash-aixmd5="openssl passwd -aixmd5"
alias hash-password-sha256="echo $1 -n | shasum -a 256"

##### Ping address:
##### Description:
alias p="ping -ODv"
alias p-cloudflare="ping -ODvc 4 1.1.1.1"
alias p-cloudflare.com="ping -ODvc 4 www.cloudflare.com"
alias p-google="ping -ODvc 4 8.8.8.8"
alias p-google.com="ping -ODvc 4 www.google.com"
alias p-quad9="ping -ODvc 4 9.9.9.9"
alias p-quad9.com="ping -ODvc 4 www.quad9.com"

##### PS:
##### Description: Report a snapshot of the current processes.
alias ps="ps aux | grep"

##### Shutdown commands:
##### Description:
alias reboot="sudo shutdown --reboot now"
alias shutdown="sudo shutdown --poweroff now"

##### SSH:
##### Description:
alias rm-known_host="rm .ssh/known_hosts*"

##### Tail:
##### Description:
alias tail="clear && tail --follow --lines=360"

##### Trash:
##### Description: Remove files or directories
alias rm="trash-put"
alias rm-restore="trash-restore"
alias list-trashcan="trash-list"
alias emty-trashcan="trash-empty 30"

##### Tree:
##### Description:
alias t="clear && tree -aAc"
alias tt="clear && tree -aAcDgpRu"

##### Tmux:
##### Description: If not inside a tmux session, and if no session is started, start a new session
alias ts="tmux attach -t tmux-session || tmux new -s tmux-session"
alias th="tmux attach -t th-session || tmux new -s th-session \; split-window -h \; select-pane -t 1"
alias tv="tmux attach -t tv-session || tmux new -s tv-session \; split-window -v \; select-pane -t 1"
alias tn="tmux attach -t tn-session || tmux new -s tn-session \; split-window -v \; split-window -h \; select-pane -t 1 \; split-window -h \; select-pane -t 1"
alias tm="tmux attach -t temp-session || tmux new -s temp-session \; split-window -h \; select-pane -t 1"

alias ts-kill="tmux kill-session -t tm-session"
alias th-kill="tmux kill-session -t th-session"
alias tm-kill="tmux kill-session -t temps-session"
alias tn-kill="tmux kill-session -t tn-session"
alias tv-kill="tmux kill-session -t tv-session"

##### Ubuntu Pro
##### Description:
alias pro-fix="pro fix CVE-"
alias pro-livepatch="canonical-livepatch status"
alias pro-security-status="pro security-status"
alias pro-status="pro status"

##### Visual Studio Code
##### Description:
alias vscode-export="code --list-extensions | xargs -L 1 echo code --install-extension"

##### Wget:
##### Description:
alias wget="wget --directory-prefix=$downloads_dir"

##### xz:
##### Description:
alias xz="xz --compress --keep --best --verbose"
alias xz-test="xz --test --verbose"
alias xz-uncompress="xz --decompress --best --verbose"

##### Default #####

# #### Apt-Get Packages:
# #### Description:
# alias update="sudo apt update"
# alias update="sudo apt update && flatpak update"
# alias update="sudo apt update && sudo snap refresh"
# alias upgrade="sudo apt-get upgrade"
# alias dist-upgrade="sudo apt-get dist-upgrade"
# alias full-upgrade="sudo apt-get full-upgrade"
# alias clean="sudo apt-get autoremove && sudo apt-get autoclean"
# alias aptsearch="apt search"
# alias aptlist="apt list --upgradable -a"
# alias install-list="sudo apt list --installed"
# alias aptfix="sudo apt-get install --fix-broken"

##### DNF Packages:
##### Description:
alias clean="sudo dnf autoremove && sudo dnf clean all"
alias update="sudo dnf check-update && flatpak update"
alias upgrade="sudo dnf upgrade"
alias dnf-downgrade="sudo dnf downgrade"
alias dnf-history-undo="sudo dnf history undo"
alias dnf-history="dnf history"
alias dnf-info="dnf info"
alias dnf-installlist="dnf list --installed"
alias dnf-list="dnf list --upgrades"
alias dnf-minimal-upgrade="sudo dnf upgrade-minimal"
alias dnf-search="dnf search"
alias dnf-rm-old-kernel="sudo dnf remove --oldinstallonly --setopt installonly_limit=2 kernel"

##### Dotfiles:
##### Description:
alias git-install-dotfiles="git clone https://github.com/homelab-alpha/dotfiles.git && cd dotfiles && echo 1 | ./dotfiles_installer.sh"
alias uninstall-dotfiles="cd dotfiles && echo 1 | ./dotfiles_installer.sh"

##### Hugo
##### Description:
alias hugo-up="hugo server --disableFastRender --noHTTPCache --buildDrafts"

##### OpenSSL
##### Description:
alias git-install-openssl="git clone https://github.com/homelab-alpha/openssl.git && cd openssl && ./openssl_installer.sh && cd && exec bash"

##### Scripts:
##### Description:
alias install-dart-sass="$bash_script_dir/install_latest_dart_sass.sh"
alias install-go="$bash_script_dir/install_latest_go.sh"
alias install-hugo="$bash_script_dir/install_latest_hugo.sh"
alias install-jetbrains-mono="$bash_script_dir/install_latest_jetbrains_mono.sh"
alias new-gpg-key-pair="$bash_script_dir/gpg_keygen_script.sh"
alias new-ssh-key-pair="$bash_script_dir/ssh_keygen_script.sh"
alias upgrade-hugo="install-dart-sass && install-go && install-hugo"
alias userid="$bash_script_dir/user_accounts_info.sh"

##### Trim
##### Description:
alias trim="sudo fstrim / --verbose"
