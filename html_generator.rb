#!/usr/bin/env ruby

# STDIN yaml => STDOUNT HTML
#

require_relative 'tmplt/top.rb'
require_relative 'tmplt/body.rb'
require_relative 'tmplt/foot.rb'

puts @top+@body+@foot
