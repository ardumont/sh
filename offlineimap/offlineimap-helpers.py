#!/usr/bin/python
import re, subprocess

def read_cmd_from_shell(command):
    return subprocess.Popen(command, shell=True, bufsize=1024, stdout=subprocess.PIPE).stdout.read()

def get_password_emacs(machine, login, port):
    s = "machine %s login %s port %s password ([^ ]*)\n" % (machine, login, port)
    p = re.compile(s)
    authinfo = read_cmd_from_shell("gpg --quiet --no-tty --decrypt ~/.authinfo.gpg")
    return p.search(authinfo).group(1)

def get_plain_password_emacs(machine, login, port):
    s = "machine %s login %s port %s password ([^ ]*)\n" % (machine, login, port)
    p = re.compile(s)
    authinfo = read_cmd_from_shell("cat ~/.authinfo")
    return p.search(authinfo).group(1)
