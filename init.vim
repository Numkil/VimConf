"------------------------------------------------------------------"
" Author:       Merel Jossart                                      "
" Source:       https://github.com/Numkil/VimConf                  "
" Requirements: Neovim, Hack Nerd Font, Git, Rg                                             "
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

    " UI modernization, floating windows, statusline, popups, treesitter for
    " syntax highlights
    call dein#add('rcarriga/nvim-notify')
    call dein#add('nvim-treesitter/nvim-treesitter')
    call dein#add('MunifTanjim/nui.nvim')
    call dein#add('folke/noice.nvim')
    call dein#add('nvim-lualine/lualine.nvim')

    " Light and dark colourscheme for vim
    call dein#add('catppuccin/nvim')

    " Devicons
    call dein#add('ryanoasis/vim-devicons')

    " LSP Implementation
    call dein#add('neovim/nvim-lspconfig')
    call dein#add('ErichDonGubler/lsp_lines.nvim')
    call dein#add("williamboman/mason.nvim")
    call dein#add("williamboman/mason-lspconfig.nvim")

    " Code completion engine
    call dein#add('hrsh7th/cmp-nvim-lsp')
    call dein#add('hrsh7th/cmp-buffer')
    call dein#add('hrsh7th/cmp-path')
    call dein#add('hrsh7th/cmp-cmdline')
    call dein#add('hrsh7th/nvim-cmp')
    call dein#add('onsails/lspkind.nvim')

    " Ai pair programming
    call dein#add('zbirenbaum/copilot.lua')

    " Snippet Engine + Presets
    call dein#add('hrsh7th/cmp-vsnip')
    call dein#add('hrsh7th/vim-vsnip')
    call dein#add('rafamadriz/friendly-snippets')

    " Telescope all in one fuzzy finder + file browser + ripgrep searcher +
    " lsp navigator
    call dein#add('nvim-lua/plenary.nvim')
    call dein#add('ahmedkhalf/project.nvim')
    call dein#add('nvim-telescope/telescope.nvim', { 'rev': '0.1.x' })
    call dein#add('nvim-neo-tree/neo-tree.nvim')

    " Git integration
    call dein#add('tpope/vim-fugitive')
    call dein#add('lewis6991/gitsigns.nvim')

    " Advanced Undo solution
    call dein#add('simnalamburt/vim-mundo')

    " Super easy commenting, toggle comments etc
    call dein#add('scrooloose/nerdcommenter')

    " UNIX shell command helpers, e.g. sudo, chmod, remove etc.
    call dein#add('tpope/vim-eunuch')

    " Multiple cursors to enable faster refactoring
    call dein#add('terryma/vim-multiple-cursors')

    " Indentation guides using treesitter
    call dein#add('lukas-reineke/indent-blankline.nvim')

    " Closes ( or ' etc.
    call dein#add('windwp/nvim-autopairs')

    " Easily manipulate surrounding characters
    call dein#add('tpope/vim-surround')

    " Navigation plugin
    call dein#add('phaazon/hop.nvim')

    " A fancy start screen, shows MRU etc.
    call dein#add('mhinz/vim-startify')

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
    set number                              " Show line numbers
    set signcolumn=number                   " Merge status and number line
    set showmatch                           " Highlight matching brace
    set smartindent                         " Enable smart-indent
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
    set iskeyword+=_,$,@,%,#                " not word dividers
    set laststatus=2                        " always show statusline
    set linebreak                           " don't cut words on wrap
    set listchars=tab:>\                    " > to highlight <Tab>
    set list                                " displaying listchars
    set mouse=                              " disable mouse
    set nolist                              " wraps to whole words
    set noshowmode                          " hide mode cmd line
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

