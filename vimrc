set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" Project management
"Plugin 'LucHermitte/lh-vim-lib'
"Plugin 'LucHermitte/local_vimrc'

" C++ code editing
"Plugin 'LucHermitte/lh-tags'
"Plugin 'LucHermitte/lh-dev'
"Plugin 'LucHermitte/lh-brackets'
"Plugin 'LucHermitte/searchInRuntime'
"Plugin 'LucHermitte/mu-template'
"Plugin 'tomtom/stakeholders_vim'
"Plugin 'LucHermitte/alternate-lite'
"Plugin 'LucHermitte/lh-cpp'

" C++ code completion
Plugin 'Valloric/YouCompleteMe'

" Color coded
Plugin 'jeaye/color_coded'

" Color scheme
Plugin 'flazz/vim-colorschemes'

" Auto pair
Plugin 'jiangmiao/auto-pairs'

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

" setup youcompleteme
"" enable complete in comments
let g:ycm_complete_in_comments=1
"" load ycm conf by default
let g:ycm_confirm_extra_conf=0
"" auto clost the preview window after exit insert mode
let g:ycm_autoclose_preview_window_after_insertion=1
"" complete syntax keywords
let g:ycm_seed_identifiers_with_syntax=1
"" map keybinds to ycm
nnoremap <F2> :YcmCompleter GoToDeclaration<CR>
nnoremap <F3> :YcmCompleter GoToInclude<CR>


" switch header/src
function! OpenOther()
    if expand("%:e") == "cpp"
	let file_name = fnameescape(expand("%:p:r:s?src?include?").".h")
	if filereadable(file_name)
	    exe ":e" file_name
	else
	    echo "no header found"
	endif
    elseif expand("%:e") == "h"
	let file_name = fnameescape(expand("%:p:r:s?include?src?").".cpp")
	if filereadable(file_name)
	    exe ":e" file_name
	else
	    echo "no src found"
	endif
    endif
endfunction
nnoremap <F4> :call OpenOther()<CR>

" vimself
" show linenumber
set nu
" hightlight current line
set cursorline
" auto align to former line's indent
set autoindent
" using smart indent
set smartindent
" using c indent
set cindent
" tab size
set tabstop=2
" using whitespace replace tab
set expandtab
" new line's indent
set shiftwidth=2
" remap ESC to jj
inoremap jj <Esc>
" setup color scheme
colorscheme twilight
