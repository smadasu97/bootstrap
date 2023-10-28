# bootstrap

## Description

Program for fast bootstrapping of my personal development environment on new computers (e.g in the Cloud). The program does the following:

1. Checks the architecture of the new computer (macOS-arm64 and Linux-amd64 are supported)
1. Checks if the dependencies bzip2 and unzip are in PATH
1. Creates useful directories (e.g. $HOME/Projects)
1. Installs the *latest* versions of my essential programs. For those that do not offer prebuilt binaries, I use binaries compiled by me and hosted on my personal Google Drive
1. Sets up **bidirectional syncing of my configuration files via Google Drive**. This is similar to how Android backups certain settings on Google Drive.
1. Connects to my [Atuin](https://github.com/atuinsh/atuin) account
1. Writes my crontab

https://github.com/gvlassis/bootstrap/assets/74119653/ca2572fd-e567-471d-9f31-759b0b32bf6a

## TODO
\-

## Installation

bzip2 and unzip are needed for the installation of programs.

To install, just `git clone https://github.com/gvlassis/bootstrap.git`.

To run, simply `./bootstrap/src/bootstrap.sh`

## Architecture

Code is split to various files under ./src. Each of these files roughly correspond to one of the steps listed in the [Description](#description) section.

set_ids.sh assigns the locations of the programs to be installed to *_id variables.

utils.sh checks that the dependencies are in PATH.

create_dirs.sh creates useful directories.

install_programs.sh uses the *_id variables plus curl, git and [goodls](https://github.com/tanaikech/goodls) to download the *latest* versions of my essential programs.

> Shameless plug: One of the installed programs is [pokecat](https://github.com/gvlassis/pokecat). Try it!

connect_drive.sh connects (via [rclone](https://rclone.org/)) to my personal Google Drive. My client_secret and config_token are needed to log in.

pull_settings.sh pulls my configuration files from my Google Drive. The files include .bashrc, .gitconfig and my SSH keys (I am well aware of the danger). Think about how **crazy convenient** this is!

connect_atuin.sh, well, connects to [Atuin](https://github.com/atuinsh/atuin) 😂.

write_crontab.sh writes my crontab.

> CAUTION: cron tasks may run in parallel. This probably caused lock issues with rclone bisync in one of the previous versions of bootstrap. This is why I made the script resync.sh, that groups all the syncing. It also makes manual resyncing *way* more convenient.