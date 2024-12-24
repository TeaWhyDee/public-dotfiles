function dmigrate --wraps='python manage.py migrate' --description 'alias dmigrate python manage.py migrate'
  python manage.py migrate $argv
        
end
