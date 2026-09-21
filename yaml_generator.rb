#!/usr/bin/env ruby


# Generates YAML sturcutre. Optpu into the STDOUT.

require "yaml"

data = {}
data[:info] = "Figure 2.1 Limits and namearguments to sysconf"
data[:data] = []
x = data[:data]
# x << {limit: "", descr: "", name_arg: ""}

x << {limit: "ARG_MAX", 
      descr: "maximum length, in bytes, of arguments to the exec functions", 
      name_arg: "_SC_ARG_MAX"}
x << {limit: "ATEXIT_MAX", 
      descr: "maximum number of functions that can be registered with the atexit function", 
      name_arg: "_SC_ATEXIT_MAX"}
x << {limit: "CHILD_MAX",
      descr: "maximum number of processes per real user ID", 
      name_arg: "_SC_CHILD_MAX"}
x << {limit: "clock ticks/second", 
      descr: "number of clock ticks per second",
      name_arg: "_SC_CLK_TCK"}
x << {limit: "COLL_WEIGHTS_MAX", 
      descr: "maximum number of weights that can be assigned to an entry of the LC_COLLATE order keyword in the locale definition file", 
      name_arg: "_SC_COLL_WEIGHTS_MAX"}
x << {limit: "DELAYTIMER_MAX", 
      descr: "maximum number of timer expiration overruns", 
      name_arg: "_SC_DELAYTIMER_MAX"}
x << {limit: "HOST_NAME_MAX", 
      descr: "maximum length of a host name as returned by gethostname", 
      name_arg: "_SC_HOST_NAME_MAX"}
x << {limit: "IOV_MAX", 
      descr: "maximum number of iovec structures that can be used with readv or writev", 
      name_arg: "_SC_IOV_MAX"}
x << {limit: "LINE_MAX", 
      descr: "maximum length of a utility's input line", 
      name_arg: "_SC_LINE_MAX"}
x << {limit: "LOGIN_NAME_MAX", 
      descr: "maximum length of a login name", 
      name_arg: "_SC_LOGIN_NAME_MAX"}
x << {limit: "NGROUPS_MAX", 
      descr: "maximum number of simultaneous supplementary process group IDs per process", 
      name_arg: "_SC_NGROUPS_MAX"}
x << {limit: "OPEN_MAX", 
      descr: "one more than the maximum value assigned to a newly created file descriptor", 
      name_arg: "_SC_OPEN_MAX"}
x << {limit: "PAGESIZE", 
      descr: "system memory page size, in bytes", 
      name_arg: "_SC_PAGESIZE"}
x << {limit: "PAGE_SIZE", 
      descr: "system memory page size, in bytes", 
      name_arg: "_SC_PAGE_SIZE"}
x << {limit: "RE_DUP_MAX", 
      descr: "number of repeated occurrences of a basic regular expression permitted by the regexec and regcomp functions when using the interval notation \{m,n\}", 
      name_arg: "_SC_RE_DUP_MAX"}
x << {limit: "RTSIG_MAX", 
      descr: "maximum number of real-time signals reserved for application use", 
      name_arg: "_SC_RTSIG_MAX"}
x << {limit: "SEM_NSEMS_MAX", 
      descr: "maximum number of semaphores a process can use at one time", 
      name_arg: "_SC_SEM_NSEMS_MAX"}
x << {limit: "SEM_VALUE_MAX", 
      descr: "maximum value of a semaphore", 
      name_arg: "_SC_SEM_VALUE_MAX"}
x << {limit: "SIGQUEUE_MAX", 
      descr: "maximum number of signals that can be queued for a process", 
      name_arg: "_SC_SIGQUEUE_MAX"}
x << {limit: "STREAM_MAX", 
      descr: "maximum number of standard I/O streams per process at any given time; if defined, it must have the same value as FOPEN_MAX", 
      name_arg: "_SC_STREAM_MAX"}
x << {limit: "SYMLOOP_MAX", 
      descr: "number of symbolic links that can be traversed during pathname resolution", 
      name_arg: "_SC_SYMLOOP_MAX"}
x << {limit: "TIMER_MAX", 
      descr: "maximum number of timers per process", 
      name_arg: "_SC_TIMER_MAX"}
x << {limit: "TTY_NAME_MAX", 
      descr: "length of a terminal device name, including the terminating null", 
      name_arg: "_SC_TTY_NAME_MAX"}
x << {limit: "TZNAME_MAX", 
      descr: "maximum number of bytes for a time zone name", 
      name_arg: "_SC_TZNAME_MAX"}
################################
print data.to_yaml
