"------------------------------------------------------------------"
" Author:       kevin Jossart                                      "
" Source:       https://github.com/Numkil/VimConf                  "
" Credits:      Various vimfora, public .vimrc's and manuals       "
" Comments:     Extra Credits for Tim Sæterøy are needed           "
"               because much of what appears in this .vimrc        "
"               are things I've taken/learned from his .vimrc      "
"               make sure to also check his out if you like this.  "
"               http://github.com/timss/vimconf                    " 
"------------------------------------------------------------------"

    set nocompatible "this vimconf is not vi-compatible
    call system("mkdir -p $HOME/.vim/{privatesnips,undo}")
"" NeoBundle plugin manager
    "Automatically setting up NeoBundle, taken from
    "http://www.erikzaadi.com/2012/03/19/auto-installing-vundle-from-your-vimrc/
        let has_neobundle=1
        if !filereadable($HOME."/.vim/bundle/neobundle.vim/README.md")
            echo "Installing NeoBundle..."
            echo ""
            silent !mkdir -p $HOME/.vim/bundle
            silent !git clone https://github.com/Shougo/neobundle.vim $HOME/.vim/bundle/neobundle.vim
            let has_neobundle=0
        endif
    "Initialize NeoBundle
        filetype off                                " required to init
        set runtimepath+=$HOME/.vim/bundle/neobundle.vim/
        call neobundle#begin(expand($HOME.'/.vim/bundle/'))
"" Bundle's

    " Recursive NeoBundle so it can self-update
    NeoBundleFetch 'Shougo/neobundle.vim' 

    " A file tree explorer
    NeoBundle 'scrooloose/nerdtree'

    " A fuzzy file finder
    NeoBundle 'kien/ctrlp.vim'

    " Finding keywords inside files
    NeoBundle 'rking/ag.vim'

    " Git wrapper inside Vim
    NeoBundle 'tpope/vim-fugitive'

    " Advanced Undo solution 
    NeoBundle 'simnalamburt/vim-mundo'

    " Super easy commenting, toggle comments etc
    NeoBundle 'scrooloose/nerdcommenter'

    " Displays a list of classes/functions/variabels in the file
    " REQUIREMENTS: (exuberant)-ctags
    NeoBundle 'majutsushi/tagbar'

    " Edit files using sudo/su
    NeoBundle 'chrisbra/SudoEdit.vim'
    
    " <Tab> everything!
    NeoBundle 'ervandew/supertab'

    " Awesome syntax checker.
    " Since syntastic is quite complex it might be helpfull to read :h Syntastic-intro.
    " You are required if you want Syntastic to be actually useful to add your own configurations
    " of this plugin to .vimrc_personal, as it is always a strictly personal setting. 
    NeoBundle 'scrooloose/syntastic'

    " Snippet engine and library
    NeoBundle 'SirVer/ultisnips'
    NeoBundle 'honza/vim-snippets'

    " AutoComplete
    NeoBundle 'Shougo/neocomplete'

    " Easy... motions... yeah.
    NeoBundle 'Lokaltog/vim-easymotion'

    " Smarter inline f and t commands
    NeoBundle 'rhysd/clever-f.vim'

    " Indentation guides for vim
    NeoBundle 'Yggdroot/indentLine'
    
    " Closes ( or ' etc.
    NeoBundle 'jiangmiao/auto-pairs'

    " Easily manipulate surrounding characters
    NeoBundle 'tpope/vim-surround'

    " A pretty statusline, bufferline integration
    NeoBundle 'itchyny/lightline.vim'
    NeoBundle 'bling/vim-bufferline'
    
    " Light and dark colourscheme for vim
    NeoBundle 'altercation/vim-colors-solarized'

    " A fancy start screen, shows MRU etc.
    NeoBundle 'mhinz/vim-startify'

    " Misc. plugins TODO: Check if I still needs this or not
    NeoBundle 'MarcWeber/vim-addon-mw-utils'
    NeoBundle 'tomtom/tlib_vim'

    " Language Specific plugins go into this file
    if filereadable($HOME."/.vimrc_plugins")
        source $HOME/.vimrc_plugins
    endif 

    call neobundle#end()

    " Installing plugins the first time then shuts down
    if has_neobundle == 0
        NeoBundleCheck
        :qa
    endif

