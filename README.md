# Codespace NVM

This is a wrapper around [devcontainers/features/node](https://github.com/devcontainers/features/tree/main/src/node) which uses nvm to manage node versions.

It is based on [nvm - deeper shell integration - fish](https://github.com/nvm-sh/nvm?tab=readme-ov-file#fish), but depends on [replay](https://github.com/jorgebucaran/replay.fish) instead of [bass](https://github.com/edc/bass).

## Installation

Install with [Fisher](https://github.com/jorgebucaran/fisher):

```fish
test -f "$NVM_DIR/nvm.sh" && fisher install jorgebucaran/replay.fish scaryrawr/codespace-nvm.fish
```
