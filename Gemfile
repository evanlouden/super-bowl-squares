source "https://rubygems.org"

ruby "3.4.7"

gem "cssbundling-rails"
gem "devise", "~> 4.9"
gem "jsbundling-rails"
gem "mailgun-ruby", "~> 1.4"
gem "pg", "~> 1.6"
gem "puma", ">= 5.0"
gem "rails", "~> 7.1.3"
gem "redis", ">= 4.0.1"
gem "sprockets-rails"
gem "stimulus-rails"
gem "turbo-rails"
gem "view_component", "~> 4.2"

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
# gem "bcrypt", "~> 3.1.7"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[ windows jruby ]

gem "bootsnap", require: false

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "debug", platforms: %i[ mri windows ]
  gem "pry-rails", "~> 0.3.11"
  gem "rspec-rails", "~> 7.1"
end

group :development do
  # Use console on exceptions pages [https://github.com/rails/web-console]
  gem "web-console"
  gem "hotwire-livereload", "~> 1.3"
end
