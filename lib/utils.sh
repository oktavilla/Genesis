# Output log message to STDOUT if $GENESIS_DEBUG is not empty
#
# arg1  - The message
#
# Returns nothing
debug_log () {
  if ! [ -z "$GENESIS_DEBUG" ]; then
    echo "[DEBUG] $1";
  fi
}

# Execs a command and saves output if command fails
#
# arg1  - Command name / label
# arg2  - The actual command as string
#
# Returns 1 if command fails
g_exec () {
  command_name=$1
  command=$2
  output_file=/tmp/genesis-$command_name-output

  if ! $(eval "$command" &> $output_file ); then
    debug_log "Command $command failed, output saved at $output_file"
    return 1;
  else
    rm $output_file; 
  fi
}

# Check if a command exists
#
# arg1  - The command name, ie. ls or nginx
#
# Returns 0 if command exists and 1 if it is missing
command_exists () {
  type "$1" &> /dev/null;
}

# Check if a version string (0.9.2) is above or equal to another version string
#
# arg1  - Version string to check
# arg2  - The version to compaire against (ie. min version that should return true)
#
# Origin of code http://stackoverflow.com/questions/4023830/bash-how-compare-two-strings-in-version-format
#
# Returns 0 if arg1 is above or equal arg2 and 1 if below
version_above_or_equal () {
    if [[ $1 == $2 ]]
    then
        return 0
    fi
    local IFS=.
    local i ver1=($1) ver2=($2)
    # fill empty fields in ver1 with zeros
    for ((i=${#ver1[@]}; i<${#ver2[@]}; i++))
    do
        ver1[i]=0
    done
    for ((i=0; i<${#ver1[@]}; i++))
    do
        if [[ -z ${ver2[i]} ]]
        then
            # fill empty fields in ver2 with zeros
            ver2[i]=0
        fi
        if ((10#${ver1[i]} > 10#${ver2[i]}))
        then
            return 0
        fi
        if ((10#${ver1[i]} < 10#${ver2[i]}))
        then
            return 1
        fi
    done
    return 0
}
