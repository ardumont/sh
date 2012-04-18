#!/bin/bash

cd ~/bin
wget -O lein2 - https://raw.github.com/technomancy/leiningen/preview/bin/lein
chmod +x ~/bin/lein2

lein2 -v

# install the plugin to make a server swank
lein2 plugin install swank-clojure 1.4.2
lein2 plugin install lein-midje 1.0.9
lein2 plugin install lein-marginalia 0.7.0
lein2 plugin install lein-noir 1.2.1
lein2 plugin install lein-cljs 0.2.2

