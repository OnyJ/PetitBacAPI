class Response < ApplicationRecord
  belongs_to :category
  belongs_to :game
  belongs_to :user
  validates_uniqueness_of :game_id, :scope => [:category_id, :user_id]
end
