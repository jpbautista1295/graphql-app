class CreateBikes < ActiveRecord::Migration[8.0]
  def change
    create_table :bikes do |t|
      t.references :brand, null: false, foreign_key: true
      t.string :model
      t.string :bike_type
      t.decimal :amount, precision: 10, scale: 2
      t.string :currency
      t.timestamps
    end
  end
end
