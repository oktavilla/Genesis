ensure_ghostscript () {
  if ! brewed "gs" ; then
    echo "Unable to Ghostscript, installing .." 
    g_exec "InstallGhostscript", "brew install ghostscript"
    echo "  DONE" 
  fi
}
