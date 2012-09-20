#yum install git -y

# Install vim and gvim
# sudo apt-get install vim vim-gnome


#GIT

 # Install git and gitg repo viewer
 #sudo apt-get install git git-doc gitg

 # Set name and email in gitconfig
git config --global user.email "jknott@boojookoo.com"
git config --global github.user JamesKnott
git config --global github.token a75711c13925bcda947730c3e8d46646
git config --global user.name "JamesKnott"
git config --global credential.helper cache
git config --global credential.helper 'cache --timeout=3600'

 # Configure default git text editor
git config --global core.editor "gvim --nofork"

 # Configure status colors
git config --global color.diff auto
git config --global color.status auto
git config --global color.branch auto
git config --global color.status.changed yellow
git config --global color.status.added green
git config --global color.status.untracked red

 # Verify git settings
git config --list

 # Generate SSH keys (provide a good passphrase when asked)
#ssh-keygen -t rsa -C "jknott@boojookoo.com"

 # Add git aliases
 echo "alias gb='git branch'" >> ~/.bashrc
 echo "alias gc='git commit -v'" >> ~/.bashrc
 echo "alias gca='git commit -a -v'" >> ~/.bashrc
 echo "alias gco='git checkout'" >> ~/.bashrc
 echo "alias gd='git diff'" >> ~/.bashrc
 echo "alias gdc='git diff --cached'" >> ~/.bashrc
 echo "alias gdh='git diff HEAD'" >> ~/.bashrc
 echo "alias gp='git push'" >> ~/.bashrc
 echo "alias gl='git pull'" >> ~/.bashrc
 echo "alias gpr='git pull --rebase'" >> ~/.bashrc
 echo "alias gst='git status'" >> ~/.bashrc
 echo "alias gap='git add -p'" >> ~/.bashrc
 echo "alias glg='git log --pretty=oneline --abbrev-commit'" >> ~/.bashrc

 # Setup git bash completion

# old -Download git source code and pull out git-completion.bash
# rename file to .sh and make it a hidden file .git-completion.sh

#clone a copy of git for your bash completion profile.

git clone git://github.com/gitster/git.git
mv git/contrib/completion/git-completion.bash ~/.git-completion.sh
rm -rf ~/git
echo "export GIT_PS1_SHOWDIRTYSTATE=1" >> ~/.bashrc
echo "export GIT_PS1_SHOWSTASHSTATE=1" >> ~/.bashrc
echo "source ~/.git-completion.sh" >> ~/.bashrc

 # Add git info to PS1 (append this to your ~/.bashrc file, not commented)
# add this to bashrc manually
# PS1='[\[\033[1;34m\]\u\[\033[0m\]@\h \W$(__git_ps1 "(%s)")]\$ '
#echo "PS1='[\[\033[1;34m\]\u\[\033[0m\]@\h \W$(__git_ps1 "(%s)")]\$ '" >> ~/.bashrc




