function pull_configs(){

    PATH="${HOME}/.local/bin:${PATH}"

    (
        cd "${HOME}"

        # .bash_profile
        goodls -u "https://drive.google.com/file/d/1wy6Pk8BHd_IPZOlDHDV3DqY3kOXytMzd/view?usp=sharing" &> "/dev/null"
        # .bashrc
        goodls -u "https://drive.google.com/file/d/1Zid68heYwguJkyxpAsZw8zc78jVZTrOB/view?usp=sharing" &> "/dev/null"
        # .blerc
        goodls -u "https://drive.google.com/file/d/13Hwo8vRJNNyVAopGYKIvs-RJHfUzNqlF/view?usp=sharing" &> "/dev/null"
        # .condarc
        goodls -u "https://drive.google.com/file/d/1GW0pMDSG7AR0YcEN19qxuJLnf6ogzNdI/view?usp=sharing" &> "/dev/null"
        # .gitconfig
        goodls -u "https://drive.google.com/file/d/1bV9GT4um_0RpDxLIdjkZ-7Q8cMk6BJ6U/view?usp=sharing" &> "/dev/null"
    )

    mkdir "${HOME}/.ssh" &> "/dev/null"
    (
        cd "${HOME}/.ssh"

        # config
        goodls -u "https://drive.google.com/file/d/1u94i3xI0keixo3e1Lfv_ZFMrWLFUh7bm/view?usp=sharing" &> "/dev/null"
    )

    mkdir "${HOME}/.config/atuin" &> "/dev/null"
    (
        cd "${HOME}/.config/atuin"

        # config.toml
        goodls -u "https://drive.google.com/file/d/1OWHbmENvfx-RNvxYJUL51WLzt5UoSVWi/view?usp=sharing" &> "/dev/null"
    )

    mkdir "${HOME}/.config/zellij" &> "/dev/null"
    (
        cd "${HOME}/.config/zellij"

        # config.kdl
        goodls -u "https://drive.google.com/file/d/1-RRfDjOVctimSTZkCOstZdPQ-RqxT6m4/view?usp=sharing" &> "/dev/null"
    )

    mkdir "${HOME}/.config/btop" &> "/dev/null"
    (
        cd "${HOME}/.config/btop"

        # btop.conf
        goodls -u "https://drive.google.com/file/d/1jogoEZ2ioyw86j3b5RkH3qrS_1MOs-YC/view?usp=sharing" &> "/dev/null"
    )

    mkdir "${HOME}/.config/nvtop" &> "/dev/null"
    (
        cd "${HOME}/.config/nvtop"

        # nvtop.ini
        goodls -u "https://drive.google.com/file/d/1QEIaIk4LiUt4vMPcl9GGmVpBN99YqwCl/view?usp=sharing" &> "/dev/null"
    )

    mkdir "${HOME}/.proxychains" &> "/dev/null"
    (
        cd "${HOME}/.proxychains"

        # proxychains.conf
        goodls -u "https://drive.google.com/file/d/1fPHiN92HZlF6EIAiRbDuZCa23dW48WOH/view?usp=sharing" &> "/dev/null"
    )
    
    mkdir "${HOME}/.config/nvim" &> "/dev/null"
    (
        cd "${HOME}/.config/nvim"

        # init.lua
        goodls -u "https://drive.google.com/file/d/1RzO8knUUz1ZevYWEnCceFQemUFE8Eg6E/view?usp=sharing" &> "/dev/null"

        # .vimrc
        goodls -u "https://drive.google.com/file/d/1zuN5d0jc09QmWGeIuI2Y4dp9Cn7PA78j/view?usp=sharing" &> "/dev/null"
    )

    mkdir "${HOME}/.config/nvim/colors" &> "/dev/null"
    (
        cd "${HOME}/.config/nvim/colors"

        # personal.vim
        goodls -u "https://drive.google.com/file/d/1Z_0GQntt2-biH95yiPctwm63T--gVkK8/view?usp=sharing" &> "/dev/null"
    )
}
