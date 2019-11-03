# frozen_string_literal: true

# Define your factories here, e.g.
#
Factory.define :theater_performance do |f|
  f.sequence(:id) { |i| i }
  f.name { fake(:lorem, :words, 10) }
end
#
# See https://github.com/rom-rb/rom-factory for more.
