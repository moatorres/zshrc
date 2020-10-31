
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

#   ✓ ✔︎ √ ✕ ✖︎ ✗ ✘ ☞ ☛ ▶︎ ▸ ⌦ → ⇢ ➤ ✪ ★ ● ○ ♻︎ ♽
#   🗂 💡 🔑 🔐 🚨 🐙 🌴 🔥 🌈 🥥 🥚 ⏱ 🧰 🧪 🛍 🇬🇧 🇧🇷 📦 

alias ga="git add ."
alias gc="git commit -m 'automatic commit'"
alias gmaster="git switch master"
alias gnext="git switch next"
alias gprod="git switch production"

# Colors:         %F{0} até %F{255}
# Conditionals:     %(?.<SUCCESS>.<ERROR>)

function whatbranch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

function prompt {
  local   ICO="🗂 "
  local   EDITOR="nano"
  local   RED="%F{red}"                                     
  local   BLUE="%F{blue}"                                   
  local   GREEN="%F{green}"                                 
  local   WHITE="%F{white}"                                 
  local   BLACK="%F{black}"                                 
  local   YELLOW="%F{yellow}"                               
  local   MAGENTA="%F{magenta}"                             
  local   CYAN="%F{cyan}"                                   
  local   BOLD="%B"                                         
  local   END="%?"                                          
  local   RESET="%f"                                        
  local   HR="%*"                                           
  local   FFFF="%/"                                         
  local   FFF="%~"                                          
  local   FF="%2d"                                          
  local   F="%1~"                                           
  
  export PS1="%(?.$GREEN✓.$RED✖︎ %?)$RESET $ICO ZSH Pro $BLUE$FF $RESET"
    PS2='> '
    PS3='+ '
  }

prompt

function editzsh {
  $EDITOR ~/.zshrc
}

# 🚭 1. ENV

# export PATH="$PATH:/usr/local/bin/"
# export PATH="/usr/local/git/bin:/sw/bin/:/usr/local/bin:/usr/local/:/usr/local/sbin:/usr/local/mysql/bin:$PATH"

# export BLOCKSIZE=1k                                         
export CLICOLOR=1                                             
export LSCOLORS=ExFxBxDxCxegedabagacad                        
export CASE_SENSITIVE="true"                                  
export DISABLE_LS_COLORS="false"                              
# export DISABLE_AUTO_UPDATE="true"                           
# export DISABLE_AUTO_TITLE="true"                            

#   2. TERMINAL

cd() { builtin cd "$@"; ll; }                                 
mcd () { mkdir -p "$1" && cd "$1"; }                          
trash () { command mv "$@" ~/.Trash ; }                       
quicklook () { qlmanage -p "$*" >& /dev/null; }               

alias cp='cp -iv'                                             
alias mv='mv -iv'                                             
alias mkdir='mkdir -pv'                                       
alias ll='ls -FGlAhp'                                         
alias less='less -FSRXc'    
alias cd..='cd ../'                                           
alias ..='cd ../'                                             
alias ...='cd ../../'                                         
alias f='open -a Finder ./'                                   
alias ~="cd ~"                                                
alias c='clear'                                               
alias DT='tee ~/Desktop/text-from-terminal.txt'                    
alias lr='ls -R | grep ":$" | sed -e '\''s/:$//'\'' -e '\''s/[^-][^\/]*\//--/g'\'' -e '\''s/^/   /'\'' -e '\''s/-/|/'\'' | less'
alias today="echo $(date +%d.%m.%y-%H:%M:%S)"
alias worldClock="ncal -hJjpwy"
alias dus="du -sckx * | sort -nr"
alias mailStorage="du -hs ~/Library/mail"
alias ttop="top -ocpu -R -F -s 2 -n30"                        
alias lh='ls -a | egrep "^\."'
alias fixTerminalReset='stty sane'                            

# 🗂 3. FILES

alias countFiles='echo $(ls -1 | wc -l)'                          

delete () { command mv "$@" ~/.Trash ; }                      
zipf () { zip -r "$1".zip "$1" ; }                            

