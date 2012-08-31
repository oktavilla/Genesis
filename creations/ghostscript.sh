ensure_ghostscript () {
  if ! brewed "ghostscript" ; then
    echo "Unable to Ghostscript, installing .." 
    g_exec "InstallGhostscript", "brew install ghostscript"
    echo "  DONE" 
  fi
}
