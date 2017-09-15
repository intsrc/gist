class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :snippet

  paginates_per 10
end
