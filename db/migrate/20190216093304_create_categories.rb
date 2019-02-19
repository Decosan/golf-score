class CreateCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :categories do |t|
      t.string :score_range
      t.string :color

      t.timestamps
    end
  end
end
