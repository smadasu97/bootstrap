function connect_atuin(){
	local username="${1}"
	while ! ${HOME}/.local/bin/atuin status &> "/dev/null"; do
		printf "Not logged in Atuin\n"
		read -s -p "password:" password
		printf "\n"
		${HOME}/.local/bin/atuin login -u "${username}" -k "" -p "${password}" &> "/dev/null"
	done
}