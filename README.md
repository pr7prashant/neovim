# A Basic Stable IDE config for Neovim

This repo is my personal neovim config. The latest config that I use corresponds to the latest version of the plugins and the previous configs have a release tag (neovim version) associated with them.

### Migration guide to lazy from packer

Now this config uses `lazy.nvim` as a plugin manager, so if you are migrating from packer you should probably remove `$HOME/.local/share/nvim` and re-open nvim to re-install the plugins to not face any issues.

## Install Neovim 0.12

You can install Neovim with your package manager e.g. brew, apt, pacman etc.. but remember that when you update your packages Neovim may be upgraded to a newer version.

If you would like to make sure Neovim only updates when you want it to than I recommend installing from source:

**NOTE** Verify the required [build prerequisites](https://github.com/neovim/neovim/wiki/Building-Neovim#build-prerequisites) for your system.

```sh
git clone https://github.com/neovim/neovim.git
cd neovim
git checkout release-0.12
make CMAKE_BUILD_TYPE=Release
sudo make install
```

## Install the config

Make sure to remove or backup your current `nvim` directory

```sh
git clone https://github.com/pr7prashant/neovim.git ~/.config/nvim
```

Run `nvim` and wait for the plugins to be installed

**NOTE** (You will notice treesitter pulling in a bunch of parsers the next time you open Neovim)

**NOTE** Checkout this file for some predefined keymaps: [keymaps](https://github.com/pr7prashant/neovim/blob/master/lua/keymaps.lua)

## Get healthy

Open `nvim` and enter the following:

```
:checkhealth
```

You'll probably notice you don't have support for copy/paste also that python and node haven't been setup

So let's fix that

First we'll fix copy/paste

- On mac `pbcopy` should be builtin

- On Ubuntu

  ```sh
  sudo apt install xsel # for X11
  sudo apt install wl-clipboard # for wayland
  ```

Next we need to install python support (node is optional)

- Neovim python support

  ```sh
  pip install pynvim
  ```

- Neovim node support

  ```sh
  npm i -g neovim
  ```

We will also need `ripgrep` for Telescope to work:

- Ripgrep

  ```sh
  sudo apt install ripgrep
  ```

Install Lazygit

- [Lazygit installation](https://github.com/jesseduffield/lazygit#installation)

---

**NOTE** make sure you have [node](https://nodejs.org/en/) installed, I recommend a node manager like [fnm](https://github.com/Schniz/fnm).

## Fonts

I recommend using the following repo to get a "Nerd Font" (Font that supports icons)

[getnf](https://github.com/ronniedroid/getnf)

## Configuration

### LSP

To add a new LSP

First Enter:

```
:Mason
```

and press `i` on the Language Server you wish to install

Next you will need to add the server to the server list: [servers](https://github.com/pr7prashant/neovim/blob/master/lua/plugins/lspconfig.lua)

### Formatters and linters

Make sure the formatter or linter is installed and add it to this setup function: [conform](https://github.com/pr7prashant/neovim/blob/master/lua/plugins/conform.lua)

**NOTE** Some are already setup as examples, remove them if you want

### Plugins

You can install new plugins here: [plugins](https://github.com/pr7prashant/neovim/blob/master/lua/plugins/)

Here is the wiki for installing new plugins refer to this: [wiki](https://github.com/pr7prashant/neovim/wiki/Adding-a-new-plugin-with-lazy.nvim-as-plugin-manager)

---

## Plugins

- [conform.nvim](https://github.com/stevearc/conform.nvim) - Lightweight yet powerful formatter plugin for Neovim.
- [copilot.vim](https://github.com/github/copilot.vim) - Neovim plugin for Github Copilot AI code.
- [fidget.nvim](https://github.com/j-hui/fidget.nvim) - Extensible UI for Neovim notifications and LSP progress messages.
- [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) - Super fast git decorations implemented purely in lua/teal.
- [grug-far.nvim](https://github.com/MagicDuck/grug-far.nvim) - Find and Replace plugin for neovim.
- [indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim) - This plugin adds indentation guides to all lines (including empty lines).
- [lazy](https://github.com/folke/lazy.nvim) - lazy.nvim is a modern plugin manager for Neovim.
- [lazydev.nvim](https://github.com/folke/lazydev.nvim) - Faster LuaLS setup for Neovim config, runtime and plugin development (completion, annotations and signatures of Neovim APIs).
- [mason.nvim](https://github.com/mason-org/mason.nvim) - Portable package manager for Neovim to install LSP servers, DAP servers, linters, and formatters.
- [mason-lspconfig.nvim](https://github.com/mason-org/mason-lspconfig.nvim) - Bridges mason.nvim with nvim-lspconfig.
- [mason-tool-installer.nvim](https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim) - Installs and upgrades registered mason packages automatically.
- [mini.nvim](https://github.com/echasnovski/mini.nvim) - Library of 40+ independent Lua modules improving overall Neovim experience with minimal effort.
- [neo-tree.nvim](https://github.com/nvim-neo-tree/neo-tree.nvim) - A Neovim plugin to browse the file system and other tree like structures in whatever style suits you.
- [neotest](https://github.com/nvim-neotest/neotest) - An extensible framework for interacting with tests within Neovim.
- [neotest-jest](https://github.com/nvim-neotest/neotest-jest) - Jest adapter for the neotest framework.
- [nvim-autopairs](https://github.com/windwp/nvim-autopairs) - A super powerful autopair plugin for Neovim that supports multiple characters.
- [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) - A completion engine plugin for neovim written in Lua.
- [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) - Configs for the Nvim LSP client.
- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) - Uses `tree-sitter` interface in Neovim to provide syntax highlighting.
- [nvim-treesitter-context](https://github.com/nvim-treesitter/nvim-treesitter-context) - A plugin that shows the context of the currently visible buffer contents.
- [nvim-ufo](https://github.com/kevinhwang91/nvim-ufo) - The goal of nvim-ufo is to make Neovim's fold look modern and keep high performance.
- [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) - `telescope.nvim` is a highly extendable fuzzy finder over lists.
- [todo-comments.nvim](https://github.com/folke/todo-comments.nvim) - A lua plugin to highlight and search for todo comments like TODO, HACK, BUG in your code base.
- [toggleterm.nvim](https://github.com/akinsho/toggleterm.nvim) - A neovim plugin to persist and toggle multiple terminals during an editing session.
- [tokyonight.nvim](https://github.com/folke/tokyonight.nvim) - A dark and light Neovim theme written in Lua ported from the Visual Studio Code TokyoNight theme.
- [vim-sleuth](https://github.com/tpope/vim-sleuth) - Automatically adjusts 'shiftwidth' and 'expandtab' heuristically based on the current file.
- [vim-visual-multi](https://github.com/mg979/vim-visual-multi) - Multiple cursor plugin for Vim/Neovim.
- [which-key](https://github.com/folke/which-key.nvim) - A lua plugin that displays a popup with possible key bindings of the command you started typing.

---

> The computing scientist's main challenge is not to get confused by the complexities of his own making.

\- Edsger W. Dijkstra
