# Define your factories here, e.g.
#
Factory.define :theater_performance do |f|
  f.sequence(:id) { |i| i }
  f.name { fake(:lorem, :words, 10) }
  f.start_date { fake(:date, :forward, 1.day) }
  f.end_date { fake(:date, :forward, 10.days) }
end
#
# See https://github.com/rom-rb/rom-factory for more.
