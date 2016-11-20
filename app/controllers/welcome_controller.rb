class WelcomeController < ApplicationController

  def welcome
    @subscription = Subscription.new
  end

end
