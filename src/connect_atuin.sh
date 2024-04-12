function connect_atuin(){
	local username="${1}"
	while ! ${HOME}/.local/bin/atuin status | grep "Remote" &> "/dev/null"; do
		printf "\e[31mNot logged in Atuin\e[0m\n"
		read -s -p "password:" password
		printf "\n"
		${HOME}/.local/bin/atuin login -u "${username}" -k "" -p "${password}" &> "/dev/null"
	done

	printf "\x1b[32mSuccess!\x1b[0m\n"
}