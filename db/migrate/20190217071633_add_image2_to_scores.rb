class AddImage2ToScores < ActiveRecord::Migration[5.0]
  def change
    add_column :scores, :image2, :string
  end
end
