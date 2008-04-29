#!/usr/bin/env ruby

require 'rubygems'
require 'irb/completion'
ARGV << "--readline"

#require 'irb/ext/save-history'
#IRB.conf[:SAVE_HISTORY] = 100
#IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb-save-history"

IRB.conf[:PROMPT_MODE] = :SIMPLE
IRB.conf[:AUTO_INDENT] = true

class Object
  def my_methods() methods - Object.methods end
  def self.my_methods() methods - Module.methods end
end

# start wirble (with color)
require 'wirble'
Wirble.init
Wirble.colorize

require 'yaml'
require 'open-uri'
require 'hpricot'
require 'scrapes'
def hp(url) Hpricot(open(url)) end

require 'irb/completion'
require 'irb/ext/save-history'
ARGV.concat [ "--readline", "--prompt-mode", "simple" ]
IRB.conf[:SAVE_HISTORY] = 100
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb-save-history"

require 'irb/completion'
ARGV.concat [ "--readline", "--prompt-mode", "simple" ]

def uptime() system('uptime') { |x| puts x } end
def ls(*args) system('ls', '-sF', *args) { |x| puts x } end
def dir(*args) system('dir', '-lF', *args) { |x| puts x } end
