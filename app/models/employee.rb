class Employee < ApplicationRecord
  belongs_to :manager, counter_cache: true
  has_many :questions
end
