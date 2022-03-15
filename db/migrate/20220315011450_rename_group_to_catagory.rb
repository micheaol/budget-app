class RenameGroupToCatagory < ActiveRecord::Migration[7.0]
  def change
    rename_table :groups, :catagories
  end
end
