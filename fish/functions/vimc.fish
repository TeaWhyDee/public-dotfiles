# Defined in - @ line 1
function vimc --wraps='vim -u ~/.config/nvim_custom/init.vim' --description 'alias vimc vim -u ~/.config/nvim_custom/init.vim'
  vim -u ~/.config/nvim_custom/init.vim $argv;
end
