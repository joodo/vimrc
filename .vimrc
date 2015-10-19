set encoding=utf-8

let mapleader = ","

" tab
set shiftwidth=4
set tabstop=4
set expandtab

" 历史和撤销
set history=50		" keep 50 lines of command line history
inoremap <C-U> <C-G>u<C-U>

" 显示未完成的命令
set showcmd		" display incomplete commands

" 回到上次编辑位置
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" 高亮当前行和列
set cursorline
set cursorcolumn

" 搜索
set incsearch		" 增量搜索
set hlsearch        " 高亮搜索

" 行号
set nu!

" 去掉有关vi一致性模式，避免以前版本的bug和局限
set nocompatible

" Vundle
" 命令行执行 git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim 安装
" :BundleList     //会显示你vimrc里面填写的所有插件名称
" :BundleInstall  //会自动下载安装或更新你的插件。
" :BundleClean    //清理不使用的插件
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#rc()

Bundle 'gmarik/Vundle.vim'

" 开启目录树导航
Bundle 'scrooloose/nerdtree.git'
map <C-n> :NERDTreeToggle<CR>
let NERDTreeQuitOnOpen = 1
let NERDTreeIgnore = ['\.pyc']

" 括号匹配
Bundle 'jiangmiao/auto-pairs.git'
let g:AutoPairsFlyMode = 1
let g:AutoPairsShortcutBackInsert = '<C-b>'

" 索引
" 需要安装ctags：sudo apt-get install ctags
Bundle 'majutsushi/tagbar'
nmap <F9> :TagbarToggle<CR>
let g:tagbar_autofocus = 1
let g:tagbar_autoclose = 1

" 彩虹括号
Bundle 'kien/rainbow_parentheses.vim'
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" 配色
set t_Co=256
let g:solarized_termcolors=256
Bundle 'altercation/vim-colors-solarized.git'
set background=light
colorscheme solarized

" 状态栏美观
Bundle 'vim-airline'
set laststatus=2
" putty下会乱码
let g:airline_powerline_fonts = 1
" Tab line设置
let g:airline#extensions#tabline#enabled = 1
noremap <Tab> <C-w>w
map <S-tab> :bn<CR>
map <C-h> :bp<CR>
map <C-w> :bd<CR>

" 缩进标识
Bundle 'Yggdroot/indentLine'
let g:indentLine_color_term = 187

" 将代码行最后无效的空格标红
Bundle 'bronson/vim-trailing-whitespace'

" 快速移动
Bundle 'Lokaltog/vim-easymotion'
hi link EasyMotionTarget Search
hi link EasyMotionTarget2First Search
hi link EasyMotionTarget2Second Search
hi link EasyMotionShade Comment

" 自动补全
" 需要编译YCM。方法：
" cd ~/.vim/bundle/YouCompleteMe
" ./install.sh --clang-completer
Bundle 'Valloric/YouCompleteMe'
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1

" 快速插入自定义代码段
" 使用前需要挪动 snippets 的位置
" sudo rm -rf ~/.vim/UltiSnips/
" sudo ln -s ~/.vim/bundle/vim-snippets/UltiSnips ~/.vim/UltiSnips
Bundle 'SirVer/ultisnips'
" Snippets are separated from the engine. Add this if you want them:
Bundle 'honza/vim-snippets'
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-e>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"


filetype plugin indent on

" 换行与折行
" textwidth=70
set nowrap

" 代码折叠 zc, zo
set foldmethod=indent
set foldlevelstart=99
set foldignore=

" 粘贴模式
:set pastetoggle=<F11>

" 黑洞寄存器
noremap <S-x> "_d
