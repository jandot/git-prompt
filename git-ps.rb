green = "\033[0;32m"
reset = "\033[0m"
red   = "\033[0;31m"
current_branch = `git branch 2>/dev/null`.grep(/^\*/).first
if current_branch
  branch_name = current_branch.gsub(/^\*\s*/,'').strip

  status_lines = `git status`.split(/\n/)
  status = ( status_lines.length == 2 ) ? 'clean' : 'dirty'
  color = ( status == 'clean' ) ? green : red
  unless current_branch.empty?
    print "#{color}(#{branch_name})#{reset}"
  end
end

