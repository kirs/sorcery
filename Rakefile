# require 'bundler'
# -- Commented because it's slow
# begin
#   Bundler.setup(:default, :development)
# rescue Bundler::BundlerError => e
#   $stderr.puts e.message
#   $stderr.puts "Run `bundle install` to install missing gems"
#   exit e.status_code
# end
# --

require 'bundler'
require 'bundler/setup'

# require 'rake'

require 'jeweler'
Jeweler::Tasks.new do |gem|
  # gem is a Gem::Specification... see http://docs.rubygems.org/read/chapter/20 for more options
  gem.name = "sorcery"
  gem.homepage = "http://github.com/NoamB/sorcery"
  gem.license = "MIT"
  gem.summary = "Magical authentication for Rails 3 applications"
  gem.description = "Provides common authentication needs such as signing in/out, activating by email and resetting password."
  gem.email = "nbenari@gmail.com"
  gem.authors = ["Noam Ben Ari"]
  # Include your dependencies below. Runtime dependencies are required when using your gem,
  # and development dependencies are only needed for development (ie running rake tasks, tests, etc)
  #  gem.add_runtime_dependency 'jabber4r', '> 0.1'
  #  gem.add_development_dependency 'rspec', '> 1.2.3'
end
Jeweler::RubygemsDotOrgTasks.new

require 'rspec/core'
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec) do |spec|
  # spec.pattern = FileList['spec/**/*_spec.rb']
end

require 'yard'
YARD::Rake::YardocTask.new

desc 'Default: Run all sorcery specs.'
task :default => :spec

desc "Run all sorcery specs"
task :all_sorcery_specs do
  # we need to be empty, otherwise bundler will use parent bundler.
  env = {
    'BUNDLE_GEMFILE' => nil,
    'GEM_HOME'       => nil
  }
  Dir['spec/**/Rakefile'].each do |rakefile|
    directory_name = File.dirname(rakefile)
    system(env, "cd #{directory_name} && bundle && bundle exec rake")
    abort unless $?.success?
  end
end

desc "Bundle all folders"
task :bundle do
  sh "bundle"
  Dir['spec', 'spec/**'].each do |dir|
    if Dir.exists?(dir) && File.exists?(dir + "/Gemfile")
      sh <<-CMD
        cd #{dir}
        bundle
      CMD
    end
  end
end

desc "Bundle update all folders"
task :bundle_update do
  sh "bundle update"
  Dir['spec', 'spec/**'].each do |dir|
    if Dir.exists?(dir) && File.exists?(dir + "/Gemfile")
      sh <<-CMD
        cd #{dir}
        bundle update
      CMD
    end
  end
end
