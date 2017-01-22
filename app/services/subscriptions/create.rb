module Subscriptions
  module Create

    extend self

    def call(params)
      params = Subscriptions::CoercePhoneNumberParams.call(params)
      subscription = Subscription.create(params.merge(frequency: :daily))

      ReplenishMessageQueueJob.perform_async(subscription)

      # Send confirmation text
      TwilioClient.messages.create(
        from: ENV.fetch("TWILIO_PHONE_NUMBER"),
        to: subscription.phone_number,
        body: %(Thanks for signing up! Reply "confirm" to start your positive messages)
      )
    end
  end
end
