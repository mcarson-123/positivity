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

class Subscription < ActiveRecord::Base

  # Attr reader used in simple form new subscription
  attr_reader :phone_number_country_code

  #---------------------------------------------------------
  # Enums
  #---------------------------------------------------------

  enum frequency: [:daily, :weekly]
  enum activation_state: [:created, :active, :inactive]


  #---------------------------------------------------------
  # Scopes
  #---------------------------------------------------------

  scope :active, -> { where(activation_state: 1) }
  scope :daily, -> { where(frequency: 0) }
  scope :weekly, -> { where(frequency: 1) }

end
