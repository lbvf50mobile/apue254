#!/usr/bin/env ruby

# STDIN yaml => STDOUNT HTML
#
#
require 'erb'
require 'yaml'

tplt_hash = YAML.load(ARGF.read)

# require_relative 'tmplt/top.rb'
top = ERB.new(File.read('tmplt/top.erb')).result_with_hash(tplt_hash);
# require_relative 'tmplt/body.rb'
body = ERB.new(File.read('tmplt/body.erb')).result_with_hash(tplt_hash);
# require_relative 'tmplt/foot.rb'
foot = ERB.new(File.read('tmplt/foot.erb')).result_with_hash(tplt_hash);

puts top+body+foot
