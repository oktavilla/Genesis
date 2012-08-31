setup_github() {
  if ! git config --global user.email > /dev/null ; then
    echo "Please supply the email address you use on GitHub:"
    read github_email

    git config --global user.email "$github_email"
  fi

  if ! git config --global user.name > /dev/null; then
    echo "Please supply your full name:"
    read github_name

    git config --global user.name "$github_name"
  fi

  git config --global credential.helper osxkeychain
}

setup_git_colors() {
  if ! git config --global color.ui > /dev/null; then
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

setup_shell_utils () {
  if ! cat $shell_rc | grep "bash_completion" > /dev/null; then
    echo "" >> $shell_rc
    echo "# Git autocompletion + rep status in prompt" >> $shell_rc
    echo "source `brew --prefix git`/etc/bash_completion.d/git-completion.bash" >> $shell_rc
    echo "source `brew --prefix git`/etc/bash_completion.d/git-prompt.sh" >> $shell_rc
    echo "GIT_PS1_SHOWDIRTYSTATE=1" >> $shell_rc
  fi
    echo "PS1='\\W\$(__git_ps1 \" (%s)\")\\[\\033[0;34m\\]\\$\[\\033[0m\\] '" >> $shell_rc
}

ensure_git() {
  if ! brewed "git" ; then
    g_exec "InstallingGit", "brew install git"
  fi

  setup_shell_utils
  setup_github
  setup_git_colors
}
