module Subscriptions
  module Confirm

    extend self

    def call(twilio_response_params)
      body = twilio_response_params["Body"]
      return unless body.strip.downcase == "confirm"

      from_phone_number = twilio_response_params["From"]
      # TODO: update all subscriptions with this phone number to active
      # safe since the user has proven they own this number
      # subscription = Subscription.find_by(phone_number: from_phone_number)
      # return unless subscription
      # subscription.active! # TODO: use tap
      # subscription
      subscriptions = Subscription.where(phone_number: from_phone_number)
      subscriptions.update_all(activation_state: :active)
      subscriptions
    end

  end
end
