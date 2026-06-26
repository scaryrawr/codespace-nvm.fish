function nvm
    replay "source $NVM_DIR/nvm.sh --no-use && nvm $argv"
    set -l nvm_status $status
    __codespace_nvm_ensure_local_bin_first
    return $nvm_status
end
