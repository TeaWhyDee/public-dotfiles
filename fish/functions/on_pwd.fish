function on_pwd --on-variable PWD
                     if [ "$(pwd | head -c19)" = "/home/tea/encrypted" ];
                      echo privated; set -g fish_private_mode yes
                  end
              
end
