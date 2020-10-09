set nocompatible              " be iMproved, required
filetype off                  " required <<========== We can turn it on later

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'tomasr/molokai'
Plugin 'mzlogin/vim-smali'
Plugin 'davidhalter/jedi-vim'
" <============================================>
" Specify the plugins you want to install here.
" We'll come on that later
" <============================================>
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
" Put the rest of your .vimrc file here
"
"
"This is where vundle ends
"
"
" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2016 Jul 28
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings.
colorscheme molokai
set smartindent
set number
set relativenumber
"set spell
filetype off
au BufRead,BufNewFile *.ts   setfiletype typescript
"Plugin 'leafgarland/typescript-vim'

"Vim emmet plugin for html/css
"let g:user_emmet_install_global = 0
"autocmd FileType html,css EmmetInstall
"let g:user_emmet_mode='a'    "enable all function in all mode.

"Omnicomplete
filetype plugin on
set omnifunc=syntaxcomplete#Complete
syntax on
set title

autocmd FileType css set omnifunc=csscomplete#CompleteCSS


"Backup Location
set backupdir=~/.vim/tmp/backup//

"Undo Location
set undodir=~/.vim/tmp/undo//

"Swap location
set directory=~/.vim/tmp/swp//

" Get the defaults that most users want.
source $VIMRUNTIME/defaults.vim

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file (restore to previous version)
  if has('persistent_undo')
    set undofile	" keep an undo file (undo changes after closing)
  endif
endif

if &t_Co > 2 || has("gui_running")
  " Switch on highlighting the last used search pattern.
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Add optional packages.
"
" The matchit plugin makes the % command work better, but it is not backwards
" compatible.
if has('syntax') && has('eval')
  packadd matchit
endif
" This changes the background color of vim to transparent overriding the
" settings of molokai theme
hi Normal ctermbg=none
hi NonText ctermbg=none
hi LineNr ctermbg=none

"Default settings
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

" Linux kernel requirements
" set tabstop=8
" set softtabstop=8
" set shiftwidth=8
" set noexpandtab

"alphsubs ---------------------- {{{
        execute "digraphs ks " . 0x2096 
        execute "digraphs as " . 0x2090
        execute "digraphs es " . 0x2091
        execute "digraphs hs " . 0x2095
        execute "digraphs is " . 0x1D62
        execute "digraphs ks " . 0x2096
        execute "digraphs ls " . 0x2097
        execute "digraphs ms " . 0x2098
        execute "digraphs ns " . 0x2099
        execute "digraphs os " . 0x2092
        execute "digraphs ps " . 0x209A
        execute "digraphs rs " . 0x1D63
        execute "digraphs ss " . 0x209B
        execute "digraphs ts " . 0x209C
        execute "digraphs us " . 0x1D64
        execute "digraphs vs " . 0x1D65
        execute "digraphs xs " . 0x2093
"}}}

"Boost Library Setup
augroup Boost
	au BufRead,BufEnter /home/shashwat/Programs/boost/* set tabstop=4 expandtab softtabstop=4 shiftwidth=4
augroup end
