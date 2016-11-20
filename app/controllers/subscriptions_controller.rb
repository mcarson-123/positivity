class SubscriptionsController < ApplicationController

  def new
    @subscription = Subscription.new
  end

  def create
    @subscription = Subscriptions::Create.call(create_subscription_params)
    redirect_to :root
  end

  private

  def create_subscription_params
    params.require(:subscription).permit(:name, :phone_number, :phone_number_country_code)
  end

end
