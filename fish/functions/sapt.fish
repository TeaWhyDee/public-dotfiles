# Defined in - @ line 1
function sapt --wraps='sudo apt install' --description 'alias sapt sudo apt install'
  sudo apt install $argv;
end
