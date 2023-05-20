"------------------------------------------------------------------"
" Author:       Merel Jossart                                      "
" Source:       https://github.com/Numkil/VimConf                  "
" Requirements: Neovim                                             "
"------------------------------------------------------------------"

   call system('mkdir -p $HOME/.nvim/undo')
"" Dein plugin manager
    "Automatically setting up Dein, taken from
    "http://www.erikzaadi.com/2012/03/19/auto-installing-vundle-from-your-vimrc/
        let has_dein =1
        if !isdirectory($HOME.'/.nvim/bundle/repos/github.com/Shougo/dein.vim')
            echo 'Installing Dein ...'
            echo ''
            silent !mkdir -p $HOME/.nvim/bundle
            silent !curl https://raw.githubusercontent.com/Shougo/dein.vim/3.0/bin/installer.sh > installer.sh
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
    call dein#add('nvim-tree/nvim-tree.lua')

    " A fuzzy file finder + ripgrep content search + buffexplorer
    call dein#add('nvim-lua/plenary.nvim')
    call dein#add('nvim-telescope/telescope.nvim', { 'rev': '0.1.x' })

    " UI modernization, floating windows, statusline, popups, treesitter for
    " syntax highlights
    " REQUIREMENTS: Hack Nerd Font
    call dein#add('rcarriga/nvim-notify')
    call dein#add('nvim-treesitter/nvim-treesitter')
    call dein#add('MunifTanjim/nui.nvim')
    call dein#add('folke/noice.nvim')
    call dein#add('nvim-lualine/lualine.nvim')

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

    " Light and dark colourscheme for vim
    call dein#add('lifepillar/vim-solarized8')

    " LSP Implementation
    call dein#add('vim-denops/denops.vim')
    call dein#add('neovim/nvim-lspconfig')
    call dein#add('ErichDonGubler/lsp_lines.nvim')
    call dein#add("williamboman/mason.nvim")
    call dein#add("williamboman/mason-lspconfig.nvim")

    " Code completion engine
    call dein#add('Shougo/ddc.vim')
    call dein#add('matsui54/denops-popup-preview.vim')
    call dein#add('tani/ddc-fuzzy')
    call dein#add('Shougo/ddc-nvim-lsp')
    call dein#add('Shougo/ddc-around')
    call dein#add('Shougo/ddc-source-nvim-lsp')
    call dein#add('matsui54/ddc-buffer')
    call dein#add('Shougo/ddc-ui-native')

    " Snippet Engine + Presets
    call dein#add('hrsh7th/vim-vsnip-integ')
    call dein#add('hrsh7th/vim-vsnip')
    call dein#add('rafamadriz/friendly-snippets')

    " A fancy start screen, shows MRU etc.
    call dein#add('mhinz/vim-startify')

    " Devicons
    call dein#add('ryanoasis/vim-devicons')

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
        set textwidth=0                     " Line wrap (number of cols)
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
            autocmd BufNewFile,BufRead *.t set ft=perl tw=79          " opens .t w/highlight
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
    set background=light
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

    " close nvim if file tree is the only remaining tab
    augroup NoFileTreeAlone()
        autocmd! BufEnter *
            \ if tabpagenr('$') == 1 && winnr('$') == 1 && @% == 'NvimTree_1' |
            \      :qa |
            \ endif
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
    nnoremap <Leader>n :bnext<CR>
    nnoremap <Leader>N :bprevious<CR>
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

    " Mappings to open multiple lines and enter insert mode. // Function at Functions block
    nnoremap <Leader>o :<C-u>call OpenLines(v:count, 0)<CR>
    nnoremap <Leader>O :<C-u>call OpenLines(v:count, -1)<CR>

    " Telescope mappings
    nnoremap <c-p> :Gcd<CR> :Telescope find_files find_command=rg,--ignore,--hidden,--files theme=ivy<CR>
    nnoremap <Leader>a :Gcd<CR> :Telescope live_grep find_command=rg,--ignore,--hidden,--files theme=ivy<CR>
    nnoremap <Leader>be :lua require'telescope.builtin'.buffers(require('telescope.themes').get_ivy({}))<cr>
    autocmd FileType TelescopePrompt call deoplete#custom#buffer_option('auto_complete', v:false)

    " Toggle tagbar (definitions, functions etc.)
    nnoremap <F1> :TagbarOpenAutoClose<CR>

    " Toggle the file tree browser
    nnoremap <F2> :Gcd<CR> :NvimTreeToggle<CR>

    " Toggle Gundo panel
    nnoremap <f3> :MundoToggle<CR>

    " Toggle light-dark background // Function at Functions block
    nnoremap <F4> :call BackgroundToggle()<CR>

    " Toggle Autopairing tags like (
    let g:AutoPairsShortcutToggle = '<F5>'

    " Toggle RelativeNumbers // Function at Functions block
    nnoremap <Leader>r :call NumberToggle()<CR>

    " Call Deletemultipleemptylines // Function at Functions block
    nnoremap <Leader>ld :call DeleteMultipleEmptyLines()<CR>

"" Plugin Configuration

    " Clever-f preferences
    let g:clever_f_across_no_line = 1
    let g:clever_f_show_promt = 1

    " Setting indentline to speedmode
    let g:indentLine_faster = 1

    " statusline
