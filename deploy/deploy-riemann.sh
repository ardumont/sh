#!bash -e

# http://riemann.io/quickstart.html

mkdir -p ~/Downloads/riemann

cd ~/Downloads/riemann

[ ! -f riemann-0.2.1.tar.bz2 ] && wget http://aphyr.com/riemann/riemann-0.2.1.tar.bz2
wget http://aphyr.com/riemann/riemann-0.2.1.tar.bz2.md5

# reworking bad riemann file
SHA1=$(cat riemann-0.2.1.tar.bz2.md5 | cut -d' ' -f1)
cat <<EOF | tee riemann-0.2.1.tar.bz2.md5
$SHA1  riemann-0.2.1.tar.bz2
EOF

md5sum -c riemann-0.2.1.tar.bz2.md5

tar xvfj riemann-0.2.1.tar.bz2 -C ~/applications/

ln -nsf ~/applications/riemann-0.2.1 ~/applications/riemann

# to start the server
# bin/riemann etc/riemann.config

# Riemann is now listening for events. Install the Ruby client, utility package, and dashboard:
sudo gem install riemann-client riemann-tools riemann-dash

# start the dashboard. If riemann-dash isn't in your path, check your rubygems bin directory.
#riemann-dash
