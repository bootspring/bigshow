require 'test_helper'

class BasicBrowsingTest < ActionDispatch::IntegrationTest
  fixtures :all

  def setup
    Rails.cache.clear
  end

  test "city browsing" do
    get '/'
    assert_response :redirect
    follow_redirect!
    assert_response :success
    assert_select 'table#event_listing' do
      assert_select 'tr', 3
    end
  end
end
