"------------------------------------------------------------------"
" Author:       Merel Jossart                                      "
" Source:       https://github.com/Numkil/VimConf                  "
" Requirements: Neovim                                             "
"------------------------------------------------------------------"

   call system('mkdir -p $HOME/.nvim/{privatesnips,undo}')
"" Dein plugin manager
    "Automatically setting up Dein, taken from
    "http://www.erikzaadi.com/2012/03/19/auto-installing-vundle-from-your-vimrc/
        let has_dein =1
        if !filereadable($HOME.'/.nvim/bundle/repos/github.com/Shougo/dein.vim/README.md')
            echo 'Installing Dein ...'
            echo ''
            silent !mkdir -p $HOME/.nvim/bundle
            silent !curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
            silent !sh ./installer.sh $HOME/.nvim/bundle
            silent !rm -rf installer.sh
            let has_dein =0
        endif
    "Initialize dein
        filetype off                                " required to init
        set runtimepath+=$HOME/.nvim/bundle/repos/github.com/Shougo/dein.vim
        call dein#begin('~/.nvim/bundle')
"" Bundle's

    " Recursive Dein so it can self-update
    call dein#add('~/.nvim/bundle/repos/github.com/Shougo/dein.vim')

    " A file tree explorer
    call dein#add('scrooloose/nerdtree')

    " A fuzzy file finder
    call dein#add('ctrlpvim/ctrlp.vim')

    " Finding keywords inside files
    call dein#add('numkil/ag.nvim')

    " Git wrapper inside Vim
    call dein#add('tpope/vim-fugitive')

    " Show modified lines for files tracked in git
    call dein#add('mhinz/vim-signify')

    " Smooth scrolling
    call dein#add('psliwka/vim-smoothie')

    " Advanced Undo solution
    call dein#add('simnalamburt/vim-mundo')

    " Super easy commenting, toggle comments etc
    call dein#add('scrooloose/nerdcommenter')

    " Displays a list of classes/functions/variabels in the file
    " REQUIREMENTS: (exuberant)-ctags
    call dein#add('preservim/tagbar')

    " UNIX shell command helpers, e.g. sudo, chmod, remove etc.
    call dein#add('tpope/vim-eunuch')

    " Awesome syntax checker.
    " Since syntastic is quite complex it might be helpfull to read :h Syntastic-intro.
    " You are required if you want Syntastic to be actually useful to add your own configurations
    " of this plugin to .vimrc_personal, as it is always a strictly personal setting.
    call dein#add('vim-syntastic/syntastic')

    " Snippet engine and library
    call dein#add('SirVer/ultisnips')
    call dein#add('honza/vim-snippets')

    " AutoComplete
    call dein#add('Shougo/deoplete.nvim')

    " Combined package for all filetype syntax support
    call dein#add('sheerun/vim-polyglot')

    " Multiple cursors to enable faster refactoring
    call dein#add('terryma/vim-multiple-cursors')

    " Smarter inline f and t commands
    call dein#add('rhysd/clever-f.vim')

    " Indentation guides for vim
    call dein#add('Yggdroot/indentLine')

    " Closes ( or ' etc.
    call dein#add('jiangmiao/auto-pairs')

    " Easily manipulate surrounding characters
    call dein#add('tpope/vim-surround')

    " A pretty statusline, bufferline integration
    call dein#add('itchyny/lightline.vim')
    call dein#add('bling/vim-bufferline')

    " Explorer view for buffers
    " When too many open buffers and :bn is not enough
    call dein#add('jlanzarotta/bufexplorer')

    " Light and dark colourscheme for vim
    call dein#add('lifepillar/vim-solarized8')

    " A fancy start screen, shows MRU etc.
    call dein#add('mhinz/vim-startify')

    " Language Specific plugins go into this file
    if filereadable($HOME.'/.vimrc_plugins')
        source $HOME/.vimrc_plugins
    endif

    call dein#end()
    call dein#save_state()

    " Installing plugins the first time then shuts down
    if has_dein == 0
        call dein#install()
        :qa
    endif

