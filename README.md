# A Basic Stable IDE config for Neovim

This repo is my personal neovim config. The neovim and plugins are pinned to a versions to avoid breaking changes. In this repo I will try to tag configs as newer version of neovim releases. The latest config that I use corresponds to the `master` branch and the previous configs have a release tag (neovim version) associated with them.

### Migration guide to lazy from packer

Now this config uses `lazy.nvim` as a plugin manager, so if you are migrating from packer you should probably remove
`$HOME/.local/share/nvim` and re-open nvim to re-install the plugins to not face any issues.

## Install Neovim 0.9

You can install Neovim with your package manager e.g. brew, apt, pacman etc.. but remember that when you update your packages Neovim may be upgraded to a newer version.

If you would like to make sure Neovim only updates when you want it to than I recommend installing from source:

**NOTE** Verify the required [build prerequisites](https://github.com/neovim/neovim/wiki/Building-Neovim#build-prerequisites) for your system.

```sh
git clone https://github.com/neovim/neovim.git
cd neovim
git checkout release-0.9
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

- Ubuntu

```sh
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep '"tag_name":' |  sed -E 's/.*"v*([^"]+)".*/\1/')
```

```sh
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
```

```sh
sudo tar xf lazygit.tar.gz -C /usr/local/bin lazygit
```

```sh
lazygit --version
```

- Mac (Homebrew)

```
brew install jesseduffield/lazygit/lazygit
```

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

Next you will need to add the server to this list: [servers](https://github.com/pr7prashant/neovim/blob/master/lua/utils/init.lua)

Note: Builtin LSP doesn't contain all lsps from [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#terraform_lsp).

If you want to install any from there, for example terraform_lsp(which adds more functionality than terraformls, like complete resource listing),

1. You can add the lsp name in [mason lsp block](https://github.com/pr7prashant/neovim/blob/master/lua/user/mason.lua)

```lua
-- lua/utils/init.lua
M.servers = {
  "lua_ls",
  "cssls",
  "html",
  "tsserver",
  "pyright",
  "bashls",
  "jsonls",
  "yamlls",
  "terraform_lsp" -- New LSP
}
```

2. Manually install the binary of the lsp and put it in your path by downloading the binary or through your package manager. For terraform_lsp [example](https://github.com/juliosueiras/terraform-lsp/releases)

### Formatters and linters

Make sure the formatter or linter is installed and add it to this setup function: [null-ls](https://github.com/pr7prashant/neovim/blob/master/lua/user/null-ls.lua)

**NOTE** Some are already setup as examples, remove them if you want

### Plugins

You can install new plugins here: [plugins](https://github.com/pr7prashant/neovim/blob/master/lua/user/)

Here is the wiki for installing new plugins refer to this: [wiki](https://github.com/pr7prashant/neovim/wiki/Adding-a-new-plugin-with-lazy.nvim-as-plugin-manager)

---

## Plugins

- [alpha-nvim](https://github.com/goolord/alpha-nvim) - `alpha` is a fast and fully programmable greeter for neovim.
- [bufdelete.nvim](https://github.com/famiu/bufdelete.nvim)
- [bufferline.nvim](https://github.com/akinsho/bufferline.nvim) - A snazzy 💅 buffer line (with tabpage integration) for Neovim built using lua.
- [cmp-buffer](https://github.com/hrsh7th/cmp-buffer) - `nvim-cmp` source for buffer words.
- [cmp-cmdline](https://github.com/hrsh7th/cmp-cmdline) - `nvim-cmp` source for vim's cmdline.
- [cmp_luasnip](https://github.com/saadparwaiz1/cmp_luasnip) - `luasnip` completion source for `nvim-cmp`.
- [cmp-nvim-lsp](https://github.com/hrsh7th/cmp-nvim-lsp) - `nvim-cmp` source for neovim's built-in language server client.
- [cmp-nvim-lua](https://github.com/hrsh7th/cmp-nvim-lua) - `nvim-cmp` source for neovim Lua API.
- [cmp-path](https://github.com/hrsh7th/cmp-path) - `nvim-cmp` source for filesystem paths.
- [Comment.nvim](https://github.com/numToStr/Comment.nvim) - Smart and Powerful commenting plugin for Neovim.
- [DAPInstall.nvim](https://github.com/ravenxrz/DAPInstall.nvim) - A NeoVim plugin for managing several debuggers for `nvim-dap`.
- [friendly-snippets](https://github.com/rafamadriz/friendly-snippets) - Snippets collection for a set of different programming languages for faster development.
- [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) - Super fast git decorations implemented purely in lua/teal.
- [indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim) - This plugin adds indentation guides to all lines (including empty lines).
- [lazy](https://github.com/folke/lazy.nvim) - lazy.nvim is a modern plugin manager for Neovim.
- [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) - A blazing fast and easy to configure Neovim statusline written in Lua.
- [LuaSnip](https://github.com/L3MON4D3/LuaSnip) - A plugin to setup snippets.
- [mason-lspconfig.nvim](https://github.com/williamboman/mason-lspconfig.nvim) - `mason-lspconfig` bridges `mason.nvim` with the `lspconfig` plugin - making it easier to use both plugins together.
- [mason.nvim](https://github.com/williamboman/mason.nvim) - Portable package manager for Neovim that runs everywhere Neovim runs.
- [null-ls.nvim](https://github.com/jose-elias-alvarez/null-ls.nvim) - Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua.
- [nvim-autopairs](https://github.com/windwp/nvim-autopairs) - A super powerful autopair plugin for Neovim that supports multiple characters.
- [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) - A completion engine plugin for neovim written in Lua.
- [nvim-dap](https://github.com/mfussenegger/nvim-dap) - `nvim-dap` is a Debug Adapter Protocol client implementation for Neovim.
- [nvim-dap-ui](https://github.com/rcarriga/nvim-dap-ui) - A UI for `nvim-dap` which provides a good out of the box configuration.
- [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) - Configs for the Nvim LSP client.
- [nvim-ts-context-commentstring](https://github.com/JoosepAlviste/nvim-ts-context-commentstring) - A Neovim plugin for setting the commentstring option based on the cursor location in the file.
- [nvim-tree.lua](https://github.com/kyazdani42/nvim-tree.lua) - A File Explorer For Neovim Written In Lua.
- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) - Uses `tree-sitter` interface in Neovim to provide syntax highlighting.
- [nvim-treesitter-context](https://github.com/nvim-treesitter/nvim-treesitter-context) - A plugin that shows the context of the currently visible buffer contents.
- [nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons) - A lua fork of vim-devicons. This plugin provides the same icons as well as colors for each icon.
- [plenary](https://github.com/nvim-lua/plenary.nvim) - All the lua functions I don't want to write twice.
- [project.nvim](https://github.com/ahmedkhalf/project.nvim) - An all in one neovim plugin written in lua that provides superior project management.
- [telescope-fzf-native.nvim](https://github.com/nvim-telescope/telescope-fzf-native.nvim) - `fzf-native` is a c port of `fzf` to support `fzf` syntax in `Telescope`.
- [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) - `telescope.nvim` is a highly extendable fuzzy finder over lists.
- [toggleterm.nvim](https://github.com/akinsho/toggleterm.nvim) - A neovim plugin to persist and toggle multiple terminals during an editing session.
- [tokyonight.nvim](https://github.com/folke/tokyonight.nvim) - A dark and light Neovim theme written in Lua ported from the Visual Studio Code TokyoNight theme.
- [vim-illuminate](https://github.com/RRethy/vim-illuminate) - Vim plugin for automatically highlighting other uses of the word under the cursor using either LSP, Tree-sitter, or regex matching.
- [which-key](https://github.com/folke/which-key.nvim) - A lua plugin that displays a popup with possible key bindings of the command you started typing.

---

## Referrences

- chris@machine : https://github.com/LunarVim/nvim-basic-ide

> The computing scientist's main challenge is not to get confused by the complexities of his own making.

\- Edsger W. Dijkstra
