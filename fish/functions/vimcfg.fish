# Defined in - @ line 1
function vimcfg --wraps='vim ~/.config/nvim_custom/init.vim -u ~/.config/nvim_custom/init.vim' --description 'alias vimcfg vim ~/.config/nvim_custom/init.vim -u ~/.config/nvim_custom/init.vim'
  vim ~/.config/nvim_custom/init.vim -u ~/.config/nvim_custom/init.vim $argv;
end
