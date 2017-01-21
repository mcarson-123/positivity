module Subscriptions
  module NextMessage
    extend self

    def call(subscription)
      message_count = subscription.message_queue.count
      case message_count
        when 0 # Need to replenish queue right away!
          ReplenishMessageQueue.call(subscription)
        when 1 # Can replenish queue asynchronously
          ReplenishMessageQueueJob.perform_async(subscription.id)
      end

      message = subscription.next_message

      return message if message

      # Small chance message was deleted from database since being
      # queued on subscription
      self.call(subscription)
    end

  end
end
