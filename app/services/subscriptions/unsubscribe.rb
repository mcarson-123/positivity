module Subscriptions
  module Unsubscribe
    extend self

    def call(params)
      params = Subscriptions::CoercePhoneNumberParams.call(params)

      subscriptions = Subscription.where(phone_number: params[:phone_number])
      subscriptions.update_all(activation_state: Subscription::ActivationState::INACTIVE)
      subscriptions
    end
  end
end
