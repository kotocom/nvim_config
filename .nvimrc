"[BRIEF INSTALLATION INFO]

"Before everything: RUN THIS:
"STEP 1
"sudo apt update && sudo apt install python3-pip git cmake python clang-format exuberant-ctags -y
"STEP 2
"git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
"STEP 3
"Reopen the document and run :PluginInstall
"STEP 4
"cd ~/.vim/bundle/YouCompleteMe && python3 install.py --clang-completer

"----------------------------------------------------------------------------------------------------
"[VIM CONFIGURATION]
"{{{

"Set VIM to non-compatible mode (Non compatible with previous VI)
set nocompatible

"To enable file type detection
filetype on

"Switch swapfiles off
set noswapfile

"Set VIM to align the cursor with #number of lines below and above the document.
set scrolloff=10

"Set encoding for multiple purposes.
scriptencoding utf-8
set encoding=utf-8

"Set spell checking toggle to F6
map <F6> :setlocal spell! spelllang=en_us<CR>

"Show line numbers on the left bar
set number
" Combined with number, shows jump distance to perform
set relativenumber

"Folding method for collapsing lines together, press za to unfold all the "{{{ ... }}}" in a document
set foldmethod=marker
nnoremap <space> za

"Set TAB as 4 spaces "To enter the real TAB ASCII, press Ctrl + V + Tab
set softtabstop=4 "Finds and tunes the amount of space to be inserted
set shiftwidth=4 "Defines the amount white-space to insert or remove
set tabstop=4 "Specifies the width of TAB character
set expandtab "Cause spaces to be used in place of tabs " >> NOTE << to use Back TAB in insert mode, press Ctrl + d

"Search highlight is not active by default
"set hlsearch
set incsearch
"Manual highlight toggling
map <Leader>h :set hlsearch!<CR>

"If you want to change Leader key mapping, use " let g:mapleader='KEY_SYMBOL' "
"Leader key is \ as default

"Setting Alt + h/l as fast switch between previous and next buffers
"So use Alt + h or Alt + l to go through opened buffers
noremap <M-h> :bprevious<CR>
noremap <M-l> :bnext<CR>

"System clipboard buffer
"It needs system clipboard provider: apt install xsel for nvim
noremap <Leader>y "+y
noremap <Leader>p "+p

"y and p use shared reg by default
"This copy\paste to all VIMs antities shared reg
set clipboard+=unnamed

"numbered registers
noremap 1Y "1y
noremap 2Y "2y
noremap 3Y "3y
noremap 4Y "4y
noremap 5Y "5y
noremap 6Y "6y
noremap 7Y "7y
noremap 8Y "8y
noremap 9Y "9y
map 1P "1p
map 2P "2p
map 3P "3p
map 4P "4p
map 5P "5p
map 6P "6p
map 7P "7p
map 8P "8p
map 9P "9p


"For you to show which command are you typing at the moment
set showcmd

"For you to show line number, position, etc
set ruler

"For switching cursor to the next line after X characters in the line typed.
set textwidth=120

"For Backspace to work correctly
set backspace=indent,eol,start

"Set VIM search as case insensitive
"/copyright      " Case insensitive
"/Copyright      " Case sensitive
"/copyright\C    " Case sensitive
"/Copyright\c    " Case insensitive
set ignorecase
set smartcase

"Auto-indentation on the next line (style dependent)
set autoindent
set smartindent

"VIM color mode
set t_Co=256

"VIM jumps management.
function! GotoJump()
  jumps
  let j = input("Please select your jump: ")
  if j != ''
    let pattern = '\v\c^\+'
    if j =~ pattern
      let j = substitute(j, pattern, '', 'g')
      execute "normal " . j . "\<c-i>"
    else
      execute "normal " . j . "\<c-o>"
    endif
  endif
endfunction

nmap <Leader>j :call GotoJump()<CR>

"}}}

"----------------------------------------------------------------------------------------------------
"[DO NOT MODIFY]
"Set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

"https://github.com/VundleVim/Vundle.vim
"let Vundle manage Vundle, required "// >> NOTE << You may need to load Vundle manually
"TODO git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
Plugin 'VundleVim/Vundle.vim'

"----------------------------------------------------------------------------------------------------
"[PLUGINS LIST]
"{{{

"[MINIMAL SET]
"{{{

"Well-designed dark Theme for VIM this .vimrc is based on.
Plugin 'cocopon/iceberg.vim'

"Status tabline for vim
"https://github.com/vim-airline/vim-airline
Plugin 'bling/vim-airline'

"}}}

