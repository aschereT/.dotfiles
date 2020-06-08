" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

Plug 'arcticicestudio/nord-vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'airblade/vim-gitgutter'
Plug 'altercation/vim-colors-solarized'
Plug 'amix/open_file_under_cursor.vim'
" Plug 'amix/vim-zenroom2'
" Plug 'chr4/nginx.vim'
Plug 'ctrlpvim/ctrlp.vim'
" Plug 'digitaltoad/vim-pug'
Plug 'garbas/vim-snipmate'
" Plug 'groenewege/vim-less'
Plug 'honza/vim-snippets'
Plug 'itchyny/lightline.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'jlanzarotta/bufexplorer'
" Plug 'junegunn/goyo.vim'
" Plug 'kchmck/vim-coffee-script'
Plug 'leafgarland/typescript-vim'
" Plug 'mattn/vim-gist'
Plug 'maxbrunsfeld/vim-yankstack'
Plug 'maximbaz/lightline-ale'
Plug 'michaeljsmith/vim-indent-object'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'morhetz/gruvbox'
Plug 'nvie/vim-flake8'
Plug 'pangloss/vim-javascript'
Plug 'plasticboy/vim-markdown'
Plug 'rust-lang/rust.vim'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'sophacles/vim-bundle-mako'
Plug 'terryma/vim-expand-region'
Plug 'terryma/vim-multiple-cursors'
Plug 'therubymug/vim-pyte'
Plug 'tpope/tpope-vim-abolish'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'vim-ruby/vim-ruby'
Plug 'vim-scripts/mayansmoke'
Plug 'vim-scripts/tlib'
Plug 'dense-analysis/ale'

" Initialize plugin system
call plug#end()

" --column: Show column number
" --line-number: Show line number
" --no-heading: Do not show file headings in results
" --fixed-strings: Search term as a literal string
" --ignore-case: Case insensitive search
" --no-ignore: Do not respect .gitignore, etc...
" --hidden: Search hidden files and folders
" --follow: Follow symlinks
" --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
" --color: Search color options
command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)

" https://github.com/amix/vimrc
exec 'source' stdpath('config') . '/basic.vim'
exec 'source' stdpath('config') . '/filetypes.vim'
exec 'source' stdpath('config') . '/plugins_config.vim'
exec 'source' stdpath('config') . '/extended.vim'
exec 'source' stdpath('config') . '/coc.vim'