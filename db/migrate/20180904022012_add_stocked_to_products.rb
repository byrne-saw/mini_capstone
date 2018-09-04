class AddStockedToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :stocked, :boolean
  end
end
