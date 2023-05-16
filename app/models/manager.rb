class Manager < ApplicationRecord
  has_many :employees
  has_many :answers
end
