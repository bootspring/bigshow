require 'test_helper'

class EventTest < ActiveSupport::TestCase
  def teardown
    ActionMailer::Base.deliveries.clear
  end

  test 'sends email upon approval' do
    e = events(:pp)
    e.approved_at = Time.now
    e.save!

    assert_equal 0, ActionMailer::Base.deliveries.size

    e = events(:pp)
    e.email = 'mike@example.com'
    e.approved_at = Time.now
    e.save!

    assert_equal 1, ActionMailer::Base.deliveries.size
    assert_equal ['mike@example.com'], ActionMailer::Base.deliveries[0].to
  end

  test 'sends an email upon submission' do
    e = Event.create! :city => cities(:sf), :name => 'FooBar', 
      :url => 'http://potato.com', :email => "test@example.com",
      :start_at => 14.days.from_now, :stop_at => 15.days.from_now
    assert_equal 1, ActionMailer::Base.deliveries.size
    assert_equal ['mperham@gmail.com'], ActionMailer::Base.deliveries[0].to
    body = ActionMailer::Base.deliveries[0].body
    assert_match body, /FooBar/
    assert_match body, /test\@example\.com/
    assert_match body, /Approve/
  end
end
