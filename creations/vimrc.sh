vimrc=$HOME/.vimrc

ensure_vimrc () {

  if [ ! -f $vimrc ]; then
    echo "No vimrc found, adding some sensible defaults .."

    echo "\" Settings added by Genesis" >> $vimrc
    echo "" >> $vimrc
    echo "set nocompatible \" On modern vim " >> $vimrc
    echo "set encoding=utf-8" >> $vimrc
    echo "set clipboard=unnamed \" Make clipboard work with MacOS" >> $vimrc
    echo "set number \" Line numbers" >> $vimrc
    echo "set hidden" >> $vimrc
    echo "set ttyfast" >> $vimrc
    echo "let mapleader = \",\"" >> $vimrc
    echo "" >> $vimrc
    echo "syntax on" >> $vimrc
    echo "set t_Co=256" >> $vimrc
    echo "set term=xterm-256color" >> $vimrc
    echo "" >> $vimrc
    echo "\" Tabs" >> $vimrc
    echo "set softtabstop=2" >> $vimrc
    echo "set shiftwidth=2" >> $vimrc
    echo "set tabstop=2" >> $vimrc
    echo "set expandtab" >> $vimrc
    echo "" >> $vimrc
    echo "\" Indenting" >> $vimrc
    echo "set ai \" Indent new lines" >> $vimrc
    echo "set si \" Smartindent" >> $vimrc
    echo "" >> $vimrc
    echo "\" Searching" >> $vimrc
    echo "set hlsearch \" highlight search" >> $vimrc
    echo "set incsearch \" Incremental search, search as you type" >> $vimrc
    echo "set ignorecase\" Ignore case when searching " >> $vimrc
    echo "set smartcase \" Ignore case when searching lowercase " >> $vimrc
    echo ":nnoremap <CR> :nohlsearch<CR><CR> \" Clear search on enter" >> $vimrc
    echo "" >> $vimrc
    echo "\" Remove trailing whitespace when a buffer is saved" >> $vimrc
    echo "autocmd FileType c,cpp,java,php,ruby,eruby,javascript,css,scss autocmd BufWritePre <buffer> :%s/\s\+$//e" >> $vimrc

    echo "  DONE"
  fi

}
