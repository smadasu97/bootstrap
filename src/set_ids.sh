# Sets the locations of the architecture-dependent programs
function set_ids(){
	local os="$(uname)"
	local arch="$(uname -m)"

	if [ "${os}" = "Darwin" ]; then
		if [ "${arch}" = "arm64" ]; then
			printf "\x1b[32mmacOS-arm64 (supported) detected\x1b[0m\n"
			atuin_id="https://drive.google.com/file/d/1SdU9OUoFuP2bVzhhBCS75oGFwum8J8Do/view?usp=share_link"
			bottom_id="https://drive.google.com/file/d/1a7bB25JkOGkhICUKmqPGpKlcBOZAEskM/view?usp=share_link"
			catimg_id="https://drive.google.com/file/d/1j8H5iq9rauS_04XMsTX7pqElf3JWQ9wC/view?usp=share_link"
			fastfetch_id="Darwin"
			goodls_id="darwin_amd64"
			micromamba_id="osx-arm64"
			nnn_id="https://drive.google.com/file/d/1jHGoOOdNk8KY_Y4UrIC97XxaIiarIFUw/view?usp=share_link"
			rclone_id="osx-arm64"
		else
			printf "\x1b[31mmacOS-${arch} (unsupported) detected\x1b[0m\n" >& 2
			exit 2
		fi
	elif [ "${os}" = "Linux" ]; then
		if [ "${arch}" = "x86_64" ]; then
			printf "\x1b[32mLinux-amd64 (supported) detected\x1b[0m\n"
			atuin_id="https://drive.google.com/file/d/1YAwu9cCFnqTvwhUQySPg18FSMNNXI9d_/view?usp=share_link"
			bottom_id="https://drive.google.com/file/d/1CVebWFC-PTV3hVihNdHwoIZe-m5ls2sp/view?usp=share_link"
			catimg_id="https://drive.google.com/file/d/1qakNW2xoloMnol_oHHgPwNb8RZve6ihx/view?usp=share_link"
			fastfetch_id="Linux"
			goodls_id="linux_amd64"
			micromamba_id="linux-64"
			nnn_id="https://drive.google.com/file/d/12-B9YRYGGCJBkz--QVhcWBhzEH3b7gHZ/view?usp=share_link"
			rclone_id="linux-amd64"
		else
			printf "\x1b[31mLinux-${arch} (unsupported) detected\x1b[0m\n" >& 2
			exit 2
		fi
	else
		printf "\x1b[31m${os} (unsupported) detected\x1b[0m\n" >& 2
		exit 1
	fi
}