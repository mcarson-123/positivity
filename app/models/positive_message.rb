# == Schema Information
#
# Table name: positive_messages
#
#  id            :integer          not null, primary key
#  messages      :string
#  enabled_state :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class PositiveMessage < ActiveRecord::Base

  #---------------------------------------------------------
  # Enums
  #---------------------------------------------------------

  enum enabled_state: [:enabled, :disabled]


  #---------------------------------------------------------
  # Scopes
  #---------------------------------------------------------

  scope :active, -> { where(activation_state: 0) }

end
