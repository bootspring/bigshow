class Event < ActiveRecord::Base
  belongs_to :city
  validates :name, :presence => true, :length => 5..64
  validates :url, :presence => true, :format => { :with => URI.regexp(%w(http https)) }

  after_save :send_approval_email, :if => lambda { email && approved_at_changed? && approved_at }

  def send_approval_email
    EMAIL_DELIVERY << EventMailer.publish_email(self)
  end
end
