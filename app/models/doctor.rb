class Doctor < ApplicationRecord
  has_many :appointments
  has_many :tasks
  belongs_to :user
end
