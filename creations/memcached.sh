ensure_memcached (){
  if ! command_exists memcached; then
    echo 'Unable to find memcached, installing ..'
    g_exec 'InstallMemcached', 'brew install memcached'
    echo '  DONE'
  fi
}
