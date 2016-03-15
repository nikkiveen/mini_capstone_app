class AddStocktoProduct < ActiveRecord::Migration
  def change
    add_column :products, :stock, :boolean, default: true
  end
end
