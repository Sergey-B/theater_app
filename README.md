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

## Thanks

* [Step-by-step](http://dry-web-roda-todo-app.readthedocs.io/en/latest) guide building an app with dry-web-roda.
* [dry-rb/workshop-app](https://github.com/dry-rb/workshop-app)
* [dry-web-blog](https://github.com/dry-rb/dry-web-blog)
* [icelab.com.au](https://github.com/icelab/berg) This site is the precursor of [dry-web-roda](https://github.com/dry-rb/dry-web-roda), it could be using old versions of some gems, but still is a great site to read code and learn.
