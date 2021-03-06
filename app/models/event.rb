class Event < ActiveRecord::Base
  belongs_to :city
  validates :name, :presence => true, :length => 5..64
  validates :url, :presence => true, :format => { :with => URI.regexp(%w(http https)) }

  after_save :send_approval_email, :if => :send_approval_email?
  after_create :send_submitted_email, :if => :send_submitted_email?

  scope :latest, { :conditions => ['approved_at is not null and start_at between ? and ?', Time.zone.today, Time.zone.today + 14] }
  scope :in_city, lambda { |id| { :conditions => { :city_id => id } } }

  def approve!
    self.approved_at = Time.now
    self.save!
  end

  def send_approval_email
    EMAIL_DELIVERY << EventMailer.publish_email(self)
  end

  def send_submitted_email
    EMAIL_DELIVERY << EventMailer.submitted_email(self)
  end

  def send_approval_email?
    email && email !~ /@whatsupnextweek\.com/ && approved_at_changed? && approved_at
  end

  def send_submitted_email?
    email && !approved_at
  end
end
