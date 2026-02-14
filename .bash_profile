# ~/.bash_profile — IBM ThinkPad X40

# Show MOTD banner
if [ -x ~/bin/motd ] && [[ $- == *i* ]]; then
    ~/bin/motd
fi

# Source .bashrc (which handles tmux auto-attach)
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi
