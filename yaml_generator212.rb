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
      descr: "maximum number of hard links to a single file", 
      name_arg: "_SC_LINK_MAX",
      long_descr: "LINK_MAX (_SC_LINK_MAX) defines the maximum number of hard links that can point to a single file's inode within a single filesystem [The Open Group]. Each hard link is simply an additional directory entry referencing the same underlying inode number, sharing the file's data blocks and metadata, with the file being physically deleted from the filesystem only when its link count drops to zero. While the POSIX/XSI standard mandates a historical minimum baseline of just 8 hard links per file [The Open Group], real-world filesystems diverge sharply: ext4 hardcodes a 16-bit link counter, capping at 65,535 links per file, while XFS uses a 32-bit counter with no practical fixed ceiling—only the available inode space limits it. In daily systems programming, attempting to create a hard link beyond the filesystem's threshold causes the link() or linkat() system calls to immediately fail with the classic EMLINK error, meaning \"Too many links.\" For Ruby and Go developers, this boundary rarely surfaces in typical application code where File.link or os.Link are used sparingly, but becomes a critical constraint in infrastructure engineering: backup systems like rsync with --link-dest, snapshot tools, and deduplication engines that aggressively create hard links to save disk space can silently hit this ceiling when consolidating hundreds of thousands of identical configuration files or log entries into a single archive directory."}
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
