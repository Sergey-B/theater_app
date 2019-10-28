source "https://rubygems.org"

gem "rake"

# Web framework
gem "dry-system", "~> 0.9"
gem "dry-web", "~> 0.7"
gem "dry-web-roda", "~> 0.11"
gem "puma"
gem "rack_csrf"

gem "rack", ">= 2.0"

# Database persistence
gem "pg"
gem "rom", "~> 4.0"
gem "rom-sql", "~> 2.1"

# Application dependencies
gem "dry-matcher", "~> 0.7"
gem "dry-monads", "~> 1.2"
gem "dry-struct", "~> 0.3"
gem "dry-transaction", "~> 0.13"
gem "dry-types", "~> 0.12"
gem "dry-validation", "~> 0.11"
gem "dry-view", "~> 0.7"
gem "slim"

gem "activesupport", "~> 5.0.0"
gem "shotgun"

group :development, :test do
  gem "pry-byebug", platform: :mri
  gem "rb-readline"
end

group :development do
  gem "rerun"
end

group :test do
  gem "database_cleaner"
  gem "poltergeist"
  gem "rspec"
  gem "rom-factory", "~> 0.5"
end