"" General Built-in Settings

    set cursorline                          "highlight cursor line
    set more                                ""--more-- like less
    set number	                            " Show line numbers
    set showmatch	                        " Highlight matching brace
    set smartindent	                        " Enable smart-indent
    set scrolloff=3                         " Lines above/below cursor
    set wildignore+=*.bak,*.pyc,*.o,*.ojb,   " ignore said files
                    \*.a,*.pdf,*.jpg,*.gif,
                    \*.avi,*.mkv,*.so,*.png,
                    \*.swp, *.git, *.mp3, *.pdf,
                    \*.m4a
    set wildmenu                            " better auto complete
    set wildmode=longest,list               " bash-like auto complete
    set guifont=DejaVu\ Sans\ Mono\ 9
    set guioptions-=m                       " remove menubar
    set guioptions-=T                       " remove toolbar
    set guioptions-=r                       " remove right scrollbar
    set hidden                              " buffer change, more undo
    set history=1000                        " default 20
    set iskeyword+=_,$,@,%,#                " not word dividers
    set laststatus=2                        " always show statusline
    set linebreak                           " don't cut words on wrap
    set listchars=tab:>\                    " > to highlight <tab>
    set list                                " displaying listchars
    set mouse=                              " disable mouse
    set nolist                              " wraps to whole words
    set noshowmode                          " hide mode cmd line
    set noexrc                              " don't use other .*rc(s)
    set nostartofline                       " keep cursor column pos
    set shortmess+=I                        " disable startup message
    set splitbelow                          " splits go below w/focus
    set splitright                          " vsplits go right w/focus
    set ttyfast                             " for faster redraws etc
    set ttymouse=xterm2                     " experimental
    " Wrapping
        set nowrap                          " don't wrap lines
        set showbreak=+++                   " Wrap-broken line prefix
        set textwidth=100                   " Line wrap (number of cols)
        set numberwidth=5                   " 99999 lines
    " Folding
        set foldcolumn=0                    " hide folding column
        set foldmethod=indent               " folds using indent
        set foldnestmax=10                  " max 10 nested folds
        set foldlevelstart=99               " folds open by default
    " Search and replace
        set gdefault                        " default s//g (global)
        set incsearch                       " 'live'-search
        set hlsearch	                    " Highlight all search results
        set smartcase	                    " Enable smart-case search
        set ignorecase	                    " Always case-insensitive
    " Matching
        set matchtime=2                     " time to blink match {}
        set matchpairs+=<:>                 " for ci< or ci>
        set showmatch                       " tmpjump to match-bracket
    " File handling
        set autochdir	                    " Change working directory to open buffer
        set autoread                        " refresh if changed
        set confirm                         " confirm changed files
        set noautowrite                     " never autowrite
        set nobackup                        " disable backups
        set updatecount=50                  " update swp after 50chars

"" Text formatting

    set autoindent	                        " Auto-indent new lines
    set backspace=indent,eol,start          " smart backspace
    set cinkeys-=0#                         " don't force # indentation
    set expandtab                           " no real tabs
    set nrformats+=alpha                    " incr/decr letters C-a/-x
    set shiftround                          " be clever with tabs
    set shiftwidth=4	                    " Number of auto-indent spaces, default 8
    set smarttab                            " tab to 0,4,8 etc.
    set softtabstop=4                       " 'tab' feels like <tab>
    set tabstop=4                           " replace <TAB> w/4 spaces
    " Only auto-comment newline for block comments 
    augroup AutoBlockComment
        autocmd! FileType c,cpp setlocal comments -=:// comments +=f://
    augroup END

"" Syntax highlighting

    filetype plugin indent on                           " detect file plugin+indent
    syntax on                                           " syntax highlighting
    
        ".txt w/highlight, plaintext is useless, markdown for .md
        augroup FileTypeRules
            autocmd!
            autocmd BufNewFile,BufRead *.txt se ft=sh tw=79          " opens .txt w/highlight
            autocmd BufNewFile,BufRead *.tex se ft=tex tw=79         " No plaintex
            autocmd BufNewFile,BufRead *.md se ft=markdown tw=79     " markdown opened w/highlight
        augroup END

        "Only force 256 colors on select terminals, other terminals need to be configured
        "outside of vim to correctly diplay these colors
        if (&term =~ "xterm") || (&term =~ "screen")
            set t_Co=256
        endif

        " Custom highlighting, where NONE uses terminal background
        function! CustomHighlighting()
            highlight Normal ctermbg=NONE
            highlight nonText ctermbg=NONE
            highlight LineNr ctermbg=NONE
            highlight SignColumn ctermbg=NONE
            highlight CursorLine ctermbg=235
        endfunction
        call CustomHighlighting()

