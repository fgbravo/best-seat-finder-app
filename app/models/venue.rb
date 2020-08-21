class Venue < ApplicationRecord
  validates :rows, :columns, presence: true, numericality: { greater_than: 0 }
end
