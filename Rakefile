task default: %w[html]

task :server do
  sh "./server.rb"
end

task html: %w[docs/index.html]

file 'fig2.11.yaml' => %w[yaml_generator.rb] do 
  sh "./yaml_generator.rb > fig2.11.yaml"
end

file 'docs/index.html' => %w[html_generator.rb fig2.11.yaml] + FileList['tmplt/*.erb'] do |t|
  sh "./html_generator.rb fig2.11.yaml > #{t.name}"
end

# fig2.11.yaml
# html_generator.rb
# Rakefile
# README.md
# server.rb
# src
# tmplt
# yaml_generator.rb



