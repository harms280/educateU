class AddFieldsToUser < ActiveRecord::Migration
  def change
    add_column :users, :about, :text
    add_column :users, :avatar, :string
  end
end
