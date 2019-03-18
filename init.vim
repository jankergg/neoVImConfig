call plug#begin()

" NERDTree
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'Xuyuanp/nerdtree-git-plugin'
" Plug 'ryanoasis/vim-devicons'

Plug 'tpope/vim-surround'
Plug 'terryma/vim-multiple-cursors'

" airline (powerline)
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" enhanced highlight
Plug 'octol/vim-cpp-enhanced-highlight'

" ctags indexer
Plug 'vim-scripts/DfrankUtil'
Plug 'vim-scripts/vimprj'
Plug 'vim-scripts/indexer.tar.gz'
Plug 'jiangmiao/auto-pairs'
" UltiSnips
Plug 'SirVer/ultisnips'

Plug 'mbbill/undotree'

" ctrlp
Plug 'kien/ctrlp.vim'

" A - for switching between source and header files
Plug 'vim-scripts/a.vim'

" easy motion
Plug 'easymotion/vim-easymotion'
" glsl color
Plug 'tikhomirov/vim-glsl'

"Youcompleteme
Plug 'Valloric/YouCompleteMe'

" Git integration
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Linting
Plug 'neomake/neomake'
Plug 'w0rp/ale'

" PHP-specific integration
Plug 'phpactor/phpactor' ,  {'do': 'composer install', 'for': 'php'}
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'phpactor/ncm2-phpactor'

" Snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" Comments
Plug 'tpope/vim-commentary'

" Search
Plug '~/.fzf'
Plug 'junegunn/fzf.vim'
Plug 'dkprice/vim-easygrep'

" Better PHP syntax
Plug 'StanAngeloff/php.vim'

"html emmet
Plug 'mattn/emmet-vim'

" Themes
Plug 'nanotech/jellybeans.vim' , {'as': 'jellybeans'}
Plug 'flazz/vim-colorschemes'
Plug 'frankier/neovim-colors-solarized-truecolor-only'

call plug#end()

set encoding=UTF-8
set guifont=Monaco\ for\ Powerline\ Plus\ Nerd\ File\ Types:h15
" let g:airline_powerline_fonts = 1

"emment setting" all mode enable all functions
let g:user_emmet_mode='a'

" set multi_cursor
let g:multi_cursor_use_default_mapping=0

" Default mapping
let g:multi_cursor_start_word_key      = 'g<C-n>'
let g:multi_cursor_select_all_word_key = 'g<C-N>'
let g:multi_cursor_start_key           = '<C-n>'
let g:multi_cursor_select_all_key      = '<C-M>'
let g:multi_cursor_next_key            = '<C-n>'
let g:multi_cursor_prev_key            = '<C-p>'
let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<Esc>'

" Auto start NERD tree when opening a directory
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | wincmd p | endif
" Auto start NERD tree if no files are specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | exe 'NERDTree' | endif
" Let quit work as expected if after entering :q the only window left open is NERD Tree itself
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" set glsl color
"autocmd! BufNewFile,BufRead *.vs,*.fs set ft=glsl

" replace tab with spaces
let g:ycm_global_ycm_extra_conf='~/.config/nvim/plugged/YouCompleteMe/.ycm_extra_conf.py'

"set expandtab
" allow cursor to move to beginning of tab
" will interfere with soft line wrapping (set nolist)
set list lcs=tab:\ \
" file type recognition
filetype on
filetype plugin on
filetype indent on
set sidescroll=6
" Make it easier to work with buffers
" http://vim.wikia.com/wiki/Easier_buffer_switching
set hidden
set confirm
set autowriteall
set wildmenu wildmode=full
" open new split panes to right and below (as you probably expect)
set splitright
set splitbelow
" Use Ag (the silver searcher) instack of Ack
let g:ackprg = 'ag --nogroup --nocolor --column'


"Completion
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
set ofu=syntaxcomplete#Complete
"autocmd BufEnter * call ncm2#enable_for_buffer()
set completeopt=noinsert,menuone,noselect

au FileType c,cpp nnoremap <buffer> <c-]> :YcmCompleter GoTo<CR>

"autocmd FileType php setlocal omnifunc=phpactor#Complete,syntaxcomplete#Complete
"let g:phpactorOmniError = v:true
let g:python_host_prog='/usr/local/bin/python'

"General
syntax on
"colorscheme jellybeans
"colorscheme Monokai
"colorscheme wombat
colorscheme solarized8_light
set nu
filetype plugin indent on
set nocp
set ruler
set wildmenu
set mouse-=a
set t_Co=256

" Persistent undo
set undodir=~/.vim/undo/
set undofile
set undolevels=1000
set undoreload=10000

"Code folding
set foldmethod=manual

"Tabs and spacing
set autoindent
set cindent
set tabstop=4
set expandtab
set shiftwidth=4
set smarttab

"Search
set hlsearch
set incsearch
set ignorecase
set smartcase
set diffopt +=iwhite

"Syntax highlighting in Markdown
au BufNewFile,BufReadPost *.md set filetype=markdown
let g:markdown_fenced_languages = ['bash=sh', 'css', 'django', 'cpp', 'javascript', 'js=javascript', 'json=javascript', 'perl', 'php', 'python', 'ruby', 'sass', 'xml', 'html', 'vim']

"using system clipboard
set clipboard+=unnamedplus

