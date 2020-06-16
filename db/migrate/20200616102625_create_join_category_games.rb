class CreateJoinCategoryGames < ActiveRecord::Migration[6.0]
  def change
    create_table :join_category_games do |t|
      t.integer :category_id
      t.integer :game_id

      t.timestamps
    end
  end
end
