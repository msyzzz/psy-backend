class User < ApplicationRecord
  has_secure_password
  validates :index, presence: true,
            uniqueness: true
  validates :password_digest, presence: true
  validates :role,  inclusion: { in: [0, 1, 2], message:"role can be only in [0 1 2]" }
  has_many :results
end
