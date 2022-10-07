class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :title, null: false
      t.string :description
      t.float :price, null: false
      t.string :picture_url

      t.timestamps
    end
  end
end
