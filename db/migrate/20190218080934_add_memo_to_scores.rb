class AddMemoToScores < ActiveRecord::Migration[5.0]
  def change
    add_column :scores, :memo, :string
  end
end
