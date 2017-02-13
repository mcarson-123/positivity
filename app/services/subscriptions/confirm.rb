module Subscriptions
  module Confirm

    extend self

    def call(twilio_response_params)
      body = twilio_response_params["Body"]
      return unless body.strip.downcase == "confirm"

      from_phone_number = twilio_response_params["From"]
      # Only confirm most recent if there are multiple
      subscription = Subscription.where(phone_number: from_phone_number).last
      subscription.update(activation_state: Subscription::ActivationState::ACTIVE)
      subscription
    end

  end
end
