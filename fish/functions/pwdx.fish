# Defined via `source`
function pwdx --wraps='pwd | xclip -selection clipboard' --description 'alias pwdx=pwd | xclip -selection clipboard'
  pwd | xclip -selection clipboard $argv; 
end
