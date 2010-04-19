green  = "\033[1;32m"
yellow = "\033[1;33m"
red    = "\033[1;31m"
blue   = "\033[1;34m"
reset  = "\033[0m"

current_branch = `git branch 2>/dev/null`.grep(/^\*/).first
if current_branch
  branch_name = current_branch.gsub(/^\*\s*/,'').strip
STDERR.puts "DEBUG: " + branch_name
  status_lines = `git status`.split(/\n/)
  colour = green
  if status_lines.grep(/^# Changed but not updated/).length > 0
    colour = red
  elsif status_lines.grep(/^# Changes to be committed/).length > 0
    colour = yellow
  end
  unless current_branch.empty?
    print "#{colour}(#{branch_name})#{reset}"
  end
end

