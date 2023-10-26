printf "Starting bootstraping🥾\n"

script_path="$(readlink -f "${0}")"
src_path="$(dirname "${script_path}")"

. "${src_path}/set_ids.sh"
set_ids

. "${src_path}/utils.sh"
check_dependencies bzip2 unzip

printf "Creating directories\n"
. "${src_path}/create_dirs.sh"
create_dirs

printf "Installing programs\n"
. "${src_path}/install_programs.sh"
install_programs

printf "Connecting to Google Drive\n"
. "${src_path}/connect_drive.sh"
connect_drive "drive" "934913687557-bmv21rhqinttpjh3a63ipnt4qsol38f2.apps.googleusercontent.com"

printf "Pulling settings\n"
. "${src_path}/pull_settings.sh"
pull_settings "drive"

printf "Connecting to Atuin\n"
. "${src_path}/connect_atuin.sh"
connect_atuin "gvlassis"

printf "Writing crontab\n"
printf "
* * * * * ${HOME}/.local/bin/rclone bisync --force mydrive:Configs ${HOME} --include {.bash_profile,.bashrc,.blerc,.condarc,.gitconfig,.hushlogin}
* * * * * ${HOME}/.local/bin/rclone bisync --force mydrive:Configs ${HOME}/.config/bottom --include bottom.toml
* * * * * ${HOME}/.local/bin/rclone bisync --force mydrive:Configs ${HOME}/.config/atuin --include config.toml
* * * * * ${HOME}/.local/bin/rclone bisync --force mydrive:Configs ${HOME}/.local/share/atuin --include key
* * * * * ${HOME}/.local/bin/rclone bisync --force mydrive:Configs ${HOME}/.config/rclone --include rclone.conf
* * * * * ${HOME}/.local/bin/rclone bisync --force mydrive:Configs ${HOME}/.ssh --include {id_rsa.pub,id_rsa,id_dsa.pub,id_dsa,id_ecdsa.pub,id_ecdsa,id_ed25519.pub,id_ed25519,config}
* * * * * /usr/bin/find ${HOME}/Temporary -amin +180 -delete
" | crontab

printf "Bootstrapping finished🥾\n"