class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :snippet

  validates :content, length: { minimum: 3, maximum: 20000 }
  validates_numericality_of :user_id,    only_integer: true
  validates_numericality_of :snippet_id, only_integer: true

  paginates_per 10
end
