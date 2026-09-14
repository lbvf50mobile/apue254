#!/usr/bin/env ruby


# Generates YAML sturcutre. Optpu into the STDOUT.

require "yaml"

data = {}
data[:info] = "Figure 2.1 Limits and namearguments to sysconf"
data[:data] = []
x = data[:data]
# x << {limit: "", descr: "", name_arg: ""}

x << {limit: "ARG_MAX", descr: "maximum length, in bytes, of arguments to the exec functions", name_arg: "_SC_ARG_MAX"}
x << {limit: "ATEXIT_MAX", descr: "maximum number of functions that can be registered with the atexit function ", name_arg: "_SC_ATEXIT_MAX"}

print data.to_yaml
