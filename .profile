# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi


# set PATH so it includes user's private bin if it exists
# environment variables
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

if [ -d "$HOME/work/bin" ] ; then
    PATH="$HOME/work/bin:$PATH"
fi

if [ -d "$HOME/applications/wine" ] ; then
    PATH="$HOME/applications/wine:$PATH"
fi

if [ -d "/usr/lib/jvm/java-6-sun" ] ; then
    export JAVA_HOME=/usr/lib/jvm/java-6-sun
fi

export WIKEO_HOME=/home/tony/repositories/pro/wikeo-core
export M2_HOME=~/bin/apache-maven-3.0.3

# Editor
export EDITOR='emacs -nw'

# Update paths
export PATH=~/.lein/bin:$PATH
export PATH=~/repositories/clones/cake/bin/:$PATH
export PATH=~/bin/:$PATH
export PATH=$M2_HOME/bin:$PATH

# Languages setup
#`echo $- | grep -qs i` && byobu-launcher && exit 0
export LANG="fr_FR.UTF-8"
export LANGUAGE="en_US:en"
export LC_MESSAGES="en_US.UTF-8"
