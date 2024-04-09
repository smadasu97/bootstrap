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
		${HOME}/.local/bin/goodls -u "${atuin_id}" &> "/dev/null"
		chmod a+x "${PWD}/atuin"
		cp "${PWD}/atuin" "${HOME}/.local/bin"

		printf "Installing bashrc_utils\n"
		git clone "https://github.com/gvlassis/bashrc_utils.git" &> "/dev/null"
		(
			cd bashrc_utils
			git remote set-url origin git@github.com:gvlassis/bashrc_utils.git
		)
		rm -rf "${HOME}/Projects/bashrc_utils"
		cp -R "${PWD}/bashrc_utils" "${HOME}/Projects"
		ln -sf "${HOME}/Projects/bashrc_utils" "${HOME}/.local/share"

		printf "Installing blesh\n"
		${HOME}/.local/bin/goodls -u "https://drive.google.com/file/d/1f2LZHyOgMpjE13kIhstX0uYQAAWVez4K/view?usp=sharing" &> "/dev/null"
		unzip -q blesh.zip
		cp -R "${PWD}/blesh" "${HOME}/.local/share"

		printf "Installing catimg\n"
		${HOME}/.local/bin/goodls -u "${catimg_id}" &> "/dev/null"
		chmod a+x "${PWD}/catimg"
		cp "${PWD}/catimg" "${HOME}/.local/bin"

		printf "Installing git-prompt.sh\n"
		curl -LOJsS "https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh"
		cp "${PWD}/git-prompt.sh" "${HOME}/.local/share"

		printf "Installing micromamba\n"
		curl -LOJsS "https://micro.mamba.pm/api/micromamba/${micromamba_id}/latest"
		tar -xj -f ${PWD}/micromamba*
		cp "${PWD}/bin/micromamba" "${HOME}/.local/bin"

		printf "Installing nnn\n"
		${HOME}/.local/bin/goodls -u "${nnn_id}" &> "/dev/null"
		chmod a+x "${PWD}/nnn"
		cp "${PWD}/nnn" "${HOME}/.local/bin"

		printf "Installing quit.cd\n"
		${HOME}/.local/bin/goodls -u "https://drive.google.com/file/d/1xCKAoA0p8Nu8EnECJeZbjtpzMyNEUUwh/view?usp=sharing" &> "/dev/null"
		mkdir "${HOME}/.local/share/nnn" &> "/dev/null"
		cp "${PWD}/quitcd.sh" "${HOME}/.local/share/nnn"

		printf "Installing pokecat\n"
		git clone "https://github.com/gvlassis/pokecat.git" &> "/dev/null"
		(
			cd pokecat
			git remote set-url origin git@github.com:gvlassis/pokecat.git
		)
		rm -rf "${HOME}/Projects/pokecat"
		cp -R "${PWD}/pokecat" "${HOME}/Projects"
		ln -sf "${HOME}/Projects/pokecat/src/pokecat.sh" "${HOME}/.local/bin"

		printf "Installing rclone\n"
		curl -LOJsS "https://downloads.rclone.org/rclone-current-${rclone_id}.zip"
		unzip -q ${PWD}/rclone*
		cp ${PWD}/rclone*/rclone "${HOME}/.local/bin"

		printf "Installing Python\n"
		${HOME}/.local/bin/micromamba -y install -n base python=3.11 &> "/dev/null"

		printf "Installing git\n"
		${HOME}/.local/bin/micromamba -y install -n base git &> "/dev/null"

		printf "Installing Python requests\n"
		${HOME}/.local/bin/micromamba run -n base pip3 install requests &> "/dev/null"

		printf "Installing zellij\n"
		curl -LOJsS "https://github.com/zellij-org/zellij/releases/latest/download/zellij-$zellij_id.tar.gz"
		tar -xz -f ${PWD}/zellij*
		cp ${PWD}/zellij "${HOME}/.local/bin/zellij"

		printf "Installing btop\n"
		${HOME}/.local/bin/goodls -u "${btop_id}" &> "/dev/null"
		chmod a+x "${PWD}/btop"
		cp "${PWD}/btop" "${HOME}/.local/bin"

		printf "Installing nvtop\n"
		${HOME}/.local/bin/goodls -u "${nvtop_id}" &> "/dev/null"
		chmod a+x "${PWD}/nvtop"
		cp "${PWD}/nvtop" "${HOME}/.local/bin"

		printf "Installing soft\n"
		git clone "https://github.com/gvlassis/soft.git" &> "/dev/null"
		(
			cd soft
			git remote set-url origin git@github.com:gvlassis/soft.git
		)
		rm -rf "${HOME}/Projects/soft"
		cp -R "${PWD}/soft" "${HOME}/Projects"
		ln -sf "${HOME}/Projects/soft/src/soft.sh" "${HOME}/.local/bin"
	)
	rm -rf "${PWD}/tmp_bootstrap"
}