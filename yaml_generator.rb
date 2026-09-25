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
      name_arg: "_SC_ARG_MAX",
      long_descr: "ARG_MAX (_SC_ARG_MAX) defines the maximum combined size in bytes allowed for the command-line arguments (ARGV) and environment variables (ENV) passed into the execve system call [The Open Group]. The Linux kernel enforces this limit to protect the newly created process's memory stack from being overwhelmed by an array of text strings before execution even begins. In daily development or CLI usage (e.g., executing a Ruby system() call or Go's exec.Command), breaching this limit triggers the classic Argument list too long (E2BIG) error, which typically happens when shell expansions like rm * attempt to process hundreds of thousands of files at once instead of using batching tools like xargs."}
x << {limit: "ATEXIT_MAX", 
      descr: "maximum number of functions that can be registered with the atexit function", 
      name_arg: "_SC_ATEXIT_MAX",
      long_descr: "ATEXIT_MAX (_SC_ATEXIT_MAX) defines the maximum number of cleanup functions that a single process can register using the atexit() function to be automatically executed upon normal program termination [The Open Group]. The system library (libc) allocates fixed array structures in memory to manage these callbacks, executing them in the reverse order of their registration (LIFO) to ensure safe resource deallocation, though they will not be triggered during abrupt crashes or explicit _exit() calls. While the historical XSI standard guarantees a minimum threshold of 32 functions [The Open Group], high-level runtimes like Go completely bypass this system limit by handling deferred cleanups (defer) via the compiler, whereas Ruby manages Kernel.at_exit hooks natively within its own User Space memory management."}
x << {limit: "CHILD_MAX",
      descr: "maximum number of processes per real user ID", 
      name_arg: "_SC_CHILD_MAX",
      long_descr: "CHILD_MAX (_SC_CHILD_MAX) defines the maximum number of active simultaneous processes that a single real user ID (UID) is permitted to own at any given moment [The Open Group]. The operating system kernel enforces this limit within its process-tracking allocation routines: every time a process calls fork(), the kernel verifies the user's active process counter, instantly blocking the system call with an EAGAIN (Resource temporarily unavailable) error if the ceiling is reached. This safeguard serves as a critical defense line against malicious or runaway application loops—such as fork bombs—preventing a single user from exhaustively monopolizing the kernel's process table and freezing the entire server; while the minimal POSIX standard requires a baseline of just 25 [The Open Group], modern Linux servers scale this boundary dynamically based on total system RAM (viewable via ulimit -u)."}
x << {limit: "clock ticks/second", 
      descr: "number of clock ticks per second",
      name_arg: "_SC_CLK_TCK",
      long_descr: "_SC_CLK_TCK provides the number of software clock ticks per second used by the kernel to measure process execution intervals. Rather than using raw nanoseconds, the Unix kernel increments internal counters (User Jiffies) during CPU scheduling and exposes these metrics inside the /proc/[pid]/stat virtual file or via the times() system call. Runtimes, monitoring agents (like Datadog), and CLI tools (like top) must divide these raw kernel ticks by the value returned by sysconf(_SC_CLK_TCK)—which is almost always hardcoded to 100 on modern Linux—to accurately compute actual CPU utilization percentages and process runtimes in human-readable seconds."}
x << {limit: "COLL_WEIGHTS_MAX", 
      descr: "maximum number of weights that can be assigned to an entry of the LC_COLLATE order keyword in the locale definition file", 
      name_arg: "_SC_COLL_WEIGHTS_MAX",
      long_descr: "COLL_WEIGHTS_MAX (_SC_COLL_WEIGHTS_MAX) defines the maximum number of comparison passes (weights) used by system string-matching functions like strcoll() to sort text according to human language rules rather than raw binary ASCII codes (ord) [The Open Group]. While binary sorting simply compares byte values, human-centric sorting requires multi-stage logic defined in the LC_COLLATE locale file. For example, a system might need three separate passes (weights) to determine that the German letter ä should be grouped near a on the first pass, distinguished from a on the second pass, and validated for capitalization (like ä vs Ä) on the third. This constant caps the number of these evaluation stages—mandating a minimum of 2 by POSIX/XSI but expanding to 255 on modern Linux—to protect libc string sorters from memory exhaustion or infinite loops when evaluating deeply nested sorting rules [The Open Group]."}
x << {limit: "DELAYTIMER_MAX", 
      descr: "maximum number of timer expiration overruns", 
      name_arg: "_SC_DELAYTIMER_MAX",
      long_descr: "DELAYTIMER_MAX (_SC_DELAYTIMER_MAX) defines the maximum number of missed timer ticks (overruns) that the kernel can queue for a high-precision POSIX timer before it stops counting them [The Open Group]. Imagine a Go/Ruby real-time microservice that uses a kernel timer to process data every 1 millisecond. If your worker thread suddenly blocks for 50 milliseconds while executing a heavy Leetcode-style algorithmic task, the timer will fire 50 times during that freeze. To prevent flooding the system with 50 duplicate signals, the kernel compresses them into a single wake-up call and increments an internal \"overrun counter.\" This constant sets the ceiling for that counter—guaranteed to be at least 32 by POSIX/XSI but often much higher—ensuring that if a process experiences massive lag, excess missed ticks are safely dropped without crashing the kernel's memory tracking [The Open Group]."}
