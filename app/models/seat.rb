class Seat < ApplicationRecord
  with_options presence: true do
    validates :id
    validates :row, inclusion: { in: "a".."z" }
    validates :column, numericality: { greater_than: 0 }
  end
end
