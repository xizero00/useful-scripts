
#!/usr/bin/env bash

cd ~
git clone https://github.com/gpakosz/.tmux.git
cd ~
ln -s -f ~/.tmux/.tmux.conf
cp ~/.tmux/.tmux.conf.local .