"" General Built-in Settings

    set cursorline                          " highlight cursor line
    set more                                " -more-- like less
    set number	                            " Show line numbers
    set signcolumn=number                   " Merge git sign column and line numbers
    set showmatch	                        " Highlight matching brace
    set smartindent	                        " Enable smart-indent
    set scrolloff=3                         " Lines above/below cursor
    set wildignore+=*.bak,*.pyc,*.o,*.ojb   " ignore said files
    set wildignore+=*.a,*.pdf,*.jpg,*.gif
    set wildignore+=*.avi,*.mkv,*.so,*.png
    set wildignore+=*.swp,*/.git,*.mp3,*.pdf
    set wildignore+=*.m4a
    set wildmenu                            " better auto complete
    set wildmode=longest:full,list:full     " bash-like auto complete
    set guifont=DejaVu\ Sans\ Mono\ 9
    set guioptions-=m                       " remove menubar
    set guioptions-=T                       " remove toolbar
    set guioptions-=r                       " remove right scrollbar
    set completeopt=menu,preview,longest    " insert mode completion
    set hidden                              " buffer change, more undo
    set history=1000                        " default 20
    set iskeyword+=_,$,@,%,#                " not word dividers
    set laststatus=2                        " always show statusline
    set linebreak                           " don't cut words on wrap
    set listchars=tab:>\                    " > to highlight <Tab>
    set list                                " displaying listchars
    set mouse=                              " disable mouse
    set nolist                              " wraps to whole words
    set noshowmode                          " hide mode cmd line
    set noexrc                              " don't use other .*rc(s)
    set nostartofline                       " keep cursor column pos
    set shortmess+=I                        " disable startup message
    set splitbelow                          " splits go below w/focus
    set splitright                          " vsplits go right w/focus
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
    set expandtab                           " indents <Tab> as spaces
    set nrformats+=alpha                    " incr/decr letters C-a/-x
    set shiftround                          " be clever with tabs
    set shiftwidth=0	                    " Number of auto-indent spaces, default 8
    set smarttab                            " tab to 0,4,8 etc.
    set softtabstop=-1                      " =-1 uses 'sw' value
    set tabstop=4                           " <Tab> as 4 spaces indent

"" Syntax highlighting

    filetype plugin indent on                           " detect file plugin+indent
    if !exists('g:syntax_on')
        syntax enable                                   " syntax highlighting
    endif

    " force behavior and filetypes, and by extension highlighting
        augroup FileTypeRules
            autocmd!
            autocmd BufNewFile,BufRead *.txt set ft=sh tw=79          " opens .txt w/highlight
            autocmd BufNewFile,BufRead *.t set ft=perl tw=79          " opens .txt w/highlight
            autocmd BufNewFile,BufRead *.tex set ft=tex tw=79         " no plaintex
            autocmd BufNewFile,BufRead *.md set ft=markdown tw=79     " markdown opened w/highlight
        augroup END

        "Only force 256 colors on select terminals, other terminals need to be configured
        "outside of vim to correctly diplay these colors
        if (&term =~? 'xterm') || (&term =~? 'screen')
            set t_Co=256
        endif

"" Advanced Built-in Settings

    set ruler	                                       " Show row and column ruler information
    set timeout timeoutlen=1000 ttimeoutlen=100        " Fluid ESC and other keycodes
    set updatetime=300                                 " Faster response on async functions

    " Colorscheme
    set termguicolors
    set background=dark
    colorscheme solarized8

    " Disabling Flashbell in cli and gui
    set noerrorbells visualbell t_vb=
    augroup NoVisualBell
        autocmd! GUIEnter * set visualbell t_vb=
    augroup END

    augroup RereadBuffer
        " Triger `autoread` when files changes on disk
        autocmd FocusGained,BufEnter,CursorHold,CursorHoldI *
                \ if mode() !~ '\v(c|r.?|!|t)' && getcmdwintype() == '' | checktime | endif

        " Notification after file change
        autocmd FileChangedShellPost *
        \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None
    augroup END


    " close nvim if nerdtree is the only remaining tab
    augroup NoNerdTreeAlone
        autocmd! BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
    augroup END

    " Return to last edit position when opening files
    augroup LastPosition
        autocmd! BufReadPost *
            \ if line("'\"") > 0 && line("'\"") <= line("$") |
            \     exe "normal! g`\"" |
            \ endif
    augroup END

    " Persistent undo.
    set undodir=$HOME/.nvim/undo/            " where to store undofiles
    set undofile                            " enable undofile
    set undolevels=500                      " max undos stored
    set undoreload=10000                    " buffer stored undos

