class CreateCosts < ActiveRecord::Migration
  def change
    create_table :costs do |t|
      t.decimal :price
      t.date :valid_date
      t.belongs_to :product, index: true

      t.timestamps
    end
  end
end
