#!/usr/bin/env bash

# init
function pause(){
   read -p "$*"
 }

cd ~

# We can't get them directly, but just click this button :)
xcode-select --install

pause 'Press [Enter] once you have installed XCode and XCode Command Line Tools.'

# Just make sure...
sudo xcodebuild -license accept

# Get Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Install software
brew install ruby
brew install git
brew install wget

brew tap caskroom/cask
brew tap homebrew/dupes
brew tap homebrew/versions
brew tap homebrew/binary
brew tap caskroom/versions

brew install brew-cask

# Random Mac tools
brew cask install slack

# Dev tools
brew cask install vagrant
brew cask install virtualbox
brew cask install sequel-pro
brew cask install sourcetree
brew install node
brew install npm

# Get composer and put it in the right place. This will require your password
curl -sS https://getcomposer.org/installer | sudo php -- --install-dir=/usr/local/bin --filename=composer
# Make sure composer has the correct ownership
sudo chown -R $USER $HOME/.composer

# Be sure we can vagrant
brew install ansible
vagrant plugin install vagrant-hostmanager
vagrant plugin install vagrant-auto_network
vagrant plugin install vagrant-triggers

# Set up PHP tools
# https://philsturgeon.uk/php/2013/08/20/php-static-analysis-in-sublime-text/
# http://benmatselby.github.io/sublime-phpcs/
echo "Setting up PHP Tools"
sudo chown -R `whoami` /usr/local
brew tap homebrew/homebrew-php
brew install php71
brew install phpmd
brew install php-code-sniffer
brew install php-cs-fixer

# Install GitHub Changelog Generator
gem install github_changelog_generator

# Do the Mac thing that you have to do but you shouldn't have to do
# This https://github.com/jirsbek/SSH-keys-in-macOS-Sierra-keychain
curl -o ~/Library/LaunchAgents/ssh.add.a.plist https://raw.githubusercontent.com/jirsbek/SSH-keys-in-macOS-Sierra-keychain/master/ssh.add.a.plist

# Hold my own hand to make sure I finish configuring.
echo "Add your ssh keys (you put them in your secret hiding place)."
pause 'Press [Enter] when you have added your ssh key.'
chmod 400 ~/.ssh/*

# Get git things
curl -o /usr/local/etc/bash_completion.d/git-prompt.sh https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh
curl -o /usr/local/etc/bash_completion.d/git-completion.bash https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash

echo "WELCOME TO THE AMA!"
