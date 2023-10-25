printf "Starting bootstraping🥾\n"

os="$(uname)"
arch="$(uname -m)"

if [ "${os}" = "Darwin" ]; then
    if [ "${arch}" = "arm64" ]; then
		printf "macOS-arm64 (supported) detected\n"
        micromamba_id="osx-arm64"
		rclone_id="osx-arm64"
		goodls_id="darwin_amd64"
		atuin_id="aarch64-apple-darwin"
		bottom_id="aarch64-apple-darwin"
		fastfetch_id="Darwin"
		nnn_id="https://drive.google.com/file/d/1jHGoOOdNk8KY_Y4UrIC97XxaIiarIFUw/view?usp=share_link"
		nvtop_id="https://drive.google.com/file/d/1w_97e2xsFGP459QouzzUQCR3iHkTwuxd/view?usp=share_link"
		catimg_id="https://drive.google.com/file/d/1j8H5iq9rauS_04XMsTX7pqElf3JWQ9wC/view?usp=share_link"
    else
		printf "\x1b[1;31mmacOS-${arch} (unsupported) detected\x1b[0m\n" >& 2
        exit 2
    fi
elif [ "${os}" = "Linux" ]; then
    if [ "${arch}" = "x86_64" ]; then
        printf "Linux-amd64 (supported) detected\n"
		micromamba_id="linux-64"
		rclone_id="linux-amd64"
		goodls_id="linux_amd64"
		atuin_id="x86_64-unknown-linux-gnu"
		bottom_id="x86_64-unknown-linux-gnu"
		fastfetch_id="Linux"
		nnn_id="https://drive.google.com/file/d/12-B9YRYGGCJBkz--QVhcWBhzEH3b7gHZ/view?usp=share_link"
		nvtop_id="https://drive.google.com/file/d/1z0AxBFJNSUmOjwdOj6pIP0ypEGkLQdN7/view?usp=share_link"
		catimg_id="https://drive.google.com/file/d/1qakNW2xoloMnol_oHHgPwNb8RZve6ihx/view?usp=share_link"
    else
        printf "\x1b[1;31mLinux-${arch} (unsupported) detected\x1b[0m\n" >& 2
        exit 2
    fi
else
    printf "\x1b[1;31m${os} (unsupported) detected\x1b[0m\n" >& 2
    exit 1
fi

script_path="$(readlink -f "${0}")"
src_path="$(dirname "${script_path}")"
. "${src_path}/utils.sh"
check_dependencies bzip2 unzip

printf "Creating directories\n"
mkdir "${HOME}/Projects" &> "/dev/null"
mkdir "${HOME}/Documents" &> "/dev/null"
mkdir "${HOME}/Temporary" &> "/dev/null"
mkdir "${HOME}/Mount" &> "/dev/null"
mkdir "${HOME}/.local" &> "/dev/null"
mkdir "${HOME}/.local/bin" &> "/dev/null"
mkdir "${HOME}/.local/share" &> "/dev/null"

