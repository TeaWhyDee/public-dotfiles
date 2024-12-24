# Defined in - @ line 1
function gcc17 
  c && g++ -o gcc.out -std=c++17 main.cpp && printf '\033[1;32mRunning gcc.out (c++17):\033[0m\n' && ./gcc.out $argv;
end
