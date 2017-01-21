# == Schema Information
#
# Table name: subscriptions
#
#  id               :integer          not null, primary key
#  name             :string
#  phone_number     :string
#  frequency        :integer
#  activation_state :integer          default(0)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  message_queue    :integer          default([]), is an Array
#

require 'rails_helper'

RSpec.describe Subscription, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
