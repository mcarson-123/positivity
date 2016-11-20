module Subscriptions
  module Confirm

    extend self

    def call(twilio_response_params)
      body = twilio_response_params["Body"]
      return unless body.downcase == "confirm"

      from_phone_number = twilio_response_params["From"]
      subscription = Subscription.find_by(phone_number: from_phone_number)
      subscription.active!
      subscription
    end

  end
end
