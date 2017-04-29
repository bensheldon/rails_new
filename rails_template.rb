# ~/rails_template.rb

gem_group :test do
  gem "launchy", require: false
end

gem_group :development, :test do
  gem "capybara"
  gem "factory_girl_rails"
  gem "pry-rails"
  gem "rspec-rails"
end

run_bundle

run "touch app/assets/stylesheets/application.scss"
run "rm app/assets/stylesheets/application.css"

generate "rspec:install"