"" Keybinds

    " Remap <Leader>
    let mapleader=','

    " Alias :W with :w because I keep accidentally typing it
    cnoreabbrev <expr> W getcmdtype() == ":" && getcmdline() == "W" ? "w" : "W"

    " Toggle text wrapping
    nnoremap <silent> <Leader>w :set invwrap<CR>:set wrap?<CR>

    "Call our own tab function
    inoremap <silent> <Tab> <C-R>=HandleTab()<CR>

    " Toggle folding
    " http://vim.wikia.com/wiki/Folding#Mappings_to_toggle_folds
    nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>

    " Treat wrapped lines as normal lines
    nnoremap <expr> j v:count == 0 ? 'gj' : 'j'
    nnoremap <expr> k v:count == 0 ? 'gk' : 'k'

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
    nnoremap <Leader>be :BufExplorerHorizontalSplit<CR>
    nnoremap <Leader>n :bnext<CR>
    nnoremap <Leader>p :bprevious<CR>
    nnoremap <Leader>f :b#<CR>
    nnoremap <Leader>1 :1b<CR>
    nnoremap <Leader>2 :2b<CR>
    nnoremap <Leader>3 :3b<CR>
    nnoremap <Leader>4 :4b<CR>
    nnoremap <Leader>5 :5b<CR>
    nnoremap <Leader>6 :6b<CR>
    nnoremap <Leader>7 :7b<CR>
    nnoremap <Leader>8 :8b<CR>
    nnoremap <Leader>9 :9b<CR>
    nnoremap <Leader>0 :10b<CR>

    " Highlight last inserted text
    nnoremap gV '[V']

    " Visual shifting ( does not exit Visual mode )
    vnoremap < <gv
    vnoremap > >gv

    " Allow using the repeat operator with a visual selection (!)
    " http://stackoverflow.com/a/8064607/127816
    vnoremap . :normal .<CR>

    " Insert a semicolon at the end of the string without moving the cursor
    nnoremap <Leader>; :call Ender()<cr>

    " :Ag
    nnoremap <Leader>a :LAg!

    " Mappings to open multiple lines and enter insert mode. // Function at Functions block
    nnoremap <Leader>o :<C-u>call OpenLines(v:count, 0)<CR>
    nnoremap <Leader>O :<C-u>call OpenLines(v:count, -1)<CR>

    " Toggle Overlength // Function at Functions block
    nnoremap <Leader>h :call ToggleOverLength()<CR>

    " Toggle tagbar (definitions, functions etc.)
    nnoremap <F1> :TagbarToggle<CR>

    " Toggle the NERDTree file browser
    nnoremap <F2> :NERDTreeToggle<CR>

    " Toggle Gundo panel
    nnoremap <f3> :MundoToggle<CR>

    " Toggle syntax highlighting // Function at Functions block
    nnoremap <F4> :call ToggleSyntaxHighLighting()<CR>

    " Toggle light-dark background // Function at Functions block
    nnoremap <F5> :call BackgroundToggle()<CR>

    " Toggle Autopairing tags like (
    let g:AutoPairsShortcutToggle = '<F6>'

    " Toggle RelativeNumbers // Function at Functions block
    nnoremap <Leader>r :call NumberToggle()<CR>

    " Call Deletemultipleemptylines // Function at Functions block
    nnoremap <Leader>ld :call DeleteMultipleEmptyLines()<CR>

