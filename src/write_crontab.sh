function write_crontab(){
	local name="${1}"

	printf "
0 * * * * ${HOME}/.local/bin/resync.sh "${name}"
0,10,20,30,40,50 * * * * /usr/bin/find ${HOME}/Temporary -amin +180 -delete
	" | crontab
}