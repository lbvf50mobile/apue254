task default: %w[html]

task :server do
  sh "./server.rb"
end

task html: %w[docs/index.html docs/212.html]

file 'fig2.11.yaml' => %w[yaml_generator.rb] do 
  sh "./yaml_generator.rb > fig2.11.yaml"
end

file 'fig2.12.yaml' => %w[yaml_generator212.rb] do 
  sh "./yaml_generator212.rb > fig2.12.yaml"
end

file 'docs/index.html' => %w[html_generator.rb fig2.11.yaml] + FileList['tmplt/*.erb'] do |t|
  sh "./html_generator.rb fig2.11.yaml > #{t.name}"
end

file 'docs/212.html' => %w[html_generator212.rb fig2.12.yaml] + FileList['tmplt/*.erb'] do |t|
  sh "./html_generator212.rb fig2.12.yaml > #{t.name}"
end


# docs
# fig2.11.yaml
# html_generator212.rb
# html_generator.rb
# llm_google.env
# llm_urls.env
# Rakefile
# README.md
# server.rb
# tmplt
# yaml_generator212.rb
# yaml_generator.rb


