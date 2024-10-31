class List < ApplicationRecord
  has_many :tasks, dependent: :destroy

  validates :position, uniqueness: true, presence: true
  validates :name, presence: true
end