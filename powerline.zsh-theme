# FreeAgent puts the powerline style in zsh !


POWERLINE_COLOR_BG_GRAY=$BG[240]
POWERLINE_COLOR_BG_LIGHT_GRAY=$BG[240]
POWERLINE_COLOR_BG_WHITE=$BG[255]

POWERLINE_COLOR_FG_GRAY=$FG[240]
POWERLINE_COLOR_FG_LIGHT_GRAY=$FG[240]
POWERLINE_COLOR_FG_WHITE=$FG[255]

GIT_DIRTY_COLOR=$FG[133]
GIT_CLEAN_COLOR=$FG[118]
GIT_PROMPT_INFO=$FG[012]

ZSH_THEME_GIT_PROMPT_PREFIX=" \u2b60 "
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$GIT_PROMPT_INFO%}"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$GIT_DIRTY_COLOR%}✘"
ZSH_THEME_GIT_PROMPT_CLEAN=" %{$GIT_CLEAN_COLOR%}✔"

ZSH_THEME_GIT_PROMPT_ADDED="%{$FG[082]%}✚%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$FG[166]%}✹%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DELETED="%{$FG[160]%}✖%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_RENAMED="%{$FG[220]%}➜%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$FG[082]%}═%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$FG[190]%}✭%{$reset_color%}"

autoload colors zsh/terminfo
colors
for color in RED GREEN YELLOW BLUE MAGENTA CYAN WHITE GREY; do
    eval PR_$color='%{$terminfo[bold]$fg[${(L)color}]%}'
    eval PR_LIGHT_$color='%{$fg[${(L)color}]%}'
done

PROMPT='
'%{$bg[green]%}%{$fg[black]%}' '%n' '%{$reset_color%}%{$fg[green]%}%{$bg[blue]%}$'\u2b80'%{$reset_color%}%{$fg[white]%}%{$bg[blue]%}' '%~$'$(git_prompt_info) '%{$reset_color%}%{$fg[blue]%}$'\u2b80\n%(?..%{$fg[red]%}%? ↵ )%{$fg_bold[red]%}➜ %{$reset_color%}'

RPROMPT=$'%{$PR_GREY%}($(rvm_prompt_info || rbenv_prompt_info))%{$POWERLINE_COLOR_FG_WHITE%}\u2b82%{$reset_color%}%{$POWERLINE_COLOR_BG_WHITE%} %{$POWERLINE_COLOR_FG_GRAY%}%D{%X}%  \u2b82%{$POWERLINE_COLOR_BG_GRAY%}%{$POWERLINE_COLOR_FG_WHITE%} %D{%b %d}%{$reset_color%}'
