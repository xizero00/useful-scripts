
#!/usr/bin/env bash

cd ~/projects
git clone https://github.com/gpakosz/.tmux.git
cd ~
ln -s -f ~/projects/.tmux/.tmux.conf
cp ~/projects/.tmux/.tmux.conf.local .

