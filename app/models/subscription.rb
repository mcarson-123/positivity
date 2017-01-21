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

class Subscription < ActiveRecord::Base

  #-----------------------------------------------------------------------------
  # Attributes
  #-----------------------------------------------------------------------------

  # Attr reader used in simple form new subscription
  attr_reader :phone_number_country_code

  #---------------------------------------------------------
  # Enums
  #---------------------------------------------------------

  enum frequency: Subscription::Frequency::OPTIONS
  enum activation_state: Subscription::ActivationState::OPTIONS


  #---------------------------------------------------------
  # Scopes
  #---------------------------------------------------------

  scope :active, -> { where(activation_state: Subscription::ActivationState::ACTIVE) }
  scope :daily, -> { where(frequency: Subscription::Frequency::DAILY) }
  scope :weekly, -> { where(frequency: Subscription::Frequency::WEEKLY) }

  #-----------------------------------------------------------------------------
  # Instance Methods
  #-----------------------------------------------------------------------------

  def next_message
    m_id = message_queue.shift
    self.message_queue = message_queue
    self.save
    PositiveMessage.find_by(id: m_id)
  end
end
