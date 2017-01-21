module Subscriptions
  class ReplenishMessageQueueJob
    include SuckerPunch::Job

    def perform(subscription_id)
      # Because we're using SuckerPunch, ensure the connection is returned
      # back to the pool at job completion
      ActiveRecord::Base.connection_pool.with_connection do
        subscription = Subscription.find(subscription_id)
        ReplenishMessageQueue.call(subscription)
      end
    end

  end
end
