class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.references :user, index: true
      t.references :product, index: true
      t.string :image
      t.string :file
      t.text :description
      t.timestamps
    end

  end
end
