#!/usr/bin/env ruby


# Generates YAML sturcutre. Optpu into the STDOUT.

require "yaml"

data = {}
data[:info] = "Figure 2.12 Limits and name arguments to pathconf and fpathconf"
data[:data] = []
x = data[:data]
x << {limit: "FILESIZEBITS", 
      descr: "number of bits used to represent file sizes in bytes", 
      name_arg: "_SC_FILESIZEBITS",
      long_descr: "FILESIZEBITS (_SC_FILESIZEBITS) defines the number of bits the operating system uses to represent file sizes in bytes [The Open Group]. On modern 64-bit Linux and macOS architectures, this value is universally 64, theoretically allowing individual files to reach exabyte scales. However, on legacy 32-bit systems, this limit was historically 32, imposing a hard ceiling of 2GB (signed) or 4GB (unsigned) per file. In daily systems programming, attempting to manipulate a file that exceeds this bit-width boundary without Large File Support (LFS) causes kernel system calls like stat(), fstat(), or lseek() to abruptly fail with the classic EOVERFLOW (Value too large for defined data type) error. For Ruby and Go developers, this is largely transparent on modern 64-bit environments—where File.size or os.Stat seamlessly handle massive files—but becomes a critical deployment trap when running 32-bit containers or legacy binaries. In those constrained environments, processing multi-gigabyte logs or datasets will crash unless the underlying runtime or C-extensions are explicitly compiled with large file offsets enabled (e.g., the _FILE_OFFSET_BITS=64 macro in C)."}
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
