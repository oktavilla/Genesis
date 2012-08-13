install_homebrew () {
  g_exec "InstallHomebrew", "curl -fsSk https://raw.github.com/mxcl/homebrew/go > /tmp/brew_install.sh &&
    ruby /tmp/brew_install.sh &&
    rm /tmp/brew_install.sh"
}

update_homebrew () {
  g_exec "BrewUpdate" "brew update";
}

ensure_homebrew () {
  ensure_path

  if command_exists brew; then
    installed_homebrew_version="$(brew --version)"

    if ! version_above_or_equal $installed_homebrew_version $GENESIS_HOMEBREW_VERSION; then
      echo "Updating homebrew to latest version, version $installed_homebrew_version is to old (>= $GENESIS_HOMEBREW_VERSION is needed)" 
      update_homebrew;
    fi
  else
    echo "Unable to find homebrew, installing .."
    install_homebrew;
    echo "  DONE"
  fi
}

ensure_path () {
  if [[ "$PATH" != *"/usr/local/bin"* ]]; then
    echo 'export PATH="/usr/local/bin:/usr/local/sbin:~/bin:$PATH"' >> ~/.bash_profile
  fi
}
