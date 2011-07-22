# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

id = City.create!(:name => 'sanfran', :title => 'San Francisco, CA').id
City.create! :name => 'austin', :title => 'Austin, TX'
City.create! :name => 'dallas', :title => 'Dallas, TX'
City.create! :name => 'houston', :title => 'Houston, TX'
City.create! :name => 'portland', :title => 'Portland, OR'
City.create! :name => 'seattle', :title => 'Seattle, WA'

Event.create! :name => 'Bay 2 Breakers',
  :url => 'http://baytobreakers.com',
  :description => 'Annual run across the peninsula',
  :city_id => id,
  :start_at => Time.local(2011, 05, 26, 7, 0, 0),
  :stop_at => Time.local(2011, 05, 26, 12, 0, 0)
