source "https://rubygems.org"

gem 'rails', '~> 7.0'
gem "propshaft"
gem "sqlite3", ">= 2.1"
gem "puma", ">= 5.0"
gem "importmap-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "jbuilder"
gem "simple_form"
gem "tzinfo-data", platforms: %i[ windows jruby ]
gem "solid_cache"
gem "solid_queue"
gem "solid_cable"
gem "chartkick"
gem "groupdate"
gem "bootsnap", require: false
gem "kamal", require: false
gem "thruster", require: false
gem "sidekiq"
gem 'sidekiq-scheduler'
gem 'redis'
gem 'devise'

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem "image_processing", "~> 1.2"

group :development, :test do
  gem "debug", platforms: %i[ mri windows ], require: "debug/prelude"
  gem "brakeman", require: false
  gem "rubocop-rails-omakase", require: false
end

group :development do
  gem "web-console"
  gem "byebug"
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
end
