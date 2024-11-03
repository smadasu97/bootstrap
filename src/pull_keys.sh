function pull_keys(){
    
    #local name="${1}"
    # Prompt for Google Drive username
    read -p "Enter your Google Drive username (ensuring SSH and atuin keys are located in 'Keys' folder): " GDRIVE_USERNAME

    # Construct the rclone remote name based on the input
    local name="${GDRIVE_USERNAME}"


    PATH="${HOME}/.local/bin:${PATH}"

    mkdir "${HOME}/.ssh" &> "/dev/null"
    rclone sync ${name}:Keys "${HOME}/.ssh" --include "{id_rsa.pub,id_rsa,id_dsa.pub,id_dsa,id_ecdsa.pub,id_ecdsa,id_ed25519.pub,id_ed25519}" &> "/dev/null"
    # SSH keys require specific permissions
    chmod 600 "${HOME}/.ssh/id_rsa" "${HOME}/.ssh/id_dsa" "${HOME}/.ssh/id_ecdsa" "${HOME}/.ssh/id_ed25519"

    mkdir "${HOME}/.local/share/atuin" &> "/dev/null"
    rclone sync ${name}:Keys "${HOME}/.local/share/atuin" --include "key" &> "/dev/null"
}
