function dmakemigrations --wraps='python manage.py makemigrations' --description 'alias dmakemigrations python manage.py makemigrations'
  python manage.py makemigrations $argv
        
end
