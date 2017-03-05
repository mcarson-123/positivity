# == Schema Information
#
# Table name: shared_messages
#
#  id                  :integer          not null, primary key
#  sender_name         :string
#  phone_number        :string
#  positive_message_id :integer
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

class SharedMessage < ActiveRecord::Base

  #---------------------------------------------------------
  # Relationships
  #---------------------------------------------------------

  belongs_to :positive_message

end
