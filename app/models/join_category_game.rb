class JoinCategoryGame < ApplicationRecord
  belongs_to :game
  belongs_to :category
end
