ensure_bash_niceties (){
  if ! cat $shell_rc | grep "export CLICOLOR=1" > /dev/null; then
    echo 'Adding some color to shell ..'
    echo "" >> $shell_rc
    echo "export CLICOLOR=1" >> $shell_rc
    echo '  DONE'
  fi
  if ! cat $shell_rc | grep "export TERM=xterm-256color" > /dev/null; then
    echo 'Setting TERM to xterm-256color ..'
    echo "" >> $shell_rc
    echo "export TERM=xterm-256color" >> $shell_rc
    echo '  DONE'
  fi
  if ! cat $shell_rc | grep "stty stop undef" > /dev/null; then
    echo 'Adding work around for shell locking ..'
    echo "" >> $shell_rc
    echo "stty stop undef" >> $shell_rc
    echo '  DONE'
  fi
}
