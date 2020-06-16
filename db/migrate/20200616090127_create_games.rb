class CreateGames < ActiveRecord::Migration[6.0]
  def change
    create_table :games do |t|
      t.integer :user_id  # the creator's id
      t.boolean :is_pending
      t.integer :winner_id
      t.integer :max_guests

      t.timestamps
    end
  end
end
