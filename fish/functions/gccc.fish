# Defined in - @ line 1
function gccc --wraps='clear ; gcc main.c -o out && ./out' --description 'alias gccc clear; gcc main.c -o out && ./out'
  clear ; gcc main.c -o out && ./out $argv;
end
