ensure_xquartz () {
  if [ ! -f /opt/X11/bin/X ]; then
    echo 'Unable to find X, installing XQuartz this will take a while ..'
    hdid http://xquartz.macosforge.org/downloads/SL/XQuartz-2.7.3.dmg
    echo ' ** Your password will be required now ..'
    sudo installer -pkg /Volumes/XQuartz-2.7.3/XQuartz.pkg -target /
    echo "  DONE"
  fi
}
