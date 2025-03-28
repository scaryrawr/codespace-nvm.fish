# Copyright © Jorge Bucaran <<https://jorgebucaran.com>>
#
# Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the 'Software'), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
# modified from https://github.com/jorgebucaran/nvm.fish/blob/a0892d0bb2304162d5faff561f030bb418cac34d/completions/nvm.fish
complete --command nvm --exclusive
complete --command nvm --exclusive --long version --description "Print version"
complete --command nvm --exclusive --long help --description "Print help"
complete --command nvm --long silent --description "Suppress standard output"

complete --command nvm --exclusive --condition __fish_use_subcommand --arguments install --description "Download and activate the specified Node version"
complete --command nvm --exclusive --condition __fish_use_subcommand --arguments alias --description "Set an alias named <name> pointing to <version>"
complete --command nvm --exclusive --condition __fish_use_subcommand --arguments exec --description "Run <command> on <version>. Uses .nvmrc if available and version is omitted."
complete --command nvm --exclusive --condition __fish_use_subcommand --arguments run --description "Run `node` on <version> with <args> as arguments. Uses .nvmrc if available and version is omitted."
complete --command nvm --exclusive --condition __fish_use_subcommand --arguments use --description "Activate the specified Node version in the current shell"
complete --command nvm --exclusive --condition __fish_use_subcommand --arguments list --description "List installed Node versions"
complete --command nvm --exclusive --condition __fish_use_subcommand --arguments list-remote --description "List available Node versions to install"
complete --command nvm --exclusive --condition __fish_use_subcommand --arguments ls --description "List installed Node versions"
complete --command nvm --exclusive --condition __fish_use_subcommand --arguments ls-remote --description "List available Node versions to install"
complete --command nvm --exclusive --condition __fish_use_subcommand --arguments current --description "Print the currently-active Node version"
complete --command nvm --exclusive --condition "__fish_seen_subcommand_from install" --arguments "(echo '--lts';echo '--latest';nvm ls-remote | grep -Po 'v\d+\.\d+\.\d+')"
complete --command nvm --exclusive --condition "__fish_seen_subcommand_from use" --arguments "(ls $NVM_DIR/versions/node)"
complete --command nvm --exclusive --condition __fish_use_subcommand --arguments uninstall --description "Uninstall the specified Node version"
complete --command nvm --exclusive --condition "__fish_seen_subcommand_from uninstall" --arguments "(ls $NVM_DIR/versions/node)"
complete --command nvm --exclusive --condition "__fish_seen_subcommand_from alias" --arguments "(ls $NVM_DIR/versions/node)"
complete --command nvm --exclusive --condition "__fish_seen_subcommand_from exec" --arguments "(ls $NVM_DIR/versions/node)"
complete --command nvm --exclusive --condition "__fish_seen_subcommand_from run" --arguments "(ls $NVM_DIR/versions/node)"
