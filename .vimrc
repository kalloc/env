set nocompatible
set nobackup
set history=50
set showcmd
set ruler
set hlsearch
set incsearch
set smartcase
set cmdheight=1
syntax enable
filetype plugin indent on
" set fencs=utf-8,cp1251,koi8-r,ucs-2,cp866
" set encoding=utf-8
" set foldmethod=indent

set wildmenu
set wcm=<Tab>
menu Encoding.koi8-r   :e ++enc=koi8-r<CR>
menu Encoding.windows-1251 :e ++enc=cp1251<CR>
menu Encoding.ibm-866      :e ++enc=ibm866<CR>
menu Encoding.utf-8        :e ++enc=utf-8 <CR>
map <F9> :emenu Encoding.<TAB>

set fileencodings=utf-8,koi8-r,cp866,cp1251

set pastetoggle=<F3>
 
" автоматическое закрытие скобок
" inoremap { {}<LEFT>
" inoremap ( ()<LEFT>
" inoremap [ []<LEFT>
 
if has('gui_running')
    colo wombat
    set guifont=Liberation15px
    set guioptions-=T
    set guioptions-=t
    set mouse=a
    set mousemodel=popup
else
    colo slate
endif
 
" when ':set list' you see <tab> and trails more usable
set listchars=tab:>-,trail:-
set list
set nu
set sw=4 ts=4 sta et
au FileType crontab,fstab,make set noet ts=8 sw=8
au BufEnter *.py set ai sw=4 ts=4 sta et fo=croql tw=80
au BufEnter *.sh set ai sw=4 ts=4 sta et tw=80
 
" STATUS STRING
set wildmenu
set laststatus=2
set statusline=%<%f\ [%Y%R%W]%1*%{(&modified)?'\ [+]\ ':''}%*%=%c%V,%l\ %P\ [%n]
 
 
" On/off line numbers by F11
imap <F11> <Esc>:set<Space>nu!<CR>a
nmap <F11> :set<Space>nu!<CR>
 
" новая вкладка
nnoremap <C-T> :tabnew<CR>
inoremap <C-T> <C-O>:tabnew<CR>
vnoremap <C-T> <ESC>:tabnew<CR>
 
" предыдущая вкладка
nnoremap <silent><A-LEFT> :call TabJump('left')<CR>
inoremap <silent><A-LEFT> <C-O>:call TabJump('left')<CR>
vnoremap <silent><A-LEFT> <ESC>:call TabJump('left')<CR>
 
" следующая вкладка
nnoremap <silent><A-RIGHT> :call TabJump('right')<CR>
inoremap <silent><A-RIGHT> <C-O>:call TabJump('right')<CR>
vnoremap <silent><A-RIGHT> <ESC>:call TabJump('right')<CR>
 
" первая вкладка
nnoremap <A-UP> :tabfirst<CR>
inoremap <A-UP> <C-O>:tabfirst<CR>
vnoremap <A-UP> <ESC>:tabfirst<CR>
 
" последняя вкладка
nnoremap <A-DOWN> :tablast<CR>
inoremap <A-DOWN> <C-O>:tablast<CR>
vnoremap <A-DOWN> <ESC>:tablast<CR>
 
" переместить вкладку назад
nnoremap <silent><A-S-LEFT> :call TabMove('left')<CR>
inoremap <silent><A-S-LEFT> <C-O>:call TabMove('left')<CR>
vnoremap <silent><A-S-LEFT> <ESC>:call TabMove('left')<CR>
 
" переместить вкладку вперёд
nnoremap <silent><A-S-RIGHT> :call TabMove('right')<CR>
inoremap <silent><A-S-RIGHT> <C-O>:call TabMove('right')<CR>
vnoremap <silent><A-S-RIGHT> <ESC>:call TabMove('right')<CR>
 
" меню выбора кодировки сохранения
nnoremap <F6> :emenu File.Encoding.Write.<TAB>
inoremap <F6> <C-O>:emenu File.Encoding.Write.<TAB>
vnoremap <F6> <ESC>:emenu File.Encoding.Write.<TAB>
 
" меню выбора кодировки чтения
nnoremap <F7> :emenu File.Encoding.Read.<TAB>
inoremap <F7> <C-O>:emenu File.Encoding.Read.<TAB>
vnoremap <F7> <ESC>:emenu File.Encoding.Read.<TAB>
 
" меню проверки орфографии
" nnoremap <F8> :emenu File.Spell.<TAB>
" inoremap <F8> <C-O>:emenu File.Spell.<TAB>
" vnoremap <F8> <ESC>:emenu File.Spell.<TAB>
 
" меню открытия внешней программой
nnoremap <F9> :emenu File.Preview.<TAB>
inoremap <F9> <C-O>:emenu File.Preview.<TAB>
vnoremap <F9> <ESC>:emenu File.Preview.<TAB>
 
" закрыть буфер
nnoremap <F10> :q!<CR>
inoremap <F10> <C-O>:q!<CR>
vnoremap <F10> <ESC>:q!<CR>
 
" закрыть всё
nnoremap <C-F10> :qall!<CR>
inoremap <C-F10> <C-O>:qall!<CR>
vnoremap <C-F10> <ESC>:qall!<CR>
 
