set nocompatible
set autoindent
set smartindent

set wildmenu " Cool looking menu shit lol
set backspace=indent,eol,start
set backup                     " keep a backup file
set history=50                 " keep 50 lines of command line history
set ruler                      " show the cursor position all the time
set showcmd                    " display incomplete commands
set incsearch                  " do incremental searching
set number                     " show line numbers
set numberwidth=4              " line numbers 4 chars wide
set shiftwidth=4               " indent 4 spaces automatically
set tabstop=4                  " tabs look 4 spaces wide
set expandtab
set showmatch                  " show matching braces
set showmode                   " show the mode i'm in
syntax on                      " well duh, highlist that shit!
set hlsearch                   " highlight search stuff too
set t_Co=256                   " convince terminals to look pretty

set undofile                   " presistent history
set undodir=$HOME/.vim/undo
set undolevels=1000
set undoreload=10000

set noeb vb t_vb=              " no error bell

" disable gvim scrollbars
set guioptions-=l
set guioptions-=r
set guioptions-=b
set guioptions-=L
set guioptions-=R

" hotkeys:
nnoremap <F2> :call ChangeNumberStyle() <CR>
nnoremap <F3> :set list!<CR>
inoremap <C-space> <C-x><C-o>
nnoremap <F7> gT
nnoremap <F8> gt
nnoremap <F6> :!echo -e "\n\n\n\nRunning tests:" && python3 % && python2 % <CR>

" gundo (history plugin)
" http://sjl.bitbucket.org/gundo.vim
nnoremap <F5> :GundoToggle<CR>
let g:gundo_preview_height = 15
let g:gundo_width = 30
let g:gundo_preview_bottom = 1
let g:gundo_right = 1

colorscheme zenburn " http://www.vim.org/scripts/script.php?script_id=415
let g:zenburn_high_Contrast=1
colors zenburn

function! ChangeNumberStyle()
    if(&relativenumber == 1)
        set number
"elseif (&number == 1)
"        set nonumber
    else
        set relativenumber
    endif
endfunc


" REQUIRED. This makes vim invoke Latex-Suite when you open a tex file.
filetype plugin on

" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
set grepprg=grep\ -nH\ $*

" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'
let g:Tex_DefaultTargetFormat='pdf'
let g:Tex_MultipleCompileFormats='dvi,pdf'

" 80 char width marker
highlight ColorColumn ctermbg=235
let &colorcolumn=join(range(81,120),",") " 80 is last valid column 


" status line
set laststatus=2
set statusline=%t       "tail of the filename
set statusline+=[%{strlen(&fenc)?&fenc:'none'}, "file encoding
set statusline+=%{&ff}] "file format
set statusline+=%h      "help file flag
set statusline+=%m      "modified flag
set statusline+=%r      "read only flag
set statusline+=%y      "filetype
set statusline+=%=      "left/right separator
set statusline+=%c,     "cursor column
set statusline+=%l/%L   "cursor line/total lines
set statusline+=\ %P    "percent through file
