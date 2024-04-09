function check_dependencies(){
    local dependencies="${@}"

    for dependency in $dependencies; do
        if ! type -P "${dependency}" &> "/dev/null"; then
            if [ -n "${missing_dependencies}" ]; then
                local missing_dependencies="${missing_dependencies}, ${dependency}"
            else
                local missing_dependencies="${dependency}"
            fi
        fi
    done

    if [ -n "${missing_dependencies}" ]; then
        local script_path="$(readlink -f "${0}")"
        printf "\x1b[31m${script_path}: The following dependencies are not in PATH: ${missing_dependencies}\x1b[0m\n" >& 2
        exit 1
    fi
}