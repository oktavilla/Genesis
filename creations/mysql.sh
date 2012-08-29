ensure_mysql () {

  if ! command_exists mysqld; then
    echo 'Unable to find mysql, installing ..'
    g_exec 'InstallMysql' 'brew install mysql'
    unset TMPDIR &&
    mysql_install_db --verbose --user=`whoami` --basedir="$(brew --prefix mysql)" --datadir=/usr/local/var/mysql --tmpdir=/tmp &&
    mysql.server start 
    echo 'Setting upp autostart of MySQL server ..'
    mkdir -p ~/Library/LaunchAgents &&
    cp /usr/local/Cellar/mysql/5.*/homebrew.mxcl.mysql.plist ~/Library/LaunchAgents/ &&
    launchctl load -w ~/Library/LaunchAgents/homebrew.mxcl.mysql.plist
    echo '  DONE'
  fi
}