rm -rf "${PWD}/tmp_bootstrap"
mkdir "${PWD}/tmp_bootstrap"
(
	cd "${PWD}/tmp_bootstrap"

	printf "Installing micromamba\n"
	curl -LOJsS "https://micro.mamba.pm/api/micromamba/${micromamba_id}/latest"
	tar -xj -f ${PWD}/micromamba*
	cp "${PWD}/bin/micromamba" "${HOME}/.local/bin"

	printf "Installing rclone\n"
	curl -LOJsS "https://downloads.rclone.org/rclone-current-${rclone_id}.zip"
	unzip -q ${PWD}/rclone*
	cp ${PWD}/rclone*/rclone "${HOME}/.local/bin"

	printf "Installing goodls\n"
	curl -LOJsS "https://github.com/tanaikech/goodls/releases/latest/download/goodls_${goodls_id}"
	chmod a+x ${PWD}/goodls*
	cp ${PWD}/goodls* "${HOME}/.local/bin/goodls"

	printf "Installing atuin\n"
	# Code borrowed from https://raw.githubusercontent.com/atuinsh/atuin/main/install.sh
	atuin_latest_release=$(curl -L -s -H 'Accept: application/json' https://github.com/atuinsh/atuin/releases/latest)
	atuin_latest_version=$(echo "$atuin_latest_release" | sed -e 's/.*"tag_name":"\([^"]*\)".*/\1/')
	curl -LOJsS "https://github.com/atuinsh/atuin/releases/download/${atuin_latest_version}/atuin-${atuin_latest_version}-${atuin_id}.tar.gz"
	tar -xz -f ${PWD}/atuin*
	cp ${PWD}/atuin*/atuin "${HOME}/.local/bin"

	printf "Installing bottom\n"
	curl -LOJsS "https://github.com/ClementTsang/bottom/releases/latest/download/bottom_${bottom_id}.tar.gz"
	tar -xz -f ${PWD}/bottom*
	cp "${PWD}/btm" "${HOME}/.local/bin"

	printf "Installing fastfetch\n"
	# Similarly to atuin
	fastfetch_latest_release=$(curl -L -s -H 'Accept: application/json' https://github.com/fastfetch-cli/fastfetch/releases/latest)
	fastfetch_latest_version=$(echo "$fastfetch_latest_release" | sed -e 's/.*"tag_name":"\([^"]*\)".*/\1/')
	curl -LOJsS "https://github.com/fastfetch-cli/fastfetch/releases/download/${fastfetch_latest_version}/fastfetch-${fastfetch_latest_version}-${fastfetch_id}.tar.gz"
	tar -xz -f ${PWD}/fastfetch*
	cp ${PWD}/fastfetch*/usr/bin/fastfetch "${HOME}/.local/bin"

	printf "Installing nnn\n"
	${HOME}/.local/bin/goodls -u "${nnn_id}" &> "/dev/null"
	chmod a+x "${PWD}/nnn"
	cp "${PWD}/nnn" "${HOME}/.local/bin"
	# quitcd.sh
	${HOME}/.local/bin/goodls -u "https://drive.google.com/file/d/1xCKAoA0p8Nu8EnECJeZbjtpzMyNEUUwh/view?usp=share_link" &> "/dev/null"
	mkdir "${HOME}/.local/share/nnn" &> "/dev/null"
	cp "${PWD}/quitcd.sh" "${HOME}/.local/share/nnn"

	printf "Installing nvtop\n"
	${HOME}/.local/bin/goodls -u "${nvtop_id}" &> "/dev/null"
	chmod a+x "${PWD}/nvtop"
	cp "${PWD}/nvtop" "${HOME}/.local/bin"

	printf "Installing blesh\n"
	curl -LOJsS "https://github.com/akinomyoga/ble.sh/releases/download/nightly/ble-nightly.tar.xz"
	tar -xJ -f "ble-nightly.tar.xz"
	cp -R ble-nightly "${HOME}/.local/share"

	printf "Installing git-prompt.sh\n"
	curl -LOJsS "https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh"
	cp "${PWD}/git-prompt.sh" "${HOME}/.local/share"

	printf "Installing catimg\n"
	${HOME}/.local/bin/goodls -u "${catimg_id}" &> "/dev/null"
	chmod a+x "${PWD}/catimg"
	cp "${PWD}/catimg" "${HOME}/.local/bin"

	printf "Installing pokecat\n"
	git clone -q "https://github.com/gvlassis/pokecat.git"
	cp -R "${PWD}/pokecat" "${HOME}/Projects"
	ln -sf "${HOME}/Projects/pokecat" "${HOME}/.local/share"

	printf "Installing bashrc_utils\n"
	git clone -q "https://github.com/gvlassis/bashrc_utils.git"
	cp -R "${PWD}/bashrc_utils" "${HOME}/Projects"
	ln -sf "${HOME}/Projects/bashrc_utils" "${HOME}/.local/share"

	printf "Installing xterm-kitty\n"
	curl -LOJsS "https://github.com/kovidgoyal/kitty/raw/master/terminfo/x/xterm-kitty"
	mkdir "${HOME}/.terminfo" &> "/dev/null"
	mkdir "${HOME}/.terminfo/x" &> "/dev/null"
	cp "${PWD}/xterm-kitty" "${HOME}/.terminfo/x"

	printf "Installing kitty.bash\n"
	curl -LOJsS "https://raw.githubusercontent.com/kovidgoyal/kitty/master/shell-integration/bash/kitty.bash"
	mkdir "${HOME}/.local/share/kitty" &> "/dev/null"
	cp "${PWD}/kitty.bash" "${HOME}/.local/share/kitty"
)
rm -rf "${PWD}/tmp_bootstrap"

printf "Connecting to Google Drive\n"
client_id="934913687557-bmv21rhqinttpjh3a63ipnt4qsol38f2.apps.googleusercontent.com"
while ! ${HOME}/.local/bin/rclone about mydrive: &> "/dev/null"; do
	printf "mydrive: is not setup correctly\n"
	read -s -p "client_secret:" client_secret
	read -s -p $'\nconfig_token:' config_token
	${HOME}/.local/bin/rclone config create mydrive drive client_id="${client_id}" client_secret="${client_secret}" scope=drive config_is_local=false config_token="${config_token}" config_change_team_drive=false &> "/dev/null"
done

printf "\nPulling settings\n"
${HOME}/.local/bin/rclone bisync --resync mydrive:Configs "${HOME}" --include "{.bash_profile,.bashrc,.blerc,.condarc,.gitconfig,.hushlogin}" &> "/dev/null"
mkdir "${HOME}/.config/bottom" &> "/dev/null"
${HOME}/.local/bin/rclone bisync --resync mydrive:Configs "${HOME}/.config/bottom" --include "bottom.toml" &> "/dev/null"
mkdir "${HOME}/.config/atuin" &> "/dev/null"
${HOME}/.local/bin/rclone bisync --resync mydrive:Configs "${HOME}/.config/atuin" --include "config.toml" &> "/dev/null"
mkdir "${HOME}/.local/share/atuin" &> "/dev/null"
${HOME}/.local/bin/rclone bisync --resync mydrive:Configs "${HOME}/.local/share/atuin" --include "key" &> "/dev/null"
${HOME}/.local/bin/rclone bisync --resync mydrive:Configs "${HOME}/.config/rclone" --include "rclone.conf" &> "/dev/null"
mkdir "${HOME}/.ssh" &> "/dev/null"
${HOME}/.local/bin/rclone bisync --resync mydrive:Configs "${HOME}/.ssh" --include "{id_rsa.pub,id_rsa,id_dsa.pub,id_dsa,id_ecdsa.pub,id_ecdsa,id_ed25519.pub,id_ed25519,config}" &> "/dev/null"
# SSH keys require specific permissions
chmod go-r "${HOME}/.ssh/id_rsa" "${HOME}/.ssh/id_dsa" "${HOME}/.ssh/id_ecdsa" "${HOME}/.ssh/id_ed25519"

printf "Connecting to Atuin\n"
username="gvlassis"
while ! ${HOME}/.local/bin/atuin status &> "/dev/null"; do
	printf "Not logged in Atuin\n"
	read -s -p "password:" password
	${HOME}/.local/bin/atuin login -u "${username}" -k "" -p "${password}" &> "/dev/null"
done

printf "\nBootstrapping finished🥾\n"