# requirements
require 'rubygems'
require 'yaml'
require 'irb/ext/save-history'
require 'irb/completion'

ANSI = {
  :RESET      => "\001\e[0m\002",
  :BOLD       => "\001\e[1m\002",
  :UNDERLINE  => "\001\e[4m\002",
  :LGRAY      => "\001\e[0;37m\002",
  :GRAY       => "\001\e[0;90m\002",
  :RED        => "\001\e[31m\002",
  :GREEN      => "\001\e[32m\002",
  :YELLOW     => "\001\e[33m\002",
  :BLUE       => "\001\e[34m\002",
  :MAGENTA    => "\001\e[35m\002",
  :CYAN       => "\001\e[36m\002",
  :WHITE      => "\001\e[37m\002",
}

# configuration
IRB.conf[:USE_READLINE] = true
IRB.conf[:SAVE_HISTORY] = 1000
IRB.conf[:HISTORY_PATH] = File::expand_path("~/.irb.history")
IRB.conf[:AUTO_INDENT]  = true
IRB.conf[:PROMPT][:IRB] => {
  :PROMPT_I => "#{ANSI[:BLUE]}>>#{ANSI[:RESET]} ",      # normal prompt
  :PROMPT_N => "#{ANSI[:BLUE]}?>#{ANSI[:RESET]} ",      #
  :PROMPT_C => "#{ANSI[:RED]}->#{ANSI[:RESET]} ",       # continuation statement
  :PROMPT_S => "#{ANSI[:YELLOW]}->#{ANSI[:RESET]} ",    # continuation string
  :RETURN   => "#{ANSI[:GREEN]}=>#{ANSI[:RESET]} %s\n", # return value
}
IRB.conf[:PROMPT_MODE] = :IRB

class Object
  def local_methods() (methods - 1.methods).sort; end
end

# extend the console helper
def extend_console(name, care = true, required = true)
  if care
    require name if required
    yield if block_given?
    $console_extensions << "#{ANSI[:GREEN]}#{name}#{ANSI[:RESET]}"
  else
    $console_extensions << "#{ANSI[:LGRAY]}#{name}#{ANSI[:RESET]}"
  end
rescue LoadError
  $console_extensions << "#{ANSI[:RED]}#{name}#{ANSI[:RESET]}"
end
$console_extensions = []

# colorization of IRB output and history
extend_console 'wirble' do
  Wirble.init
  Wirble.colorize
end

# makes handling tables output simple
extend_console 'hirb' do
  Hirb.enable
  extend Hirb::Console
end

# awesome print is nicer than pretty print
extend_console 'ap' do
  alias pp ap
end

# When you're using Rails 3 console, show queries in the console
extend_console 'rails3', defined?(ActiveSupport::Notifications), false do
  $odd_or_even_queries = false
  ActiveSupport::Notifications.subscribe('sql.active_record') do |*args|
    $odd_or_even_queries = !$odd_or_even_queries
    color = $odd_or_even_queries ? ANSI[:CYAN] : ANSI[:MAGENTA]
    event = ActiveSupport::Notifications::Event.new(*args)
    time  = "%.1fms" % event.duration
    name  = event.payload[:name]
    sql   = event.payload[:sql].gsub("\n", " ").squeeze(" ")
    puts "  #{ANSI[:UNDERLINE]}#{color}#{name} (#{time})#{ANSI[:RESET]}  #{sql}"
  end
end

# aliases
alias q exit
alias po local_methods

# results
puts "#{ANSI[:CYAN]}~> Console extensions:#{ANSI[:RESET]} #{$console_extensions.join(' ')}#{ANSI[:RESET]}"
