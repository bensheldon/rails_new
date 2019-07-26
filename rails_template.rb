# Ensure copy_file actions have this dir as a source path
source_paths.unshift(File.dirname(__FILE__))

ruby_version = File.read(File.join(File.dirname(__FILE__), ".ruby-version")).strip
create_file '.ruby-version', ruby_version

inject_into_file 'Gemfile', after: "source 'https://rubygems.org'\n" do
  <<~RUBY
    ruby_version = File.read(File.join(File.dirname(__FILE__), ".ruby-version")).strip
    ruby ruby_version
  RUBY
end

gem "pry-rails"

gem_group :test do
  gem "capybara"
  gem 'capybara-email'
  gem "factory_bot_rails"
  gem "launchy", require: false
  gem "webmock"
end

gem_group :development, :test do
  gem "rspec-rails"
  gem "faker"
end

gem_group :development do
  gem "annotate"
  gem "eefgilm"
  gem "spring-commands-rspec"
  gem "spring-watcher-listen"
end

copy_file "config/secrets.yml"
run "touch app/assets/stylesheets/application.scss"
run "rm app/assets/stylesheets/application.css"

run "bin/rails g rspec:install"
copy_file "spec/support/capybara_email.rb"
copy_file "spec/support/factory_bot.rb"
copy_file "spec/support/system.rb"
copy_file "spec/support/webmock.rb"
run "yes | bin/rails app:update:bin"
run "bundle exec eefgilm"
