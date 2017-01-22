class CreatePositiveMessages < ActiveRecord::Migration
  def change
    create_table :positive_messages do |t|
      t.string :message_text
      t.integer :enabled_state
      t.timestamps null: false
    end
  end
end