"[SMART EXTENSIONS]
"""{{{
""
"""[Autocompletion plugin]
"""https://github.com/Valloric/YouCompleteMe "cd ~/.vim/bundle/YouCompleteMe$ and then ./install.py --clang-completer
"Config details in PLUGINS CONFIG section
"Plugin 'Valloric/YouCompleteMe'

"""[ycm files generator] it generates propper tags/flags/and autocomplete information for autocomplete and checkers
"""https://github.com/rdnetto/YCM-Generator
"""Config details in PLUGINS CONFIG section
""Plugin 'rdnetto/YCM-Generator'
""
"[Brackets autocomplete], insert, delete pair of brackets
"Extensions whitelist & blacklist in plugins config section
"https://github.com/jiangmiao/auto-pairs
"Config details in PLUGINS CONFIG section
"Plugin 'jiangmiao/auto-pairs'

"""[C/CPP Code-formatter]
"https://github.com/rhysd/vim-clang-format
"Before using, you need satisfy clang-format dependency by: TODO apt-get install clang-format
"Config details in PLUGINS CONFIG section
Plugin 'rhysd/vim-clang-format'

"[git extension plugin]
"https://github.com/tpope/vim-fugitive
"Plugin 'tpope/vim-fugitive'

"[fuzzy search extension plugin]
"https://github.com/junegunn/fzf
Plugin 'junegunn/fzf'

"[CPP Namespaces/Classes map] window tab extension
"Config details in PLUGINS CONFIG section
Plugin 'majutsushi/tagbar'

"[C functions/variables map] window tab extension
"Taglist for VIM: TODO apt get install exuberant-ctags or go to line 294 and see instruction about how manually make
"that for customized Linux
Plugin 'vim-scripts/taglist.vim'

" COC (Conquer Of Completion) for nvim
" Handles all the autocompletion + syntax checkers
" CocInstall coc-dictionary coc-pairs coc-lists coc-word coc-python coc-clangd coc-fzf-preview coc-highlight coc-rust-analyzer coc-sh coc-yaml
" Extentions list https://github.com/neoclide/coc.nvim/wiki/Using-coc-extensions
Plugin 'neoclide/coc.nvim', {'branch': 'release'}
"}}}

"[FANCY ADDONS]
"""{{{
""
"""[Nerd-commenter plugin]
"""https://github.com/scrooloose/nerdcommenter
"""Plugin 'scrooloose/nerdcommenter'
""
"""Vim-table-mode for drawing tablr within VIM's control.
"""Plugin 'dhruvasagar/vim-table-mode'
""":set TableModeEnable
""":set TableModeDisable

"Vim-boxdraw for drawing graph within the VIM's control.
"https://github.com/gyim/vim-boxdraw/blob/master/doc/boxdraw.txt // Tutorial
Plugin 'gyim/vim-boxdraw'

"set virtualedit+=all
"+o
"+O

"""[vim-tmux-navigator]
"""Plugin for navigation through the tmux tabs
"""Plugin 'christoomey/vim-tmux-navigator'
""
"""[side files tree]
"""https://github.com/scrooloose/nerdtree
"""Plugin 'scrooloose/nerdtree'
""
"""}}}

"}}}

