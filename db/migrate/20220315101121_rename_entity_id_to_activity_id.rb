class RenameEntityIdToActivityId < ActiveRecord::Migration[7.0]
  def change
    rename_column :activities_categories, :entity_id, :activity_id
  end
end
