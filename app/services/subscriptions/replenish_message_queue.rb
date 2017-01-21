module Subscriptions
  module ReplenishMessageQueue
    extend self

    def call(subscription)
      subscription.message_queue += PositiveMessages::GrabRandomMessages.call
      # Further try to prevent user receiving the same message in a row
      subscription.message_queue.uniq!
      subscription.save
    end
  end
end
