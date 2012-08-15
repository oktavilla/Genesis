setup_github() {
  if ! git config --global user.email; then
    echo "Please supply the email address you use on GitHub"
    read github_email

    git config --global user.email "$github_email"
  fi

  if ! git config --global user.name; then
    echo "Please supply your full name"
    read github_name

    git config --global user.name "$github_name"
  fi

  git config --global credential.helper osxkeychain
}

setup_git_colors() {
  if ! cat $shell_rc | grep "parse_git_branch"; then
    read -d '' branch_colors <<"EOF"
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ \1/'
}
parse_git_modified() {
  [[ $(git status 2> /dev/null | grep modified:) != "" ]] && echo " •"
}
export PS1="\\[\\033[0;32m\\]\\[\\033[0;36m\\]\\w\\[\\033[0;33m\\]\$(parse_git_branch)\\[\\033[0;31m\\]\\$(parse_git_modified)\\[\\033[0;34m\\] $\\[\\033[0m\\]"
EOF
    echo "$branch_colors" >> $shell_rc
    source $shell_rc
  fi

  if ! git config --global color.ui; then
    git config --global color.ui "auto"

    git config --global color.branch.current "yellow reverse"
    git config --global color.branch.local "yellow"
    git config --global color.branch.remote "green"

    git config --global color.diff.meta "yellow bold"
    git config --global color.diff.frag "magenta bold"
    git config --global color.diff.old "red bold"
    git config --global color.diff.new "green bold"

    git config --global color.status.added "yellow"
    git config --global color.status.changed "green"
    git config --global color.status.untracked "cyan"
  fi
}

ensure_git() {
  if ! brewed "git" ; then
    g_exec "InstallingGit", "brew install git"
    echo "source `brew --prefix git`/etc/bash_completion.d/git-completion.bash" >> ~/.bashrc
  fi

  setup_github
  setup_git_colors
}
