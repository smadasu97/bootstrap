function pull_configs(){

	(
		cd "${HOME}"

		# .bash_profile
		${HOME}/.local/bin/goodls -u "https://drive.google.com/file/d/1wy6Pk8BHd_IPZOlDHDV3DqY3kOXytMzd/view?usp=sharing" &> "/dev/null"
		# .bashrc
		${HOME}/.local/bin/goodls -u "https://drive.google.com/file/d/1Zid68heYwguJkyxpAsZw8zc78jVZTrOB/view?usp=sharing" &> "/dev/null"
		# .blerc
		${HOME}/.local/bin/goodls -u "https://drive.google.com/file/d/13Hwo8vRJNNyVAopGYKIvs-RJHfUzNqlF/view?usp=sharing" &> "/dev/null"
		# .condarc
		${HOME}/.local/bin/goodls -u "https://drive.google.com/file/d/1GW0pMDSG7AR0YcEN19qxuJLnf6ogzNdI/view?usp=sharing" &> "/dev/null"
		# .gitconfig
		${HOME}/.local/bin/goodls -u "https://drive.google.com/file/d/1bV9GT4um_0RpDxLIdjkZ-7Q8cMk6BJ6U/view?usp=sharing" &> "/dev/null"
	)

	mkdir "${HOME}/.config/bottom" &> "/dev/null"
	(
		cd "${HOME}/.config/bottom"

		# bottom.toml
		${HOME}/.local/bin/goodls -u "https://drive.google.com/file/d/1f_45cdGxDRUySSXquups5AHWZ4gd7l5H/view?usp=sharing" &> "/dev/null"
	)

	mkdir "${HOME}/.ssh" &> "/dev/null"
	(
		cd "${HOME}/.ssh"

		# config
		${HOME}/.local/bin/goodls -u "https://drive.google.com/file/d/1u94i3xI0keixo3e1Lfv_ZFMrWLFUh7bm/view?usp=sharing" &> "/dev/null"
	)

	mkdir "${HOME}/.config/atuin" &> "/dev/null"
	(
		cd "${HOME}/.config/atuin"

		# config.toml
		${HOME}/.local/bin/goodls -u "https://drive.google.com/file/d/1OWHbmENvfx-RNvxYJUL51WLzt5UoSVWi/view?usp=sharing" &> "/dev/null"
	)
}