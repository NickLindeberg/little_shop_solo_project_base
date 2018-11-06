class AddDiscountToItems < ActiveRecord::Migration[5.1]
  def change
    add_column :items, :discount, :boolean, default: true
  end
end