"""All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

"----------------------------------------------------------------------------------------------------
"[ACTIVE VISUAL PLUGINS CONFIGURATION]
"{{{

"[COLORSCHEME]
"{{{

"set the colorscheme to Dark and comfortable.
colorscheme iceberg

"}}}

"[SYMBOL RULES]
"{{{

"Extra-symbols and White-spaces hight-lighter.
set list
set listchars=tab:>.,extends:>,precedes:<

highlight ExtraWhitespace ctermbg=darkred guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

"}}}

"[EXTRA HIGHLIGHTING]
"{{{

"[C/CPP syntax highlighter Plugin]
"Setting the color-scheme syntax highlight for C/C++
"let g:cpp_concepts_highlight = 1
"let c_no_curly_error = 1

"Highlight brackets
set showmatch

"Rule for preferable maximum code length that highlights lines in a document with the only specific filetypes
autocmd BufRead *.c,*.h,*.cpp,*.hpp,*.sh highlight OverLength ctermfg=darkred guibg=#592929
autocmd BufRead *.c,*.h,*.cpp,*.hpp,*.sh 2match OverLength /\%120v.\+/

"}}}

"}}}

"----------------------------------------------------------------------------------------------------
"""[PLUGINS CONFIG SECTION]
"""{{{

"[GENERIC_CONFIG]
"{{{
"Install universal_ctags if on archlinux https://aur.archlinux.org/packages/universal-ctags-git/
"makepkg PKGBUILD
let g:tagbar_ctags_bin="/usr/bin/ctags"

"}}}

"[fzf]
"{{{

" Hotkey to open FZF searchbar
nmap <C-P> :FZF<CR>

" Default fzf layout
" - Popup window
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }

" - down / up / left / right
let g:fzf_layout = { 'down': '40%' }

" Customize fzf colors to match your color scheme
" - fzf#wrap translates this to a set of `--color` options
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" Enable per-command history
" - History files will be stored in the specified directory
" - When set, CTRL-N and CTRL-P will be bound to 'next-history' and
"   'previous-history' instead of 'down' and 'up'.
let g:fzf_history_dir = '~/.local/share/fzf-history'
"}}}

"[Coc.nvim]
"{{{

" If folder/project is Cmake based, one can use the instruction to generate paths to files for coc-cland
" cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=1 .

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> <Leader>b <Plug>(coc-diagnostic-prev)
nmap <silent> <Leader>n <Plug>(coc-diagnostic-next)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>"
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

nmap <silent> <Leader>m :!push<CR> 
nmap <silent> <Leader>M :!push && valgrind --leak-check=full --show-leak-kinds=all --track-origins=yes -q ./src/testpp<CR>

" GoTo code navigation. // To return to previous location, use Ctrl+^
" or use Crtl+O/Ctrl+I to jump back and forth.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gt <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" https://github.com/neoclide/coc-lists
" Keymapping for grep region with interactive mode
vnoremap gv :<C-u>call <SID>GrepFromSelected(visualmode())<CR>
nnoremap gv :<C-u>set operatorfunc=<SID>GrepFromSelected<CR>g@

" install ripgrep
function! s:GrepFromSelected(type)
  let saved_unnamed_register = @@
  if a:type ==# 'v'
    normal! `<v`>y
  elseif a:type ==# 'char'
    normal! `[v`]y
  else
    return
  endif
  let word = substitute(@@, '\n$', '', 'g')
  let word = escape(word, '| ')
  let @@ = saved_unnamed_register
  execute 'CocList grep '.word
endfunction

" Keymapping for grep word under cursor with interactive mode
nnoremap <silent> gw :exe 'CocList -I --input='.expand('<cword>').' grep'<CR>

" coc-pairs
autocmd FileType markdown let b:coc_pairs_disabled = ['txt']

"}}}

"[vim-boxdraw] "drawing box graphix within vim"
"{{{

nmap <silent> <Leader>ve :set virtualedit+=all<CR> 

"all"
"onemore" // Default
"
"}}}

"[clang-format] "code style checker"
"{{{

"let g:clang_format#code_style = 'llvm'
""If you want clang formatter to mess with you, uncomment this line.
""let g:clang_format#auto_format_on_insert_leave = 1
"
""The FAQ about clang-format style settings: https://clang.llvm.org/docs/ClangFormatStyleOptions.html
"
""To generate rules set and tweak them, use $ clang-format -style=llvm -dump-config > clang-format.txt
"
""let g:clang_format#style_options = {}
"let g:clang_format#style_options = {
"            \"ColumnLimit" : 80}
""            \"Standard" : "c++14",
""            \"AccessModifierOffset" : -4,
""            \"AllowShortIfStatementsOnASingleLine" : "true",
""            \"AlwaysBreakTemplateDeclarations" : "true"}
"
""Run the formatting:
""Leader key + f to format a code
"autocmd FileType c,cpp,objc nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
"autocmd FileType c,cpp,objc vnoremap <buffer><Leader>cf :ClangFormat<CR>
"
""Toggle auto formatting:
""Leader key + a + f to autoformat on\off
"nmap <Leader>af :ClangFormatAutoToggle<CR>

"}}}

"[Airline]
"{{{

let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#formatter = 'default'
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#show_tabs = 0

"Enable the list of buffers with number we can navigate to with n + Ctrl + 6
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1

"Show just the filename
"let g:airline#extensions#tabline#fnamemod = ':t'

"}}}

"[Tagbar]
"{{{

"To open CPP TagBar window
nmap <Leader>tb :TagbarToggle<CR>

"to wrap and unwrap lines in the Tagbar window use: - and + sign

"}}}

"[Taglist]
"{{{

"To open C/CPP TagList window
map <Leader>tl :TlistToggle <CR>

"}}}

"[YouCompleteMe and YCM options config]
"{{{

"[YouCompleteMe KEY-COMBINATION]
"TAB key to go through pop-up list of autocomplete options
"Ctrl + y to apply autocomplete as work-around if needed

"This file should be generated using YCM-Generator script: ~/.vim/bundle/YCM-Generator/config_gen.py PATH_TO_CMAKE
"P.S. Although it has some limit/issues in tearms of ycmd is trying to parse system files
"so the issue can be solved in this way: https://github.com/syl20bnr/spacemacs/issues/10943
"https://stackoverflow.com/questions/27219433/youcompleteme-and-c-diagnostics-inappropriate-errors

"Path to .ycm file generated by YCM-Generator/config_gen.py
""let g:ycm_global_ycm_extra_conf = '~/path_to_the_cmakelists_project_folder/.ycm_extra_conf.py'
""
""let g:ycm_enable_diagnostic_signs = 1
""let g:ycm_enable_diagnostic_highlighting = 0
""let g:ycm_always_populate_location_list = 1
""let g:ycm_open_loclist_on_ycm_diags = 1
""let g:ycm_seed_identifiers_with_syntax = 1
""let g:ycm_complete_in_strings = 1
""let g:ycm_collect_identifiers_from_tags_files = 1
""let g:ycm_path_to_python_interpreter = ''
""let g:ycm_server_use_vim_stdout = 0
""let g:ycm_server_log_level = 'info'
""let g:ycm_confirm_extra_conf = 1
""let g:ycm_goto_buffer_command = 'same-buffer' "[ 'same-buffer', 'horizontal-split', 'vertical-split', 'new-tab' ]
""let g:ycm_filetype_whitelist = { '*': 1 }
""let g:ycm_key_invoke_completion = '<C-Space>'
""
""nnoremap <F9> :YcmForceCompileAndDiagnostics <CR>
""
"""Filetypes autocomplete functionality enabler lists
""let g:ycm_filetype_whitelist = {
""        \'sh': 1,
""        \'bash': 1,
""        \'c++': 1,
""        \'cpp': 1,
""        \'c': 1,
""        \'hpp': 1,
""        \'h': 1,
""        \'hh': 1,
""        \'vim': 1,
""        \'notes': 1,
""        \'text': 1}
""
""let g:ycm_filetype_blacklist = {
""        \ 'tagbar' : 1,
""        \ 'qf' : 1,
""        \ 'markdown' : 1,
""        \ 'unite' : 1,
""        \ 'vimwiki' : 1,
""        \ 'pandoc' : 1,
""        \ 'infolog' : 1,
""        \ 'mail' : 1
""        \}
"""}}}
""
"""[nerd-commenter]
"""{{{
""
"""Add spaces after comment delimiters by default
"""let g:NERDSpaceDelims = 1
""
"""Use compact syntax for prettified multi-line comments
"""let g:NERDCompactSexyComs = 1
""
"""Align line-wise comment delimiters flush left instead of following code indentation
"""let g:NERDDefaultAlign = 'left'
""
"""Set a language to use its alternate delimiters by default
"""let g:NERDAltDelims_java = 1
""
"""Add your own custom formats or override the defaults
"""let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/'  }  }
""
"""Allow commenting and inverting empty lines (useful when commenting a region)
"""let g:NERDCommentEmptyLines = 1
""
"""Enable trimming of trailing whitespace when uncommenting
"""let g:NERDTrimTrailingWhitespace = 1
""
"""Enable NERDCommenterToggle to check all selected lines is commented or not
"""let g:NERDToggleCheckAllLines = 1"
""
"""[count]<leader>cc |NERDComComment| "Comment out the current line or text selected in visual mode.
"""[count]<leader>cn |NERDComNestedComment| "Same as cc but forces nesting.
"""[count]<leader>c<space> |NERDComToggleComment| "Toggles the comment state of the selected line(s). If the topmost selected line is commented, all selected lines are uncommented and vice versa.
"""[count]<leader>cm |NERDComMinimalComment| "Comments the given lines using only one set of multipart delimiters.
"""[count]<leader>ci |NERDComInvertComment| "Toggles the comment state of the selected line(s) individually.
"""[count]<leader>cs |NERDComSexyComment| "Comments out the selected lines with a pretty block formatted layout.
"""[count]<leader>cy |NERDComYankComment| "Same as cc except that the commented line(s) are yanked first.
"""<leader>c$ |NERDComEOLComment| "Comments the current line from the cursor to the end of line.
"""<leader>cA |NERDComAppendComment| "Adds comment delimiters to the end of line and goes into insert mode between them.
"""[count]<leader>cu |NERDComUncommentLine| "Uncomments the selected line(s).
""
"""}}}
""
"""[nerd tree]
"""{{{
""
"""Open nerd-tree side window
"""map <C-n> :NERDTreeToggle<CR>
""
"""}}}
""
"""}}}
""
