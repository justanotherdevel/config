set nocompatible              " be iMproved, required
filetype off                  " required <<========== We can turn it on later

" set the runtime path to include Vundle and initialize
call plug#begin('~/.config/nvim/plugged')
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plug 'tomasr/molokai'
Plug 'mzlogin/vim-smali'
Plug 'lilydjwg/colorizer'
Plug 'itchyny/lightline.vim'
Plug 'preservim/nerdtree'
Plug 'francoiscabrol/ranger.vim'
Plug 'rbgrouleff/bclose.vim'
Plug 'amix/open_file_under_cursor.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'dense-analysis/ale'
Plug 'tpope/vim-commentary'
Plug 'dart-lang/dart-vim-plugin'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }
Plug 'SirVer/ultisnips'
Plug 'mlaursen/vim-react-snippets'
Plug 'luochen1990/rainbow'
Plug 'yuezk/vim-js'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'thiagoalessio/rainbow_levels.vim'
Plug 'valloric/MatchTagAlways'
Plug 'tpope/vim-surround'
Plug 'preservim/tagbar'
Plug 'https://github.com/yegappan/taglist'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf'
Plug 'ryanoasis/vim-devicons'
" Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }
Plug 'kdheepak/lazygit.nvim'
Plug 'vim-scripts/restore_view.vim'
Plug 'nvim-lua/plenary.nvim'
Plug 'shatur/neovim-session-manager'
Plug 'liuchengxu/vim-which-key'
Plug 'ggandor/lightspeed.nvim'
Plug 'tpope/vim-repeat'
" Plug 'https://github.com/adelarsq/image_preview.nvim'
" Plug 'rmagatti/auto-session'
" <============================================>
" Specify the plugins you want to install here.
" We'll come on that later
" <============================================>
" All of your Plugins must be added before the following line
call plug#end()            " required
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

" Enable true color
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

" When started as "evim", evim.vim will already have done these settings.
colorscheme molokai
set smartindent
set number
set relativenumber
"set spell
set termguicolors
set ignorecase
set smartcase
autocmd vimenter * hi Normal guibg=NONE ctermbg=NONE " transparent bg
filetype off
au BufRead,BufNewFile *.ts   setfiletype typescript
"Plugin 'leafgarland/typescript-vim'
"vim-jsx-pretty
let g:vim_jsx_pretty_colorful_config = 0

"Folding Stuff
augroup vimrc
  au BufReadPre * setlocal foldmethod=indent
  au BufWinEnter * if &fdm == 'indent' | setlocal foldmethod=manual | endif
augroup END
set viewoptions=cursor,folds,slash,unix
" let g:skipview_files = ['*\.vim']

" nvim stuff
if !has('nvim')
    set viminfo+=~/.vim/viminfo
endif

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

"Vim Rainbow Level
" Or automatically turning it on for certain file types:
autocmd Filetype * call rainbow_levels#off()
hi! RainbowLevel0 ctermfg=240 guifg=#339009 ctermbg=none guibg=none
hi! RainbowLevel1 ctermfg=239 guifg=#9e0059 ctermbg=none guibg=none
hi! RainbowLevel2 ctermfg=238 guifg=#ff0054 ctermbg=none guibg=none
hi! RainbowLevel3 ctermfg=237 guifg=#59ffa0 ctermbg=none guibg=none
hi! RainbowLevel4 ctermfg=236 guifg=#ffbd00 ctermbg=none guibg=none
hi! RainbowLevel5 ctermfg=235 guifg=#ff5440 ctermbg=none guibg=none
hi! RainbowLevel6 ctermfg=234 guifg=#ccff33 ctermbg=none guibg=none
hi! RainbowLevel7 ctermfg=233 guifg=#979dac ctermbg=none guibg=none
hi! RainbowLevel8 ctermfg=232 guifg=#fed9b7 ctermbg=none guibg=none
"Enable vim rainbow
let g:rainbow_active = 1
let g:rainbow_conf = {
\	'guifgs': ['royalblue3', '#ff0054', 'seagreen3', '#ff5400','#ffbd00','firebrick'],
\	'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
\	'guis': [''],
\	'cterms': [''],
\	'operators': '_,_',
\	'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
\	'separately': {
\       '*': {},
\		'xml': {
\			'syn_name_prefix': 'xmlRainbow',
\			'parentheses': ['start=/\v\<\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'))?)*\>/ end=#</\z1># fold'],
\		},
\		'xhtml': {
\			'parentheses': ['start=/\v\<\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'))?)*\>/ end=#</\z1># fold'],
\		},
\		'html': {
\			'parentheses': ['start=/\v\<((script|style|area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
\		},
\		'markdown': {
\			'parentheses_options': 'containedin=markdownCode contained', 
\		},
\		'lisp': {
\			'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'], 
\		},
\		'haskell': {
\			'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/\v\{\ze[^-]/ end=/}/ fold'], 
\		},
\		'vim': {
\			'parentheses_options': 'containedin=vimFuncBody', 
\		},
\		'perl': {
\			'syn_name_prefix': 'perlBlockFoldRainbow', 
\		},
\		'stylus': {
\			'parentheses': ['start=/{/ end=/}/ fold contains=@colorableGroup'], 
\		},
\		'css': 0, 
\	}
\}

