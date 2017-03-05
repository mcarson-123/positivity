class SharedMessagesController < ApplicationController

  def new
    @shared_message = SharedMessage.new
    positive_message_ids = PositiveMessages::GrabRandomMessages.call(count: 3)
    @positive_messages = PositiveMessage.find(positive_message_ids)
  end

  def create
    @shared_message = SharedMessages::Create.call(message_params)
    redirect_to "/share_success"
  end

  private

  def message_params
    params.require(:shared_message)
          .permit(:phone_number, :phone_number_country_code, :sender_name, :positive_message_id)
  end

end
