require 'bundler'
Bundler::GemHelper.install_tasks

require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec)

# We define a custom_spec that is default because it depends on the spec:prepare_fixtures task
# This way, CI servers should execute the spec:prepare_fixtures before the spec task, allowing all specs to pass!
task :custom_spec => "spec:prepare_fixtures" do
  `rake spec`
end
task :default => :custom_spec

namespace :spec do

  desc "Run all specs on multiple ruby versions (requires rvm)"
  task(:portability) do
    travis_config_file = File.expand_path("../.travis.yml", __FILE__)
    begin
      travis_options ||= YAML::load_file(travis_config_file)
    rescue => ex
      puts "Travis config file '#{travis_config_file}' could not be found: #{ex.message}"
      return
    end

    travis_options['rvm'].each do |version|
      system <<-BASH
        bash -c 'source ~/.rvm/scripts/rvm;
                 rvm #{version};
                 ruby_version_string_size=`ruby -v | wc -m`
                 echo;
                 for ((c=1; c<$ruby_version_string_size; c++)); do echo -n "="; done
                 echo;
                 echo "`ruby -v`";
                 for ((c=1; c<$ruby_version_string_size; c++)); do echo -n "="; done
                 echo;
                 bundle install;
                 bundle exec rspec spec -f doc 2>&1;'
      BASH
    end
  end

end