x << {limit: "HOST_NAME_MAX", 
      descr: "maximum length of a host name as returned by gethostname", 
      name_arg: "_SC_HOST_NAME_MAX",
      long_descr: "HOST_NAME_MAX (_SC_HOST_NAME_MAX) defines the maximum length of a system's network name (hostname) in bytes, excluding the terminating null character [The Open Group]. The operating system kernel utilizes this limit to reserve a fixed-size byte array within its internal system identification structures (such as the nodename field in struct utsname). While the POSIX/XSI standard mandates a baseline threshold of at least 255 bytes [The Open Group], the Linux kernel historically hardcodes this boundary to a strict 64 bytes. In daily operations, this limit directly affects DevOps engineering and infrastructure deployment: if a container orchestrator (like Kubernetes) or a Ruby/Go network script attempts to assign a long, auto-generated FQDN using the sethostname() system call, any string exceeding 64 characters will trigger an EINVAL (Invalid argument) error or be abruptly truncated by the kernel."}
x << {limit: "IOV_MAX", 
      descr: "maximum number of iovec structures that can be used with readv or writev", 
      name_arg: "_SC_IOV_MAX",
      long_descr: "IOV_MAX (_SC_IOV_MAX) defines the maximum number of elements allowed in an iovec array when performing vector (scatter-gather) I/O operations via system calls like readv() or writev() [The Open Group]. An iovec is a fundamental two-field C-structure containing a memory address pointer (iov_base) and a byte length (iov_len), which essentially describes a single disconnected chunk of data in User Space. Instead of spending CPU cycles and allocating RAM to combine hundreds of text slices into one contiguous string (like running array.join in Ruby or pre-allocating a large byte slice in Go), you package these chunks into an array of iovec structures and hand them over to the kernel in a single atomic system call. This constant restricts the array's size—guaranteeing a minimum of 16 by POSIX/XSI but expanding to 1024 on modern Linux and macOS [The Open Group]—meaning that if your high-throughput Go or Ruby server passes 1025 text chunks to a socket at once, the system call will immediately reject the operation with an EINVAL (Invalid argument) error."}
x << {limit: "LINE_MAX", 
      descr: "maximum length of a utility's input line", 
      name_arg: "_SC_LINE_MAX",
      long_descr: "LINE_MAX (_SC_LINE_MAX) defines the maximum length of a utility’s input line in bytes, including the newline character (\\n), that standard UNIX command-line tools (such as grep, sed, or awk) are guaranteed to process without failing [The Open Group]. Historically, this limit forced developers to allocate fixed-size memory buffers in User Space, protecting the program's stack from overflowing when reading text streams. While the POSIX/XSI standard requires a minimum baseline of 2048 bytes, modern GNU utilities on Linux dynamically reallocate memory under the hood (getline) and can handle lines of almost any size, making this constant a legacy compatibility guarantee [The Open Group]. In practice, if you feed a continuous stream of data containing a huge line (e.g., millions of characters without a single \\n) into an old, strict compliance utility, the program will abruptly truncate the input or crash with a buffer overflow error."}
x << {limit: "LOGIN_NAME_MAX", 
      descr: "maximum length of a login name", 
      name_arg: "_SC_LOGIN_NAME_MAX",
      long_descr: ""}
x << {limit: "NGROUPS_MAX", 
      descr: "maximum number of simultaneous supplementary process group IDs per process", 
      name_arg: "_SC_NGROUPS_MAX",
      long_descr: "NGROUPS_MAX (_SC_NGROUPS_MAX) defines the maximum number of supplementary group IDs that a single process can concurrently belong to in addition to its primary group [The Open Group]. The Unix kernel stores this list directly within its process credential tracking structures to perform rapid O(N) permission validations whenever an application initiates an open() or exec() system call [The Open Group]. While the POSIX/XSI standard mandates a historical baseline of at least 8 groups [The Open Group], modern Linux scaling expands this capacity up to 65,536. In production environments, this limit typically surfaces during enterprise LDAP or Active Directory integrations: if a user belongs to hundreds of corporate security groups and accesses files over an old NFSv3 share—which hardcodes an archaic internal protocol limit of 16 groups—the kernel will silently truncate the group array, causing the file system to reject access with an unexpected EACCES (Permission denied) error."}
