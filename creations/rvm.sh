rvmrc=$HOME/.rvmrc

install_rvm () {
  g_exec "InstallRvm" "curl -L https://get.rvm.io | bash -s stable --ruby"
  source /Users/arvid/.rvm/scripts/rvm;
}

install_ree () {
  g_exec "InstallRee" "rvm install ree"
}

ensure_rvm () {
  if ! command_exists rvm; then
    echo 'Unable to find RVM, installing (this will take a while) ..'
    install_rvm;
    echo 'Installing REE ..'
    install_ree;
    echo "  DONE"
  fi
  if [ ! -f $rvmrc ]; then
    echo "export rvm_gemset_create_on_use_flag=1" >> $rvmrc
    echo "export rvm_install_on_use_flag=1" >> $rvmrc
    echo "export rvm_auto_reload_flag=1" >> $rvmrc
    source $rvmrc
  fi
}
