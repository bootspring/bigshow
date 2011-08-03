class EventMailer < ActionMailer::Base
  default from: "support@whatsupnextweek.com"

  def publish_email(event)
    @event = event
    mail  to: event.email, subject: "[WUNW] '#{event.name}' approved!"
  end
end
