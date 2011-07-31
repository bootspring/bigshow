class Event < ActiveRecord::Base
  belongs_to :city
  validates :name, :presence => true, :length => 5..64
  validates :url, :presence => true, :format => { :with => URI.regexp(%w(http https)) }
end
