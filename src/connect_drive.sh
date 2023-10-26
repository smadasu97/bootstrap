function connect_drive(){
	local name="${1}"
	local client_id="${2}"
	while ! ${HOME}/.local/bin/rclone about ${name}: &> "/dev/null"; do
		printf "${name}: is not setup correctly\n"
		local client_secret
		read -s -p "client_secret:" client_secret
		printf "\n"
		local config_token
		read -s -p "config_token:" config_token
		printf "\n"
		${HOME}/.local/bin/rclone config create ${name} drive client_id="${client_id}" client_secret="${client_secret}" scope=drive config_is_local=false config_token="${config_token}" config_change_team_drive=false &> "/dev/null"
	done
}