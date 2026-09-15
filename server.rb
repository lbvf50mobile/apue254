#!/usr/bin/env ruby

require 'webrick'

server = WEBrick::HTTPServer.new(
  Port: 8080,
  DocumentRoot: './src'
)
trap('INT'){ server.shutdown}
server.start
