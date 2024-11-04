printf "\x1b[1m🥾Starting bootstrap\x1b[0m\n"

# Prompt for Google Drive and Atuin usernames and client ID
read -p "Enter your Google Drive username: " GDRIVE_USERNAME
read -p "Enter the Google Drive client ID: " GDRIVE_CLIENT_ID
read -p "Enter your Atuin username: " ATUIN_USERNAME

script_path="$(readlink -f "${0}")"
src_path="$(dirname "${script_path}")"

. "${src_path}/set_ids.sh"
set_ids

. "${src_path}/utils.sh"
check_dependencies bzip2

printf "Creating directories\n"
. "${src_path}/create_dirs.sh"
create_dirs
touch "${HOME}/.hushlogin"

printf "Installing programs\n"
. "${src_path}/install_programs.sh"
install_programs

printf "Pulling configs\n"
. "${src_path}/pull_configs.sh"
pull_configs

printf "Connecting to Google Drive\n"
. "${src_path}/connect_drive.sh"
connect_drive "${GDRIVE_USERNAME}" "${GDRIVE_CLIENT_ID}"

printf "Pulling keys\n"
. "${src_path}/pull_keys.sh"
pull_keys "${GDRIVE_USERNAME}"

printf "Connecting to Atuin\n"
. "${src_path}/connect_atuin.sh"
connect_atuin "${ATUIN_USERNAME}"

printf "\x1b[1mBootstrapping finished\x1b[0m\n"
