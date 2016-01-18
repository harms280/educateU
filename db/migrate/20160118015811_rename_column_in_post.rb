class RenameColumnInPost < ActiveRecord::Migration
  def change
  	rename_column :posts, :order_number, :position
  end
end
