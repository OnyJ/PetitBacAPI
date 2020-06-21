class JoinCategoryGame < ApplicationRecord
  belongs_to :game
  belongs_to :category
  validates_uniqueness_of :game_id, :scope => :category_id
end
