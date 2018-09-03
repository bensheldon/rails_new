# ~/rails_template.rb

gem "pry-rails"

gem_group :test do
  gem "capybara"
  gem "factory_bot_rails"
  gem "launchy", require: false
end

gem_group :development, :test do
  gem "rspec-rails"
  gem "faker"
end

gem_group :development do
  gem "annotate"
  gem "eefgilm"
  gem "spring-commands-rspec"
end

run "touch app/assets/stylesheets/application.scss"
run "rm app/assets/stylesheets/application.css"

run "rails g rspec:install"
run "rake app:updates:bin"
run "eefgilm" # cleanup the Gemfile
