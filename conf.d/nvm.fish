if test -z "$NVM_DIR" && test -e "$HOME/.nvm"
  set -gx NVM_DIR "$HOME/.nvm"
end

test -n "$NVM_DIR" && load_nvm >/dev/stderr
