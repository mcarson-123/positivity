# == Schema Information
#
# Table name: subscriptions
#
#  id               :integer          not null, primary key
#  phone_number     :string
#  frequency        :integer
#  activation_state :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

require 'rails_helper'

RSpec.describe Subscription, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
