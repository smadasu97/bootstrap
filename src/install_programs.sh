function install_programs(){
	rm -rf "${PWD}/tmp_bootstrap"
	mkdir "${PWD}/tmp_bootstrap"
	(
		cd "${PWD}/tmp_bootstrap"

		# goodls might be used to download other programs, so install it first
		printf "Installing goodls\n"
		curl -LOJsS "https://github.com/tanaikech/goodls/releases/latest/download/goodls_${goodls_id}"
		chmod a+x ${PWD}/goodls*
		cp ${PWD}/goodls* "${HOME}/.local/bin/goodls"

		printf "Installing atuin\n"
		# Code borrowed from https://raw.githubusercontent.com/atuinsh/atuin/main/install.sh
		local atuin_latest_release=$(curl -L -s -H 'Accept: application/json' https://github.com/atuinsh/atuin/releases/latest)
		local atuin_latest_version=$(echo "$atuin_latest_release" | sed -e 's/.*"tag_name":"\([^"]*\)".*/\1/')
		curl -LOJsS "https://github.com/atuinsh/atuin/releases/download/${atuin_latest_version}/atuin-${atuin_latest_version}-${atuin_id}.tar.gz"
		tar -xz -f ${PWD}/atuin*
		cp ${PWD}/atuin*/atuin "${HOME}/.local/bin"

		printf "Installing bashrc_utils\n"
		git -C "${HOME}/Projects" clone "https://github.com/gvlassis/bashrc_utils.git" &> "/dev/null"
		ln -sf "${HOME}/Projects/bashrc_utils" "${HOME}/.local/share"

		printf "Installing blesh\n"
		${HOME}/.local/bin/goodls -u "https://drive.google.com/file/d/1f2LZHyOgMpjE13kIhstX0uYQAAWVez4K/view?usp=drive_link" &> "/dev/null"
		unzip -q blesh.zip
		cp -R "${PWD}/blesh" "${HOME}/.local/share"

		printf "Installing bottom\n"
		curl -LOJsS "https://github.com/ClementTsang/bottom/releases/latest/download/bottom_${bottom_id}.tar.gz"
		tar -xz -f ${PWD}/bottom*
		cp "${PWD}/btm" "${HOME}/.local/bin"

		printf "Installing catimg\n"
		${HOME}/.local/bin/goodls -u "${catimg_id}" &> "/dev/null"
		chmod a+x "${PWD}/catimg"
		cp "${PWD}/catimg" "${HOME}/.local/bin"

		printf "Installing fastfetch\n"
		# Similarly to atuin
		local fastfetch_latest_release=$(curl -L -s -H 'Accept: application/json' https://github.com/fastfetch-cli/fastfetch/releases/latest)
		local fastfetch_latest_version=$(echo "$fastfetch_latest_release" | sed -e 's/.*"tag_name":"\([^"]*\)".*/\1/')
		curl -LOJsS "https://github.com/fastfetch-cli/fastfetch/releases/download/${fastfetch_latest_version}/fastfetch-${fastfetch_latest_version}-${fastfetch_id}.tar.gz"
		tar -xz -f ${PWD}/fastfetch*
		cp ${PWD}/fastfetch*/usr/bin/fastfetch "${HOME}/.local/bin"

		printf "Installing git-prompt.sh\n"
		curl -LOJsS "https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh"
		cp "${PWD}/git-prompt.sh" "${HOME}/.local/share"

		printf "Installing kitty.bash\n"
		curl -LOJsS "https://raw.githubusercontent.com/kovidgoyal/kitty/master/shell-integration/bash/kitty.bash"
		mkdir "${HOME}/.local/share/kitty" &> "/dev/null"
		cp "${PWD}/kitty.bash" "${HOME}/.local/share/kitty"

		printf "Installing xterm-kitty\n"
		curl -LOJsS "https://github.com/kovidgoyal/kitty/raw/master/terminfo/x/xterm-kitty"
		mkdir "${HOME}/.terminfo" &> "/dev/null"
		mkdir "${HOME}/.terminfo/x" &> "/dev/null"
		cp "${PWD}/xterm-kitty" "${HOME}/.terminfo/x"

		printf "Installing micromamba\n"
		curl -LOJsS "https://micro.mamba.pm/api/micromamba/${micromamba_id}/latest"
		tar -xj -f ${PWD}/micromamba*
		cp "${PWD}/bin/micromamba" "${HOME}/.local/bin"

		printf "Installing nnn\n"
		${HOME}/.local/bin/goodls -u "${nnn_id}" &> "/dev/null"
		chmod a+x "${PWD}/nnn"
		cp "${PWD}/nnn" "${HOME}/.local/bin"

		printf "Installing quit.cd\n"
		${HOME}/.local/bin/goodls -u "https://drive.google.com/file/d/1xCKAoA0p8Nu8EnECJeZbjtpzMyNEUUwh/view?usp=share_link" &> "/dev/null"
		mkdir "${HOME}/.local/share/nnn" &> "/dev/null"
		cp "${PWD}/quitcd.sh" "${HOME}/.local/share/nnn"

		printf "Installing nvtop\n"
		${HOME}/.local/bin/goodls -u "${nvtop_id}" &> "/dev/null"
		chmod a+x "${PWD}/nvtop"
		cp "${PWD}/nvtop" "${HOME}/.local/bin"

		printf "Installing pokecat\n"
		git -C "${HOME}/Projects" clone "https://github.com/gvlassis/pokecat.git" &> "/dev/null"
		ln -sf "${HOME}/Projects/pokecat/src/pokecat.sh" "${HOME}/.local/bin"

		printf "Installing rclone\n"
		curl -LOJsS "https://downloads.rclone.org/rclone-current-${rclone_id}.zip"
		unzip -q ${PWD}/rclone*
		cp ${PWD}/rclone*/rclone "${HOME}/.local/bin"
	)
	rm -rf "${PWD}/tmp_bootstrap"

	printf "Installing resync.sh\n"
	local script_path="$(readlink -f "${0}")"
	local src_path="$(dirname "${script_path}")"

	cp "${src_path}/resync.sh" "${HOME}/.local/bin"
}