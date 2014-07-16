#!bash

cd ~/bin
[ ! -f ~/bin/lein ] && wget -O lein2 - https://raw.github.com/technomancy/leiningen/preview/bin/lein && chmod +x ~/bin/lein2 && ln -nfs ~/bin/lein2 ~/bin/lein

~/bin/lein -v
