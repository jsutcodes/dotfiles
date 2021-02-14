# useful shortcuts found online and my own
# url: http://www.cyberciti.biz/tips/bash-aliases-mac-centos-linux-unix.html
# look at this https://www.digitalocean.com/community/tutorials/an-introduction-to-useful-bash-aliases-and-functions

# if user is not root, pass all commands via sudo #
if [ $UID -ne 0 ]; then
    alias reboot='sudo reboot'
    alias update='sudo apt-get upgrade'
fi

# become root #
alias root='sudo -i'
alias su='sudo -i'

## running this command updates the aliases file
alias updalias='cp -uv ~/.bash_aliases{,.orig} && curl "https://raw.githubusercontent.com/jsutcodes/.bashrc_helper/master/.bash_aliases.sh" > ~/.bash_aliases && source ~/.bash_aliases'


## Colorize the ls output ##
alias ls='ls --color=auto'
 
## Use a long listing format ##
alias ll='ls -la'
 
## Show hidden files ##
alias l.='ls -d .* --color=auto'
 
 
## Colorize the grep command output for ease of use (good for log files)##
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

#lets you mk directories even when parents don't exist
alias mkdir='mkdir -pv'

# install  colordiff package :)
alias diff='colordiff'

#human readable mount command
alias mnt='mount |column -t'

alias path='echo -e ${PATH//:/\\n}'
alias now='date +"%T"'
alias nowtime=now
alias nowdate='date +"%d-%m-%Y"'

alias open=xdg-open
alias vi=vim
alias svi='sudo vi'
alias vis='vim "+set si"'
alias edit='vim'

# Stop after sending count ECHO_REQUEST packets #
alias ping='ping -c 5'

alias ports='netstat -tulanp'

# reboot / halt / poweroff
alias reboot='sudo /sbin/reboot'
alias poweroff='sudo /sbin/poweroff'
alias halt='sudo /sbin/halt'
alias shutdown='sudo /sbin/shutdown'

## pass options to free ## 
alias meminfo='free -m -l -t'
 
## get top process eating memory
alias psmem='ps auxf | sort -nr -k 4'
alias psmem10='ps auxf | sort -nr -k 4 | head -10'
 
## get top process eating cpu ##
alias pscpu='ps auxf | sort -nr -k 3'
alias pscpu10='ps auxf | sort -nr -k 3 | head -10'
 
## Get server cpu info ##
alias cpuinfo='lscpu'
 
## older system use /proc/cpuinfo ##
##alias cpuinfo='less /proc/cpuinfo' ##
 
## get GPU ram on desktop / laptop## 
alias gpumeminfo='grep -i --color memory /var/log/Xorg.0.log'

## this one saved by butt so many times ##
alias wget='wget -c'

##give a file execute permissions
alias chx='chmod 755'
##give a file read and write permissions
alias chr='chmod 644'

## get web server headers
alias header='curl -I'

##quick file tree
alias filetree="find . -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'"

## show history (d/m/y time )
export HISTTIMEFORMAT="%d/%m/%y %T " 