"" Plugin Configuration

    " Settings for ctrlp and ag.vim -> Ignores do not seem to always be working
    let g:ctrlp_custom_ignore = {
      \ 'dir':  '\v[\/]\.(git|hg|svn)$',
      \ 'file': '\v\.(pdf|mp3|m4a|mkv|iso|zip|ogg|png|jpg|webm)$',
      \ 'link': '',
      \ }
    let g:ctrlp_working_path_mode = 'ra' " Always start from project root
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
    let g:ag_working_path_mode = 'r' " Always start from project root

    " Clever-f preferences
    let g:clever_f_across_no_line = 1
    let g:clever_f_show_promt = 1

    " Setting indentline to speedmode
    let g:indentLine_faster = 1

    " NERDTree Positioning
    let g:NERDTreeWinPos = 'left'
    let g:NERDTreeHijackNetrw = 1

    " TagBar Positioning
    let g:tagbar_left = 0
    let g:tagbar_width = 30
    set tags=tags;/

    " Gundo Positioning
    let g:mundo_width = 35
    let g:mundo_preview_height = 20
    let g:mundo_right = 0

    " Startify Layout Configuration
    let g:ctrlp_reuse_window = 'startify' " don't split in startify
    let g:startify_bookmarks = [
            \ $HOME . '/.config/nvim/init.vim' ,
            \ $HOME . '/.vimrc_personal',
            \ $HOME . '/.vimrc_plugins',
            \ ]
    let g:startify_custom_header = [
            \ '   Author:      Merel Jossart',
            \ ''
            \ ]
    let g:startify_files_number = 5

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
            \     'mode'         : 'LightlineMode',
            \     'fugitive'     : 'LightlineFugitive',
            \     'readonly'     : 'LightlineReadonly',
            \     'ctrlpmark'    : 'LightlineCtrlPMark',
            \     'bufferline'   : 'LightlineBufferline',
            \     'fileformat'   : 'LightlineFileformat',
            \     'fileencoding' : 'LightlineFileencoding',
            \     'filetype'     : 'LightlineFiletype'
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

        " Ensure that each mode indicator is the same size and casing
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

        function! LightlineMode()
            let fname = expand('%:t')
            return fname ==? '__Tagbar__' ? 'Tagbar' :
                    \ fname ==? 'ControlP' ? 'CtrlP' :
                    \ fname ==? 'NERD_tree' ? 'NerdTree' :
                    \ fname ==? '__Mundo__' ? 'Mundo' :
                    \ fname ==? '__Mundo_Preview__' ? 'Mundo Preview' :
                    \ winwidth(0) > 60 ? lightline#mode() : ''
        endfunction

        function! LightlineFugitive()
            try
                if expand('%:t') !~? 'Tagbar\|Mundo\|NERD' && exists('*fugitive#head')
                    let branch = fugitive#head()
                    return branch !=# '' ? '± '.branch : ''
                endif
            catch
            endtry
            return ''
        endfunction

        function! LightlineReadonly()
            return &ft !~? 'help' && &readonly ? '≠' : ''
        endfunction

        function! LightlineCtrlPMark()
            if expand('%:t') =~ 'ControlP' && has_key(g:lightline, 'ctrlp_item')
                call lightline#link('iR'[g:lightline.ctrlp_regex])
                return lightline#concatenate([g:lightline.ctrlp_prev, g:lightline.ctrlp_item
                    \ , g:lightline.ctrlp_next], 0)
            else
                return ''
            endif
        endfunction

        " https://github.com/itchyny/lightline.vim/issues/36
        function! LightlineBufferline()
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

        function! LightlineFileformat()
            return winwidth(0) > 90 ? &fileformat : ''
        endfunction

        function! LightlineFileencoding()
            return winwidth(0) > 80 ? (&fenc !=# '' ? &fenc : &enc) : ''
        endfunction

        function! LightlineFiletype()
            return winwidth(0) > 70 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
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
                if g:colors_name =~# 'wombat\|solarized8\|landscape\|jellybeans\|Tomorrow'
                    let g:lightline.colorscheme =
                        \ substitute(substitute(g:colors_name, '-', '_', 'g'), '256.*', '', '') .
                        \ (g:colors_name ==# 'solarized8' ? '_' . &background : '')
                    call lightline#init()
                    call lightline#colorscheme()
                    call lightline#update()
                endif
            catch
            endtry
        endfunction
    " }}} Lightline configuration ends here

    " Deoplete configurations
        " Disable AutoComplPop.
        let g:acp_enableAtStartup = 0
        " Stop ultisnips from overriding our <Tab> remap
        let g:UltiSnipsExpandTrigger = "<F12>"

        let g:deoplete#enable_at_startup = 1
        call deoplete#custom#option('camel_case', v:true)
        call deoplete#custom#option('smart_case', v:true)
        call deoplete#custom#option('sources', {
            \ '_': ['tag', 'buffer', 'file', 'LanguageClient', 'syntax', 'omni', 'ultisnips'],
            \ 'php': ['omni', 'phpactor', 'ultisnips', 'buffer']
        \})

    " UltiSnips
        let g:UltiSnipsSnippetsDir='~/.nvim/privatesnips'

    " Syntastic default configuration every1 should use. Language specific stuff in vimrc_personal
        let g:syntastic_always_populate_loc_list = 1
        let g:syntastic_auto_loc_list = 1
        let g:syntastic_check_on_open = 1
        let g:syntastic_check_on_wq = 0

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

    " Our own supertab function
        function! HandleTab() abort
            call UltiSnips#ExpandSnippetOrJump()
            if g:ulti_expand_or_jump_res > 0
                return ""
            endif
            if pumvisible()
                return "\<C-n>"
            endif
            let col = col('.') - 1
            if !col || getline('.')[col - 1] =~ '\s'
                return "\<Tab>"
            endif
            return deoplete#manual_complete()
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
            let &background = ( &background ==? 'dark'?'light' : 'dark')
            if exists('g:colors_name')
                exe 'colorscheme ' . g:colors_name
            endif
            call RepaintOverLength()
        endfunction

    " Toggle syntax highlighting
        function! ToggleSyntaxHighLighting()
            if exists('g:syntax_on')
                syntax off
            else
                syntax enable
            endif
            IndentLinesReset
            call RepaintOverLength()
        endfunction

    " Remove multiple empty lines
        function! DeleteMultipleEmptyLines()
            g/^\_$\n\_^$/d
        endfunction

    " Strip trailing whitespace, return to cursor at save
        function! StripTrailingWhitespace()
            let l = line('.')
            let c = col('.')
            %s/\s\+$//e
            call cursor(l, c)
        endfunction

        augroup StripTrailingWhiteSpace
            autocmd!
            autocmd BufWritePre * :call StripTrailingWhitespace()
        augroup END

    " Insert semicolon at end of line without moving cursor
       function! Ender()
           :execute "normal! mqA;\<esc>`q"
       endfunction

    " Attempt to include external file with personal extra configurations
    if filereadable($HOME.'/.vimrc_personal')
        source $HOME/.vimrc_personal
    endif
