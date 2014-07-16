#!bash -xe

# install some scripts to ease the reading on bash repl
[ ! -d ~/repo/perso/sh ] && git clone git://github.com/ardumont/sh.git ~/repo/perso/sh
[ ! -d ~/repo/perso/dot-files ] && git clone git://github.com/ardumont/dot-files.git ~/repo/perso/dot-files && ~/repo/perso/dot-files/deploy.sh

# installing pre-requisite
sudo aptitude install -y git wordpress mysql-server emacs24 org-mode

# install wordpress rapidly
if [ ! -f latest.zip ]; then
    wget https://wordpress.org/latest.zip
    unzip latest.zip
    sudo ln -s ~/vagrant/wordpress /var/www/
    sudo chown -R vagrant: ~/vagrant/wordpress
fi


# installing emacs-live
mv -f ~/.emacs.d ~/.emacs.d-old
git clone git://github.com/overtone/emacs-live.git ~/.emacs.d

[ ! -d ~/repo/perso/blog-pack ] && git clone git://github.com/ardumont/blog-pack.git ~/repo/perso/blog-pack
[ ! -d  ~/repo/perso/install-packages-pack ] && git clone git://github.com/ardumont/install-packages-pack.git ~/repo/perso/install-packages-pack

cat <<EOF > ~/repo/perso/emacs-live-packs/.emacs-live.el
;; a utility function to help in installing emacs-live packs
(defun add-live-packs (path packs)
  "Adding live packs at startup"
  (live-add-packs
   (mapcar
    (lambda (pack)
      (concat path pack))
    packs)))

;; all the other packs needed
(add-live-packs "~/repo/perso/" '(;; installing emacs repositories (melpa, milkbox, marmalade) and the install-packs utility function
                                         "install-packages-pack"
                                         ;; a setup blog pack for wordpress
                                         "blog-pack"
))

EOF

# setup blog pack
cat <<EOF > ~/.netrc
machine some-dummy-machine login some-login password some-password
machine blog login admin password "emacs rocks"
machine blog-description blog-name tony-blog blog-url-rpc http://localhost/wordpress/xmlrpc.php
EOF