"" Advanced Built-in Settings

    set ruler	                                       " Show row and column ruler information
    set undolevels=1000	                               " Number of undo levels
    set timeout timeoutlen=1000 ttimeoutlen=100        " Fluid ESC and other keycodes

    " Colorscheme
    set background=dark
    colorscheme solarized

    " Disabling Flashbell in cli and gui
    set noerrorbells visualbell t_vb=
    if has('autocmd')
        augroup NoVisualBell
            autocmd! GUIEnter * set visualbell t_vb=
        augroup END
    endif

    "Return to last edit position when opening files
    augroup LastPosition
        autocmd! BufReadPost *
            \ if line("'\"") > 0 && line("'\"") <= line("$") |
            \     exe "normal! g`\"" |
            \ endif
    augroup END

    " Persistent undo. Requires Vim 7.3
        if has('persistent_undo') && exists("&undodir")
            set undodir=$HOME/.vim/undo/            " where to store undofiles
            set undofile                            " enable undofile
            set undolevels=500                      " max undos stored
            set undoreload=10000                    " buffer stored undos
        endif

"" Keybinds

    " Remap <leader>
    let mapleader=","

    " Toggle text wrapping
    nnoremap <silent> <leader>w :set invwrap<CR>:set wrap?<CR>

    " Toggle folding
    nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
    vnoremap <Space> zf

    " External yanking and pasting using clipboard. Only works in GVIM
    nnoremap <A-y> "+y
    vnoremap <A-y> "+y
    nnoremap <A-p> "+gP
    vnoremap <A-p> "+gP

    " Move faster
    map <C-Down> <C-d>
    map <C-Up> <C-u>

    " Treat wrapped lines as normal lines
    nnoremap j gj
    nnoremap k gk

    " Working ci(, works for both breaklined, inline and multiple ()
    nnoremap ci( %ci(

    " We don't need any help!
    inoremap <F1> <nop>
    nnoremap <F1> <nop>
    vnoremap <F1> <nop>

    " Disable annoying ex mode (Q)
    map Q <nop>

    " Force vim intented usage
    map <Left> :echo "Error: cannot find Notepad.exe"<cr>
    map <Right> :echo "Error: cannot find Notepad.exe"<cr>
    map <Up> :echo "Error: cannot find Notepad.exe"<cr>
    map <Down> :echo "Error: cannot find Notepad.exe"<cr>

    " Convenient moving from split to split
    nnoremap <silent> <C-k> :wincmd k<CR>
    nnoremap <silent> <C-j> :wincmd j<CR>
    nnoremap <silent> <C-h> :wincmd h<CR>
    nnoremap <silent> <C-l> :wincmd l<CR>
    
    " Navigating through buffers
    nnoremap gn :bnext<CR>
    nnoremap gN :bprevious<CR>
    nnoremap gd :bdelete<CR>
    nnoremap gf <C-^>
    
    " :Ag
    nnoremap <leader>a :Ag!

    " Fugitive shortcuts
    "nnoremap :gs :Gstatus<cr>
    "nnoremap :gw :Gwrite<cr>
    "nnoremap :gd :Gdiff<cr>
    "nnoremap :gc :Gcommit<cr>

    " Mappings to open multiple lines and enter insert mode. // function defined later on
    nnoremap <Leader>o :<C-u>call OpenLines(v:count, 0)<CR>
    nnoremap <Leader>O :<C-u>call OpenLines(v:count, -1)<CR>

    " Open corresponding .cpp or .h file  // function defined later on
    nnoremap <leader>sp :call SplitSourceHeader()<CR>
    
    " Toggle Overlength // function defined later on
    nnoremap <leader>h :call ToggleOverLength()<CR>

    " Toggle tagbar (definitions, functions etc.)
    nnoremap <F1> :TagbarToggle<CR>

    " Toggle the NERDTree file browser
    nnoremap <F2> :NERDTreeToggle<CR>  

    " Toggle Gundo panel
    nnoremap <f3> :GundoToggle<CR>

    " Toggle syntax highlighting // function defined later on
    nnoremap <F4> :call ToggleSyntaxHighLighting()<CR>

    " Toggle light-dark background
    nnoremap <F5> :call BackgroundToggle()<CR>

    " Toggle Autopairing tags like (
    let g:AutoPairsShortcutToggle = '<F6>'

    " Toggle RelativeNumbers // function defined later on
    nnoremap <leader>r :call NumberToggle()<CR>

    " Call Deletemultipleemptylines // function defined later on
    nnoremap <leader>ld :call DeleteMultipleEmptyLines()<CR>

"" Plugin Configuration

    " Ignores for ctrlp -> wildignore does not work?!?
    let g:ctrlp_custom_ignore = {
      \ 'dir':  '\v[\/]\.(git|hg|svn)$',
      \ 'file': '\v\.(pdf|mp3|m4a|mkv|iso|zip|ogg|png|jpg|webm)$',
      \ 'link': '',
      \ }
    let g:ctrlp_working_path_mode = 'ra'
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

    " Clever-f preferences
    let g:clever_f_across_no_line = 1
    let g:clever_f_show_promt = 1

    " Setting indentline to speedmode
    let g:indentLine_faster = 1

    " NERDTree Positioning
    let g:NERDTreeWinPos = "left"
    let g:NERDTreeHijackNetrw = 1  

    " TagBar Positioning
    let g:tagbar_left = 0
    let g:tagbar_width = 30
    set tags=tags;/
    
    " Gundo Positioning
    let g:gundo_width = 35
    let g:gundo_preview_height = 20
    let g:gundo_right = 0

    " Automatically remove preview window after autocomplete (mainly for NeoComplete)
    augroup RemovePreview
        autocmd!
        autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
        autocmd InsertLeave * if pumvisible() == 0|pclose|endif
    augroup END

    " Startify Layout Configuration
    let g:ctrlp_reuse_window = 'startify' " don't split in startify
    let g:startify_bookmarks = [
            \ $HOME . "/.vimrc" ,
            \ $HOME . "/.vimrc_personal",
            \ $HOME . "/.vimrc_plugins",
            \ ]
    let g:startify_custom_header = [
            \ '   Author:      Kevin Jossart',
            \ ''
            \ ]
    
    " Lightline and bufferline configuration  {{{
        let g:lightline = {
            \ 'colorscheme': 'solarized',
            \ 'active': {
            \     'left': [
            \         ['mode', 'paste'],
            \         ['fugitive', 'readonly'],
            \         ['ctrlpmark', 'bufferline']
            \     ],
            \     'right': [
            \         ['lineinfo'],
            \         ['percent'],
            \         ['fileformat', 'fileencoding', 'filetype', 'syntastic']
            \     ]
            \ },
            \ 'component': {
            \     'paste': '%{&paste?"!":""}'
            \ },
            \ 'component_function': {
            \     'mode'         : 'MyMode',
            \     'fugitive'     : 'MyFugitive',
            \     'readonly'     : 'MyReadonly',
            \     'ctrlpmark'    : 'CtrlPMark',
            \     'bufferline'   : 'MyBufferline',
            \     'fileformat'   : 'MyFileformat',
            \     'fileencoding' : 'MyFileencoding',
            \     'filetype'     : 'MyFiletype'
            \ },
            \ 'component_expand': {
            \     'syntastic': 'SyntasticStatuslineFlag',
            \ },
            \ 'component_type': {
            \     'syntastic': 'middle',
            \ },
            \ 'subseparator': {
            \     'left': '|', 'right': '|'
            \ }
            \ }

        let g:lightline.mode_map = {
            \ 'n'      : ' N ',
            \ 'i'      : ' I ',
            \ 'R'      : ' R ',
            \ 'v'      : ' V ',
            \ 'V'      : 'V-L',
            \ 'c'      : ' C ',
            \ "\<C-v>" : 'V-B',
            \ 's'      : ' S ',
            \ 'S'      : 'S-L',
            \ "\<C-s>" : 'S-B',
            \ '?'      : '      ' }

        function! MyMode()
            let fname = expand('%:t')
            return fname == '__Tagbar__' ? 'Tagbar' :
                    \ fname == 'ControlP' ? 'CtrlP' :
                    \ fname == '__Gundo\|NERD_tree' ? '' :
                    \ winwidth('.') > 60 ? lightline#mode() : ''
        endfunction

        function! MyFugitive()
            try
                if expand('%:t') !~? 'Tagbar\|Gundo\|NERD' && exists('*fugitive#head')
                    let mark = '∓ '
                    let _ = fugitive#head()
                    return strlen(_) ? mark._ : ''
                endif
            catch
            endtry
            return ''
        endfunction

        function! MyReadonly()
            return &ft !~? 'help' && &readonly ? '≠' : ''
        endfunction

        function! CtrlPMark()
            if expand('%:t') =~ 'ControlP'
                call lightline#link('iR'[g:lightline.ctrlp_regex])
                return lightline#concatenate([g:lightline.ctrlp_prev, g:lightline.ctrlp_item
                    \ , g:lightline.ctrlp_next], 0)
            else
                return ''
            endif
        endfunction

        function! MyBufferline()
            call bufferline#refresh_status()
            let b = g:bufferline_status_info.before
            let c = g:bufferline_status_info.current
            let a = g:bufferline_status_info.after
            let alen = strlen(a)
            let blen = strlen(b)
            let clen = strlen(c)
            let w = winwidth(0) * 4 / 11
            if w < alen+blen+clen
                let whalf = (w - strlen(c)) / 2
                let aa = alen > whalf && blen > whalf ? a[:whalf] : alen + blen < w - clen || alen < whalf ? a : a[:(w - clen - blen)]
                let bb = alen > whalf && blen > whalf ? b[-(whalf):] : alen + blen < w - clen || blen < whalf ? b : b[-(w - clen - alen):]
                return (strlen(bb) < strlen(b) ? '...' : '') . bb . c . aa . (strlen(aa) < strlen(a) ? '...' : '')
            else
                return b . c . a
            endif
        endfunction

        function! MyFileformat()
            return winwidth('.') > 90 ? &fileformat : ''
        endfunction

        function! MyFileencoding()
            return winwidth('.') > 80 ? (strlen(&fenc) ? &fenc : &enc) : ''
        endfunction

        function! MyFiletype()
            return winwidth('.') > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
        endfunction

        let g:ctrlp_status_func = {
            \ 'main': 'CtrlPStatusFunc_1',
            \ 'prog': 'CtrlPStatusFunc_2',
            \ }

        function! CtrlPStatusFunc_1(focus, byfname, regex, prev, item, next, marked)
            let g:lightline.ctrlp_regex = a:regex
            let g:lightline.ctrlp_prev = a:prev
            let g:lightline.ctrlp_item = a:item
            let g:lightline.ctrlp_next = a:next
            return lightline#statusline(0)
        endfunction

        function! CtrlPStatusFunc_2(str)
            return lightline#statusline(0)
        endfunction

        let g:tagbar_status_func = 'TagbarStatusFunc'

        function! TagbarStatusFunc(current, sort, fname, ...) abort
            let g:lightline.fname = a:fname
            return lightline#statusline(0)
        endfunction

        augroup AutoSyntastic
            autocmd!
            autocmd BufWritePost *.pl,*.c,*.cpp,*.h,*.php,*.java call s:syntastic()
        augroup END
        function! s:syntastic()
            SyntasticCheck
            call lightline#update()
        endfunction

        "Changing background color on the fly
        augroup LightLineColorScheme
            autocmd!
            autocmd ColorScheme * call s:lightline_update()
        augroup END
    	function! s:lightline_update()
            if !exists('g:loaded_lightline')
                return
            endif
            try
                if g:colors_name =~# 'wombat\|solarized\|landscape\|jellybeans\|Tomorrow'
                    let g:lightline.colorscheme =
                        \ substitute(substitute(g:colors_name, '-', '_', 'g'), '256.*', '', '') .
                        \ (g:colors_name ==# 'solarized' ? '_' . &background : '')
                    call lightline#init()
                    call lightline#colorscheme()
                    call lightline#update()
                endif
            catch
            endtry
        endfunction
    " }}}

    " NeoComplete configurations {{{
        " Disable AutoComplPop.
        let g:acp_enableAtStartup = 0
        " Use neocomplete.
        let g:neocomplete#enable_at_startup = 1
        " Use smartcase.
        let g:neocomplete#enable_smart_case = 1
        " Set minimum syntax keyword length.
        let g:neocomplete#sources#syntax#min_keyword_length = 3 

        " Define dictionary.
         let g:neocomplete#sources#dictionary#dictionaries = {
                \ 'default' : '',
                \ 'vimshell' : $HOME.'/.vimshell_hist',
                \ 'scheme' : $HOME.'/.gosh_completions'
                    \ }

        " Define keyword.
        if !exists('g:neocomplete#keyword_patterns')
            let g:neocomplete#keyword_patterns = {}
        endif
        let g:neocomplete#keyword_patterns['default'] = '\h\w*'
        
        " Enable omni completion.
        augroup OmniCompletion
            autocmd!
            autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
            autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
            autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
            autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
            autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
        augroup END

        " Enable heavy omni completion.
        if !exists('g:neocomplete#sources#omni#input_patterns')
            let g:neocomplete#sources#omni#input_patterns = {}
        endif
        let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
        let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
        let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*'
    " }}}
    
    " UltiSnips
        let g:UltiSnipsSnippetsDir="~/.vim/privatesnips"
        let g:UltiSnipsExpandTrigger="<tab>"
        let g:UltiSnipsJumpForwardTrigger="<c-b>"
        let g:UltiSnipsJumpBackwardTrigger="<c-z>"

