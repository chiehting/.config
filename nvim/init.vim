set t_Co=256
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8

" 自動換行
set wrap

" 顯示游標所在的列
"hi CursorLine cterm=none ctermbg=DarkMagenta ctermfg=White

" 別bebe叫
set noeb

" 自動切換當前目錄
"set autochdir

" 搜尋不分大小寫
"set ic

" 只在 Normal 以及 Visual 模式使用滑鼠，也就是取消 Insert 模式的滑鼠
"set mouse=nv

" 顯示相對行號
set relativenumber

" 在 fish 裡相容 Vim 裡的 Neobundle
set shell=/bin/bash

"syntax on 語法高亮
syntax on
autocmd InsertLeave * se nocul
autocmd InsertEnter * se cul
highlight Visual cterm=bold ctermbg=Blue ctermfg=NONE

" 當文件變動時自動加載
set autoread

" paste模式
set nopaste

" tab鍵的字元數
set tabstop=2

" 處理縮排
set shiftwidth=4

" On pressing tab, insert 4 spaces
set expandtab
set softtabstop=4

" 尋結果高亮
set hlsearch
set incsearch

" 顯示斷行符號
set list

" when indenting with '>', use 4 spaces width
set listchars=nbsp:_,tab:>-,trail:~,extends:>,precedes:<

" 顯示檔案列數
"set nu

""" Plugins
call plug#begin('~/.config/nvim/plugged')
"    Plug 'junegunn/vim-easy-align'
"    Plug 'Valloric/YouCompleteMe'
    Plug 'scrooloose/nerdtree'
    Plug 'Xuyuanp/nerdtree-git-plugin'
    Plug 'tpope/vim-fugitive'
    Plug 'vim-airline/vim-airline'
    Plug 'rking/ag.vim'
"    Plug 'kien/ctrlp.vim'
    Plug '/usr/local/opt/fzf'
    Plug 'junegunn/fzf.vim'
    Plug 'mattn/emmet-vim'
call plug#end()

" :source %
" :PlugUpgrade   - 更新 vim-plug 管理器
" :PlugInstall   - 安裝未安裝的插件
" :PlugUpdate    - 安裝或更新插件
" :PlugClean     - 移除未使用的插件目錄
" :PlugStatus    - 查看目前插件狀態

""" 參數鍵設置
" Plugin:NERDTree
let NERDTreeWinPos='left'
let NERDTreeWinSize=30
let NERDTreeShowHidden=1
map <C-\> :NERDTreeToggle<CR>

" Plugin:YouCompleteMe
let g:ycm_seed_identifiers_with_syntax=1 " 語法關鍵字補全

" Plugin:emmet-vim
let g:user_emmet_expandabbr_key='<Tab>'
let g:user_emmet_install_global = 0
autocmd FileType html,css,scss,sass EmmetInstall

" self
imap <C-s> <Esc>:w<CR>
map <C-s> :set nopaste<CR>:w<CR>
map <C-c> :w !pbcopy<CR>
map <C-p> :FZF<CR>

""" event
autocmd BufWinLeave,VimLeave *.php  silent! execute "!php-cs-fixer fix --using-cache=no %" | redraw!

