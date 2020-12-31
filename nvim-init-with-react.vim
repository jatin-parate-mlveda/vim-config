syntax on
filetype plugin indent on
set hidden
set nobackup
set nowritebackup
set smarttab
set nu relativenumber
set number
set cindent
set tabstop=2
set shiftwidth=2
set expandtab
set textwidth=100
set ruler
set colorcolumn=100
set noshowmode
set noswapfile
autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync clear
set conceallevel=2
set cursorline

" Specify a directory for plugins
call plug#begin('~/.config/nvim/plugged')

Plug 'ianks/vim-tsx'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-surround'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'rking/ag.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-commentary'
Plug 'mhinz/vim-startify'
Plug 'alvan/vim-closetag'
Plug 'rhysd/git-messenger.vim'
Plug 'mbbill/undotree'
Plug 'AndrewRadev/tagalong.vim'

Plug 'HerringtonDarkholme/yats.vim' " TS Syntax
Plug 'christoomey/vim-tmux-navigator'
Plug 'morhetz/gruvbox'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'godlygeek/tabular'
Plug 'heavenshell/vim-jsdoc', { 'do': 'make install', 'for': ['javascript', 'javascript.jsx','typescript'] }
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'luochen1990/rainbow'

Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'jparise/vim-graphql'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'mattn/emmet-vim'
Plug 'terryma/vim-multiple-cursors'
call plug#end()

let g:user_emmet_settings = {
  \ 'indentation': '',
  \}

let g:user_emmet_expandabbr_key = '<c-e>'
let g:user_emmet_complete_tag = 1

let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1

augroup javascript_folding
  au!
  au FileType javascript setlocal foldmethod=syntax
augroup END

let g:javascript_conceal_function             = "ƒ"
let g:javascript_conceal_null                 = "ø"
let g:javascript_conceal_this                 = "@"
let g:javascript_conceal_return               = "⇚"
let g:javascript_conceal_undefined            = "¿"
let g:javascript_conceal_NaN                  = "ℕ"
let g:javascript_conceal_prototype            = "¶"
let g:javascript_conceal_static               = "•"
let g:javascript_conceal_super                = "Ω"
let g:javascript_conceal_arrow_function       = "⇒"
let g:javascript_conceal_noarg_arrow_function = "🞅"
let g:javascript_conceal_underscore_arrow_function = "🞅"

" filenames like *.xml, *.html, *.xhtml, ...
" These are the file extensions where this plugin is enabled.
"
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.js,*.jsx,*.ts,*.tsx'

" filetypes like xml, html, xhtml, ...
" These are the file types where this plugin is enabled.
"
let g:closetag_filetypes = 'html,xhtml,phtml,js,jsx,ts,tsx'

" dict
" Disables auto-close if not in a "valid" region (based on filetype)
"
let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ }

let g:closetag_close_shortcut = '<leader>>'

let g:rainbow_active = 1 "set to 0 if you want to enable it later via :RainbowToggle

let g:indent_guides_enable_on_vim_startup = 1

autocmd CursorHoldI,CursorMovedI * silent! call CocActionAsync('showSignatureHelp')


nmap ++ <plug>NERDCommenterToggle
vmap  ++ <plug>NERDCommenterToggle
let g:NERDTreeGitStatusWithFlags = 1
"let g:WebDevIconsUnicodeDecorateFolderNodes = 1
"let g:NERDTreeGitStatusNodeColorization = 1
"let g:NERDTreeColorMapCustom = {
    "\ "Staged"    : "#0ee375",
    "\ "Modified"  : "#d9bf91",
    "\ "Renamed"   : "#51C9FC",
    "\ "Untracked" : "#FCE77C",
    "\ "Unmerged"  : "#FC51E6",
    "\ "Dirty"     : "#FFBD61",
    "\ "Clean"     : "#87939A",
    "\ "Ignored"   : "#808080"
    "\ }
let g:NERDTreeIgnore = ['^node_modules$']
" prettier command for coc
command! -nargs=0 Prettier :CocCommand prettier.formatFile

" prettier command for coc
" command! -nargs=0 Prettier :CocCommand prettier.formatFile
"


let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn|node_modules)$'

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

map <C-n> :NERDTreeToggle<CR>
nnoremap <silent> <leader>pv :NERDTreeFind<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


colorscheme gruvbox

set cmdheight=2

set updatetime=300

set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Coc Config
let g:coc_global_extensions = ['coc-yank', 'coc-emmet', 'coc-css', 'coc-html' ,'coc-snippets', 'coc-pairs', 'coc-tsserver', 'coc-json']

if isdirectory('./node_modules')
  if isdirectory('./node_modules/prettier')
    let g:coc_global_extensions += ['coc-prettier']
  endif

  if isdirectory('./node_modules/eslint')
    let g:coc_global_extensions += ['coc-eslint']
  endif
endif

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> [g <Plug>(coc-diagnostics-prev)
nmap <silent> g] <Plug>(coc-diagnostics-next)
nmap <leader>do <Plug>(coc-codeaction)
nmap <leader>rn <Plug>(coc-rename)

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

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')


" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif


" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

" use <c-space>for trigger completion
inoremap <silent><expr> <NUL> coc#refresh()

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

au BufNewFile,BufRead *.ts setlocal filetype=typescript
au BufNewFile,BufRead *.tsx setlocal filetype=typescript.tsx

if isdirectory('./node_modules')
  if isdirectory('./node_modules/react')
    au BufRead,BufNewFile *.js setlocal filetype=javascriptreact
    au BufRead,BufNewFile *.jsx setlocal filetype=javascriptreact
  endif
endif
