# #######################################################################################
# #######################################################################################
# .tmux.conf
# Michael Heinrich-Bloch 
# 18.03.2018
# #######################################################################################
# #######################################################################################


# #######################################################################################
# Exports
# #######################################################################################
# export PATH=$HOME/bin:/usr/local/bin:$HOME/Skripte:$HOME/go/bin:$PATH
export ZSH=/home/omppu/.oh-my-zsh
export VISUAL=vim
export EDITOR=vim
export GOPATH=/home/omppu/go
export QT_DIR=$HOME/daten/Qt5.8.0

#PATH="/home/omppu/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/omppu/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/omppu/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/omppu/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/omppu/perl5"; export PERL_MM_OPT;


# #######################################################################################
# Setup ZSH-General
# #######################################################################################
#ZSH_THEME="bira"
#ZSH_THEME="agnoster"
ZSH_THEME="omppu"
plugins=(git)
source $ZSH/oh-my-zsh.sh


# #######################################################################################
# Alias
# #######################################################################################
alias sublime LANG=en_US.UTF-8 LC_CTYPE=en_US.UTF-8 LC_ALL=de_DE.UTF-8 /opt/sublime_text_3/sublime_text 
alias getYoutubePlaylist="youtube-dl --simulate --get-id $1 > playlist" 
alias feh="feh -."
alias dict="dict.cc.py $@"


# #######################################################################################
# Setup Powerline
# #######################################################################################
#powerline-daemon -q
POWERLINE_BASH_CONTINUATION=1
POWERLINE_BASH_SELECT=1
#. /usr/lib/python3.6/site-packages/powerline/bindings/zsh/powerline.zsh


# #######################################################################################
# TMUX & tmuxinator
# #######################################################################################
## workaround for handling TERM variable in multiple tmux sessions properly from http://sourceforge.net/p/tmux/mailman/message/32751663/ by Nicholas Marriott
if [[ -n ${TMUX} && -n ${commands[tmux]} ]];then
        case $(tmux showenv TERM 2>/dev/null) in
                *256color) ;&
                TERM=fbterm)
                        TERM=screen-256color ;;
                *)
                        TERM=screen
        esac
    fi

source ~/.bin/tmuxinator.zsh


# #######################################################################################
# Screenfetch
# #######################################################################################
screenfetch

