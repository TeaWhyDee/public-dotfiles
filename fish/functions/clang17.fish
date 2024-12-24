# Defined in - @ line 1
function clang17
  c && clang++ main.cpp -std=c++17 -o clang.out && printf '\033[1;32mRunning clang.out (c++17 clang):\033[0m\n' && ./clang.out;
end
