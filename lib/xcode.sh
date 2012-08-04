ensure_xcode () {
  if ! command_exists xcrun; then
    printf "%b" "

 ** XCODE COMMAND LINE TOOLS NOT INSTALLED **

 How to install the command line tools:

  1) Install Xcode from the App Store
  2) Open Xcode
  3) Open preferenses from Xcode menu
  4) Select Downloads and click Install for Command Line Tools 

 After installed please re-run genesis.

"
    return 1
  fi

  return 0
}
