function write_crontab(){
	local name="${1}"

	printf "
* * * * * ${HOME}/.local/bin/rclone bisync --force ${name}:Configs ${HOME} --include '{.bash_profile,.bashrc,.blerc,.condarc,.gitconfig,.hushlogin}'
* * * * * ${HOME}/.local/bin/rclone bisync --force ${name}:Configs ${HOME}/.config/bottom --include 'bottom.toml'
* * * * * ${HOME}/.local/bin/rclone bisync --force ${name}:Configs ${HOME}/.config/atuin --include 'config.toml'
* * * * * ${HOME}/.local/bin/rclone bisync --force ${name}:Configs ${HOME}/.local/share/atuin --include 'key'
* * * * * ${HOME}/.local/bin/rclone bisync --force ${name}:Configs ${HOME}/.config/rclone --include 'rclone.conf'
* * * * * ${HOME}/.local/bin/rclone bisync --force ${name}:Configs ${HOME}/.ssh --include '{id_rsa.pub,id_rsa,id_dsa.pub,id_dsa,id_ecdsa.pub,id_ecdsa,id_ed25519.pub,id_ed25519,config}'
* * * * * /usr/bin/find ${HOME}/Temporary -amin +180 -delete
	" | crontab
}