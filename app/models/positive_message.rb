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

  enum enabled_state: PositiveMessage::EnabledState::OPTIONS


  #---------------------------------------------------------
  # Scopes
  #---------------------------------------------------------

  scope :active, -> { where(enabled_state: PositiveMessage::EnabledState::ENABLED) }

end
