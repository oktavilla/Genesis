ensure_imagemagick (){
  if ! command_exists convert; then
    echo 'Unable to find imagemagick, installing ..'
    g_exec 'InstallImageMagick', 'brew install imagemagick'
    echo '  DONE'
  fi
}
