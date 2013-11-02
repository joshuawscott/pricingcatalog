class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :product_number
      t.string :description
      t.string :source

      t.timestamps
    end
  end
end