function! TabJump(direction)
    let l:tablen=tabpagenr('$')
    let l:tabcur=tabpagenr()
    if a:direction=='left'
        if l:tabcur>1
            execute 'tabprevious'
        endif
    else
        if l:tabcur!=l:tablen
            execute 'tabnext'
        endif
    endif
endfunction
 
function! TabMove(direction)
    let l:tablen=tabpagenr('$')
    let l:tabcur=tabpagenr()
    if a:direction=='left'
        if l:tabcur>1
            execute 'tabmove' l:tabcur-2
        endif
    else
        if l:tabcur!=l:tablen
            execute 'tabmove' l:tabcur
        endif
    endif
endfunction

let g:netrw_list_hide='\.pyc$,\.o$,^\.svn$,^\.swp$,^\.git$' 
set acd

if has("python")
function! LoadRope()
python << EOF
import ropevim
EOF
endfunction
call LoadRope()
let ropevim_codeassist_maxfixes=10
let ropevim_vim_completion=1
let ropevim_guess_project=1
let ropevim_enable_autoimport=1
let ropevim_enable_shortcuts=1
let ropevim_extended_complete=1
endif

" Обозреватель файлов (plugin-NERD_Tree)
map <F8> :NERDTreeToggle<cr>
vmap <F8> <esc>:NERDTreeToggle<cr>
imap <F8> <esc>:NERDTreeToggle<cr>

let NERDTreeWinPos = 'right'
let NERDTreeShowBookmarks = 1
let NERDTreeIgnore = ['\~$', '*.pyc', '*.pyo', '.git']
let NERDChristmasTree = 0


" Source Explorer  http://www.vim.org/scripts/script.php?script_id=2179
nmap <F7> :SrcExplToggle<CR> 
let g:SrcExpl_winHeight = 8 
let g:SrcExpl_refreshTime = 100 
" let g:SrcExpl_jumpKey = "<ENTER>" 
let g:SrcExpl_gobackKey = "<SPACE>" 
let g:SrcExpl_pluginList = [ 
        \ "__Tag_List__", 
        \ "_NERD_tree_", 
        \ "Source_Explorer" 
    \ ] 

let g:SrcExpl_searchLocalDef = 1 
let g:SrcExpl_isUpdateTags = 0 
let g:SrcExpl_updateTagsCmd = "ctags --sort=foldcase -R ." 
let g:SrcExpl_updateTagsKey = "<F12>" 



" neocomplete
let g:acp_enableAtStartup = 0 
let g:neocomplcache_disable_auto_complete = 1
let g:neocomplcache_enable_at_startup = 1 
" Use smartcase. 
let g:neocomplcache_enable_smart_case = 1 
" Use camel case completion. 
let g:neocomplcache_enable_camel_case_completion = 1 
" Use underbar completion. 
let g:neocomplcache_enable_underbar_completion = 1 
" Set minimum syntax keyword length. 
let g:neocomplcache_min_syntax_length = 3 
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*' 

autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS 
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags 
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS 
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete 
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags 
function! TabWrapperRope()
    echo getline('.')
    if strpart(getline('.'), 0, col('.')-1) =~ '^\s*$'
        return "\<Tab>"
    else
"        return "\<C-R>=RopeCodeAssistInsertMode()\<CR>"
        return "\<C-x>\<C-u>"
    endif
endfunction

silent imap <buffer><Tab> <C-R>=TabWrapperRope()<CR>



" taglist
nnoremap <silent> <F6> :TlistToggle<CR>

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" My Bundles here:
"
" original repos on github
Bundle 'tpope/vim-fugitive'
Bundle "scrooloose/nerdtree"
Bundle 'Lokaltog/vim-easymotion'
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
Bundle "vim-scripts/sudo.vim"
" vim-scripts repos
Bundle 'L9'
Bundle 'FuzzyFinder'
" Lua
Bundle 'vim-scripts/lua.vim'
Bundle 'rkowal/Lua-Omni-Vim-Completion'
Bundle 'xolox/vim-lua-ftplugin'
Bundle 'xolox/vim-lua-inspect'
"Snippets
Bundle "rygwdn/ultisnips"

" IDE
Bundle "mileszs/ack.vim"
Bundle "Source-Explorer-srcexpl.vim"
Bundle "taglist.vim"
Bundle "kien/ctrlp.vim"
Bundle "Shougo/neocomplcache"
Bundle "xolox/vim-easytags"

" Python/Django
Bundle 'git://github.com/fs111/pydoc.vim.git'
Bundle "pyflakes"

" Perl
Bundle 'git://github.com/petdance/vim-perl.git'
Bundle 'git://github.com/ggray/vim-tt2.git'

" HTML/HAML
Bundle 'git://github.com/othree/html5.vim.git'
Bundle 'git://github.com/hokaccha/vim-html5validator.git'
"Bundle 'git://github.com/tyru/operator-html-escape.vim.git'
Bundle 'git://github.com/tpope/vim-haml.git'
Bundle 'git://github.com/gregsexton/MatchTag.git'

" non github repos
filetype plugin indent on 

