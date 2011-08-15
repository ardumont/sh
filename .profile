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

# Personal shell scripts
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# Work shell scripts
if [ -d "$HOME/work/bin" ] ; then
    PATH="$HOME/work/bin:$PATH"
fi

# Specific to wine (some times, it's useful... It has been a long time since i use this...)
if [ -d "$HOME/applications/wine" ] ; then
    PATH="$HOME/applications/wine:$PATH"
fi

# Specific folder for links on application launcher
if [ -d "$HOME/applications/bin" ] ; then
    PATH="$HOME/applications/bin:$PATH"
fi

# java config
if [ -d "/usr/lib/jvm/java-6-sun" ] ; then
    export JAVA_HOME=/usr/lib/jvm/java-6-sun
fi

if [ -d "~/applications/apache-maven-3.0.3" ]; then
    # Specific to use maven 3 which is not on the repository
    export M2_HOME=~/bin/apache-maven-3.0.3
    export PATH=$M2_HOME/bin:$PATH
fi

if [ -d "~/repositories/pro/wikeo-core" ]; then
    export WIKEO_HOME=~/repositories/pro/wikeo-core
fi

# Editor
export EDITOR='emacs -nw'

# Languages setup
export LANG="fr_FR.UTF-8"
export LANGUAGE="en_US:en"
export LC_MESSAGES="en_US.UTF-8"
