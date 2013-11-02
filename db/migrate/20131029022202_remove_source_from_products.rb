class RemoveSourceFromProducts < ActiveRecord::Migration
  def change
    remove_column :products, :source
  end
end
