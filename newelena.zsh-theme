# Minimal zsh theme
# Requires Nerd Fonts for the icons

# Configuration
num_dirs=1 # Use 0 for full path
truncated_path="%F{199}%$num_dirs~%f"
decoration="
$truncated_path %F{199}─%F{069}─%F{123}─%F{135}─○ %F{160}"
background_jobs="%(1j.%F{green} %f.)"
non_zero_return_value="%(0?..%F{yellow}  %f)"
hostname="%{$fg_bold[pink]%}%m"
ret_status="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ %s)"
function virtualenv_info {
    [ $VIRTUAL_ENV ] && echo '('`basename $VIRTUAL_ENV`') '
}

function prompt_char {
    git branch >/dev/null 2>/dev/null && echo '  ' 
}

function box_name {
    [ -f ~/.box-name ] && cat ~/.box-name || echo ${SHORT_HOST:-$HOST}
}


# Left part of promp

PROMPT="$hostname%{$FG[pink]%}@%n%{$reset_color%} %\$(git_prompt_info)\$(ruby_prompt_info) %F{199}$decoration \$(virtualenv_info)\$(prompt_char) "

# Right Prompt ***Only displaying SSH segment during active ssh connections

if [[ -n $SSH_CONNECTION  ]]; then
   RPROMPT='$hostname $ret_status $background_jobs'   
else
   RPROMPT='$background_jobs'
fi


ZSH_THEME_GIT_PROMPT_PREFIX=" %{$FG[202]%}on%{$reset_color%} %{$fg[255]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$FG[199]%} %{$FG[202]%}✘✘✘"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$FG[199]%} %{FG[040]%}✔"
ZSH_THEME_RUBY_PROMPT_PREFIX=" %{$FG[239]%}using%{$FG[243]%} ‹"
ZSH_THEME_RUBY_PROMPT_SUFFIX="›%{$reset_color%}"


# Input in bold
zle_highlight=(default:bold)
