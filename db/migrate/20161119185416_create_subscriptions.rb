class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
      t.string :name
      t.string :phone_number
      t.integer :frequency
      t.integer :activation_state, default: 0
      t.timestamps null: false
    end
  end
end
