class Task < ApplicationRecord
  has_many :results
  has_one :questionnaire
  has_and_belongs_to_many :users
  belongs_to :doctor
end
