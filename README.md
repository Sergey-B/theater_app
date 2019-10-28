[![Build Status](https://travis-ci.org/Sergey-B/theater_app.svg?branch=master)](https://travis-ci.org/Sergey-B/theater_app)

# TheaterApp

TheaterApp example app built with [dry-web-roda](https://github.com/dry-rb/dry-web-roda).

## First steps

1. Run `bundle`
2. Review `.env` & `.env.test` (and make a copy to e.g. `.example.env` if you want example settings checked in)
3. Run `bundle exec rake db:create` to create the development database.
4. Run `RACK_ENV=test bundle exec rake db:create` to create the test database.
5. Add your own steps to `bin/setup`
6. Run the app with `bundle exec rerun -- rackup --port 4000 config.ru`
7. Initialize git with `git init` and make your initial commit
