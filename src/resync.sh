# Meant to be run by crond

name="${1}"

${HOME}/.local/bin/rclone bisync --force ${name}:Configs ${HOME} --include "{.bash_profile,.bashrc,.blerc,.condarc,.gitconfig}"
${HOME}/.local/bin/rclone bisync --force ${name}:Configs ${HOME}/.config/bottom --include "bottom.toml"
${HOME}/.local/bin/rclone bisync --force ${name}:Configs ${HOME}/.config/atuin --include "config.toml"
${HOME}/.local/bin/rclone bisync --force ${name}:Configs ${HOME}/.local/share/atuin --include "key"
${HOME}/.local/bin/rclone bisync --force ${name}:Configs ${HOME}/.ssh --include "{id_rsa.pub,id_rsa,id_dsa.pub,id_dsa,id_ecdsa.pub,id_ecdsa,id_ed25519.pub,id_ed25519,config}"