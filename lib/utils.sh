debug_log () {
  if ! [ -z "$GENESIS_DEBUG" ]; then
    echo "[DEBUG] $1";
  fi
}

command_exists () {
  type "$1" &> /dev/null ;
}

# From http://stackoverflow.com/questions/4023830/bash-how-compare-two-strings-in-version-format

# version_above_or_equal version_to_check, min_version
#   Returns 0 if version_to_check_is above or equal to min_version
#   Returns 1 if version_to_check is less than min_version

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
