class AddNbMarkingToResponse < ActiveRecord::Migration[6.0]
  def change
    add_column :responses, :nbmarking, :integer, default: 0
  end
end