" change the leader key from "\" to ";" ("," is also popular)
let mapleader=";"
" Shortcut to edit THIS configuration file: (e)dit (c)onfiguration
nnoremap <silent> <leader>ec :e $MYVIMRC<CR>
" Shortcut to source (reload) THIS configuration file after editing it: (s)ource (c)onfiguraiton
nnoremap <silent> <leader>sc :source $MYVIMRC<CR>
"emmet shortcut
nnoremap <leader>ee :Emmet 
" use ;; for escape
" http://vim.wikia.com/wiki/Avoid_the_escape_key
"inoremap ;; <Esc>
" Toggle NERDTree
" Can't get <C-Space> by itself to work, so this works as Ctrl - space - space
" https://github.com/neovim/neovim/issues/3101
" http://stackoverflow.com/questions/7722177/how-do-i-map-ctrl-x-ctrl-o-to-ctrl-space-in-terminal-vim#answer-24550772
nnoremap <Space> :NERDTreeToggle<CR>
"nmap <C-@> <C-Space>
"nnoremap <silent> <Space> :NERDTreeToggle<CR>
" toggle tagbar
nnoremap <silent> <leader>tb :TagbarToggle<CR>
" toggle line numbers
nnoremap <silent> <leader>n :set number! number?<CR>
" toggle line wrap
nnoremap <silent> <leader>w :set wrap! wrap?<CR>
" redraw screan and clear search highlighted items
"http://stackoverflow.com/questions/657447/vim-clear-last-search-highlighting#answer-25569434
nnoremap <silent> <C-L> :nohlsearch<CR><C-L>
" vimux
" https://raw.githubusercontent.com/benmills/vimux/master/doc/vimux.txt
nnoremap <leader>vc :VimuxPromptCommand<CR>
nnoremap <leader>vl :VimuxRunLastCommand<CR>
nnoremap <leader>vq :VimuxCloseRunner<CR>
nnoremap <leader>vx: VimuxInterruptRunner<CR>
" improved keyboard navigation
nnoremap <silent> <C-h> <C-w>h
nnoremap <silent> <C-j> <C-w>j
nnoremap <silent> <C-k> <C-w>k
nnoremap <silent> <C-l> <C-w>l
" improved keyboard support for navigation (especially terminal)
" https://neovim.io/doc/user/nvim_terminal_emulator.html
tnoremap <Esc> <C-\><C-n>
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l
" Start terminal in insert mode
au BufEnter * if &buftype == 'terminal' | :startinsert | endif
nnoremap <silent> <leader>tt :terminal<CR>
nnoremap <silent> <leader>tv :vnew<CR>:terminal<CR>
nnoremap <silent> <leader>th :new<CR>:terminal<CR>
tnoremap <C-x> <C-\><C-n><C-w>q
" ctrlp.vim
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = ''
let g:ctrlp_custom_ignore='node_modules\|DS_Store\|git\|idea\|vscode'
" toggle colors to optimize based on light or dark background
nnoremap <leader>c :call ToggleLightDark()<CR>

" =====================================
" vim-airline status
" configure: https://github.com/vim-airline/vim-airline#user-content-extensible-pipeline
" =====================================
let g:airline_theme='monochrome'
" show buffers (if only one tab)
"let g:airline#extensions#tabline#enabled = 1
let s:hidden_all = 0
function! ToggleHiddenAll()
if s:hidden_all  == 0
let s:hidden_all = 1
set noshowmode
set noruler
set laststatus=0
set noshowcmd
	TagbarClose
	NERDTreeClose
set foldcolumn=10
else
set foldcolumn=0
let s:hidden_all = 0
set showmode
set ruler
set laststatus=2
set showcmd
	NERDTree
	" NERDTree takes focus, so move focus back to the right
	" (note: "l" is lowercase L (mapped to moving right)
wincmd l
	TagbarOpen
endif
endfunction
nnoremap <silent> <leader>h :call ToggleHiddenAll()<CR>
" =====================================
" Custom find
" =====================================
" --column: Show column number
" --line-number: Show line number
" --no-heading: Do not show file headings in results
" --fixed-strings: Search term as a literal string
" --ignore-case: Case insensitive search
" --no-ignore: Do not respect .gitignore, etc...
" --hidden: Search hidden files and folders
" --follow: Follow symlinks
" --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
" --color: Search color options
command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)
" =====================================
" Custom styling
" =====================================
" http://stackoverflow.com/questions/9001337/vim-split-bar-styling
set fillchars+=vert:\
" http://vim.wikia.com/wiki/Highlight_current_line
" http://stackoverflow.com/questions/8750792/vim-highlight-the-whole-current-line
" http://vimdoc.sourceforge.net/htmldoc/autocmd.html#autocmd-events
autocmd BufEnter * setlocal cursorline
autocmd WinEnter * setlocal cursorline
autocmd BufLeave * setlocal nocursorline
autocmd WinLeave * setlocal nocursorline
" tagbar autopen
"autocmd VimEnter * nested :call tagbar#autoopen(1)
"autocmd FileType * nested :call tagbar#autoopen(0)
"autocmd BufEnter * nested :call tagbar#autoopen(0)
" =====================================
" auto completion
" =====================================
set completeopt+=noinsert
set completeopt+=noselect
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#go#use_cache = 1
" =====================================
" Init
" =====================================
autocmd VimEnter * wincmd p


" Neomake config
" Full config: when writing or reading a buffer, and on changes in insert and
" normal mode (after 1s; no delay when writing).
call neomake#configure#automake('nrwi', 500)

