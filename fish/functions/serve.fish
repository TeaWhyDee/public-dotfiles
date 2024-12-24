# Defined in - @ line 1
function serve --wraps='browser-sync start --server --files .' --description 'alias serve browser-sync start --server --files .'
  browser-sync start --server --files . $argv;
end
