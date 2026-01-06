function load_nvm --on-variable="PWD"
    set -l default_node_version (nvm version default)
    set -l node_version (nvm version)
    set -l nvmrc_path (nvm_find_nvmrc)
    if test -n "$nvmrc_path"
        set -l nvmrc_content (cat $nvmrc_path)
        set -l nvmrc_node_version (nvm version $nvmrc_content)
        if test "$nvmrc_node_version" = N/A
            nvm install $nvmrc_content
        else if test "$nvmrc_node_version" != "$node_version"
            # Check if current version satisfies the nvmrc spec by checking if it's in the list
            set -l matching_versions (nvm ls $nvmrc_content 2>/dev/null)
            if not string match -q "*$node_version*" -- $matching_versions
                nvm use $nvmrc_content
            end
        end
    else if test "$node_version" != "$default_node_version"
        nvm use default
    end
    set -gx PATH $NVM_BIN $PATH
end
