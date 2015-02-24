# Fish git prompt
set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showstashstate 'yes'
set __fish_git_prompt_showupstream 'yes'
set __fish_git_prompt_color_branch yellow

# Status Chars
set __fish_git_prompt_char_dirtystate '⚡'
set __fish_git_prompt_char_stagedstate '→'
set __fish_git_prompt_char_stashstate '↩'
set __fish_git_prompt_char_upstream_ahead '↑'
set __fish_git_prompt_char_upstream_behind '↓'
  
function fish_prompt
    set last_status $status
    set_color $fish_color_cwd
    printf '%s' (prompt_pwd)
    set_color normal
    printf '%s ' (__fish_git_prompt)
    set_color normal
end

#no welcome message
set fish_greeting ""

set -U EDITOR enw


set -U NODE_fish_user_paths /usr/lib/node_modules

##aliases####
alias rgrep='grep -R --exclude="\.git\/"'
# for security reasons
alias rm='rm -i'
alias mv='mv -i'

# simplifying common commands
alias gvim='gvim -p'
alias v='vim'
alias ll='ls -lh'
alias enw='emacs -nw'

# boring typo
alias sl='ls'

# using colors!
alias vless='vim -u /usr/share/vim/vim71/macros/less.vim'

# I always forget 'time' when I wanna measure build time..
alias make='time make'

# git achievements
alias git="git-achievements"

set -Ux fish_user_paths /usr/lib/icecream/bin $HOME/local/bin /usr/local/bin $PATH
set -Ux fish_user_paths $PATH $HOME/git-achievements/
set -Ux fish_user_paths $PATH /home/anselmo/work/project-scripts/
set -Ux fish_user_paths $PATH /home/anselmo/.gem/ruby/2.0.0/

set -Ux USE_CCACHE 1
set -Ux EDITOR vim
set -Ux CCACHE_DIR .ccache

if [ (xrandr | grep DP-4 | cut -f 2 -d " ") = "disconnected" ]
      setxkbmap -model thinkpad60 -layout br
end

# requires source-highlight
set -Ux LESSOPEN "| /usr/bin/src-hilite-lesspipe.sh %s"
set -Ux LESS ' -R '

set -Ux LESS_TERMCAP_mb (printf "\e[1;31m")
set -Ux LESS_TERMCAP_md (printf "\e[1;31m")
set -Ux LESS_TERMCAP_me (printf "\e[0m")
set -Ux LESS_TERMCAP_so (printf "\e[1;44;33m")
set -Ux LESS_TERMCAP_se (printf "\e[0m")
set -Ux LESS_TERMCAP_ue (printf "\e[0m")
set -Ux LESS_TERMCAP_us (printf "\e[1;32m")
