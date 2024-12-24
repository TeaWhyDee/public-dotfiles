# Defined in - @ line 1
function lolmatrix --wraps='cmatrix -u 5 -s | lolcat -p 50 -F 0.01' --description 'alias lolmatrix cmatrix -u 5 -s | lolcat -p 50 -F 0.01'
  cmatrix -u 5 -s | lolcat -p 50 -F 0.01 $argv;
end
