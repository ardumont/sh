#!bash
# source: https://help.github.com/articles/using-jekyll-with-pages

# pre-requisite
install.sh ruby1.9.1-dev

# install bundler
sudo gem install bundler

# 'install' jekyll in the current git repo
echo -e "source 'https://rubygems.org'\ngem 'github-pages'" > Gemfile

# execute the bundle installation of the deps needed
sudo bundle install
