class AddScoreToResponse < ActiveRecord::Migration[6.0]
  def change
    add_column :responses, :score, :integer, default: 0
  end
end