"" Advanced Built-in Settings

    set ruler	                                       " Show row and column ruler information

    " Colorscheme
    set termguicolors
    set background=light
    colorscheme catppuccin

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

    " Disable <F1> cause i keep accidentally hitting it
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
    nnoremap <c-p> :Telescope find_files theme=ivy<CR>
    nnoremap <Leader>a :Telescope live_grep theme=ivy<CR>
    nnoremap <Leader>\ :Telescope lsp_definitions theme=ivy<CR>
    nnoremap <Leader>/ :Telescope lsp_references theme=ivy<CR>
    nnoremap <F4> :Telescope treesitter theme=ivy<CR>

    " file browser and buffer browser
    nnoremap <F2> :Neotree toggle reveal_force_cwd<CR>
    nnoremap <Leader>be :Neotree toggle show buffers bottom<cr>

    "vsnip mappings
    imap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'
    smap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'


    " Toggle Gundo panel
    nnoremap <f3> :MundoToggle<CR>

    " Toggle light-dark background // Function at Functions block
    nnoremap <F5> :call BackgroundToggle()<CR>

    " Toggle RelativeNumbers // Function at Functions block
    nnoremap <Leader>r :call NumberToggle()<CR>

    " Call Deletemultipleemptylines // Function at Functions block
    nnoremap <Leader>ld :call DeleteMultipleEmptyLines()<CR>

"" Plugin Configuration

    " Clever-f preferences
    let g:clever_f_across_no_line = 1
    let g:clever_f_show_promt = 1

    " Vsnip extend filetypes
    let g:vsnip_filetypes = {}
    let g:vsnip_filetypes.twig = ['twig', 'html']

