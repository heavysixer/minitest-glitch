#!/bin/env ruby
# encoding: utf-8
require 'minitest'

module Minitest

  # Start an escape sequence
  ESC = "\e["
  # End the escape sequence
  NND = "#{ESC}0m"

  def self.plugin_glitch_options opts, options # :nodoc:
    opts.on "-e", "--glitch", "Show Glitch instead of dots" do
      Glitch.glitch!
    end
  end

  def self.plugin_glitch_init options # :nodoc:
    if Glitch.glitch? then
      io = Glitch.new options[:io]

      self.reporter.reporters.grep(Minitest::Reporter).each do |rep|
        rep.io = io
      end
    end
  end

  class Glitch

    VERSION = '1.0.1'

    attr_reader :io

    def self.glitch!
      @glitch = true
    end

    def self.glitch?
      @glitch ||= false
    end

    def initialize io
      @io    = io
    end

    def char
      %w(
Ȋ̷͗ͯ̌͂̈̅́ͭ̋̎ͭ̈̑́̀͏͓̥̟ ̢̢̏̈ͩ͋͏̖̝͇̘̹̤lͪ̓̃͗̄̑ͤ̉̌́ͤͬ̋̆͛͑ͣ͝͏̥̠͖͈̙̼̲̞̯͉͎̰̖̳͖͙͠ͅí̛̦̤̦͇̫̥͚̙͒̄́͆͛̅̋̀͌͒́͠ͅk̶͗͌̑ͭ͒͐́̓̉̂͌̅̚͏̻͚͙̥̥̳̮̖̙̰̯̲̲e̶̛͈̣͖̥̼̭͍̝̤͎͈̤̊ͣ̐ͬ̅ͣ͐ͬ̈̓̄ͫ͋̽͜ͅ ̛̫͉͈̖̪̬͎̟̥͇ͪ̄ͩ̏̑́ę̛̯͈̮̬͇̥̻͉ͧͥ͐̒̐͒̃̈̿̓́͂͒ͥͦm̡̧͕̰͎͓͓̱̪̘͓͚̼̮̤̭͎͉͖͕̃̿ͣ̅͊ͪ͛̀ͤͮ̌̐ͨ͒̊o̼͇̱͕̖̜̥̻̲̥̘̔̍̀͐̈̀̆̾ͩ̀̄̋̃ͤ̀̚͠j̡̻̼̪̠͚̝̣͈̘̜̬̥̘̮̻̞̪̮͛̈́̑̃̆̏̐͛ͯ̏͊ͮ̄̍͐ͧ͆̑̏͘ͅi̷͎͇͔̱̖͛̾͂͊̋̃̅̑̋ͧ͊̄ͤͮ̋́'̔͗ͦ͒̔ͪ̍̊̊́̋ͥ̐̈́̕͜͏̶͏̼̩̳̟̗͍̲͔̲̖̳ͅͅͅs͊͐ͩ̑̇̌̓͐͐̑ͥ̾ͥ̄̽͏̸̳̞͉̫͝,̛̞͍͓̈́́̾̊̃͢ ̶̢ͥ̃͌̑͒ͤͫ̿͋̀̚̚͜͠͏̦̝̫̬ͅtͯ̃́ͥ͐̿͏̨̨̛̱͔̻͖̬̯̩̝̟̠̣̬̯̼̀h̟͕͉͔̠̬͇̝̼̤̝̖̪͚͈͚̪̱ͥͫͪͣ̎ͮͤ͌ͩ͆̊̿͘͟ȇ̷̓̃̎̆ͯ̀̃̆̌ͨͫ̋͛̑҉̸̥̳̰͎̦̥͈͕͍͜͜y̶̢̮̙̪͙̏̓͗̂̊ͥ̐͠͞'ͭ͆ͮ̈̍҉̟͎̞̱̟̥̻̯̖̯̘̱̮̬̺̩̙͟r̹͖͎̘̯̻̠̘͔͈̍́ͫ̆̾͛͂ͤͤ̓̓ͯ͢͢ͅȩ̶̷̯̩͍͙̗͇̝̳͍̦̭͎̺̖̣͍ͬͥ̀͋ͨ̂ͤ͑̓̐̒͋͆ͬ͆͛̓̓̀̚͡ ̸̵̵̩̳͙̘͕̥̲͇̥̘̻̤̹͕̗̩̪̊ͤ̊ͭ̍̄̈́̒͢ͅc̡̲͓̜̓̔̏͗̎̀̃̃͊̀͜͟ͅo̖̩͈̞̝̟̗̬̩̝͕͕̎͐ͫ͆͌ͤͣ́ͨͩͪ͛ͯͥͨ́̀o̢̟̩̰̗͓̠̳̣̲͔̐̃͛̊ͯ̌̆͞͝ľ̷͛̿͋̏͌́̾̅̉͆ͫͩ͟҉͜͏̠̞͓̹͕̗͖̼͖̱̪̱̞̘̰!̶̖͖̤̘̠̮̙̺̱̽̿̇ͮ̑ͦ̃͑ͥ͒̎͌ͨ͋̽͌̓̆̀̀̀
).sample()
    end

    def print o
      case o
      when "." then
        io.print  char
      when "E", "F" then
        io.print "#{ESC}41m#{ESC}37m#{char}#{NND}"
      else
        io.print char
      end
    end

    def method_missing msg, *args
      return super unless io.respond_to? msg
      io.send(msg, *args)
    end
  end
end
