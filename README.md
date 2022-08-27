# Neovim Setup

### Install neovim
- Ubuntu: `sudo apt install neovim`
- MacOS: `brew install neovim`

### Create neovim config
Make directory for your Neovim config

`mkdir ~/.config/nvim`

Create an `init.vim` file

`touch ~/.config/nvim/init.vim`

### Install vim-plug
`curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim`

You should now have plug.vim in your autoload directory so it will load of on start

### Add a new file for plugins
We will manage our plugins in a separate file.

`mkdir ~/.config/nvim/vim-plug`

`touch ~/.config/nvim/vim-plug/plugins.vim`

### Add some basic plugins
Add the following to `~/.config/nvim/vim-plug/plugins.vim`
```
" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  "autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/autoload/plugged')

    " Better Syntax Support
    Plug 'sheerun/vim-polyglot'
    " File Explorer
    Plug 'scrooloose/NERDTree'
    " Auto pairs for '(' '[' '{'
    Plug 'jiangmiao/auto-pairs'

call plug#end()
```

### Source your plugins
Add the following line to `~/.config/nvim/init.vim`

`source $HOME/.config/nvim/vim-plug/plugins.vim`

### References
- vim-plug : https://github.com/junegunn/vim-plug


# Vim Long and Prosper
