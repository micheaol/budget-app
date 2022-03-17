class RenamCategoriesEntitiesToActivitiesCategories < ActiveRecord::Migration[7.0]
  def change
    rename_table :categories_entities, :activities_categories
  end
end
