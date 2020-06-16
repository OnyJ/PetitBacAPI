class Game < ApplicationRecord
  # belongs_to :user, as :creator
  # or
  belongs_to :user  # which is the creator

  # has_many :histories
  # has_many :users, through: :histories
  has_many :join_category_game
  has_many :categories, through: :join_category_game
  has_many :invites
  has_many :invited_users, through: :invites, source: :users
end