x << {limit: "OPEN_MAX", 
      descr: "one more than the maximum value assigned to a newly created file descriptor", 
      name_arg: "_SC_OPEN_MAX",
      long_descr: "OPEN_MAX (_SC_OPEN_MAX) defines the maximum number of files and network sockets that a single process is permitted to keep open simultaneously [The Open Group]. The Unix kernel enforces this limit by restricting the size of the process's internal file descriptor table, where each integer index (starting at 0 for stdin, 1 for stdout, 2 for stderr) points to an open file structure. While the historical POSIX/XSI baseline requires a minimum of just 20 [The Open Group], modern Linux systems default to a soft limit of 1024 and a hard limit of 4096 (configurable via ulimit -n). As a Go or Ruby developer, you will encounter this boundary under heavy network traffic: if a high-performance web server (like Puma or a Go HTTP multiplexer) accepts massive concurrent TCP connections without closing them fast enough, the accept() or open() system calls will immediately fail, crashing with the classic EMFILE: Too many open files error."}
x << {limit: "PAGESIZE", 
      descr: "system memory page size, in bytes", 
      name_arg: "_SC_PAGESIZE",
      long_descr: "PAGESIZE (_SC_PAGESIZE) defines the size of a system memory page in bytes, which represents the smallest fixed-length block of virtual memory allocated by the kernel [The Open Group]. On modern x86_64 and ARM64 architectures running Linux or macOS, this value is almost universally hardcoded to 4096 bytes (4 KB). The operating system handles memory management, paging, and disk I/O caching strictly in blocks of this size rather than individual bytes. In Go and Ruby runtimes, low-level memory allocators and tools leverage this constant to align data structures along page boundaries and manage memory mappings via the mmap() system call, which significantly minimizes CPU translation lookaside buffer (TLB) cache misses and accelerates overall execution speed."}
x << {limit: "PAGE_SIZE", 
      descr: "system memory page size, in bytes", 
      name_arg: "_SC_PAGE_SIZE",
      long_descr: "PAGE_SIZE (_SC_PAGE_SIZE) is an absolute synonym for PAGESIZE, defining the size of a system memory page in bytes (universally 4096 bytes or 4 KB on modern x86_64/ARM64 architectures) [The Open Group]. The existence of both names is a historical artifact for cross-platform compatibility: PAGESIZE is the official standard mandated by POSIX, while PAGE_SIZE emerged from the XSI, BSD, and System V Unix lineages. To prevent developers from writing platform-specific conditional code (#ifdef), modern system libraries (libc) and the sysconf utility support both tokens interchangeably to yield the identical value. Understanding this system page dimension is critical in Go and Ruby for low-level memory performance, as the kernel maps virtual memory, handles disk caches, and executes memory-backed system calls like mmap() exclusively in blocks aligned to this specific byte threshold."}
x << {limit: "RE_DUP_MAX", 
      descr: "number of repeated occurrences of a basic regular expression permitted by the regexec and regcomp functions when using the interval notation \{m,n\}", 
      name_arg: "_SC_RE_DUP_MAX",
      long_descr: ""}
x << {limit: "RTSIG_MAX", 
      descr: "maximum number of real-time signals reserved for application use", 
      name_arg: "_SC_RTSIG_MAX",
      long_descr: ""}
x << {limit: "SEM_NSEMS_MAX", 
      descr: "maximum number of semaphores a process can use at one time", 
      name_arg: "_SC_SEM_NSEMS_MAX",
      long_descr: ""}
x << {limit: "SEM_VALUE_MAX", 
      descr: "maximum value of a semaphore", 
      name_arg: "_SC_SEM_VALUE_MAX",
      long_descr: ""}
x << {limit: "SIGQUEUE_MAX", 
      descr: "maximum number of signals that can be queued for a process", 
      name_arg: "_SC_SIGQUEUE_MAX",
      long_descr: ""}
x << {limit: "STREAM_MAX", 
      descr: "maximum number of standard I/O streams per process at any given time; if defined, it must have the same value as FOPEN_MAX", 
      name_arg: "_SC_STREAM_MAX",
      long_descr: ""}
x << {limit: "SYMLOOP_MAX", 
      descr: "number of symbolic links that can be traversed during pathname resolution", 
      name_arg: "_SC_SYMLOOP_MAX",
      long_descr: ""}
x << {limit: "TIMER_MAX", 
      descr: "maximum number of timers per process", 
      name_arg: "_SC_TIMER_MAX",
      long_descr: ""}
x << {limit: "TTY_NAME_MAX", 
      descr: "length of a terminal device name, including the terminating null", 
      name_arg: "_SC_TTY_NAME_MAX",
      long_descr: ""}
x << {limit: "TZNAME_MAX", 
      descr: "maximum number of bytes for a time zone name", 
      name_arg: "_SC_TZNAME_MAX",
      long_descr: ""}
################################
print data.to_yaml
