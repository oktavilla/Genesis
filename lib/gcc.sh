install_gcc () {
  if ! [ -d /usr/local/Library/Taps/homebrew-dupes ]; then
    g_exec "AddDupesTap" "brew tap homebrew/dupes"
  fi
  g_exec "InstallGcc42" "brew install apple-gcc42"
}

ensure_gcc () {
  if ! command_exists gcc-4.2; then
    echo "Unable to find GCC 4.2, installing .."
    install_gcc;
    echo "  DONE"
  fi
}
