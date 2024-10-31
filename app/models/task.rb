class Task < ApplicationRecord
  belongs_to :list

  validates :list_position, uniqueness: { scope: :list_id }, presence: true
  validates :name, presence: true
end

