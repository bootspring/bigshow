require 'test_helper'

class EventTest < ActiveSupport::TestCase
  test 'sends email upon approval' do
    e = events(:one)
    e.approved_at = Time.now
    e.save!

    assert_equal 0, ActionMailer::Base.deliveries.size

    e = events(:two)
    e.email = 'mike@example.com'
    e.approved_at = Time.now
    e.save!

    assert_equal 1, ActionMailer::Base.deliveries.size
    assert_equal ['mike@example.com'], ActionMailer::Base.deliveries[0].to
  end
end
