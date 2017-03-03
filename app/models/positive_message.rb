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

class PositiveMessage < ActiveRecord::Base

  #---------------------------------------------------------
  # Enums
  #---------------------------------------------------------

  has_many :shared_messages

  #---------------------------------------------------------
  # Enums
  #---------------------------------------------------------

  enum enabled_state: PositiveMessage::EnabledState::OPTIONS


  #---------------------------------------------------------
  # Scopes
  #---------------------------------------------------------

  scope :active, -> { where(enabled_state: PositiveMessage::EnabledState::ENABLED) }

end
