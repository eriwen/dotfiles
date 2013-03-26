#!/usr/bin/env ruby

# Requirements
require "irb/completion"
require "irb/ext/save-history"

# IRB Defaults
IRB.conf[:AUTO_INDENT] = true
IRB.conf[:SAVE_HISTORY] = 1000
IRB.conf[:EVAL_HISTORY] = 200
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb_history"
IRB.conf[:PROMPT] ||= {}
IRB.conf[:PROMPT][:RA] = {
  PROMPT_I: "[#{RUBY_VERSION}p#{RUBY_PATCHLEVEL}]> ",
  PROMPT_N: "[#{RUBY_VERSION}p#{RUBY_PATCHLEVEL}]| ",
  PROMPT_C: "[#{RUBY_VERSION}p#{RUBY_PATCHLEVEL}]| ",
  PROMPT_S: "[#{RUBY_VERSION}p#{RUBY_PATCHLEVEL}]%l ",
  RETURN: "=> %s\n"
}
IRB.conf[:PROMPT_MODE] = :RA

# IRB for Rails 3.x.x
if defined?(Rails)
  # Prompt
  require "logger"
  Rails.logger = Logger.new STDOUT
  IRB.conf[:PROMPT][:RA][:PROMPT_I] = "[#{RUBY_VERSION}p#{RUBY_PATCHLEVEL}][#{Rails.application.class.parent_name.downcase}][#{Rails.env}]> "
  IRB.conf[:PROMPT][:RA][:PROMPT_N] = "[#{RUBY_VERSION}p#{RUBY_PATCHLEVEL}][#{Rails.application.class.parent_name.downcase}][#{Rails.env}]| "
  IRB.conf[:PROMPT][:RA][:PROMPT_C] = "[#{RUBY_VERSION}p#{RUBY_PATCHLEVEL}][#{Rails.application.class.parent_name.downcase}][#{Rails.env}]| "
  IRB.conf[:PROMPT][:RA][:PROMPT_S] = "[#{RUBY_VERSION}p#{RUBY_PATCHLEVEL}][#{Rails.application.class.parent_name.downcase}][#{Rails.env}]%l "
  
  # ActionController
  ActionController::Base.logger = Logger.new STDOUT
end

["wirb", "hirb", "awesome_print", "pry", "pry-vterm_aliases", "pry-stack_explorer", "pry-remote", "pry-nav"].each do |gem|
  begin
    require gem
  rescue LoadError
    STDERR.puts "Unable to load #{gem}: #{$!}"
  end
end

# Gem Settings
["Wirb.start", "Hirb.enable"].each do |config|
  begin
    instance_eval config
  rescue NoMethodError
    STDERR.puts "Unable to execute #{config}: #{$!}"
  end
end

def copy(*args) IO.popen('pbcopy', 'r+') { |clipboard| clipboard.puts args.map(&:inspect) }; end
