class User < ApplicationRecord
  has_many :snippets

  has_secure_password
end
