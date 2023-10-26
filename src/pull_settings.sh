# Use rclone's bisync --resync functionality to pull settings while setting up subsequent bisync runs
function pull_settings(){
	local name="${1}"

	${HOME}/.local/bin/rclone bisync --resync ${name}:Configs "${HOME}" --include "{.bash_profile,.bashrc,.blerc,.condarc,.gitconfig,.hushlogin}" &> "/dev/null"

	mkdir "${HOME}/.config/bottom" &> "/dev/null"
	${HOME}/.local/bin/rclone bisync --resync ${name}:Configs "${HOME}/.config/bottom" --include "bottom.toml" &> "/dev/null"

	mkdir "${HOME}/.ssh" &> "/dev/null"
	${HOME}/.local/bin/rclone bisync --resync ${name}:Configs "${HOME}/.ssh" --include "{id_rsa.pub,id_rsa,id_dsa.pub,id_dsa,id_ecdsa.pub,id_ecdsa,id_ed25519.pub,id_ed25519,config}" &> "/dev/null"
	# SSH keys require specific permissions
	chmod go-r "${HOME}/.ssh/id_rsa" "${HOME}/.ssh/id_dsa" "${HOME}/.ssh/id_ecdsa" "${HOME}/.ssh/id_ed25519"

	mkdir "${HOME}/.config/atuin" &> "/dev/null"
	${HOME}/.local/bin/rclone bisync --resync ${name}:Configs "${HOME}/.config/atuin" --include "config.toml" &> "/dev/null"
	mkdir "${HOME}/.local/share/atuin" &> "/dev/null"
	${HOME}/.local/bin/rclone bisync --resync ${name}:Configs "${HOME}/.local/share/atuin" --include "key" &> "/dev/null"

	${HOME}/.local/bin/rclone bisync --resync ${name}:Configs "${HOME}/.config/rclone" --include "rclone.conf" &> "/dev/null"
}