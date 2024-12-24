# Defined in - @ line 1
function steam --wraps='steam -noverifyfile' --description 'alias steam steam -noverifyfile'
 command steam -noverifyfile $argv;
end
