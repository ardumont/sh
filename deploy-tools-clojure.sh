#!/bin/bash

cd ~/bin
wget https://raw.github.com/technomancy/leiningen/stable/bin/lein
chmod +x ~/bin/lein

lein -v

# install the plugin to make a server swank
lein plugin install swank-clojure 1.4.0
lein plugin install lein-midje 1.0.7
lein plugin install lein-marginalia 0.7.0
lein plugin install lein-noir 1.2.1
lein plugin install lein-cljs 0.2.2

