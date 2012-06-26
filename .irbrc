def copy(*args) IO.popen('pbcopy', 'r+') { |clipboard| clipboard.puts args.map(&:inspect) }; end
