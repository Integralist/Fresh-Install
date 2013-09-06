#!/usr/bin/env ruby
$: << File.expand_path("../../lib/", __FILE__)

require "thor"
require "tmuxinator"

if ARGV.length == 1
  name = ARGV[0]

  if Tmuxinator::Config.exists?(name)
    Tmuxinator::Cli.new.start(name)
  else
    Tmuxinator::Cli.start
  end
else
  Tmuxinator::Cli.start
end