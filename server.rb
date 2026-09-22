#!/usr/bin/env ruby

require 'webrick'

server = WEBrick::HTTPServer.new(
  Port: 8080,
  DocumentRoot: './docs'
)
trap('INT'){ server.shutdown}
server.start