"Vim emmet plugin for html/css
"let g:user_emmet_install_global = 0
"autocmd FileType html,css EmmetInstall
"let g:user_emmet_mode='a'    "enable all function in all mode.

"Folding
set foldmethod=syntax
set foldnestmax=10
set nofoldenable
set foldlevel=2

"Set space as leader
let mapleader = "\<space>"
map <leader>/ :noh<CR>

" HTML tag match
let g:mta_filetypes = {
    \ 'html' : 1,
    \ 'xhtml' : 1,
    \ 'xml' : 1,
    \ 'jinja' : 1,
    \ 'javascript' : 1,
    \ 'javascriptreact': 1,
    \}
nmap <leader>% :MtaJumpToOtherTag<cr>


" Rainbow Keymapping
nmap <leader>tR :RainbowToggle<cr>

" Tagbar
nmap <leader>tb :TagbarToggle<cr>

" Indent guide
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_guide_size = 1

"Vim Rainbow Levels
" Creating a mapping to turn it on and off:
map <leader>tr :RainbowLevelsToggle<cr>

"Fast buffer
map <leader>n :bn<CR>
map <leader>p :bp<CR>
nmap <leader>gB :ls<CR>:b<Space>
nmap <leader>gt <c-^>

"NerdTree
" autocmd VimEnter * NERDTree
" autocmd VimEnter * wincmd p
" autocmd TabNew * NERDTree
" autocmd TabNew * wincmd p
" autocmd InsertLeave * :CocCommand prettier.formatFile
map <leader>N :NERDTreeToggle<CR>
nnoremap <C-h> <C-w><C-h>
nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-l> <C-w><C-l>

"Ranger
let g:NERDTreeHijackNetrw = 0  "add this line if you use NERDTree
let g:ranger_replace_netrw = 0 "open ranger when vim open a directory

"Some other mapping
map <Up>    <C-W>-
map <Down>  <C-W>+
map <Left>  <c-w><
map <Right> <c-w>>
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove
map <leader>CD :cd %:p:h<cr>:pwd<cr>

