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

### General Editor Settings
To include some basics in your config first create a directory called general and a file called `settings.vim`

`mkdir ~/.config/nvim/general`

`touch ~/.config/nvim/general/settings.vim`

Add the following to `settings.vim`
```
" set leader key
let g:mapleader = "\<Space>"

syntax enable                           " Enables syntax highlighing
set hidden                              " Required to keep multiple buffers open multiple buffers
set nowrap                              " Display long lines as just one line
set encoding=utf-8                      " The encoding displayed
set pumheight=10                        " Makes popup menu smaller
set fileencoding=utf-8                  " The encoding written to file
set ruler                                      " Show the cursor position all the time
set cmdheight=2                         " More space for displaying messages
set iskeyword+=-                          " treat dash separated words as a word text object"
set mouse=a                             " Enable your mouse
set splitbelow                          " Horizontal splits will automatically be below
set splitright                          " Vertical splits will automatically be to the right
set t_Co=256                            " Support 256 colors
set conceallevel=0                      " So that I can see `` in markdown files
set tabstop=2                           " Insert 2 spaces for a tab
set shiftwidth=2                        " Change the number of space characters inserted for indentation
set smarttab                            " Makes tabbing smarter will realize you have 2 vs 4
set expandtab                           " Converts tabs to spaces
set smartindent                         " Makes indenting smart
set autoindent                          " Good auto indent
set laststatus=0                        " Always display the status line
set number                              " Line numbers
"set cursorline                          " Enable highlighting of the current line
set background=dark                     " tell vim what the background color looks like
set showtabline=2                       " Always show tabs
"set noshowmode                          " We don't need to see things like -- INSERT -- anymore
set nobackup                            " This is recommended by coc
set nowritebackup                       " This is recommended by coc
set updatetime=300                      " Faster completion
set timeoutlen=500                      " By default timeoutlen is 1000 ms
set formatoptions-=cro                  " Stop newline continution of comments
set clipboard=unnamedplus               " Copy paste between vim and everything else
"set autochdir                           " Your working directory will always be the same as your working directory

au! BufWritePost $MYVIMRC source %      " auto source when writing to init.vm alternatively you can run :source $MYVIMRC

" You can't stop me
cmap w!! w !sudo tee %
```

Source the editor settings in `init.vim`

`source $HOME/.config/nvim/general/settings.vim`

### References
- vim-plug : https://github.com/junegunn/vim-plug


# Vim Long and Prosper
