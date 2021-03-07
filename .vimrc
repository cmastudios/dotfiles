set nocompatible
filetype plugin indent on
syntax enable
"set background=dark
set noexpandtab
set ts=4 sw=4
"colorscheme solarized
set colorcolumn=80

"autocmd Filetype tex setl updatetime=1
"let g:livepreview_previewer = 'open -a Preview'
"let g:polyglot_disabled = ['latex']
"let maplocalleader = "`"
"let g:vimtex_view_method = "skim"
"let g:vimtex_latexmk_enabled = 1

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsEditSplit="vertical"

setlocal spell
set spelllang=en,en_us
inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u

set conceallevel=1
let g:tex_conceal='abdmg'

call plug#begin()
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
"Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'
"Plug 'godlygeek/tabular'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'SirVer/ultisnips'
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'thomasfaingnaert/vim-lsp-snippets'
Plug 'thomasfaingnaert/vim-lsp-ultisnips'
call plug#end()

if executable('clangd')
    augroup vim_lsp_cpp
        autocmd!
        autocmd User lsp_setup call lsp#register_server({
                    \ 'name': 'clangd',
                    \ 'cmd': {server_info->['clangd']},
                    \ 'whitelist': ['c', 'cpp', 'objc', 'objcpp', 'cc'],
                    \ })
	autocmd FileType c,cpp,objc,objcpp,cc setlocal omnifunc=lsp#complete
    augroup end
endif

set completeopt+=menuone

"let g:mkdp_browser = 'Safari'
"let g:vim_markdown_math = 1
