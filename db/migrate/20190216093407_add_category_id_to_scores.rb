class AddCategoryIdToScores < ActiveRecord::Migration[5.0]
  def change
    add_column :scores, :category_id, :integer
  end
end
