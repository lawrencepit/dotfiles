# http://blog.nicksieger.com/articles/2006/04/23/tweaking-irb
ARGV.concat ["--readline", "--prompt-mode", "simple"]

require 'irb/completion'
require 'irb/ext/save-history'
IRB.conf[:SAVE_HISTORY] = 500
IRB.conf[:HISTORY_FILE] = File.expand_path('~/.irb-history')

# autoindent of code while typing it
IRB.conf[:AUTO_INDENT]=true

require 'pp'

require 'rubygems'

# http://ozmm.org/posts/time_in_irb.html
def time(times = 1)
  require 'benchmark'
  ret = nil
  Benchmark.bm { |x| x.report { times.times { ret = yield } } }
  ret
end

# list object methods
def local_methods(obj=self)
  (obj.methods - obj.class.superclass.instance_methods).sort
end

def ls(obj=self)
  width = `stty size 2>/dev/null`.split(/\s+/, 2).last.to_i
  width = 80 if width == 0
  local_methods(obj).each_slice(3) do |meths|
    pattern = "%-#{width / 3}s" * meths.length
    puts pattern % meths
  end
end

require 'logger'
if ENV.include?('RAILS_ENV') && !Object.const_defined?('RAILS_DEFAULT_LOGGER')
  Object.const_set('RAILS_DEFAULT_LOGGER', Logger.new(STDOUT))
end

def ppp(object)
  require 'json'
  puts JSON.pretty_generate(JSON.parse(object.to_json))
end

def c
  puts caller.reverse.map.with_index{ |m, i|
    m.rindex( /:\d+(:in `(.*)')?$/ )
    "  "*i + $2
  }
end
alias cc c

def o(desc = nil)
  caller[0].rindex( /:(\d+)(:in (`.*'))?$/ )
  m = $3 ? "method #$3, " : ""
  d = desc ? "#{desc}: r" : 'R'

  # lol, I need to change the syntax highlighter...
  # the "syntax" gem *crashed* when I wrote "#$`"
  puts "#{d}eached #{m}line #{$1} of file #{$`}"
end
alias oo o

# reload this .irbrc
def IRB.reload
  load __FILE__
end