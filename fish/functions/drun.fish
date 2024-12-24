function drun --wraps='python manage.py runserver' --description 'alias drun python manage.py runserver'
  python manage.py runserver $argv
        
end
