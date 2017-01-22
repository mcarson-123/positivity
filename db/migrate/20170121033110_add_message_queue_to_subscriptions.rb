class AddMessageQueueToSubscriptions < ActiveRecord::Migration
  def change
    add_column :subscriptions, :message_queue, :integer, array: true, default: []
  end
end
