# Defined in - @ line 1
function nvc --wraps='sudo nvim ~/.config/nvim/init.vim' --description 'alias nvc sudo nvim ~/.config/nvim/init.vim'
  sudo nvim ~/.config/nvim/init.vim $argv;
end
