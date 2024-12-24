# Defined in - @ line 1
function cdf --wraps='cd (find . -type d -print | fzf)' --description 'alias cdf cd (find . -type d -print | fzf)'
  cd (find . -type d -print | fzf) $argv;
end
