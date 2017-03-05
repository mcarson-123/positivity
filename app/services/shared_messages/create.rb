module SharedMessages
  module Create

    extend self

    def call(params)
      params = Subscriptions::CoercePhoneNumberParams.call(params)
      shared_message = SharedMessage.create(params)

      TwilioClient.messages.create(
        from: ENV.fetch("TWILIO_PHONE_NUMBER"),
        to: shared_message.phone_number,
        body: "From #{shared_message.sender_name}: #{shared_message.positive_message.message_text}. Visit www.imaginewhirledpeas.com to share positivity with others."
      )
    end
  end
end
