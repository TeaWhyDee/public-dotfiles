function dshell --wraps='python manage.py shell' --description 'alias dshell python manage.py shell'
  python manage.py shell $argv
        
end
