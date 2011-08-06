# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

City.destroy_all
id = City.create!(:name => 'sf', :title => 'San Francisco, CA').id
City.create! :name => 'la', :title => 'Los Angeles, CA'
City.create! :name => 'austin', :title => 'Austin, TX'

Event.destroy_all
Event.create! :name => 'Bay 2 Breakers', :url => 'http://baytobreakers.com',
  :city_id => id, :start_at => Time.now, :stop_at => Time.now, :approved_at => Time.now
Event.create! :name => 'Pride Parade', :url => 'http://sfprideparade.com',
  :city_id => id, :start_at => Time.now, :stop_at => Time.now, :approved_at => Time.now
Event.create! :name => 'Fillmore Jazz Festival', :url => 'http://fillmorejazzfest.com',
  :city_id => id, :start_at => Time.now, :stop_at => Time.now, :approved_at => Time.now
Event.create! :name => 'Cherry Blosson Festival', :url => 'http://cherryblossom.com',
  :city_id => id, :start_at => Time.now, :stop_at => Time.now, :approved_at => Time.now
