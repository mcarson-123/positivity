module Subscriptions
  module CoercePhoneNumberParams
    extend self

    def call(params)
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