map [[ ?{<CR>w99[{:noh<CR>
map ][ /}<CR>b99]}:noh<CR>
map ]] j0[[%/{<CR>:noh<CR>
map [] k$][%?}<CR>:noh<CR>
"Open_file_cursor
nnoremap <leader>F :call GotoFile("new")<CR>

"Omnicomplete
filetype plugin on
set omnifunc=syntaxcomplete#Complete
syntax on
set title

autocmd FileType css set omnifunc=csscomplete#CompleteCSS


"Backup Location
set backupdir=~/.nvim/tmp/backup//

"Undo Location
set undodir=~/.nvim/tmp/undo//

"Swap location
set directory=~/.nvim/tmp/swp//

" Get the defaults that most users want.

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

"Some changes to theme overriding molokai
hi Directory guifg=#e63946
hi Function guifg=#e63946
hi PreCondit guifg=#ffd166
hi PreProc guifg=#ffd166

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

" Javascript  Setup
augroup twig_ft
  au!
  autocmd BufNewFile,BufRead *.js   set filetype=javascriptreact
  autocmd BufNewFile,BufRead *.jsx   set filetype=javascriptreact
augroup END

autocmd BufNewFile,BufRead *.json set filetype=jsonc

" Dart indentation settings
autocmd FileType dart setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab

"js indentation settings
autocmd FileType *.js setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
autocmd FileType *.jsx setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab

"Jump to last known cursor position
if 1

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  " Revert with ":filetype off".
  filetype plugin indent on 
  " Put these in an autocmd group, so that you can revert them with:
  " ":augroup vimStartup | au! | augroup END"
  augroup vimStartup
    au!

    " When editing a file, always jump to the last known cursor position.
    " Don't do it when the position is invalid, when inside an event handler
    " (happens when dropping a file on gvim) and for a commit message (it's
    " likely a different one than last time).
    autocmd BufReadPost *
      \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
      \ |   exe "normal! g`\""
      \ | endif

  augroup END

endif

"  ================================================================
" UltiSnips
" ================================================================
let g:UltiSnipsExpandTrigger='<c-s-space>'    

"CoC
" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
" set nobackup
" set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" " Use tab for trigger completion with characters ahead and navigate.
" " NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" " other plugin before putting this into your config.
" inoremap <silent><expr> <TAB>
"       \ pumvisible() ? "\<C-n>" :
"       \ <SID>check_back_space() ? "\<TAB>" :
"       \ coc#refresh()
" inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" function! s:check_back_space() abort
"   let col = col('.') - 1
"   return !col || getline('.')[col - 1]  =~# '\s'
" endfunction

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
inoremap <expr><A-TAB> coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<TAB>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-s-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

let g:coc_user_config = {}
" let g:coc_user_config['coc.preferences.jumpCommand'] = 'vsp'

" coc-highlight
autocmd CursorHold * silent call CocActionAsync('highlight')
" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> <leader>[g <Plug>(coc-diagnostic-prev)
nmap <silent> <leader>]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> <leader>gd <Plug>(coc-definition)
nmap <silent> <leader>gy <Plug>(coc-type-definition)
nmap <silent> <leader>gi <Plug>(coc-implementation)
nmap <silent> <leader>gr <Plug>(coc-references)

" Colorizer
nmap <leader>tC <Plug>Colorizer


" Use K to show documentation in preview window.
nnoremap <silent> <leader>K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

function! ShowDocIfNoDiagnostic(timer_id)
  if (coc#float#has_float() == 0 && CocHasProvider('hover') == 1)
    silent call CocActionAsync('doHover')
  endif
endfunction

function! s:show_hover_doc()
  call timer_start(500, 'ShowDocIfNoDiagnostic')
endfunction

autocmd CursorHoldI * :call <SID>show_hover_doc()
autocmd CursorHold * :call <SID>show_hover_doc()


" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Run flutter specific commands
nmap <leader>fc :CocList --input=flutter commands<cr>

" Run javascript specific commands
nmap <leader>jc :CocList --input=tsserver commands<cr>

" Run formatting fix on save
let g:dart_format_on_save=1

" Formatting selected code.
xmap <leader>fF  <Plug>(coc-format-selected)
nmap <leader>fF  <Plug>(coc-format-selected)
nmap <leader>ff :CocCommand prettier.formatFile<cr>

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>A  <Plug>(coc-codeaction-selected)
nmap <leader>A  <Plug>(coc-codeaction-selected)

xmap <leader>a  <Plug>(coc-codeaction-cursor)
nmap <leader>a  <Plug>(coc-codeaction-cursor)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>Ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of LS, ex: coc-tsserver
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
"set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

let g:lightline = {
    \ 'colorscheme': 'molokai',
    \ 'active': {
    \   'left': [ [ 'mode', 'paste' ],
    \             ['filename', 'readonly', 'relativepath','modified', 'git', 'ctrlpmark', 'method', 'cocstatus'] ],
    \   'right':[ ['filetype', 'fileencoding', 'lineinfo', 'percent'],
    \             ['blame']]
    \ },
    \ 'component_function': {
    \   'cocstatus': 'coc#status',
    \   'blame': 'LightlineGitBlame',
    \ },
    \ }

" Use auocmd to force lightline update.
autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <leader><space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <leader><space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <leader><space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <leader><space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <leader><space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <leader><space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <leader><space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <leader><space>p  :<C-u>CocListResume<CR>

" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

 inoremap <silent><expr> <C-j>
       \ pumvisible() ? coc#_select_confirm() :
       \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
       \ CheckBackspace() ? "\<TAB>" :
       \ coc#refresh()

" function! s:check_back_space() abort
"   let col = col('.') - 1
"   return !col || getline('.')[col - 1]  =~# '\s'
" endfunction

" let g:coc_snippet_next = '<tab>'
"
" Adding FZF
nnoremap <leader>s :FZF<cr>


let g:fzf_command_prefix = 'Fzf'
let g:fzf_buffers_jump = 1      " [Buffers] to existing split

function! s:build_location_list(lines) abort
    call setloclist(0, map(copy(a:lines), '{ "filename": v:val }'))
    lopen
endfunction

function! s:build_quickfix_list(lines) abort
    call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
    copen
endfunction

" An action can be a reference to a function that processes selected lines
let g:fzf_action = {
            \ 'ctrl-l': function('s:build_quickfix_list'),
            \ 'ctrl-r': function('s:build_location_list'),
            \ 'ctrl-t': 'tab split',
            \ 'ctrl-x': 'split',
            \ 'ctrl-v': 'vsplit'}
" \ 'ctrl-o': '<S-tab>',
" \ 'ctrl-i': 'insert_match',

" function! s:insert_match(lines) abort
"   <c-r>=echo('a:lines')<cr>
" endfunction

nnoremap <leader><c-f> :FzfFiles $HOME<cr>
nnoremap <leader>gf :FzfFiles .<cr>
nnoremap <leader>gF :FzfFiles /<cr>
nnoremap <leader>gb :FzfBuffers<cr>
nnoremap <leader>gFw :FzfWindows<cr>
nnoremap <leader>gFt :FzfTags<cr>
nnoremap <leader>gF<c-t> :FzfBTags<cr>
nnoremap <leader>gFc :FzfCommit<cr>
nnoremap <leader>gF<c-c> :FzfBCommit<cr>
nnoremap <leader>gFg :FzfGFiles?<cr>
nnoremap <leader>gF<c-g> :FzfGFiles<cr>
nnoremap <leader>gL :FzfLines<cr>
nnoremap <leader>gl :FzfBLines<cr>
nnoremap <leader>gF; :FzfHistory:<cr>
nnoremap <leader>gF/ :FzfHistory/<cr>
nnoremap <leader>gFh :FzfHistory<cr>
nnoremap <leader>gFm :FzfHelptags<cr>
nnoremap <leader>gFs <esc>:FzfSnippets<cr>
nnoremap <leader>gFr <esc>:Rg<cr>
inoremap <c-x><c-s> <c-o>:FzfSnippets<cr>

" Terminal
tnoremap <C-w> <C-\><C-n>
nmap <leader>tt <Plug>(coc-terminal-toggle)

" Enable per-command history.
" CTRL-N and CTRL-P will be automatically bound to next-history and
" previous-history instead of down and up. If you don't like the change,
" explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
let g:fzf_history_dir = '~/.local/share/fzf-history'

let g:fzf_tags_command = 'ctags -R'
" Border color
let g:fzf_layout = {'up':'~90%', 'window': { 'width': 0.8, 'height': 0.8,'yoffset':0.5,'xoffset': 0.5, 'highlight': 'Todo', 'border': 'rounded' } }

let $FZF_DEFAULT_OPTS = '--layout=reverse --info=inline --bind "ctrl-o:toggle+up,ctrl-space:toggle-preview"'
let $FZF_DEFAULT_COMMAND="rg --files --hidden --glob '!.git/**'"
"-g '!{node_modules,.git}'

" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
    \ 'bg':      ['bg', 'Normal'],
    \ 'gutter':  ['bg', 'Normal'],
    \ 'hl':      ['fg', 'Comment'],
    \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
    \ 'bg+':     ['bg', 'Visual', 'CursorColumn'],
    \ 'hl+':     ['fg', 'Statement'],
    \ 'info':    ['fg', 'PreProc'],
    \ 'border':  ['fg', 'vertsplit'],
    \ 'prompt':  ['fg', 'Conditional'],
    \ 'pointer': ['fg', 'Exception'],
    \ 'marker':  ['fg', 'Keyword'],
    \ 'spinner': ['fg', 'Label'],
    \ 'header':  ['fg', 'Comment'] }
    " \ 'border':  ['fg', 'Conditional'],

"Get Files
command! -bang -nargs=? -complete=dir Files
        \ call fzf#vim#files(<q-args>, fzf#vim#with_preview({'options': ['--layout=reverse', '--info=inline']}), <bang>0)

" Get text in files with Rg
command! -bang -nargs=* Rg
    \ call fzf#vim#grep(
    \   "rg --column --line-number --no-heading --color=always --smart-case --glob '!.git/**' ".shellescape(<q-args>), 1,
    \   fzf#vim#with_preview(), <bang>0)

" Ripgrep advanced
function! RipgrepFzf(query, fullscreen) abort
    let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case %s || true'
    let initial_command = printf(command_fmt, shellescape(a:query))
    let reload_command = printf(command_fmt, '{q}')
    let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
    call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)

" Git grep
command! -bang -nargs=* GGrep
    \ call fzf#vim#grep(
    \   'git grep --line-number '.shellescape(<q-args>), 0,
    \   fzf#vim#with_preview({'dir': systemlist('git rev-parse --show-toplevel')[0]}), <bang>0)

" Lazy git stuff
nnoremap <silent> <leader>lg :LazyGit<CR>

" Which Key
nnoremap <silent> <leader>wk :WhichKey '<Space>'<CR>

" Copilot
imap <silent><script><expr> <C-Space> copilot#Accept("\<CR>")
imap <c-space><C-\> <Plug>(copilot-suggest)
imap <c-space><C-]> <Plug>(copilot-next)
imap <c-space><C-[> <Plug>(copilot-previous)
imap <c-space><C-c> <Plug>(copilot-cancel)
nmap <c-space>cp :Copilot panel<CR>
let g:copilot_no_tab_map = v:true

let g:python3_host_prog = "/home/shashwat/nvim/bin/python3.11"

