# Setup
ruby_info = "[#{RUBY_VERSION}p#{RUBY_PATCHLEVEL}]"
rails_info = defined?(Rails) ? "[#{Rails.application.class.parent_name.downcase}][#{Rails.env}]" : nil

# Prompt
Pry.config.prompt = [
  proc do |conf|
    tree = conf.binding_stack.map { |stack| Pry.view_clip stack.eval("self") } * " / "
    [ruby_info, rails_info, "[PRY #{tree} - #{conf.expr_number}:#{conf.nesting_level}]> "].compact.join
  end,
  proc do |conf|
    tree = conf.binding_stack.map { |stack| Pry.view_clip stack.eval("self") } * " / "
    [ruby_info, rails_info, "[PRY #{tree} - #{conf.expr_number}:#{conf.nesting_level}]> "].compact.join
  end
]

# Aliases (requires the pry-nav gem)
Pry.commands.alias_command 'c', "continue" rescue nil
Pry.commands.alias_command 's', "step" rescue nil
Pry.commands.alias_command 'n', "next" rescue nil

# Gem Enhancements (requirements)
%w(hirb awesome_print).each do |gem|
  begin
    require gem
  rescue LoadError
    STDERR.puts "Unable to load #{gem}: #{$!}"
  end
end

# Gem Enhancements (settings)
begin
  Hirb.enable
  Pry.config.print = proc do |output, value|
    Hirb::View.view_or_page_output(value) || Pry::DEFAULT_PRINT.call(output, value)
  end
rescue NoMethodError
  STDERR.puts "Unable to configure Hirb: #{$!}"
end

