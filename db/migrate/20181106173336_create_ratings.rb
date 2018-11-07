class CreateRatings < ActiveRecord::Migration[5.1]
  def change
    create_table :ratings do |t|
      t.string :title
      t.string :description
      t.integer :rating

      t.references :order_item, foreign_key: true
      t.references :user, foreign_key: true
    end
  end
end
