require 'rake/docker_lib'
require 'rake/compile_go'

output='.target/www'

namespace :hugo do
  desc "build hugo binary"
  task :bin do
    sh "docker run deliverous/gobuild 'http://github.com/spf13/hugo;github.com/spf13/hugo;' | tar -x"
  end
end

namespace :pelican do
  desc "Build html for local test"
  task :html do
    sh 'pelican', 'content', '-o', output, '-s', 'pelicanconf.py', '--cache-path', '.target/cache'
  end

  desc "Build html for publish target"
  task :publish do
    sh 'pelican', 'content', '-o', output, '-s', 'publishconf.py', '--cache-path', '.target/cache'
  end

  desc "Start pelican development server"
  task :start => "pelican:html" do
    sh "cd #{output} && python -m pelican.server 8000 2>&1 &"
  end

  desc "Stop pelican development server"
  task :stop do
    sh "pkill -f pelican.server"
  end 
end

namespace :docker do
  Rake::DockerLib.new("tclavier/blog") do
  end

  task :prepare => "pelican:publish"

  desc "Run container for live test"
  task :run => ['docker:build', 'docker:stop'] do
    sh "docker run --name blog -d -p 8000:80 tclavier/blog"
  end

  desc "Stop container"
  task :stop do
    `docker stop blog ; docker rm blog`
  end
end
