class CreateSharedMessages < ActiveRecord::Migration
  def change
    create_table :shared_messages do |t|
      t.string :sender_name
      t.string :phone_number
      t.references :positive_message
      t.timestamps null: false
    end
  end
end
