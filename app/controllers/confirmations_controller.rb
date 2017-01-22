class ConfirmationsController < ApplicationController
  before_action :ensure_twilio_sender, only: :confirm

  def confirm
    @subscriptions = Subscriptions::Confirm.call(params)
    if @subscriptions.any? { |subscription| subscription.active? }
      twiml = Twilio::TwiML::Response.new do |r|
        r.Message "Thanks for confirming, positive messages are coming your way soon..."
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
