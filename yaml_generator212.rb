#!/usr/bin/env ruby


# Generates YAML sturcutre. Optpu into the STDOUT.

require "yaml"

data = {}
data[:info] = "Figure 2.12 Limits and name arguments to pathconf and fpathconf"
data[:data] = []
x = data[:data]
x << {limit: "FILESIZEBITS", 
      descr: "minimum number of bits needed to represent, as a signed integer value, the maximum size of a regular file allowed in the specified directory", 
      name_arg: "_PC_FILESIZEBITS",
      long_descr: ""}
x << {limit: "LINK_MAX", 
      descr: "maximum value of a file’s link count", 
      name_arg: "_PC_LINK_MAX",
      long_descr: ""}
x << {limit: "MAX_CANON", 
      descr: "maximum number of bytes on a terminal’s canonical input queue", 
      name_arg: "_PC_MAX_CANON",
      long_descr: ""}
################################
print data.to_yaml
