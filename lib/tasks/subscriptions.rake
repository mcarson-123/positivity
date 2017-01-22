namespace :subscriptions do

  desc "Send daily subscription messages"
  task send_daily_messages: :environment do
    Subscription.active.daily.find_each do |subscription|
      Subscriptions::SendMessage.call(subscription)
    end
  end

  desc "Send weekly subscription messages"
  task send_weekly_messages: :environment do
    Subscription.active.weekly.find_each do |subscription|
      Subscriptions::SendMessage.call(subscription)
    end
  end
end
