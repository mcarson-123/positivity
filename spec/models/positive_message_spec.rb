# == Schema Information
#
# Table name: positive_messages
#
#  id            :integer          not null, primary key
#  message_text  :string
#  enabled_state :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

require 'rails_helper'

RSpec.describe PositiveMessage, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
