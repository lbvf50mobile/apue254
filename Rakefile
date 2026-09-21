task default: %w[html]

task :server do
  sh "./server.rb"
end

task html: %w[src/index.html]

file 'fig2.11.yaml' => %w[yaml_generator.rb] do 
  sh "./yaml_generator.rb > fig2.11.yaml"
end

file 'src/index.html' => %w[html_generator.rb fig2.11.yaml] + FileList['tmplt/*.erb'] do
  sh './html_generator.rb fig2.11.yaml > src/index.html' 
end

# fig2.11.yaml
# html_generator.rb
# Rakefile
# README.md
# server.rb
# src
# tmplt
# yaml_generator.rb



