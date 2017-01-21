module Subscriptions
  module Confirm

    extend self

    def call(twilio_response_params)
      body = twilio_response_params["Body"]
      return unless body.strip.downcase == "confirm"

      from_phone_number = twilio_response_params["From"]
      subscriptions = Subscription.where(phone_number: from_phone_number)
      subscriptions.update_all(activation_state: Subscription::ActivationState::ACTIVE)
      subscriptions
    end

  end
end
