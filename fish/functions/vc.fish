# Defined via `source`
function vc --wraps=vultr-cli --description 'alias vc vultr-cli'
  vultr-cli $argv; 
end
