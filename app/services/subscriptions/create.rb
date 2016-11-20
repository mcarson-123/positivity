module Subscriptions
  module Create

    extend self

    def call(params)
      sub = Subscription.create(params)
      # Send confirmation text
      TwilioClient.messages.create(
        from: ENV.fetch("TWILIO_PHONE_NUMBER"),
        to: sub.phone_number,
        body: %(Thanks for signing up! Reply "confirm" to start your positive messages)
      )
    end
  end
end
