class TwilioController < ApplicationController
  before_action :ensure_twilio_sender

  def incoming_message
    body = params["Body"]
    case body.strip.downcase
    when "confirm"
      @subscription = Subscriptions::Confirm.call(params)
      if @subscription.try(:active?)
        respond = true
        message = \
        %(Thanks for confirming, positive messages are coming your way soon...
Text STOP to unsubscribe.)
      end
    when "stop"
      @subscriptions = Subscriptions::Unsubscribe.call(params, from_twilio: true)
      # Can't respond with a message since twilio won't send messages after
      # receiving a "STOP"
    when "start"
      @subscription = Subscriptions::Confirm.call(params)
      if @subscription.try(:active?)
        respond = true
        message = "Welcome back! Positive messages are coming your way soon..."
      end
    end

    if respond
      twiml = Twilio::TwiML::Response.new do |r|
        r.Message message
      end
      render xml: twiml.text and return
    end

    # Else need to let Twilio know there is nothing to do
    head :no_content
  end

  private

  def ensure_twilio_sender
    unless params["AccountSid"] == ENV["TWILIO_ACCOUNT_SID"]
      render json: { errors: { request: ["Source may not confirm Subscription"] } }, status: :forbidden
    end
  end
end
