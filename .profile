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
    if [ -f $HOME/.bashrc ] && . $HOME/.bashrc
    # one for the work
    if [ -f $HOME/.bashrc-work ] && . $HOME/.bashrc-work
fi

# set PATH so it includes user's private bin if it exists
# environment variables

# Personal shell scripts
[ -d $HOME/bin ] && export PATH=$HOME/bin:$PATH

# Work shell scripts
[ -d $HOME/work/bin ] && export PATH=$HOME/work/bin:$PATH

# Specific to wine (some times, it's useful... It has been a long time since i use this...)
[ -d $HOME/applications/wine ] && export PATH=$HOME/applications/wine:$PATH

# Specific folder for links on application launcher
[ -d $HOME/applications/bin ] && export PATH=$HOME/applications/bin:$PATH

# java config
[ -d /usr/lib/jvm/java-6-sun ] && export JAVA_HOME=/usr/lib/jvm/java-6-sun

# maven 3
[ -d $HOME/applications/apache-maven-3.0.3 ] && export PATH=$HOME/applications/apache-maven-3.0.3/bin:$PATH

# Languages setup
export LANG="fr_FR.UTF-8"
export LANGUAGE="en_US:en"
export LC_MESSAGES="en_US.UTF-8"
