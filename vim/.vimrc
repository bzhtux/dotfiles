" =======================================
" Initially based on/forked from: Jeremy Mack (@mutewinter)
" [http://github.com/luan/vimfiles]
" Maintained By: Luan Santos (GitHub: @luan)
" =======================================

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
Plugin 'https://github.com/scrooloose/nerdtree.git'
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required


silent! source ~/.vimrc.local.before

runtime! Plug.vim

runtime! config/basic.vim
runtime! config/bindings.vim
runtime! config/colors.vim
runtime! config/paste.vim

" ----------------------------------------
" Plugin Configuration
" ----------------------------------------

runtime! config/plugin/ack.vim
runtime! config/plugin/airline.vim
runtime! config/plugin/ale.vim
runtime! config/plugin/autoformat.vim
runtime! config/plugin/better-whitespace.vim
runtime! config/plugin/fugitive.vim
runtime! config/plugin/livedown.vim
runtime! config/plugin/goyo.vim
runtime! config/plugin/multicursor.vim
runtime! config/plugin/ncm.vim
runtime! config/plugin/nerdtree.vim
runtime! config/plugin/signify.vim
runtime! config/plugin/tagbar.vim
runtime! config/plugin/tcomment.vim
runtime! config/plugin/ultisnips.vim
runtime! config/plugin/undotree.vim

if has('gui_running')
  runtime! config/plugin/ctrlp.vim
else
  runtime! config/plugin/fzf.vim
end

" ----------------------------------------
" Language Configuration
" ----------------------------------------

runtime! config/lang/c.vim
runtime! config/lang/crontab.vim
runtime! config/lang/elm.vim
runtime! config/lang/golang.vim
runtime! config/lang/javascript.vim
runtime! config/lang/markdown.vim
runtime! config/lang/ruby.vim
runtime! config/lang/rust.vim
runtime! config/lang/vue.vim
runtime! config/lang/yaml.vim

" ----------------------------------------
" Lib load path
" ----------------------------------------

runtime! lib/functions.vim
runtime! lib/autocommands.vim
runtime! lib/watchforchanges.vim

silent! source ~/.vimrc.local

