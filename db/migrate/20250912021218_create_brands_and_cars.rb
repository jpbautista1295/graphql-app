class CreateBrandsAndCars < ActiveRecord::Migration[8.0]
  def change
    create_table :brands do |t|
      t.string :name
      t.timestamps
    end
    
    create_table :cars do |t|
      t.references :brand, null: false, foreign_key: true
      t.string :model
      t.integer :num_of_doors
      t.decimal :amount, precision: 10, scale: 2
      t.string :currency
      t.timestamps
    end
  end
end
