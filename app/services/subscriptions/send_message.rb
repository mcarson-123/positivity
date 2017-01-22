module Subscriptions
  module SendMessage

    extend self

    def call(subscription)
      TwilioClient.messages.create(
        from: ENV.fetch("TWILIO_PHONE_NUMBER"),
        to: subscription.phone_number,
        body: NextMessage.call(subscription).message_text
      )
    end
  end
end
