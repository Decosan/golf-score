class AddScoreIdToPictures < ActiveRecord::Migration[5.0]
  def change
    add_column :pictures, :score_id, :integer
  end
end
