class Snippet < ApplicationRecord
  belongs_to :user
  has_many   :comments

  validates :content, length: { minimum: 3, maximum: 20000 }
  validates_numericality_of :user_id, only_integer: true

  paginates_per 10
end
