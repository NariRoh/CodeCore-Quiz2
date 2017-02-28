class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.string :body
      t.references :idea, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :reviews, :body
  end
end