:lua << EOF
    require('lualine').setup({
      options = {
        theme = "solarized"
      },
      extensions = {'fugitive', 'mundo', 'nvim-tree'}
    })
EOF

    " File tree configuration
    let g:loaded_netrw=1
    let g:loaded_netrwPlugin=1
:lua << EOF
    require("nvim-tree").setup({
      respect_buf_cwd = true,
      update_focused_file = {
        enable = true,
      },
      view = {
        width = 45,
      },
      git = {
        ignore = true,
      },
      renderer = {
        highlight_git = true,
      },
      sort_by = "case_sensitive",
      filters = {
        dotfiles = false,
        custom = { "^.git$" }
      },
    })
EOF
    " UI updates configuration
:lua << EOF
    require("noice").setup({
      lsp = {
        hover = {
          enabled = true,
        },
        signature = {
          enabled = true,
        },
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
          },
      },
      presets = {
        command_palette = true,
        long_message_to_split = true,
        inc_rename = false,
        lsp_doc_border = true,
      },
      views = {
        hover = {
          position = {
            row = "10%",
            col = "50%",
          },
        },
        popupmenu = {
          position = {
            row = "50%",
            col = "50%",
          },
        },
        notify = {
          merge = true,
        },
        cmdline_popup = {
          position = {
            row = "50%",
            col = "50%",
          },
          size = {
            min_width = 80,
          },
        },
      },
    })
EOF

    " tree sitter configuration
:lua << EOF
    require'nvim-treesitter.configs'.setup({
      ensure_installed = { "lua", "vim", "vimdoc", "query", "bash", "php", "regex", "markdown", "markdown_inline", "twig" },
      sync_install = false,
      auto_install = true,
      highlight = {
        enable = true,
        disable = {"twig"},
        disable = function(lang, buf)
          local max_filesize = 100 * 1024 -- 100 KB
          local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
          if ok and stats and stats.size > max_filesize then
            return true
          end
        end,
        additional_vim_regex_highlighting = false,
      },
      indent = {
        enable = true
      },
    })
EOF

    " TagBar Positioning
    let g:tagbar_left = 1
    let g:tagbar_width = 35
    set tags=tags;/

    " Gundo Positioning
    let g:mundo_width = 35
    let g:mundo_preview_height = 20
    let g:mundo_right = 0

    " Startify Layout Configuration
    let g:startify_bookmarks = [
            \ $HOME . '/.config/nvim/init.vim' ,
            \ $HOME . '/.vimrc_personal',
            \ $HOME . '/.vimrc_plugins',
            \ $HOME . '/.bash_profile',
            \ ]
    let g:startify_custom_header = [
            \ '   Author:      Merel Jossart',
            \ ''
            \ ]
    let g:startify_files_number = 5


    " lsp / mason configuration
:lua << EOF
    require 'lspconfig'.intelephense.setup {
        capabilities = capabilities,
        on_attach = on_attach,
        settings = {
            intelephense = {
                stubs = {
                    'Core',
                    'SPL',
                    'imagick',
                    'standard',
                    'pcre',
                    'date',
                    'json',
                    'ctype',
                    'SimpleXML',
                    'Reflection',
                }
            }
        }
    }

    require("lsp_lines").setup {
    }
    require("mason").setup {
    }
    require("mason-lspconfig").setup {
        ensure_installed = { "intelephense" },
    }
EOF

    " Ddc configurations
        call ddc#custom#patch_global('ui', 'native')
        call ddc#custom#patch_global({
        \ 'sources': ['nvim-lsp', 'vsnip', 'around', 'buffer'],
        \ 'sourceOptions': {
            \ '_': {
            \ 'matchers': ['matcher_fuzzy'],
            \ 'sorters': ['sorter_fuzzy'],
            \ 'converters': ['converter_fuzzy'],
            \ },
            \ 'nvim-lsp': {
            \ 'mark': 'LSP',
            \ 'forceCompletionPattern': '\.\w*|:\w*|->\w*',
            \ },
            \ 'vsnip': {
            \ 'mark': 'SNIPPET',
            \ },
            \ 'around': {
            \ 'mark': 'AROUND',
            \ },
            \ 'buffer': {
            \ 'mark': 'BUFFER',
            \ },
        \ },
        \ })

        " Markdown FileType completion sources
        call ddc#custom#patch_filetype('markdown', { 'sources': ['around', 'buffer'] })

        inoremap <expr> <C-y> pumvisible() ? (vsnip#expandable() ? "\<Plug>(vsnip-expand)" : "\<C-y>") : "\<C-y>"
        inoremap <silent><expr> <TAB>
          \ pumvisible() ? '<C-n>' :
          \ (col('.') <= 1 <Bar><Bar> getline('.')[col('.') - 2] =~# '\s') ?
          \ '<TAB>' : ddc#map#manual_complete()

        " <S-TAB>: completion back.
        inoremap <expr><S-TAB>  pumvisible() ? '<C-p>' : '<C-h>'

        " Use ddc.
        call popup_preview#enable()
        call ddc#enable()

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
            let &background = ( &background ==? 'dark' ? 'light' : 'dark')
:lua << EOF
            require('lualine').refresh()
EOF
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
