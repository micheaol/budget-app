class RenamEentityToActivity < ActiveRecord::Migration[7.0]
  def change
    rename_table :entities, :activities
  end
end
