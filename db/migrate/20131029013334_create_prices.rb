class CreatePrices < ActiveRecord::Migration
  def change
    create_table :prices do |t|
      t.string :type
      t.decimal :price
      t.date :valid_date
      t.belongs_to :product, index: true

      t.timestamps
    end
  end
end
