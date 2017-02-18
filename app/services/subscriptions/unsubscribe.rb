module Subscriptions
  module Unsubscribe
    extend self

    def call(params, from_twilio: false)
      phone_number =
        if from_twilio
          params["From"]
        else # from confirmations controller
          Subscriptions::CoercePhoneNumberParams.call(params)["phone_number"]
        end

      subscriptions = Subscription.where(phone_number: phone_number)
      subscriptions.update_all(activation_state: Subscription::ActivationState::INACTIVE)
      subscriptions
    end
  end
end
