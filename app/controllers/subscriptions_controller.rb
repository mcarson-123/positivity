class SubscriptionsController < ApplicationController

  def new
    @subscription = Subscription.new
  end

  def create
    @subscription = Subscriptions::Create.call(subscription_params)
    redirect_to "/success"
  end

  def edit
  end

  def unsubscribe
    @subscriptions = Subscriptions::Unsubscribe.call(subscription_params)
    redirect_to "/unsubscribed"
  end

  private

  def subscription_params
    params.require(:subscription).permit(:phone_number, :phone_number_country_code)
  end

end
