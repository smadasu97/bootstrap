# Create useful directories
function create_dirs(){
    mkdir "${HOME}/Projects" &> "/dev/null"
    mkdir "${HOME}/Temporary" &> "/dev/null"
    mkdir "${HOME}/micromamba" &> "/dev/null"
    mkdir "${HOME}/.local" &> "/dev/null"
    mkdir "${HOME}/.local/bin" &> "/dev/null"
    mkdir "${HOME}/.local/share" &> "/dev/null"
    mkdir "${HOME}/.local/lib" &> "/dev/null"
    mkdir "${HOME}/.config" &> "/dev/null"
}
