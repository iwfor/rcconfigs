#!/usr/bin/env ruby

require 'json'
require 'yaml'
#require 'nokogiri'

unless $0.match(/script\/server/)

  require 'rubygems'
  require 'irb/completion'
  require 'bigdecimal'
  require 'bigdecimal/util'
  ARGV << "--readline"

  require 'irb/ext/save-history'
  IRB.conf[:SAVE_HISTORY] = 2000
  IRB.conf[:HISTORY_FILE] = File.expand_path("~/.irb-history")

  IRB.conf[:PROMPT_MODE] = :SIMPLE
  IRB.conf[:AUTO_INDENT] = true

  class Object
    def self.my_methods (sort_them=true)
      methods = self.methods - Module.methods
      methods.sort! if sort_them
      methods
    end

    def my_methods (sort_them=true)
      methods = self.methods - Object.methods
      methods.sort! if sort_them
      methods
    end
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

  def arlog
    ActiveRecord::Base.logger = Logger.new(STDOUT)
    ActiveRecord::Base.clear_active_connections!
  end
end