extract () {                                                  
    if [ -f $1 ] ; then
      case $1 in
        *.tar.bz2)   tar xjf $1     ;;
        *.tar.gz)    tar xzf $1     ;;
        *.bz2)       bunzip2 $1     ;;
        *.rar)       unrar e $1     ;;
        *.gz)        gunzip $1      ;;
        *.tar)       tar xf $1      ;;
        *.tbz2)      tar xjf $1     ;;
        *.tgz)       tar xzf $1     ;;
        *.zip)       unzip $1       ;;
        *.Z)         uncompress $1  ;;
        *.7z)        7z x $1        ;;
        *)     echo "'$1' couldn't be extracted with extract()" ;;
        esac
    else
        echo "'$1' isn't a valid file"
    fi
}

cdf () {
    pathCurrentFolder=$( /usr/bin/osascript <<EOT
        tell application "Finder"
            try
        set currFolder to (folder of the front window as alias)
            on error
        set currFolder to (path to desktop folder as alias)
            end try
            POSIX path of currFolder
        end tell
EOT
    )
    echo "cd to \"$pathCurrentFolder\""
    cd "$pathCurrentFolder"
}


# 🕵🏻‍♂️ 4. SEARCH

ff () { /usr/bin/find . -name "$@" ; }                        
ffs () { /usr/bin/find . -name "$@"'*' ; }                    
ffe () { /usr/bin/find . -name '*'"$@" ; }                    
spot () { mdfind "kMDItemDisplayName == '$@'wc"; }            

mans () {
    man $1 | grep -iC2 --color=always $2 | less
}

# 5. PROCESS

alias over='top -l 1 -o rsize | head -20'
alias overWhere='ps wwaxm -o pid,stat,vsize,rss,time,command | head -10'
alias overCpu='ps wwaxr -o pid,stat,%cpu,time,command | head -10'
alias ttop="top -R -F -s 10 -o rsize"
alias topForever='top -l 9999999 -s 10 -o cpu'

findPid () { lsof -t -c "$@" ; }                              

pss() { ps $@ -u $USER -o pid,%cpu,%mem,start,time,bsdtime,command ; }

# 6. NETWORK

alias netCons='lsof -i'                                       
alias flushDNS='dscacheutil -flushcache'                      
alias lsock='sudo /usr/sbin/lsof -i -P'                       
alias lsockU='sudo /usr/sbin/lsof -nP | grep UDP'             
alias lsockT='sudo /usr/sbin/lsof -nP | grep TCP'             
alias ipEnv0='ipconfig getpacket en0'                         
alias ipEnv1='ipconfig getpacket en1'                         
alias openPorts='sudo lsof -i | grep LISTEN'                  
alias showBlocked='sudo ipfw list'                            

ii() {
    echo -e "\nLogged in on ${RED}$HOST"
    echo -e "\nAditional Info:$NC " ; uname -a
    echo -e "\n${RED}Logged-in Users:$NC " ; w -h
    echo -e "\n${RED}Data:$NC " ; date
    echo -e "\n${RED}Stats:$NC " ; uptime
    echo -e "\n${RED}Location:$NC " ; scselect
    echo
}

function myip() {
  ifconfig lo0 | grep 'inet ' | sed -e 's/:/ /' | awk '{print "lo0       : " $2}'
	ifconfig en0 | grep 'inet ' | sed -e 's/:/ /' | awk '{print "en0 (IPv4): " $2 " " $3 " " $4 " " $5 " " $6}'
	ifconfig en0 | grep 'inet6 ' | sed -e 's/ / /' | awk '{print "en0 (IPv6): " $2 " " $3 " " $4 " " $5 " " $6}'
	ifconfig en1 | grep 'inet ' | sed -e 's/:/ /' | awk '{print "en1 (IPv4): " $2 " " $3 " " $4 " " $5 " " $6}'
	ifconfig en1 | grep 'inet6 ' | sed -e 's/ / /' | awk '{print "en1 (IPv6): " $2 " " $3 " " $4 " " $5 " " $6}'
}

# 🔭 7. SYS OPS

hiddenOn() { defaults write com.apple.Finder AppleShowAllFiles YES ; }
hiddenOff() { defaults write com.apple.Finder AppleShowAllFiles NO ; }

