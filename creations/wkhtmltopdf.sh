ensure_wkhtmltopdf (){
  if ! command_exists wkhtmltopdf; then
    echo 'Unable to find wkhtmltopdf, installing ..'
    g_exec 'InstallWkhtmltopdf', 'brew install wkhtmltopdf'
    echo '  DONE'
  fi
}
