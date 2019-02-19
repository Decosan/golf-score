class CreateScores < ActiveRecord::Migration[5.0]
  def change
    create_table :scores do |t|
      t.date :date
      t.integer :score_out
      t.integer :score_in
      t.integer :score_total
      t.integer :put_out
      t.integer :put_in
      t.integer :put_total
      t.integer :course_id
      t.references :user, foreign_key: true
      t.integer :range_id

      t.timestamps
    end
  end
end
