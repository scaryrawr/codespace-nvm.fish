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
            # Check if current version satisfies the nvmrc spec
            # This handles cases where .nvmrc contains partial versions like "v24"
            # and we're already on a compatible version like "v24.0.0"
            set -l version_pattern 'v[0-9]+\.[0-9]+\.[0-9]+'
            set -l matching_versions (nvm ls $nvmrc_content 2>/dev/null | string match -r $version_pattern)
            # Only switch if we found matching versions and current version is not among them
            if test -n "$matching_versions"; and not contains -- "$node_version" $matching_versions
                # Use the spec from .nvmrc, not the resolved version, to let nvm handle version selection
                nvm use $nvmrc_content
            else if test -z "$matching_versions"
                # If no matching versions found, let nvm use handle it (it will switch or error appropriately)
                nvm use $nvmrc_content
            end
        end
    else if test "$node_version" != "$default_node_version"
        nvm use default
    end
    set -gx PATH $NVM_BIN $PATH
end