alias cleanupDS="find . -type f -name '*.DS_Store' -ls -delete"
alias cleanupLS="/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user && killall Finder"

# 🌎 8. WEB DEV 

httpHeaders () { /usr/bin/curl -I -L $@ ; }
httpDebug () { /usr/bin/curl $@ -o /dev/null -w "dns: %{time_namelookup} connect: %{time_connect} pretransfer: %{time_pretransfer} starttransfer: %{time_starttransfer} total: %{time_total}\n" ; }


:'

 ██████╗██╗  ██╗███████╗ █████╗ ████████╗    ███████╗██╗  ██╗███████╗███████╗████████╗
██╔════╝██║  ██║██╔════╝██╔══██╗╚══██╔══╝    ██╔════╝██║  ██║██╔════╝██╔════╝╚══██╔══╝
██║     ███████║█████╗  ███████║   ██║       ███████╗███████║█████╗  █████╗     ██║   
██║     ██╔══██║██╔══╝  ██╔══██║   ██║       ╚════██║██╔══██║██╔══╝  ██╔══╝     ██║   
╚██████╗██║  ██║███████╗██║  ██║   ██║       ███████║██║  ██║███████╗███████╗   ██║   
 ╚═════╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝   ╚═╝       ╚══════╝╚═╝  ╚═╝╚══════╝╚══════╝   ╚═╝   
                                                                                                       

&	    # Run the previous command in the background	                                      👉 ls &
&&	  # Logical AND	                                                                      👉 if [ "$foo" -ge "0" ] && [ "$foo" -le "9"]
||	  # Logical OR	                                                                      👉 if [ "$foo" -lt "0" ] || [ "$foo" -gt "9" ]
^	    # Start of line	                                                                    👉 grep "^foo"
$	    # End of line	                                                                      👉 grep "foo$"
=	    # String equality (cf. -eq)	                                                        👉 if [ "$foo" = "bar" ]
!     #	Logical NOT	                                                                      👉 if [ "$foo" != "bar" ]
$$	  # PID of current shell	                                                            👉 echo "my PID = $$"
$!	  # PID of last background command	                                                  👉 ls & echo "PID of ls = $!"
$?	  # exit status of last command	                                                      👉 ls ; echo "ls returned code $?"
$0	  # Name of current command (as called)	                                              👉 echo "I am $0"
$1	  # Name of current commands first parameter	                                        👉 echo "My first argument is $1"
$9	  # Name of current commands ninth parameter	                                        👉 echo "My ninth argument is $9"
$@	  # All of current commands parameters (preserving whitespace and quoting)	          👉 echo "My arguments are $@"
$*	  # All of current commands parameters (not preserving whitespace and quoting)	      👉 echo "My arguments are $*"
-eq   # Numeric Equality	                                                                👉 if [ "$foo" -eq "9" ]
-ne   # Numeric Inquality	                                                                👉 if [ "$foo" -ne "9" ]
-lt   # Less Than	                                                                        👉 if [ "$foo" -lt "9" ]
-le   # Less Than or Equal	                                                              👉 if [ "$foo" -le "9" ]
-gt   # Greater Than	                                                                    👉 if [ "$foo" -gt "9" ]
-ge   # Greater Than or Equal	                                                            👉 if [ "$foo" -ge "9" ]
-z	  # String is zero length	                                                            👉 if [ -z "$foo" ]
-n	  # String is not zero length	                                                        👉 if [ -n "$foo" ]
-nt   # Newer Than	                                                                      👉 if [ "$file1" -nt "$file2" ]
-d	  # Is a Directory	                                                                  👉 if [ -d /bin ]
-f	  # Is a File	                                                                        👉 if [ -f /bin/ls ]
-r	  # Is a readable file	                                                              👉 if [ -r /bin/ls ]
-w	  # Is a writable file	                                                              👉 if [ -w /bin/ls ]
-x	  # Is an executable file	                                                            👉 if [ -x /bin/ls ]
()    #	Function definition	                                                              👉 function myfunc() { echo hello }

'
