EMAIL_DELIVERY = GirlFriday::Queue.new(:email, :size => 3) do |msg|
  msg.deliver
end
