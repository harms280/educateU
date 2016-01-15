class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :description
      t.string :url
      t.integer :order_number

      t.timestamps null: false
    end
  end
end
