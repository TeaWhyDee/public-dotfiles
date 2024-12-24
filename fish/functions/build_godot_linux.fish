# Defined in - @ line 1
function build_godot_linux --wraps='scons platform=x11 tools=no target=release bits=64 disable_3d=yes use_lto=yes -j 12' --description alias\ build_godot_linux=\'scons\ platform=x11\ tools=no\ target=release\ bits=64\ disable_3d=yes\ use_lto=yes\ -j\ 12
  scons platform=x11 tools=no target=release bits=64 disable_3d=yes use_lto=yes -j 12  $argv;
end