"" Functions

    " Open multiple lines (insert empty lines) before or after current line,
    " and position cursor in the new space, with at least one blank line
    " before and after the cursor.
        function! OpenLines(nrlines, dir)
            let nrlines = a:nrlines < 3 ? 3 : a:nrlines
            let start = line('.') + a:dir
            call append(start, repeat([''], nrlines))
            if a:dir < 0
                normal! 2k
            else
                normal! 2j
            endif
        endfunction

    " Highlight characters past 85 characters 
        let g:overlength_enabled = 0

        function! ToggleOverLength()
        highlight OverLength ctermbg=181 guibg=MistyRose1
            if g:overlength_enabled == 0
                match OverLength /\%85v.*/
                let g:overlength_enabled = 1
                echo 'OverLength highlighting turned on'
            else
                match
                let g:overlength_enabled = 0
                echo 'OverLength highlighting turned off'
            endif
        endfunction

    " Overlength sometimes need repainting after messing around with the colorscheme
        function! RepaintOverLength()
        highlight OverLength ctermbg=181 guibg=MistyRose1
            if g:overlength_enabled == 1
                match OverLength /\%85v.*/
            endif
        endfunction

    " Toggle relativenumber
        function! NumberToggle()
            if(&rnu== 1)
                set nornu
            else
                set rnu
            endif
        endfunction

    " Toggle between dark and light background
        function! BackgroundToggle()
            let &background = ( &background == "dark"?"light" : "dark")
            if exists("g:colors_name")
                exe "colorscheme " . g:colors_name
            endif
            call RepaintOverLength()
        endfunction
        
    " Toggle syntax highlighting
        function! ToggleSyntaxHighLighting()
            if exists("g:syntax_on")
                syntax off
            else
                syntax on
            endif
            IndentLinesReset
            call RepaintOverLength()
        endfunction

    " Remove multiple empty lines 
        function! DeleteMultipleEmptyLines()
            g/^\_$\n\_^$/d
        endfunction
   
    " Strip trailing whitespace, return to cursor at save 
        function! <SID>StripTrailingWhitespace()
            let l = line(".")
            let c = col(".")
            %s/\s\+$//e
            call cursor(l, c)
        endfunction

        augroup StripTrailingWhiteSpace
            autocmd!
            autocmd FileType c,cpp,css,html,perl,php,python,java,sh autocmd
                        \ BufWritePre <buffer> :call <SID>StripTrailingWhitespace()
        augroup END

    " Split to relative header/source
        function! SplitSourceHeader()
            let s:fname = expand("%:t:r")
            if expand("%:e") == "h"
                set nosplitright
                exe "vsplit" fnameescape(s:fname . ".cpp")
                set splitright
            elseif expand("%:e") == "cpp"
                exe "vsplit" fnameescape(s:fname . ".h")
            endif
        endfunction


    " Attempt to include external file with personal extra configurations
    if filereadable($HOME."/.vimrc_personal")
        source $HOME/.vimrc_personal
    endif 
