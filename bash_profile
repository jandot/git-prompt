parse_git_branch() {
  ruby ~/git-ps.rb 2>/dev/null
}
export PS1="[\w \$(parse_git_branch)]> "
