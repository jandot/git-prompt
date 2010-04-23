parse_git_branch() {
  source ~/git-ps.sh 2>/dev/null
}
export PS1="[\w \$(parse_git_branch)]> "
