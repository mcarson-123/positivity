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

require 'rails_helper'

RSpec.describe SharedMessage, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
