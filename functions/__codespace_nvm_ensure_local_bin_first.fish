function __codespace_nvm_ensure_local_bin_first
    test -n "$HOME"; or return

    set -l local_bin "$HOME/.local/bin"
    set -l path_without_local_bin

    for path_entry in $PATH
        test "$path_entry" = "$local_bin"; and continue
        set -a path_without_local_bin "$path_entry"
    end

    set -gx PATH "$local_bin" $path_without_local_bin
end
