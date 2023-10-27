printf "\x1b[1mStarting bootstraping🥾\x1b[0m\n"

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
. "${src_path}/write_crontab.sh"
write_crontab "drive"

printf "\x1b[1mBootstrapping finished🥾\x1b[0m\n"