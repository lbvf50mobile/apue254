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
x << {limit: "MAX_INPUT", 
      descr: "number of bytes for which space is available on terminal’s input queue", 
      name_arg: "_PC_MAX_INPUT",
      long_descr: ""}
x << {limit: "NAME_MAX", 
      descr: "maximum number of bytes in a filename (does not include a null at end)", 
      name_arg: "_PC_NAME_MAX",
      long_descr: ""}
x << {limit: "PATH_MAX", 
      descr: "maximum number of bytes in a relative pathname, including the terminating null", 
      name_arg: "_PC_PATH_MAX",
      long_descr: ""}
x << {limit: "PIPE_BUF", 
      descr: "maximum number of bytes that can be written atomically to a pipe", 
      name_arg: "_PC_PIPE_BUF",
      long_descr: ""}
x << {limit: "_POSIX_TIMESTAMP_RESOLUTION", 
      descr: "resolution in nanoseconds for file timestamps", 
      name_arg: "_PC_TIMESTAMP_RESOLUTION",
      long_descr: ""}
x << {limit: "SYMLINK_MAX", 
      descr: "number of bytes in a symbolic link", 
      name_arg: "_PC_SYMLINK_MAX",
      long_descr: ""}
################################
print data.to_yaml
