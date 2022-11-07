function hello-world {
  echo "hello-world"
}

# use this to notify when a command is done
# Will end when the uer hits a key 
# ex: run-command-that-takes-a-long-time; flasher

function flasher { 
  while true; do 
    printf \\e[?5h;
    sleep 0.1; 
    printf \\e[?5l; 
    read -s -n1 -t1 && break; 
  done; 
}

# use this to unpack whatever file is present
function extract {
 if [ -z "$1" ]; then
    # display usage if no parameters given
    echo "Usage: extract <path/file_name>.<zip|rar|bz2|gz|tar|tbz2|tgz|Z|7z|xz|ex|tar.bz2|tar.gz|tar.xz>"
    echo "       extract <path/file_name_1.ext> [path/file_name_2.ext] [path/file_name_3.ext]"
    return 1
 else
    for n in $@
    do
      if [ -f "$n" ] ; then
          case "${n%,}" in
            *.tar.bz2|*.tar.gz|*.tar.xz|*.tbz2|*.tgz|*.txz|*.tar) 
                         tar xvf "$n"       ;;
            *.lzma)      unlzma ./"$n"      ;;
            *.bz2)       bunzip2 ./"$n"     ;;
            *.rar)       unrar x -ad ./"$n" ;;
            *.gz)        gunzip ./"$n"      ;;
            *.zip)       unzip ./"$n"       ;;
            *.z)         uncompress ./"$n"  ;;
            *.7z|*.arj|*.cab|*.chm|*.deb|*.dmg|*.iso|*.lzh|*.msi|*.rpm|*.udf|*.wim|*.xar)
                         7z x ./"$n"        ;;
            *.xz)        unxz ./"$n"        ;;
            *.exe)       cabextract ./"$n"  ;;
            *)
                         echo "extract: '$n' - unknown archive method"
                         return 1
                         ;;
          esac
      else
          echo "'$n' - file does not exist"
          return 1
      fi
    done
fi
}

 function myuptime {
   uptime | awk '{ print "Uptime:", $3, $4, $5 }' | sed 's/,//g'
   return;
 }
 
 function tcp-test {
   #description        :Script that outputs whether a server can be accessed 
   #                   :on a port via tcp (linux only) 
   #usage              : tcp-connection-test <server/ip> <port>
   #========================================================================

   SERVER=$1
   PORT=$2
  
   ping -c 1 $SERVER > /dev/null 2>&1 ||( echo "$SERVER unreachable." && exit 1)
  
   echo "Testing TCP Connection to $SERVER on $PORT:"
   echo > /dev/tcp/$SERVER/$PORT && echo "Port $PORT is open" || echo "Port $PORT is unaccessable."
   exit 0
 
 }
 
# function findreplace {
   # WIP - need to test this and add  in safe version?
   # finds $1 and replaces any instance of it globally in files listed
   #grep -RiIl $1  | xargs sed -i "s/$1/$2/g" 

# }
 
 function uppercase {
  str=$@
  output=$(tr '[a-z]' '[A-Z]'<<<"${str}")
  echo $output
 }
 
 function lowercase {
    str=$@
    output=$(tr '[A-Z]' '[a-z]'<<<"${str}")
    echo $output

 }
 
 function randUUID {
    echo $(cat /proc/sys/kernel/random/uuid)
 } 
