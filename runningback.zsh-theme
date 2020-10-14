# Minimal zsh theme
# Requires Nerd Fonts for the icons

# Configuration
num_dirs=2 # Use 0 for full path
truncated_path="%F{cyan}%$num_dirs~%f"
decoration="%F{087}─%F{086}─%F{085}─%F{084}─%F{083}─%F{199}%F{048}%F{068}"
background_jobs="%(1j.%F{green} %f.)"
non_zero_return_value="%(0?..%F{yellow}  %f)"
function virtualenv_info {
    [ $VIRTUAL_ENV ] && echo '('`basename $VIRTUAL_ENV`') '
}

function prompt_char {
    git branch >/dev/null 2>/dev/null && echo '○' 
}

function box_name {
    [ -f ~/.box-name ] && cat ~/.box-name || echo ${SHORT_HOST:-$HOST}
}


# Left part of promp

PROMPT="%F{087}╭─ $background_jobs %B%F{192}%n%f%{$fg_bold[white]%}→%F{084}%m%f%{$reset_color%} %F{075} %*
%F{087}╰─$decoration \$(virtualenv_info)\$(prompt_char) "

# Right Prompt ***Only displaying SSH segment during active ssh connections

if [[ -n $SSH_CONNECTION  ]]; then
   RPROMPT='%B%F{198}%n%f%{$fg_bold[white]%}→ %F{201}%m%f%{$reset_color%} $background_jobs'   
else
   RPROMPT='$truncated_path %{$reset_color%} $(git_prompt_info) $(ruby_prompt_info)'
fi


ZSH_THEME_GIT_PROMPT_PREFIX=" %{$FG[087]%}on%{$reset_color%} %{$fg[255]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$FG[111]%} %{$FG[202]%}✘✘✘"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$FG[111]%} %{FG[040]%}✔"
ZSH_THEME_RUBY_PROMPT_PREFIX=" %{$FG[239]%}using%{$FG[243]%} ‹"
ZSH_THEME_RUBY_PROMPT_SUFFIX="›%{$reset_color%}"


# Input in bold
zle_highlight=(default:bold)
