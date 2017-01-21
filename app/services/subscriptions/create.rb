module Subscriptions
  module Create

    extend self

    def call(params)
      params = coerce_params_for_phone_number(params)
      subscription = Subscription.create(params.merge(frequency: :daily))

      ReplenishMessageQueueJob.perform_async(subscription)

      # Send confirmation text
      TwilioClient.messages.create(
        from: ENV.fetch("TWILIO_PHONE_NUMBER"),
        to: subscription.phone_number,
        body: %(Thanks for signing up! Reply "confirm" to start your positive messages)
      )
    end

    private

    def coerce_params_for_phone_number(params)
      country_code = params.delete("phone_number_country_code")
      # Remove leading 0 if it is included
      country_code.sub!(/^0/, '')
      phone_number = params["phone_number"]
      # Remove dashes that were included for legibility
      phone_number.tr!("-", "")
      params[:phone_number] = "+#{country_code}#{phone_number}"
      params
    end
  end
end
