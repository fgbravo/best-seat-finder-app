class CreateSeats < ActiveRecord::Migration[6.0]
  def change
    create_table :seats do |t|
      t.integer :status
      t.string :row
      t.integer :column

      t.timestamps
    end
  end
end