:lua << EOF
    vim.opt.list = true

    local hop = require('hop')
    local directions = require('hop.hint').HintDirection
    vim.keymap.set('', 'f', function()
    hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true })
    end, {remap=true})
    vim.keymap.set('', 'F', function()
    hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true })
    end, {remap=true})
    vim.keymap.set('', 't', function()
    hop.hint_words({ direction = directions.AFTER_CURSOR})
    end, {remap=true})
    vim.keymap.set('', 'T', function()
    hop.hint_words({ direction = directions.BEFORE_CURSOR})
    end, {remap=true})
    hop.setup()

    require("indent_blankline").setup {
        space_char_blankline = " ",
        use_treesitter = true,
        show_current_context = true,
        show_current_context_start = true,
    }
    require('nvim-autopairs').setup({
        check_ts = true,
    })
    require('lualine').setup({
      options = {
          theme = "catppuccin"
      },
      extensions = {'fugitive', 'mundo', 'neo-tree'}
    })
    require("neo-tree").setup({
        close_if_last_window = false, -- Close Neo-tree if it is the last window left in the tab
        filesystem = {
          filtered_items = {
            visible = true,
            never_show = { -- remains hidden even if visible is toggled to true, this overrides always_show
              ".idea",
              "node_modules/",
              ".git/",
            },
          },
        },
    })
    require('telescope').setup({
      defaults = {
        prompt_prefix = "  ",
        selection_caret = "❯ ",
        borderchars = { "█", " ", "▀", "█", "█", " ", " ", "▀" },
        sorting_strategy = "ascending",
        file_ignore_patterns = {
            '.git/',
            'node_modules/',
            '.idea/',
        },
        dynamic_preview_title = true,
        vimgrep_arguments = {
        'rg',
        '--ignore',
        '--hidden',
        '--color=never',
        '--no-heading',
        '--with-filename',
        '--line-number',
        '--column',
        '--smart-case',
        '--trim',
        },
        layout_config = {
          horizontal = {
            prompt_position = "top",
            preview_width = 0.55,
            results_width = 0.8,
          },
          vertical = {
            mirror = false,
          },
          width = 0.87,
          height = 0.80,
          preview_cutoff = 120,
        },
      },
    })
    require('project_nvim').setup()
    require('telescope').load_extension('projects')
    require("catppuccin").setup({
      integrations = {
        mason = true,
        noice = true,
        notify = true,
        hop = true,
      }
})
EOF

    let g:loaded_netrw=1
    let g:loaded_netrwPlugin=1
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
        documentation = {
            opts = {
                border = { style = "rounded" },
                position = {
                    row = 2,
                },
                win_options = {
                    winhighlight = {
                        NormalFloat = "Normal",
                    },
                },
            },
        },
      },
      presets = {
        command_palette = true,
        long_message_to_split = true,
        inc_rename = false,
        lsp_doc_border = true,
      },
      views = {
        cmdline_popup = {
            position = {
                row = 8,
                col = "50%",
            },
            size = {
                width = math.floor(vim.o.columns * 0.4),
                height = "auto",
            },
        },
        popupmenu = {
            relative = "editor",
            position = {
                row = 11,
                col = "50%",
            },
            size = {
                width = math.floor(vim.o.columns * 0.4),
                height = "auto",
            },
            border = {
                style = "rounded",
            },
        },
      },
    })
    require'nvim-treesitter.configs'.setup({
      ensure_installed = { "lua", "vim", "vimdoc", "query", "bash", "php", "regex", "markdown", "markdown_inline", "twig", "html" },
      sync_install = false,
      auto_install = true,
      highlight = {
        enable = true,
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
      autotag = {
        enable = true,
        filetypes = { "html", "xml", "twig" },
      },
    })
    require('gitsigns').setup()
EOF

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
    local capabilities = require('cmp_nvim_lsp').default_capabilities()

    require 'lspconfig'.intelephense.setup {
        capabilities = capabilities,
        on_attach = on_attach,
        settings = {
            intelephense = {
                stubs = {
                    'Core',
                    'SPL',
                    'imagick',
                    'curl',
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
    require 'lspconfig'.tailwindcss.setup {}
    require 'lspconfig'.tsserver.setup {}

    require("lsp_lines").setup {
    }
    require("mason").setup {
    }
    require("mason-lspconfig").setup {
        ensure_installed = { "intelephense", "tailwindcss", "tsserver" },
    }
EOF

" nvim-cmp configuration

lua <<EOF
  local lspkind = require 'lspkind'
  local cmp = require 'cmp'

  local has_words_before = function()
    unpack = unpack or table.unpack
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
  end

  local feedkey = function(key, mode)
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
  end

  cmp.setup({
    snippet = {
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body)
      end,
    },
    window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
    },
    formatting = {
        format = lspkind.cmp_format({
            mode = "symbol",
            max_width = 50,
            symbol_map = { Copilot = "" }
        })
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }),
      ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.confirm({ behavior = cmp.ConfirmBehavior.Insert, select = true })
          elseif require("copilot.suggestion").is_visible() then
            require("copilot.suggestion").accept()
          elseif vim.fn["vsnip#available"](1) == 1 then
            feedkey("<Plug>(vsnip-expand-or-jump)", "")
          elseif has_words_before() then
            cmp.complete()
          else
            fallback()
          end
    end, { "i", "s" }),
    ["<S-Tab>"] = cmp.mapping(function()
          if cmp.visible() then
            cmp.select_prev_item()
          elseif vim.fn["vsnip#available"](-1) == 1 then
            feedkey("<Plug>(vsnip-jump-prev)", "")
          else
            fallback()
          end
    end, { "i", "s" }),
    }),
    sources = cmp.config.sources(
        {
            { name = 'vsnip' },
            { name = 'nvim_lsp' },
        },
        {
            { name = 'path' },
        },
        {
            { name = 'buffer' },
        }
    )
  })

  cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' },
      { name = 'cmdline' }
    })
  })

  local cmp_autopairs = require('nvim-autopairs.completion.cmp')
  local cmp = require('cmp')
  cmp.event:on(
    'confirm_done',
    cmp_autopairs.on_confirm_done()
  )

  require("copilot").setup({
    panel = {
        enabled = true,
        auto_refresh = true,
    },
    suggestion = {
        enabled = true,
        auto_trigger = true,
        accept = false,
    },
  })

    local cmp_status_ok, cmp = pcall(require, "cmp")
      if cmp_status_ok then
        cmp.event:on("menu_opened", function()
          vim.b.copilot_suggestion_hidden = true
        end)

        cmp.event:on("menu_closed", function()
          vim.b.copilot_suggestion_hidden = false
        end)
      end
EOF

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
