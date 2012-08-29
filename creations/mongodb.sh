ensure_mongodb (){
  if ! command_exists mongod; then
    echo 'Unable to find mongodb, installing ..'
    g_exec 'InstallMongodb' 'brew install mongodb'
    mkdir -p ~/Library/LaunchAgents &&
    cp /usr/local/Cellar/mongodb/2.*/homebrew.mxcl.mongodb.plist ~/Library/LaunchAgents/ &&
    launchctl load -w ~/Library/LaunchAgents/homebrew.mxcl.mongodb.plist
    echo '  DONE'
  fi
}
