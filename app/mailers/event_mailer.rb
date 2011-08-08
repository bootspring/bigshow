class EventMailer < ActionMailer::Base
  default from: "support@whatsupnextweek.com"
  default_url_options[:host] = "whatsupnextweek.com"

  def publish_email(event)
    @event = event
    mail to: event.email, subject: "[WUNW] '#{event.name}' approved!"
  end

  def submitted_email(event)
    @event = event
    mail to: 'mperham@gmail.com', subject: "[WUNW] '#{event.name}' submitted"
  end
end
